'use strict';

define('admin/settings/post', ['api', 'alerts', 'bootbox', 'translator'], function (api, alerts, bootbox, translator) {
	const state = {
		container: null,
		inputEl: null,
		listEl: null,
		emptyEl: null,
		words: [],
	};

	const PostSettings = {};

	PostSettings.init = function () {
		state.container = document.querySelector('[component="acp/banned-words"]');
		if (!state.container || state.container.getAttribute('data-initialized')) {
			return;
		}

		state.container.setAttribute('data-initialized', 'true');
		state.inputEl = state.container.querySelector('[data-element="banned-word-input"]');
		state.listEl = state.container.querySelector('[data-element="banned-word-list"]');
		state.emptyEl = state.container.querySelector('[data-element="banned-word-empty"]');

		bindEvents();
		refresh();
	};

	function bindEvents() {
		const addBtn = state.container.querySelector('[data-action="banned-word-add"]');
		if (addBtn) {
			addBtn.addEventListener('click', handleAddWord);
		}
		if (state.inputEl) {
			state.inputEl.addEventListener('keydown', (ev) => {
				if (ev.key === 'Enter') {
					ev.preventDefault();
					handleAddWord();
				}
			});
		}

		state.container.addEventListener('click', (ev) => {
			const actionEl = ev.target.closest('[data-action]');
			if (!actionEl) {
				return;
			}

			const word = actionEl.dataset.word;
			const action = actionEl.getAttribute('data-action');
			switch (action) {
				case 'banned-word-edit':
					handleEditWord(word);
					break;
				case 'banned-word-delete':
					handleDeleteWord(word);
					break;
			}
		});
	}

	async function refresh() {
		try {
			const result = await api.get('/admin/banned-words');
			let payload = Array.isArray(result) ? result : null;
			if (payload && payload.words !== undefined) {
				payload = payload.words;
			}
			if (!Array.isArray(payload)) {
				payload = result?.words;
			}
			if (!Array.isArray(payload) && payload && typeof payload === 'object') {
				payload = Object.values(payload);
			}
			if (!Array.isArray(payload)) {
				payload = [];
			}
			state.words = payload
				.map(word => String(word || '').trim())
				.filter(Boolean)
				.sort((a, b) => a.localeCompare(b));
			render();
		} catch (err) {
			alerts.error(err);
		}
	}

	function render() {
		if (!state.listEl) {
			return;
		}

		state.listEl.textContent = '';
		const hasWords = state.words.length > 0;

		if (state.emptyEl) {
			state.emptyEl.hidden = hasWords;
		}
		state.listEl.classList.toggle('d-none', !hasWords);

		if (!hasWords) {
			return;
		}

		const fragment = document.createDocumentFragment();
		state.words.forEach((word) => {
			const item = document.createElement('div');
			item.className = 'list-group-item d-flex flex-column flex-md-row align-items-start align-items-md-center gap-3 justify-content-between';
			item.dataset.word = word;

			const wordWrapper = document.createElement('div');
			wordWrapper.className = 'text-break fw-medium';
			wordWrapper.textContent = word;
			item.appendChild(wordWrapper);

			const btnGroup = document.createElement('div');
			btnGroup.className = 'btn-group btn-group-sm';
			btnGroup.setAttribute('role', 'group');

			const editBtn = document.createElement('button');
			editBtn.type = 'button';
			editBtn.className = 'btn btn-outline-primary';
			editBtn.dataset.action = 'banned-word-edit';
			editBtn.dataset.word = word;
			editBtn.innerHTML = '<i class="fa fa-pencil-alt"></i>';
			translateAttr(editBtn, '[[admin/settings/post:banned-words.edit]]');
			btnGroup.appendChild(editBtn);

			const deleteBtn = document.createElement('button');
			deleteBtn.type = 'button';
			deleteBtn.className = 'btn btn-outline-danger';
			deleteBtn.dataset.action = 'banned-word-delete';
			deleteBtn.dataset.word = word;
			deleteBtn.innerHTML = '<i class="fa fa-trash"></i>';
			translateAttr(deleteBtn, '[[admin/settings/post:banned-words.delete]]');
			btnGroup.appendChild(deleteBtn);

			item.appendChild(btnGroup);
			fragment.appendChild(item);
		});

		state.listEl.appendChild(fragment);
	}

	async function handleAddWord() {
		if (!state.inputEl) {
			return;
		}

		const word = state.inputEl.value.trim();
		if (!word) {
			state.inputEl.focus();
			return;
		}

		try {
			await api.post('/admin/banned-words', { word });
			alerts.success('[[admin/settings/post:banned-words.add-success]]');
			state.inputEl.value = '';
			await refresh();
		} catch (err) {
			alerts.error(err);
		}
	}

	function handleEditWord(currentWord) {
		if (!currentWord) {
			return;
		}

		translator.translate('[[admin/settings/post:banned-words.edit-prompt]]', (title) => {
			translator.translate('[[admin/settings/post:banned-words.edit-placeholder]]', (placeholder) => {
				bootbox.prompt({
					title,
					value: currentWord,
					placeholder,
					callback: async (newWord) => {
						if (newWord === null) {
							return;
						}
						const trimmed = String(newWord).trim();
						if (!trimmed || trimmed === currentWord) {
							return;
						}
						try {
							await api.put('/admin/banned-words', {
								oldWord: currentWord,
								newWord: trimmed,
							});
							alerts.success('[[admin/settings/post:banned-words.edit-success]]');
							await refresh();
						} catch (err) {
							alerts.error(err);
						}
					},
				});
			});
		});
	}

	function handleDeleteWord(word) {
		if (!word) {
			return;
		}

		const encodedWord = word.replace(/%/g, '&#37;').replace(/,/g, '&#44;');
		translator.translate(`[[admin/settings/post:banned-words.remove-confirm, ${encodedWord}]]`, (message) => {
			bootbox.confirm(message, async (ok) => {
				if (!ok) {
					return;
				}
				try {
					await api.del('/admin/banned-words', { word });
					alerts.success('[[admin/settings/post:banned-words.remove-success]]');
					await refresh();
				} catch (err) {
					alerts.error(err);
				}
			});
		});
	}

	function translateAttr(element, key) {
		translator.translate(key, (text) => {
			element.title = text;
			element.setAttribute('aria-label', text);
		});
	}

	return PostSettings;
});
