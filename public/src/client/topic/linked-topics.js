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
		if (contentEl.attr('data-linked-topics-rendered') === 'true') {
			return;
		}

		// Create a map of slugified titles to topic data
		const topicMap = {};
		post.linkedTopics.forEach(function (topic) {
			const slugifiedTitle = topic.title.replace(/\s+/g, '-');
			topicMap[slugifiedTitle] = topic;
		});

		// Get the HTML content
		let html = contentEl.html();

		// Replace hashtags with clickable links
		// Match #word-word patterns (hashtags)
		const hashtagPattern = /#([\w-]+)/g;
		html = html.replace(hashtagPattern, function (match, hashtag) {
			const topic = topicMap[hashtag];
			if (topic) {
				const slug = topic.slug || '';
				const url = config.relative_path + '/topic/' + topic.tid + (slug ? '/' + slug : '');
				const escapedTitle = $('<div>').text(topic.title).html();
				return '<a href="' + url + '" class="linked-topic-hashtag" target="_blank" rel="noopener" ' +
					'style="color: #0066cc; text-decoration: none; font-weight: 500;" ' +
					'title="' + escapedTitle + '">#' + hashtag + '</a>';
			}
			return match; // Return unchanged if no matching topic
		});

		contentEl.html(html);
		contentEl.attr('data-linked-topics-rendered', 'true');
	}

	return LinkedTopics;
});
