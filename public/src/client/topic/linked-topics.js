'use strict';

define('forum/topic/linked-topics', ['hooks'], function (hooks) {
	const LinkedTopics = {};

	LinkedTopics.init = function () {
		// Render linked topics when posts are loaded
		hooks.on('action:posts.loaded', function (data) {
			if (!data || !data.posts) {
				return;
			}

			data.posts.forEach(function (post) {
				if (post.linkedTopics && post.linkedTopics.length > 0) {
					renderLinkedTopics(post);
				}
			});
		});
	};

	function renderLinkedTopics(post) {
		const postEl = $('[component="post"][data-pid="' + post.pid + '"]');
		if (!postEl.length) {
			return;
		}

		const contentEl = postEl.find('[component="post/content"]');
		if (!contentEl.length) {
			return;
		}

		// Check if already rendered
		if (contentEl.find('.linked-topics-container').length > 0) {
			return;
		}

		// Create linked topics display
		const linkedTopicsHtml = post.linkedTopics.map(function (topic) {
			const slug = topic.slug || '';
			const url = config.relative_path + '/topic/' + topic.tid + (slug ? '/' + slug : '');
			return '<a href="' + url + '" class="linked-topic-tag" target="_blank" rel="noopener">#' +
				$('<div>').text(topic.title).html() + '</a>';
		}).join(' ');

		const container = $('<div class="linked-topics-container" style="margin-top: 10px; padding: 8px; background: #f5f5f5; border-radius: 4px;">' +
			'<small><i class="fa fa-link"></i> <strong>Linked Topics:</strong> ' + linkedTopicsHtml + '</small>' +
			'</div>');

		contentEl.append(container);
	}

	return LinkedTopics;
});
