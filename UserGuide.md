# Feature Guide

This guide covers the new keyword flagging (banned words), the moderator review surface, the Resources page, and Linked Thread IDs.

## Keyword flagging (banned words)

What it is
- Centralized matching and logging live in [src/banned-words/index.js](src/banned-words/index.js):
  - Add/remove/list words: [`BannedWords.add`](src/banned-words/index.js), [`BannedWords.remove`](src/banned-words/index.js), [`BannedWords.getAll`](src/banned-words/index.js)
  - Match content: [`BannedWords.findMatches`](src/banned-words/index.js)
  - Retroactive scan when a new word is added: [`BannedWords.scanExistingPostsForWord`](src/banned-words/index.js)

How to add/remove words
- Add a word (admin):
  - API v3: POST /api/v3/admin/banned-words { "word": "example" }
  - Programmatic: require and call [`BannedWords.add`](src/banned-words/index.js)
- Remove a word (admin):
  - API v3: DELETE /api/v3/admin/banned-words/{word}
  - Programmatic: [`BannedWords.remove`](src/banned-words/index.js)

What happens on add
- New words trigger a one-time retroactive scan across all posts and topic titles:
  - Flags posts into a global queue: posts:flagged:banned (score=timestamp, member=pid)
  - Logs matched terms per post: post:{pid}:banned:matches (field=word, value=timestamp)
- Live validation uses the same matcher via [`BannedWords.findMatches`](src/banned-words/index.js) to ensure parity.

Where to review flagged content
- Moderators/Admins page: /banned-review
  - Controller: [src/controllers/mod/banned-review.js](src/controllers/mod/banned-review.js)
  - Route mount: [src/routes/index.js](src/routes/index.js)
  - View: [src/views/banned-review.tpl](src/views/banned-review.tpl)
- What you see:
  - List of posts, topic title, content preview, timestamp, and “Matched words” badges.
- Notes:
  - The scanner does not delete or edit posts; it only queues them for review.
  - Use standard moderation tools on the post/topic pages to delete/restore/purge.

Operational details
- Data written by the scanner:
  - posts:flagged:banned sorted set
  - post:{pid}:banned:matches hash
- Access control:
  - Admins and global moderators see all; category moderators see only categories they moderate (enforced in [src/controllers/mod/banned-review.js](src/controllers/mod/banned-review.js)).

## Resources page

Where to view
- Page: /resources
  - Route: [src/routes/index.js](src/routes/index.js) maps to [`controllers.resources.get`](src/routes/index.js)
  - List view: [src/views/resources.tpl](src/views/resources.tpl)

Adding a resource
- UI form template: [src/views/resources-new.tpl](src/views/resources-new.tpl)
- If your build exposes a route for the “New Resource” form, open it, fill in:
  - Name, Description, Link (URL), then submit (CSRF token included in the form)
- On success, you return to /resources and the new item appears in the table.

Notes
- Labels are localized via the “global:resources-*” keys in templates.
- If the “New Resource” route/button is not visible, creation may be ACP-/API-only in your deployment.

## Linked Thread IDs (linked topics)

What it is
- Posts can carry metadata referencing other topics. This powers inline “linked topic” badges/links.
- API schema: “linkedThreadIds” and “linkedTopics” on a post are defined in [public/openapi/components/schemas/PostObject.yaml](public/openapi/components/schemas/PostObject.yaml).
- Client rendering: [public/src/client/topic/linked-topics.js](public/src/client/topic/linked-topics.js) turns linked topic metadata into inline links.

How to attach links when composing
- Use the composer’s Topic Link tool (loaded via composer integration in [public/src/app.js](public/src/app.js), see the `composer/topic-link` module import) to attach existing topics to your post before submitting.
- After posting:
  - The server populates post.linkedThreadIds/post.linkedTopics.
  - The client enhances your post with inline links to those topics.

How to consume via API
- GET /api/post/{pid} returns the post object including:
  - linkedThreadIds: number[]
  - linkedTopics: [{ tid, title, slug }, …]
- Use these fields to render cross-topic links in your own clients.

Behavior in the topic page
- When viewing a topic, the client script [public/src/client/topic/linked-topics.js](public/src/client/topic/linked-topics.js) builds canonical links using tid and slug so they open `/topic/{tid}/{slug}`.

