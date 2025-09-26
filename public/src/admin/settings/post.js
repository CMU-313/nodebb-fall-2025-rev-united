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
			const words = Array.isArray(result && result.response) ? result.response : [];
			state.words = words.slice().sort((a, b) => a.localeCompare(b));
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
		if (!state.words.length) {
			if (state.emptyEl) {
				state.emptyEl.hidden = false;
			}
			return;
		}

		if (state.emptyEl) {
			state.emptyEl.hidden = true;
		}

		const fragment = document.createDocumentFragment();
		state.words.forEach((word) => {
			const row = document.createElement('tr');
			row.dataset.word = word;

			const wordCell = document.createElement('td');
			wordCell.textContent = word;
			row.appendChild(wordCell);

			const actionsCell = document.createElement('td');
			actionsCell.classList.add('text-end');

			const btnGroup = document.createElement('div');
			btnGroup.className = 'btn-group btn-group-sm';
			btnGroup.setAttribute('role', 'group');

			const editBtn = document.createElement('button');
			editBtn.type = 'button';
			editBtn.className = 'btn btn-light';
			editBtn.dataset.action = 'banned-word-edit';
			editBtn.dataset.word = word;
			editBtn.innerHTML = '<i class="fa fa-pencil-alt"></i>';
			translateAttr(editBtn, '[[admin/settings/post:banned-words.edit]]');
			btnGroup.appendChild(editBtn);

			const deleteBtn = document.createElement('button');
			deleteBtn.type = 'button';
			deleteBtn.className = 'btn btn-light';
			deleteBtn.dataset.action = 'banned-word-delete';
			deleteBtn.dataset.word = word;
			deleteBtn.innerHTML = '<i class="fa fa-trash"></i>';
			translateAttr(deleteBtn, '[[admin/settings/post:banned-words.delete]]');
			btnGroup.appendChild(deleteBtn);

			actionsCell.appendChild(btnGroup);
			row.appendChild(actionsCell);

			fragment.appendChild(row);
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
