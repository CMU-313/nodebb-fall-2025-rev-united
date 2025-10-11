'use strict';

define('composer/topic-link', [], function () {
	const TopicLink = {};

	// Store linked topics with their metadata
	TopicLink._linkedTopics = {};

	TopicLink.init = function () {
		$(window).on('composer:autocomplete:init', function (ev, data) {
			// Add strategy for # trigger to autocomplete topics
			data.strategies.push({
				match: /#(\w*)$/,
				search: function (term, callback) {
					if (!term) {
						callback([]);
						return;
					}

					socket.emit('topics.searchTopicsForLink', {
						query: term,
					}, function (err, topics) {
						if (err) {
							console.error('Error searching topics:', err);
							callback([]);
							return;
						}
						callback(topics);
					});
				},
				template: function (topic) {
					return topic.title;
				},
				replace: function (topic) {
					// Store the topic data for later extraction
					const uuid = data.element.closest('[data-uuid]').attr('data-uuid') || 'quickreply';
					if (!TopicLink._linkedTopics[uuid]) {
						TopicLink._linkedTopics[uuid] = {};
					}
					TopicLink._linkedTopics[uuid][topic.tid] = topic;

					// Replace with formatted hashtag
					return '#' + topic.title.replace(/\s+/g, '-') + ' ';
				},
				index: 1,
				cache: false,
			});
		});

		// Hook into composer submit to add linkedThreadIds
		require(['hooks'], function (hooks) {
			hooks.on('filter:composer.submit', function (data) {
				const uuid = data.composerData.uuid;
				const content = data.composerData.content;

				if (content && uuid) {
					const linkedThreadIds = TopicLink.getLinkedTopicIds(uuid, content);
					if (linkedThreadIds.length > 0) {
						data.composerData.linkedThreadIds = linkedThreadIds;
					}
				}

				return data;
			});
		});

		// Clean up on composer discard
		$(window).on('action:composer.discard', function (evt, data) {
			delete TopicLink._linkedTopics[data.post_uuid];
		});
	};

	TopicLink.getLinkedTopicIds = function (uuid, content) {
		const linkedTopics = TopicLink._linkedTopics[uuid] || {};
		const linkedIds = [];

		// Extract hashtags from content and match them to stored topics
		const hashtagPattern = /#([\w-]+)/g;
		let match;
		while ((match = hashtagPattern.exec(content)) !== null) {
			const hashtag = match[1];
			// Find matching topic by comparing slugified title
			for (const tid of Object.keys(linkedTopics)) {
				const topic = linkedTopics[tid];
				const slugifiedTitle = topic.title.replace(/\s+/g, '-');
				if (slugifiedTitle === hashtag) {
					linkedIds.push(parseInt(tid, 10));
					break;
				}
			}
		}

		return linkedIds;
	};

	return TopicLink;
});