## Where the code lives

- Banned words module
  - [src/banned-words/index.js](src/banned-words/index.js): [`BannedWords.add`](src/banned-words/index.js), [`BannedWords.remove`](src/banned-words/index.js), [`BannedWords.findMatches`](src/banned-words/index.js), [`BannedWords.scanExistingPostsForWord`](src/banned-words/index.js)
- Review surface (mods)
  - [src/controllers/mod/banned-review.js](src/controllers/mod/banned-review.js), [src/routes/index.js](src/routes/index.js), [src/views/banned-review.tpl](src/views/banned-review.tpl)
- Resources
  - [src/views/resources.tpl](src/views/resources.tpl), [src/views/resources-new.tpl](src/views/resources-new.tpl)
- Linked topics
  - [public/openapi/components/schemas/PostObject.yaml](public/openapi/components/schemas/PostObject.yaml), [public/src/client/topic/linked-topics.js](public/src/client/topic/linked-topics.js)

## Automated tests

- Banned words data layer
  - File: [test/bannedwords.js](test/bannedwords.js)
  - Covers:
    - Add/remove words, empty input handling
    - Case-insensitive matching and de-duplication via [`BannedWords.findMatches`](src/banned-words/index.js)
    - Retroactive scan writes to posts:flagged:banned and per-post matches
  - Why sufficient: Exercises primary branches (new vs existing word), title vs content matching, and DB side-effects.

- Banned review route (added to controller suite)
  - File: [test/controllers.js](test/controllers.js) — “banned content review” section
  - Covers:
    - Access control (guest 401, user 403, admin 200)
    - Data shape and pid→matches alignment in the response
  - Why sufficient: Validates the mounted route contract and privilege gating in [src/controllers/mod/banned-review.js](src/controllers/mod/banned-review.js).

- Optional focused unit test
  - File: [test/banned-review.controller.js](test/banned-review.controller.js) (if added)
  - Verifies controller logic in isolation (joining summaries with matches by pid)

