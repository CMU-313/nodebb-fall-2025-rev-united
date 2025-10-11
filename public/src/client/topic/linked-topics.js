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
				console.log('Posts loaded - Post:', post.pid, 'linkedTopics:', post.linkedTopics);
				if (post.linkedTopics && post.linkedTopics.length > 0) {
					console.log('Rendering linked topics for post:', post.pid);
					renderLinkedTopics(post);
				}
			});
		});

		// Also render on topic load
		hooks.on('action:topic.loaded', function (data) {
			console.log('Topic loaded, posts:', data.posts);
			if (!data || !data.posts) {
				return;
			}

			data.posts.forEach(function (post) {
				console.log('Topic load - Post:', post.pid, 'linkedTopics:', post.linkedTopics);
				if (post.linkedTopics && post.linkedTopics.length > 0) {
					renderLinkedTopics(post);
				}
			});
		});

		// Handle new posts added via socket events
		$(window).on('action:posts.loaded', function (ev, data) {
			console.log('Window event - posts loaded:', data);
			if (!data || !data.posts) {
				return;
			}

			data.posts.forEach(function (post) {
				console.log('Window event - Post:', post.pid, 'linkedTopics:', post.linkedTopics);
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
				console.log('Topic data for hashtag:', hashtag, topic);
				// NodeBB URL format is /topic/{tid}/{slug}
				// The slug should just be the slugified title, not including the tid
				let slug = topic.slug || '';

				// If slug contains the tid at the start (like "12/test-7"), remove it
				const tidPrefix = topic.tid + '/';
				if (slug.startsWith(tidPrefix)) {
					slug = slug.substring(tidPrefix.length);
				}

				const url = config.relative_path + '/topic/' + topic.tid + '/' + slug;
				const escapedTitle = $('<div>').text(topic.title).html();
				console.log('Generated URL:', url);
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