```// filepath: /workspaces/nodebb-fall-2025-rev-united/UserGuide.md
# Feature Guide

This guide covers the new keyword flagging (banned words), the moderator review surface, the Resources page, and Linked Thread IDs.

## Keyword flagging (banned words)

What it is
- Centralized matching and logging live in [src/banned-words/index.js](src/banned-words/index.js):
  - Add/remove/list words: [`BannedWords.add`](src/banned-words/index.js), [`BannedWords.remove`](src/banned-words/index.js), [`BannedWords.getAll`](src/banned-words/index.js)
  - Match content: [`BannedWords.findMatches`](src/banned-words/index.js)
  - Retroactive scan when a new word is added: [`BannedWords.scanExistingPostsForWord`](src/banned-words/index.js)

How to add/remove words
- Add a word (admin):
  - API v3: POST /api/v3/admin/banned-words { "word": "example" }
  - Programmatic: require and call [`BannedWords.add`](src/banned-words/index.js)
- Remove a word (admin):
  - API v3: DELETE /api/v3/admin/banned-words/{word}
  - Programmatic: [`BannedWords.remove`](src/banned-words/index.js)

What happens on add
- New words trigger a one-time retroactive scan across all posts and topic titles:
  - Flags posts into a global queue: posts:flagged:banned (score=timestamp, member=pid)
  - Logs matched terms per post: post:{pid}:banned:matches (field=word, value=timestamp)
- Live validation uses the same matcher via [`BannedWords.findMatches`](src/banned-words/index.js) to ensure parity.

Where to review flagged content
- Moderators/Admins page: /banned-review
  - Controller: [src/controllers/mod/banned-review.js](src/controllers/mod/banned-review.js)
  - Route mount: [src/routes/index.js](src/routes/index.js)
  - View: [src/views/banned-review.tpl](src/views/banned-review.tpl)
- What you see:
  - List of posts, topic title, content preview, timestamp, and “Matched words” badges.
- Notes:
  - The scanner does not delete or edit posts; it only queues them for review.
  - Use standard moderation tools on the post/topic pages to delete/restore/purge.

Operational details
- Data written by the scanner:
  - posts:flagged:banned sorted set
  - post:{pid}:banned:matches hash
- Access control:
  - Admins and global moderators see all; category moderators see only categories they moderate (enforced in [src/controllers/mod/banned-review.js](src/controllers/mod/banned-review.js)).

## Resources page

Where to view
- Page: /resources
  - Route: [src/routes/index.js](src/routes/index.js) maps to [`controllers.resources.get`](src/routes/index.js)
  - List view: [src/views/resources.tpl](src/views/resources.tpl)

Adding a resource
- UI form template: [src/views/resources-new.tpl](src/views/resources-new.tpl)
- If your build exposes a route for the “New Resource” form, open it, fill in:
  - Name, Description, Link (URL), then submit (CSRF token included in the form)
- On success, you return to /resources and the new item appears in the table.

Notes
- Labels are localized via the “global:resources-*” keys in templates.
- If the “New Resource” route/button is not visible, creation may be ACP-/API-only in your deployment.

## Linked Thread IDs (linked topics)

What it is
- Posts can carry metadata referencing other topics. This powers inline “linked topic” badges/links.
- API schema: “linkedThreadIds” and “linkedTopics” on a post are defined in [public/openapi/components/schemas/PostObject.yaml](public/openapi/components/schemas/PostObject.yaml).
- Client rendering: [public/src/client/topic/linked-topics.js](public/src/client/topic/linked-topics.js) turns linked topic metadata into inline links.

How to attach links when composing
- Use the composer’s Topic Link tool (loaded via composer integration in [public/src/app.js](public/src/app.js), see the `composer/topic-link` module import) to attach existing topics to your post before submitting.
- After posting:
  - The server populates post.linkedThreadIds/post.linkedTopics.
  - The client enhances your post with inline links to those topics.

How to consume via API
- GET /api/post/{pid} returns the post object including:
  - linkedThreadIds: number[]
  - linkedTopics: [{ tid, title, slug }, …]
- Use these fields to render cross-topic links in your own clients.

Behavior in the topic page
- When viewing a topic, the client script [public/src/client/topic/linked-topics.js](public/src/client/topic/linked-topics.js) builds canonical links using tid and slug so they open `/topic/{tid}/{slug}`.

## Where the code lives

- Banned words module
  - [src/banned-words/index.js](src/banned-words/index.js): [`BannedWords.add`](src/banned-words/index.js), [`BannedWords.remove`](src/banned-words/index.js), [`BannedWords.findMatches`](src/banned-words/index.js), [`BannedWords.scanExistingPostsForWord`](src/banned-words/index.js)
- Review surface (mods)
  - [src/controllers/mod/banned-review.js](src/controllers/mod/banned-review.js), [src/routes/index.js](src/routes/index.js), [src/views/banned-review.tpl](src/views/banned-review.tpl)
- Resources
  - [src/views/resources.tpl](src/views/resources.tpl), [src/views/resources-new.tpl](src/views/resources-new.tpl)
- Linked topics
  - [public/openapi/components/schemas/PostObject.yaml](public/openapi/components/schemas/PostObject.yaml), [public/src/client/topic/linked-topics.js](public/src/client/topic/linked-topics.js)

## Automated tests

- Banned words data layer
  - File: [test/bannedwords.js](test/bannedwords.js)
  - Covers:
    - Add/remove words, empty input handling
    - Case-insensitive matching and de-duplication via [`BannedWords.findMatches`](src/banned-words/index.js)
    - Retroactive scan writes to posts:flagged:banned and per-post matches
  - Why sufficient: Exercises primary branches (new vs existing word), title vs content matching, and DB side-effects.

- Banned review route (added to controller suite)
  - File: [test/controllers.js](test/controllers.js) — “banned content review” section
  - Covers:
    - Access control (guest 401, user 403, admin 200)
    - Data shape and pid→matches alignment in the response
  - Why sufficient: Validates the mounted route contract and privilege gating in [src/controllers/mod/banned-review.js](src/controllers/mod/banned-review.js).

- Banned review controller
  - File: [test/banned-review.controller.js]
  - Verifies controller logic in isolation (joining summaries with matches by pid)
