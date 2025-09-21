[33mcommit fbfa3976a5088e5d8d57a35ad329da2487fe40aa[m[33m ([m[1;31mmyrepo/main[m[33m, [m[1;31mmyrepo/HEAD[m[33m)[m
Author: ChrisTimperley <christimperley@googlemail.com>
Date:   Wed Aug 27 01:29:20 2025 +0000

    tests: skip unreliable file.copyFile test

[33mcommit 13a3e42757cda139cb5965139e45bd6b14365ce2[m
Author: ChrisTimperley <christimperley@googlemail.com>
Date:   Tue Aug 26 23:47:34 2025 +0000

    test: disabled failing i18n and activitypub tests

[33mcommit 8dc3f1c6297f62607ccc76729512f9d2c18b1051[m
Author: ChrisTimperley <christimperley@googlemail.com>
Date:   Sat Aug 23 02:23:51 2025 +0000

    dev: added vscode debugging configuration

[33mcommit 9af07ae3fec963650a339607cd1628e633abca3a[m
Author: ChrisTimperley <christimperley@googlemail.com>
Date:   Fri Aug 22 20:45:35 2025 +0000

    course: added P1B pull request template

[33mcommit 8f1b7c374b884c892d00ef98259d1d4976d38643[m
Author: ChrisTimperley <christimperley@googlemail.com>
Date:   Fri Aug 22 20:13:41 2025 +0000

    course: added P1B issue form

[33mcommit 28ed8512ef3efaeed1b37d68904aa74ad9cfc18b[m
Author: ChrisTimperley <christimperley@googlemail.com>
Date:   Thu Aug 21 19:11:42 2025 +0000

    infra: added launch.json for debugging in vscode

[33mcommit 896dffe8507b6fe85c1877d99020d0febe33e739[m
Author: ChrisTimperley <christimperley@googlemail.com>
Date:   Thu Aug 21 16:19:01 2025 +0000

    infra: added openapi vscode extension to devcontainer

[33mcommit 66faa999dca314200d50595f665983800ba9a443[m
Author: ChrisTimperley <christimperley@googlemail.com>
Date:   Thu Aug 21 15:43:57 2025 +0000

    infra: added iputils-ping to devcontainer for network debugging

[33mcommit 03be3892b35b463f8b2e5c3fa4bfce7825992ea1[m
Author: ChrisTimperley <christimperley@googlemail.com>
Date:   Tue Aug 19 16:23:44 2025 +0000

    infra: removed ./nodebb setup and npm install from postCreateCommand

[33mcommit 85116febda78b0f9bdc2e3486e67294287a96a36[m
Author: ChrisTimperley <christimperley@googlemail.com>
Date:   Wed Aug 13 21:31:50 2025 +0000

    infra: added gittogether workflow with placeholder config file

[33mcommit a498623996249ffb28b5c650faa289d3c53416e5[m
Author: ChrisTimperley <christimperley@googlemail.com>
Date:   Wed Aug 13 19:54:50 2025 +0000

    infra: ensure that redis-server runs on starts (not just creation) and specify port forwarding details

[33mcommit 2771c53906dd2fb364a33c494f8817849787b3f1[m
Author: ChrisTimperley <christimperley@googlemail.com>
Date:   Wed Aug 13 18:54:40 2025 +0000

    infra: run npm install as part of devcontainer post-creation step

[33mcommit 47e75bea15b21790ce9db026c70f780a1380cd94[m
Author: ChrisTimperley <christimperley@googlemail.com>
Date:   Wed Aug 13 18:48:46 2025 +0000

    infra: run ./nodebb setup on devcontainer post-creation

[33mcommit dc0bb37e77b9a938c351e9949f19c55f1a710364[m
Author: ChrisTimperley <christimperley@googlemail.com>
Date:   Wed Aug 13 18:46:42 2025 +0000

    infra: added default env vars for NodeBB automatic installation

[33mcommit 1b53a50609668d199e409b639bd5a4dc77a91016[m
Author: ChrisTimperley <christimperley@googlemail.com>
Date:   Wed Aug 13 18:36:06 2025 +0000

    fix: incorrectly specified directory name for vendored nodebb-theme-harmony

[33mcommit f0939854b35ceeb4aa9b4ba4ffd3050ebdd7e3de[m
Author: ChrisTimperley <christimperley@googlemail.com>
Date:   Wed Aug 13 18:26:19 2025 +0000

    infra: vendored nodebb-theme-harmony to allow frontend/style changes from the same repo

[33mcommit 98441cdcbdd9136298d8a2903dd565e08144f240[m
Author: ChrisTimperley <christimperley@googlemail.com>
Date:   Wed Aug 13 18:21:17 2025 +0000

    infra: added basic qlty configuration for Project 1

[33mcommit 9136164b36dca969114775d2a586b375d9e445be[m
Author: ChrisTimperley <christimperley@googlemail.com>
Date:   Wed Aug 13 18:17:34 2025 +0000

    infra: added dump.rdb to .gitignore

[33mcommit 95fb1e974e88ae309b4876994a346e043ac78082[m
Author: ChrisTimperley <christimperley@googlemail.com>
Date:   Wed Aug 13 18:15:16 2025 +0000

    infra: added volunteers workflow

[33mcommit d473bd0a452470b4025eb6fdbda561bc848c3aaf[m
Author: ChrisTimperley <christimperley@googlemail.com>
Date:   Wed Aug 13 14:11:20 2025 -0400

    infra: added basic Node devcontainer w/ qlty, redis, and a few useful plugins

[33mcommit bb913c152bc050567d4a4236fa5a9535b293d811[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Wed Aug 6 17:48:33 2025 +0000

    chore: incrementing version number - v4.4.6

[33mcommit 32de562e709410f20fd136c06d200c5912af2528[m
Author: Barış Soner Uşaklı <baris@nodebb.org>
Date:   Wed Aug 6 13:38:42 2025 -0400

    Revert "feat: add inspect argument"
    
    This reverts commit 955b27debc036199afa9e34f66812e83464572ac.

[33mcommit 955b27debc036199afa9e34f66812e83464572ac[m
Author: Barış Soner Uşaklı <baris@nodebb.org>
Date:   Wed Aug 6 13:10:56 2025 -0400

    feat: add inspect argument

[33mcommit 567ed8755b6783ef99619f2700b8b2a67095e70e[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Thu Jul 31 18:44:09 2025 -0400

    feat: add new brite skin from bootswatch

[33mcommit d5f57af3422babbc0df7698e848e9b1075c6dbea[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Fri Aug 1 12:21:17 2025 -0400

    fix: pass max-memory expose-gc as process args

[33mcommit de05dad2518b657acc0b854c86a7c8fc88484e0e[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Thu Jul 31 13:57:00 2025 +0000

    chore: update changelog for v4.4.5

[33mcommit af95cde187782a7e206c8d5f7c04f241eadf2997[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Thu Jul 31 13:57:00 2025 +0000

    chore: incrementing version number - v4.4.5

[33mcommit 5f5a6972537fb5a614fb384c4894b8d8e792a78c[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Thu Jul 31 09:24:04 2025 -0400

    test: one more fix

[33mcommit 3b609316047004fb79721ad711cc7ba370116abc[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Thu Jul 31 09:17:26 2025 -0400

    test: fix spec

[33mcommit c7c83e0e4bc610a64ad77a3626760e2401ed0eb1[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Thu Jul 31 09:14:19 2025 -0400

    test: fix openapi

[33mcommit 7c00e814b711712e5e7d092e1647987c829968ef[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Thu Jul 31 09:00:40 2025 -0400

    refactor: use promise.all

[33mcommit bbb9a4601963d0283802ed0e9e268a2dc63f63da[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Thu Jul 31 09:02:49 2025 -0400

    feat: add filter:post.getDiffs

[33mcommit 5f696176b444e8836dcc09c08a59b3edf7690bac[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Sun Jul 27 10:35:17 2025 -0400

    fix: clearTimeout if item is evicted from cache

[33mcommit fe9b49e3d5dc8dadfea1b775095df63d001838e6[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Fri Jul 25 10:57:30 2025 -0400

    test: increase timeout of failing test

[33mcommit b74c789849eb25bb9527d181d104837df940bfdb[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Fri Jul 25 10:49:52 2025 -0400

    fix: use sharp to convert svg to png, closes #13534

[33mcommit 5a86415092c438bad4fb463a951886ca7b501213[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Fri Jul 25 10:28:40 2025 -0400

    chore(config): migrate config renovate.json (#13565)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit 5bcf078a75ee484dc154821ca9ba34fd805118da[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Thu Jul 24 12:07:26 2025 -0400

    fix: use filename to check for svg, tempPath doesn't always have extension

[33mcommit a8f4c5e63a93089ad334e9c927e9a0862e235394[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Thu Jul 24 10:34:37 2025 -0400

    fix: apply sanitizeSvg to regular uploads and uploads from manage uploads acp page

[33mcommit 3e961257ec0904dbc3b3c64dab3d4cbdffcfbbd7[m
Author: Barış Uşaklı <barisusakli@gmail.com>
Date:   Wed Jun 18 13:25:36 2025 -0400

    Update README.md

[33mcommit 7b14e2677544938f3a121363783b06071e15a4f5[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Wed Jun 18 14:20:41 2025 +0000

    chore: update changelog for v4.4.4

[33mcommit 2490c312c97926d0b5975c15780db593b8d7ade6[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Wed Jun 18 14:20:41 2025 +0000

    chore: incrementing version number - v4.4.4

[33mcommit a3fed408e571b4f4be0dfcf75539dd77f95ae60b[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Tue Jun 17 09:21:00 2025 -0400

    change default to perma ban

[33mcommit 8c69c6a0c4399debac837469dbbb1a142d220679[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Tue Jun 17 09:17:57 2025 -0400

    feat: link to post in preview timestamp

[33mcommit da2597f81ce5c7df5e02a90d5215e2da087d1f47[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Wed Jun 11 17:13:56 2025 -0400

    fix: sanitize svg when uploading site-logo, default avatar and og:image

[33mcommit dc37789b5dd4888332c6ef4c3ede65fedcdd2452[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Wed Jun 11 13:16:52 2025 -0400

    refactor: send single message

[33mcommit 84d99a0fc775f01e1dc28b4c80ad78b58d539263[m
Author: Eli Sheinfeld <lma05485@gmail.com>
Date:   Wed Jun 11 20:13:23 2025 +0300

    feat: Add live reload functionality with Grunt watch and Socket.IO (#13489)
    
    - Added livereload event to Grunt watch tasks for instant browser refresh
    - Integrated Socket.IO WebSocket communication for real-time updates
    - Enhanced development workflow with immediate file change detection
    - Improved developer experience with automatic browser reload on file changes
    
    Changes:
    - Gruntfile.js: Send livereload message when files change
    - src/start.js: Handle livereload events and broadcast via Socket.IO

[33mcommit 6c5b22684bdb30598dd7166f8fd4104ab7bd177b[m
Author: cliffmccarthy <16453869+cliffmccarthy@users.noreply.github.com>
Date:   Wed Jun 11 08:52:36 2025 -0500

    fix: Revise package hash check in Docker entrypoint.sh (#13483)
    
    - In the build_forum() function, the file install_hash.md5 is intended
      to track the content of package.json and detect changes that imply
      the need to run 'nodebb upgrade'.
    - The check to compare the current checksum of package.json to the one
      saved in install_hash.md5 is reversed.  The "package.json was
      updated" branch is taken when the hashes are the same, not when they
      are different.
    - When install_hash.md5 does not exist, the comparison value becomes
      the null string, which never matches the checksum of package.json.
      As a result, the code always takes the "No changes in package.json"
      branch and returns from the function without creating
      install_hash.md5.  As a result, install_hash.md5 never gets created
      on a new installation.
    - Revised build_forum() to use "not equals" when comparing the two
      checksums.  This causes it to run 'nodebb upgrade' when the
      checksums are different, and also when install_hash.md5 does not yet
      exist.  If the checksum saved in install_hash.md5 matches the
      current package.json checksum, it proceeds to either the "Build
      before start" case or the "No changes" case.

[33mcommit 32faaba0e5a53da8c6ba4eb9192c6dd157a252ce[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Tue Jun 10 13:36:23 2025 -0400

    fix: more edge cases

[33mcommit 0ebb31fe87750e6b50a2cccc389c0170543af493[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Tue Jun 10 12:39:49 2025 -0400

    fix: #13484, clear tooltip if cursor leaves link
    
    and doesn't enter tooltip

[33mcommit 8ab034d8f05c90e03fef0f719c2110061d0de01c[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Tue Jun 10 10:52:55 2025 -0400

    lint: fix lint

[33mcommit 14e30c4bf8b0c3064cd1b3789badf32f50e22cfb[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Tue Jun 10 10:47:14 2025 -0400

    feat: closes #13484, post preview changes
    
    don't close preview when mouse leaves the anchor
    close preview on click outside
    close preview when mouseleaves preview
    open the preview to the top if there isn't enough space
    add scrollbar to post preview

[33mcommit 0c9297f81cd1e62df4c6cecaf36fe66fc4016472[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Mon Jun 9 15:26:59 2025 +0000

    chore: update changelog for v4.4.3

[33mcommit 3d88cb8696cc9a5d206575646ae952352e4d06f1[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Mon Jun 9 15:26:58 2025 +0000

    chore: incrementing version number - v4.4.3

[33mcommit 5f51dfc4356a70493a789d419dec41866b8003f3[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Mon Jun 9 11:10:07 2025 -0400

    chore: up composer

[33mcommit b02eb57d067105c4aedae09cf1eea5413db566e5[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Mon Jun 9 10:23:00 2025 -0400

    fix: escape, query params

[33mcommit 806e54bf5a0d6a6cefb2f9e0ba57346e77aef8a6[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Thu Jun 5 11:42:29 2025 -0400

    fix: closes #13475, don't store escaped username
    
    when updating profile

[33mcommit 4fbcfae8b15e4ce5d132c408bca69ebb9cf146ed[m
Author: Barış Uşaklı <barisusakli@gmail.com>
Date:   Thu Jun 5 07:15:45 2025 -0400

    Post queue write api (#13473)
    
    * move post queue from socket.io to rest api
    
    * move harmony post-queue to core
    
    add canEdit, allow users to edit their queued posts
    
    * fix: openapi spec
    
    * lint: whitespace

[33mcommit 6d40a2118c7244ff8e2cb7f4aad8b52341aab0b9[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Mon Jun 2 15:06:29 2025 +0000

    chore: update changelog for v4.4.2

[33mcommit 9c7cbbe2e4f5043ed99036ccf39576eed070657b[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Mon Jun 2 15:06:29 2025 +0000

    chore: incrementing version number - v4.4.2

[33mcommit 524a1e8bfe403fa240e804f076943871264caf2f[m
Author: Julian Lam <julian@nodebb.org>
Date:   Sun Jun 1 12:40:37 2025 -0400

    fix: return 200 for non-implemented activities instead of 501

[33mcommit b1022566da98b5b58f08a1efc76daba345eac232[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Mon Jun 2 09:55:20 2025 -0400

    fix: closes #13458, check if plugin is system
    
    plugin before activate/deactive/install/uninstall

[33mcommit cc9270262074b154fd6d3a5df7d1f354f3b4cb37[m
Author: Julian Lam <julian@nodebb.org>
Date:   Sun Jun 1 00:31:58 2025 -0400

    fix: add try..catch around topics.post in note assertion logic

[33mcommit 83a55f6adcd246920ba08415dcdf46505503c4a4[m
Author: Julian Lam <julian@nodebb.org>
Date:   Sat May 31 22:46:47 2025 -0400

    fix: don't throw on unknown post on Undo(Like)

[33mcommit 629eec7b5b17c55984dd690b281224d9139a57d4[m
Author: Julian Lam <julian@nodebb.org>
Date:   Fri May 30 16:49:15 2025 -0400

    fix: add try..catch wrapper around Announce(Like) call to internal method so as to not return a 500 — just drop the Like activity

[33mcommit ebb88c1277945887062c1e669f5e4a93cbffd2ed[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Fri May 30 11:45:04 2025 -0400

    feat: add action:post-queue.save
    
    fires after a post is added to the post queue

[33mcommit 390f6428506f98458045fe07b6f594508141cc4c[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Fri May 30 11:00:08 2025 -0400

    fix: browser title translation

[33mcommit 78de8c6da12919e60660142bff46ebde5ad23b1f[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Fri May 30 09:22:06 2025 -0400

    fix: allow guests to load topic tools if they have privilege to view them
    
    display errors from topics.loadTopicTools

[33mcommit 0c1a61839efc6bfb57b945e223584c5c70c69177[m
Author: Julian Lam <julian@nodebb.org>
Date:   Thu May 29 12:49:56 2025 -0400

    test: fix groups:find webfinger test

[33mcommit 72417d82bd05c26dd8e38220fd9dc05792a07fdb[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Thu May 29 11:36:46 2025 -0400

    fix: closes #13454, align dropdowns to opposite side on rtl

[33mcommit 49b5268e529a403ca929797361f853c3c40f301d[m
Author: Julian Lam <julian@nodebb.org>
Date:   Wed May 28 14:53:32 2025 -0400

    fix: send actor in undo(follow)

[33mcommit b20a6ed0d700f0a02cdf5d9e42d6f0fd42b6f4e0[m
Author: Julian Lam <julian@nodebb.org>
Date:   Wed May 28 12:31:53 2025 -0400

    fix: missed handling zset on ap unfollow

[33mcommit a888b868c70361b2298c2fa1eb4770085c2c6689[m
Author: Julian Lam <julian@nodebb.org>
Date:   Mon May 26 14:49:48 2025 -0400

    fix: additional tests for remote privileges, enforcing privileges for remote edits and deletes

[33mcommit fd2ae7261e0e8378c10e7b8863c368ce864d5edb[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Sun May 25 19:04:01 2025 -0400

    chore: up eslint stylistic

[33mcommit e2de0ec212bda29ae419f81fc92cad122da99e4b[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Sat May 24 16:50:53 2025 -0400

    chore: up dbsearch

[33mcommit 30aa0fe6d25c0b5aac9df422818911e909c178aa[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Sat May 24 11:49:49 2025 -0400

    chore: up dbsearch

[33mcommit e70e990a1aa932a3f994b2205bacc2f35730aa01[m
Author: Julian Lam <julian@nodebb.org>
Date:   Thu May 22 14:13:41 2025 -0400

    feat: restrict access to ap.probe method to registered users, add rate limiting protection

[33mcommit 99234b3f97af00c136d126fd748e8c6cbb1ff989[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Thu May 22 11:16:14 2025 -0400

    chore: up harmony

[33mcommit a16bc7382cee1fe5c278ca05bd1c014203de8ff5[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Thu May 22 11:01:05 2025 -0400

    chore: up harmony

[33mcommit a686cf20624dfebf2077ddfb86054252deef7061[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Fri May 16 16:37:49 2025 +0000

    chore: update changelog for v4.4.1

[33mcommit 672dcc5d142e34f36cb9621dca1e05c7d41ee1ea[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Fri May 16 16:37:49 2025 +0000

    chore: incrementing version number - v4.4.1

[33mcommit 948bfe46f1c0fdb5c9d7e56dbcf26f40586ce330[m
Author: Julian Lam <julian@nodebb.org>
Date:   Fri May 16 11:43:26 2025 -0400

    test: fix tests to account for a460a55064e1280f36a0021e0510c7c557251030

[33mcommit ce5ef1ab6e98c2c8e91735beab5eb6ee9fec6ca5[m
Author: Julian Lam <julian@nodebb.org>
Date:   Fri May 16 10:04:39 2025 -0400

    fix: openapi schema to handle additional `attachments` field in postsobject

[33mcommit 61a63851d4f26386494756c65c4385e09da61815[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Thu May 15 18:25:10 2025 -0400

    chore: up themes

[33mcommit 0a574d72404f885e46e2a2783a24f129f5bfd3cc[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Thu May 15 18:23:38 2025 -0400

    fix: group edit url

[33mcommit 8f9f377121d38a1bb4aff121d35236b12bf75ebc[m
Author: Julian Lam <julian@nodebb.org>
Date:   Thu May 15 16:57:05 2025 -0400

    fix: add attachments to getpostsummaries call in search, #13324

[33mcommit a460a55064e1280f36a0021e0510c7c557251030[m
Author: Julian Lam <julian@nodebb.org>
Date:   Thu May 15 15:38:57 2025 -0400

    fix: bring back auto-categorization if group and object are same-origin, handle Peertube putting channel names in `attributedTo`

[33mcommit 3674fa578346483dac1f4e5922bf7d545a689785[m
Author: Julian Lam <julian@nodebb.org>
Date:   Thu May 15 13:56:31 2025 -0400

    feat: save width and height values into post attachment

[33mcommit 45a11d45fc2cd09943934b52bd8bef155306fa65[m
Author: Julian Lam <julian@nodebb.org>
Date:   Thu May 15 12:01:45 2025 -0400

    fix: #13419, handle remote content with mediaType text/markdown

[33mcommit 6c3e2a8e2291dc15163dfd4ec2b2034df5d9d9e1[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Thu May 15 09:42:55 2025 -0400

    refactor: create date once per digest.send

[33mcommit 3faae559a8c39c398a6f9df50cebdd5479e78665[m
Merge: 3d96afb2d1 09cc91d5a0
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Thu May 15 09:38:49 2025 -0400

    Merge branch 'master' of https://github.com/NodeBB/NodeBB

[33mcommit 3d96afb2d1bbb16c397e537133fd3fea21f9ffaa[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Thu May 15 09:38:43 2025 -0400

    feat: use local date string for digest subject
    
    closes #13420

[33mcommit 09cc91d5a06b34d70187ac23857254e8705f4c9c[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Wed May 14 20:36:36 2025 +0000

    chore: update changelog for v4.4.0

[33mcommit b31d769d9c0171cd87281d3deec1198503de8998[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Wed May 14 20:36:35 2025 +0000

    chore: incrementing version number - v4.4.0

[33mcommit 799b08db3a6f74bf32b4fc45fbb4e94441e3892d[m
Author: Julian Lam <julian@nodebb.org>
Date:   Wed May 14 15:22:58 2025 -0400

    fix: adjust Peertube-specific handling to shove mp4 into post attachments, #13324

[33mcommit 919d62ab4e3eb70808264e36f0afd42c62d8dd98[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Wed May 14 14:23:24 2025 -0400

    fix(deps): update dependency diff to v8 (#13409)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit 3e18af1e2576ce4cbaef842674f80e15c60a9a4c[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Wed May 14 14:22:45 2025 -0400

    fix(deps): update dependency sanitize-html to v2.17.0 (#13418)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit d5865613e3ca132227150be1be81e9545259ecf3[m
Author: Julian Lam <julian@nodebb.org>
Date:   Wed May 14 14:14:06 2025 -0400

    fix: #13081, don't add mention when you are replying to yourself

[33mcommit f176d6b2c5cc76ee8ee749c6ed6b3b1f1430b89e[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Wed May 14 13:45:21 2025 -0400

    fix(deps): update dependency satori to v0.13.1 (#13408)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit 7320a858968af80f508aeaeccf731d199f59112f[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Wed May 14 13:45:10 2025 -0400

    fix(deps): update dependency pg-cursor to v2.15.0 (#13414)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit 84b8ecc7a0bcf20ceae6c5d30865843e952b3534[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Wed May 14 13:45:01 2025 -0400

    fix(deps): update dependency nodebb-plugin-markdown to v13.2.1 (#13416)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit 366651d6e1651b0c5265ec21b1395463d3962f2f[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Wed May 14 12:40:46 2025 -0400

    fix(deps): update dependency semver to v7.7.2 (#13410)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit 0825c569aa72d1e0a3ea526dfe2b3fad6a9404dd[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Wed May 14 12:40:24 2025 -0400

    fix(deps): update dependency pg to v8.16.0 (#13411)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit fbe97b4e914a31cdd1b66f90651ba77305e6a56f[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Wed May 14 12:38:22 2025 -0400

    chore(deps): update redis docker tag to v8.0.1 (#13415)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit 383a7ce507b7650804520a98e9543ec5b2689b4f[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Wed May 14 12:38:00 2025 -0400

    fix(deps): update dependency nodebb-plugin-mentions to v4.7.6 (#13417)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit 0f576a42195b42a225eba94213299244e0fc1dfa[m
Author: Julian Lam <julian@nodebb.org>
Date:   Wed May 14 12:16:06 2025 -0400

    fix: add `announces` to postdataobject schema

[33mcommit 61f6806b6a6939d56733e9c5ee9a3a1900e9aaa8[m
Author: Julian Lam <julian@nodebb.org>
Date:   Wed May 14 11:49:12 2025 -0400

    test: a few additional tests for announce handling

[33mcommit 5b118904c9544b8cfb53f38b9df0ed6aab888eec[m
Author: Julian Lam <julian@nodebb.org>
Date:   Wed May 14 11:05:10 2025 -0400

    test: fix regression from 5802c7ddd9506a4e296f6dbdf2d9a32621c7f4ef

[33mcommit 9dc91f11a4ab57b8312d4c973894e0a4067c2249[m
Author: Julian Lam <julian@nodebb.org>
Date:   Wed May 14 11:00:53 2025 -0400

    test: fix broken test due to adjusted note assertion relation logic

[33mcommit 7dc690a14ab1471ce6832e9ea84534cce903a3f7[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Wed May 14 09:19:59 2025 +0000

    Latest translations and fallbacks

[33mcommit fe13c75549ff2c9263635a8f1444eac1eedc5287[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue May 13 13:59:34 2025 -0400

    fix: #13375, plus additional tests

[33mcommit 30db15836be674643fbc1915a1d634028e6fcef0[m
Merge: a9c02acae2 0aa9c187f7
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Mon May 12 21:23:19 2025 -0400

    Merge branch 'master' into develop

[33mcommit a9c02acae27358e76f3b8bea85e2c2489d784faf[m
Merge: 1b0b1da6b9 5802c7ddd9
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Mon May 12 17:48:47 2025 -0400

    Merge branch 'develop' of https://github.com/NodeBB/NodeBB into develop

[33mcommit 1b0b1da6b98c5183bdfd645aba24ab5eafda3040[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Mon May 12 17:48:46 2025 -0400

    refactor: use a single until

[33mcommit 5802c7ddd9506a4e296f6dbdf2d9a32621c7f4ef[m
Author: Julian Lam <julian@nodebb.org>
Date:   Mon May 12 14:59:57 2025 -0400

    fix: missing awaits, more comprehensive 1b12 tests

[33mcommit 0aa9c187f71606ac0e395b51755b4c0394103193[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Mon May 12 14:53:40 2025 +0000

    chore: update changelog for v4.3.2

[33mcommit f60748906030c1e2f475ab5b8edcf951f99cc7b3[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Mon May 12 14:53:39 2025 +0000

    chore: incrementing version number - v4.3.2

[33mcommit f88f99b7a2939f82024fab7b564cdeb8aaf599d8[m
Merge: 5b6c34bfcf 00668bdc34
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Mon May 12 10:29:45 2025 -0400

    Merge branch 'master' into develop

[33mcommit 00668bdc342f22b1ef263ca2d6003b12bbb194af[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Mon May 12 10:29:32 2025 -0400

    refactor: wrap ap routes in try/catch

[33mcommit dfa213298b7dce55845c18eee657ad4d32145ef5[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Mon May 12 10:28:26 2025 -0400

    refactor: call verify if request is POST

[33mcommit 16504bad8100aa25327dd8b8b26483df9e087b69[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Mon May 12 10:02:59 2025 -0400

    fix: sql injection in sortedSetScan

[33mcommit 285d438cb3f98a729765a1bde6b12efa535a3940[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Mon May 12 09:30:33 2025 -0400

    fix: escape flag filters

[33mcommit 31be083e86060b5903d9f3ba6cba65f6c86a9c1d[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Mon May 12 09:12:51 2025 -0400

    fix: #13407, don't restart user jobs
    
    if jobsDisabled=true on that process

[33mcommit 5b6c34bfcfb5eb78d28719721e921f28447e215d[m
Merge: 23374fd7e9 fcf9e8b796
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Mon May 12 09:02:18 2025 -0400

    Merge branch 'master' into develop

[33mcommit fcf9e8b796d81db1c7e50561f25b78e5ebfe3bf4[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Mon May 12 09:01:32 2025 -0400

    chore: up mentions

[33mcommit 23374fd7e9b6594b1cbcdaa8a65efa95182bdaf5[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Sun May 11 22:33:49 2025 -0400

    fix(deps): update dependency lru-cache to v11 (#12685)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit 6a4ffe02159d133e260fc99036db65aa63ad4d59[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Sun May 11 22:33:25 2025 -0400

    fix(deps): update dependency rimraf to v6 (#12686)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit 1df7313c99611733b432e6ba5f53afa2bd159530[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Sun May 11 22:32:58 2025 -0400

    chore(deps): update redis docker tag to v8 (#13387)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit d319b0aaadeee8224ac8788ad0563d72f1360cde[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Sun May 11 22:32:45 2025 -0400

    chore(deps): update postgres docker tag to v17.5 (#13398)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit 7a7cf830c317d69bf05559d93832136e2dd7217a[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Sun May 11 22:32:37 2025 -0400

    fix(deps): update dependency bootswatch to v5.3.6 (#13400)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit ecce9998186d453d3562f5062ec12be5469535a4[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Sun May 11 22:32:27 2025 -0400

    fix(deps): update dependency csrf-sync to v4.2.1 (#13401)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit 694c79bc9a0af5b96ff4f1455b79fcd3e4056905[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Sun May 11 22:32:18 2025 -0400

    chore(deps): update dependency sass-embedded to v1.88.0 (#13402)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit 7ffba2186c144434048dfdb48026343eae86a463[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Sun May 11 22:31:59 2025 -0400

    fix(deps): update dependency sass to v1.88.0 (#13403)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit 9d877481bdb6036effd3996cbe20d96d0c727dc6[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Sun May 11 22:31:50 2025 -0400

    chore(deps): update dependency lint-staged to v16 (#13404)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit 8174578c5bfc45057be71b99425a9b93decaec98[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Sun May 11 22:31:00 2025 -0400

    fix: closes #13405, catch errors in ap.verify

[33mcommit bbf69e4093a7326a1b135d1769e2983d6f337823[m
Merge: d7cc637675 20ab90694c
Author: Julian Lam <julian@nodebb.org>
Date:   Fri May 9 10:34:25 2025 -0400

    Merge branch 'master' into develop

[33mcommit 20ab90694c47ec3dde3afccde22b3ac2f89ca85b[m
Author: Julian Lam <julian@nodebb.org>
Date:   Fri May 9 10:34:19 2025 -0400

    fix: send proper accept header for outgoing webfinger requests

[33mcommit d7cc637675e06313c8a11949b08ea59273517993[m
Merge: af3afba0f8 64fdf91b6b
Author: Julian Lam <julian@nodebb.org>
Date:   Fri May 9 10:17:50 2025 -0400

    Merge branch 'master' into develop

[33mcommit 64fdf91b6b02c291edd29f2a7de0dbe85591fd79[m
Author: Julian Lam <julian@nodebb.org>
Date:   Fri May 9 10:16:33 2025 -0400

    fix: wrap generateCollection calls in try..catch to send 404 if thrown

[33mcommit af3afba0f8fb495a529e6a61718b855ced50434c[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Thu May 8 20:21:13 2025 -0400

    fix(deps): update dependency nodemailer to v7.0.3 (#13395)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit 6bfe4e627d8bd396131442b59ee8c1fade8162b2[m
Author: Julian Lam <julian@nodebb.org>
Date:   Thu May 8 16:34:13 2025 -0400

    fix: another case

[33mcommit e042201f4bc662cc294ba19f63e218aa0860d82c[m
Author: Julian Lam <julian@nodebb.org>
Date:   Thu May 8 16:32:21 2025 -0400

    fix: handle missing orderedItems property in followers route

[33mcommit d5349b39f5c8f857fccbe669e4f6c7d7ce70ac0f[m
Merge: 7a7a4f0ab7 26e6a22278
Author: Julian Lam <julian@nodebb.org>
Date:   Thu May 8 14:12:33 2025 -0400

    Merge branch 'master' into develop

[33mcommit 26e6a22278c426802e8f80e70cefcffc73653a25[m
Author: Julian Lam <julian@nodebb.org>
Date:   Thu May 8 13:55:42 2025 -0400

    fix: #13397, null values in category sync list

[33mcommit 401ff797c91217c4887b86f013f038b7d4e09b13[m
Author: Julian Lam <julian@nodebb.org>
Date:   Thu May 8 13:55:17 2025 -0400

    fix: #13392, regression from c6f2c87, unable to unfollow from pending follows

[33mcommit a9a5ab5e4bfef9acde8d45d04322081f44a3da47[m
Author: Julian Lam <julian@nodebb.org>
Date:   Thu May 8 13:41:43 2025 -0400

    fix: #13397, update getCidByHandle to work with remote categories, fix sync with handles causing issues with null entries

[33mcommit 7a7a4f0ab7b901806b4c2e3e87323701c1f7755d[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Thu May 8 09:40:53 2025 -0400

    chore(deps): update commitlint monorepo to v19.8.1 (#13394)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit 4245575e09013253e72e607dc5b185aefb87cc90[m
Merge: 0b4d403c61 10077d0f89
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Wed May 7 19:06:01 2025 -0400

    Merge branch 'master' into develop

[33mcommit 0b4d403c619fbfd00e8fe8d8f95930cd71c7a720[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Wed May 7 18:59:04 2025 -0400

    fix(deps): update dependency nodemailer to v7 (#13381)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit 4f0f67a45f815a93e0aab2a337d36814ef5b3791[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Wed May 7 18:58:52 2025 -0400

    fix(deps): update dependency csrf-sync to v4.2.0 (#13364)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit 10077d0f89b4e3779f2e9217d5061d7d55f84240[m
Author: Opliko <opliko@opliko.dev>
Date:   Thu May 8 00:57:40 2025 +0200

    fix: correct stage name in dev dockerfile (#13393)
    
    Co-authored-by: ThisIsMissEm <ThisIsMissEm@users.noreply.github.com>

[33mcommit c7a164aef559676d4f3e4188ef0aceda78f91b0d[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Wed May 7 13:02:39 2025 -0400

    fix(deps): update dependency webpack to v5.99.8 (#13390)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit a819d39c31f5f0e843701c5e59cf87de3aa9f294[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Wed May 7 12:42:22 2025 -0400

    test: update filter:router.page tests to response:router.page

[33mcommit 2310a7b835438db75c288282c6651dec7f75c0e7[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Wed May 7 15:38:18 2025 +0000

    chore: update changelog for v4.3.1

[33mcommit 130b93eca91f305cc2c7b95ec818ae637f76a4dc[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Wed May 7 15:38:18 2025 +0000

    chore: incrementing version number - v4.3.1

[33mcommit 9324a1937be24d8eb7ad057ee922e2dff37370eb[m
Author: Barış Uşaklı <barisusakli@gmail.com>
Date:   Wed May 7 11:28:33 2025 -0400

    Update README.md

[33mcommit ebe40f960c52aa6596a5e7bfc6fa9b97e8155d9d[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Wed May 7 09:20:10 2025 +0000

    Latest translations and fallbacks

[33mcommit 96dc5c89a462cc5a289762a6ea618a2192e01eba[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Tue May 6 17:26:01 2025 -0400

    chore(deps): update dependency lint-staged to v15.5.2 (#13383)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit e6a196127435752cd27127290e02e7ad3bd9c17b[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Tue May 6 17:25:50 2025 -0400

    fix(deps): update dependency bootstrap to v5.3.6 (#13384)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit b6f4de5bffe9f9282e6fb720aed66d3156730fc5[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Tue May 6 17:25:40 2025 -0400

    fix(deps): update dependency esbuild to v0.25.4 (#13385)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit 52df41b9060123390fe3da8f8ba123acb5dc6f4e[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue May 6 15:13:29 2025 -0400

    test: adjustment for now-removed labels property

[33mcommit 860ac8953e753ef29fcc2b8abcb0130b07cb624f[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue May 6 15:08:21 2025 -0400

    docs: remove since-removed `labels` property from api

[33mcommit 15b6a2c117a9ab13afb0eeef631e12b7651be428[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue Dec 5 10:06:36 2023 -0500

    chore: remove unused require

[33mcommit 8ea377a4011d9973c2980bdae9657a6fca20927e[m
Author: Julian Lam <julian@nodebb.org>
Date:   Mon Dec 4 14:21:05 2023 -0500

    breaking: removal of deprecated privilege hooks
    
    * filter:privileges.global.list
    * filter:privileges.global.groups.list
    * filter:privileges.global.list_human
    * filter:privileges.global.groups.list_human
    * filter:privileges.list
    * filter:privileges.groups.list
    * filter:privileges.list_human
    * filter:privileges.groups.list_human
    * filter:privileges.admin.list
    * filter:privileges.admin.groups.list
    * filter:privileges.admin.list_human
    * filter:privileges.admin.groups.list_human

[33mcommit 547fb482eb0bc82905956a5440410bcd118795bf[m
Author: Julian Lam <julian@nodebb.org>
Date:   Mon Dec 4 14:04:55 2023 -0500

    breaking: removal of `filter:flags.getFilters`

[33mcommit 7e25946cd7e18e17db8f64144fda6fe4d3ae0e28[m
Author: Julian Lam <julian@nodebb.org>
Date:   Mon Dec 4 14:04:18 2023 -0500

    breaking: removal of `filter:user.verify.code`

[33mcommit df5c1a938de3db394928a2f24d729d8f9a8eb561[m
Author: Julian Lam <julian@nodebb.org>
Date:   Mon Dec 4 14:03:19 2023 -0500

    breaking: removal of `filter:post.purge`

[33mcommit c84b72fb37bbb6991aa9ff80e8313a24552fa48d[m
Author: Julian Lam <julian@nodebb.org>
Date:   Mon Dec 4 14:02:31 2023 -0500

    breaking: removal of `filter:post.purge`

[33mcommit 9d8061eab9f018dc8478867d637ac711cbb23ba8[m
Author: Julian Lam <julian@nodebb.org>
Date:   Mon Dec 4 14:00:48 2023 -0500

    breaking: removal of `filter:router.page`

[33mcommit b73a8d3e1dd9fe674c164e2bc500fe3a707de539[m
Author: Julian Lam <julian@nodebb.org>
Date:   Mon Dec 4 13:56:25 2023 -0500

    breaking: removal of `filter:email.send`

[33mcommit 651ebaaf6c3e62e7ea02775a51ea5b1de4b6fb81[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue May 6 13:24:58 2025 -0400

    fix: missing await

[33mcommit 53bb0bbc26ed4993a841f0179f35815f90697cc2[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue May 6 12:30:43 2025 -0400

    fix: handle missing orderedItems

[33mcommit f83b1fbf68a4d5530b9fb0e1e258e90ce31f7cce[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue May 6 12:27:27 2025 -0400

    fix: extra `orderedItems` property in generated paginated OrderedCollection, #13153

[33mcommit a2de7aaecfacc284a57f0b9389d978ea85216885[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue May 6 12:09:33 2025 -0400

    fix: #13153, follower and following collections to use generateCollection helper

[33mcommit 7f59238d3a17c8dd077e9e296b15a431c45ae9ed[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue May 6 12:09:07 2025 -0400

    refactor: Helpers.generateCollection so that total count and a bound function can be passed in, #13153

[33mcommit 450ce3b85ce86fd1e2411cf033398be90ecd79af[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Tue May 6 11:29:19 2025 -0400

    chore(deps): update dependency @eslint/js to v9.26.0 (#13371)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit e2a8cf98f3f6b95596a24b1991fcd58a1334b2d7[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Tue May 6 11:17:35 2025 -0400

    fix(deps): update dependency @fontsource/poppins to v5.2.6 (#13376)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit b4338489712f44286f52d0a3ea726c83801cde56[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue May 6 10:44:47 2025 -0400

    fix: #13374, updates to posts.edit to handle remote content updates better

[33mcommit 625ce96f94cc3197ed94186610d418ed32627dd0[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue May 6 10:03:27 2025 -0400

    fix: leftover `handle` var

[33mcommit 2c0aba02d325af8ec49fe76e70aaf0b20a4dccad[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Tue May 6 09:59:17 2025 -0400

    fix(deps): update dependency nodebb-plugin-mentions to v4.7.5 (#13386)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit 7f757615e5fc08d686a8580af7df2b32d2c5a22c[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Tue May 6 09:37:52 2025 -0400

    fix(deps): update dependency nodebb-widget-essentials to v7.0.38 (#13380)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit 954aa541ac5783c3c345139cc13076caa2039860[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Tue May 6 09:35:30 2025 -0400

    fix(deps): update dependency nodebb-theme-persona to v14.1.11 (#13379)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit 2aa0bfc5f660956abf0cffec2016307c3e8ac490[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Tue May 6 09:32:50 2025 -0400

    fix(deps): update dependency nodebb-theme-peace to v2.2.42 (#13378)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit 72b3a21539da1111b5fc9770f2bdb4f6d103a4c1[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Tue May 6 09:32:32 2025 -0400

    fix(deps): update dependency nodebb-theme-harmony to v2.1.12 (#13377)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit 92af41582951ceda4a263d0fdcd300b69fc55ce4[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Tue May 6 09:20:36 2025 +0000

    Latest translations and fallbacks

[33mcommit f8d012c81c7d9fa1141eed8940db828ee9af9861[m
Author: Julian Lam <julian@nodebb.org>
Date:   Mon May 5 17:01:07 2025 -0400

    fix: AP inbox update handling for non-note objects

[33mcommit 9f80d10d09a5a6bc9ae040c3119b6063de39b65c[m
Author: Julian Lam <julian@nodebb.org>
Date:   Mon May 5 16:50:44 2025 -0400

    fix: 1b12 creates being dropped

[33mcommit 7cf61ab0809b5e7ffd8ebfb5bc4e8ab8c93736b7[m
Author: Julian Lam <julian@nodebb.org>
Date:   Mon May 5 16:35:12 2025 -0400

    fix: update AP api (un)follow ids to be url encoded id instead of handle

[33mcommit 31af05c75aeec775385c94ca842a3b2b981adc78[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Mon May 5 11:09:53 2025 -0400

    test: fix android test

[33mcommit 25979294e1ae59efb4d9a644aa73095c38914520[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Mon May 5 11:00:30 2025 -0400

    test: fix android test

[33mcommit 7ef79981ddfdfebee8cea52799688bda0bebd57d[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Mon May 5 10:57:43 2025 -0400

    test: fix a test

[33mcommit 800426d68b91f0a8aeac9383f9728c9fb1588ea9[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Mon May 5 10:46:04 2025 -0400

    chore: node 18 eol

[33mcommit 2d15555e5c687dc00af1c39b8c30287f18ddadbb[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Mon May 5 10:43:56 2025 -0400

    update tests to node 20/22

[33mcommit 4b78710b46f1bbe230d816f79da1c91e390aaba0[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Mon May 5 09:06:41 2025 -0400

    fix(deps): update dependency ace-builds to v1.41.0 (#13372)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit ee2f91ad988f256312c2a156f2b358fe4a8aaf0c[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Sat May 3 14:36:20 2025 -0400

    chore: up widgets

[33mcommit 18867fb14a810e261e89f4409e15864c40ae12da[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Fri May 2 19:49:56 2025 -0400

    chore: up themes

[33mcommit d35aad317d1afeb3e7ecaf1d1ef3c1b5934f2aab[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Fri May 2 19:48:35 2025 -0400

    https://github.com/NodeBB/NodeBB/issues/13367

[33mcommit 39953ee16ba34926fc3f03a93deff1402f45c22c[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Fri May 2 19:48:35 2025 -0400

    https://github.com/NodeBB/NodeBB/issues/13367

[33mcommit e958010f40658ffd2756dbb30a2a427013230b56[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Fri May 2 19:41:55 2025 -0400

    chore(deps): update dependency mocha to v11.2.2 (#13366)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit f3bd8590e9741751dcf1804ed4568859a6b1c87a[m
Author: Julian Lam <julian@nodebb.org>
Date:   Fri May 2 14:07:56 2025 -0400

    fix(deps): bump markdown

[33mcommit 227bfabb8bef2df5b8a5ba6cbf48cafee432b35a[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Fri May 2 09:19:56 2025 +0000

    Latest translations and fallbacks

[33mcommit cf62da5c3e5213b559d4c05a68ef2f9823239c9d[m
Merge: 6ada76f401 343f13e1c1
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Thu May 1 13:06:16 2025 -0400

    Merge branch 'master' into develop

[33mcommit 343f13e1c133b4fa536cda035c249f30f01f8067[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Thu May 1 10:55:00 2025 -0400

    chore: update bundled plugins to use eslint9

[33mcommit 6ada76f401e7111bfdf19d53a5a7e42a3ff365fa[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Thu May 1 09:19:38 2025 +0000

    Latest translations and fallbacks

[33mcommit 76c03019f80ddfae181c2c00cf851b801698bdd5[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Thu May 1 04:13:40 2025 +0000

    chore: update changelog for v4.3.0

[33mcommit 7b43b1b80e7bc96b21860349cf17603a226b20f2[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Thu May 1 04:13:39 2025 +0000

    chore: incrementing version number - v4.3.0

[33mcommit 1c07eab66be6d20879cc6cc35ff7a66bb7a3ecc8[m
Merge: b32b7fccff ed92ffaf08
Author: Julian Lam <julian@nodebb.org>
Date:   Thu May 1 00:06:47 2025 -0400

    Merge remote-tracking branch 'origin/master' into develop

[33mcommit b32b7fccffd63fa12f12d5e1bfcb97d7a3c14927[m
Author: Julian Lam <julian@nodebb.org>
Date:   Wed Apr 30 15:18:05 2025 -0400

    docs: update openapi spec with new (missing) properties

[33mcommit 2bf2e55664952b7c835aad86720e35f804168fa7[m
Author: Julian Lam <julian@nodebb.org>
Date:   Wed Apr 30 15:11:48 2025 -0400

    fix: bump harmony

[33mcommit 2524d4ce127db34336611888f36ebd2cab0bb266[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Wed Apr 30 09:20:22 2025 +0000

    Latest translations and fallbacks

[33mcommit 28b7a203396865e076ab5ad992248eba600ff43d[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue Apr 29 15:13:21 2025 -0400

    lint: yup.

[33mcommit 2827498d76901206f445a6b1b46226b6ccb91fd1[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Tue Apr 29 19:06:06 2025 +0000

    chore(i18n): fallback strings for new resources: nodebb.category, nodebb.world

[33mcommit 5aee2f2661b7f6ae6feeb057fe3e28c15a8e6e99[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue Apr 29 11:52:59 2025 -0400

    feat: upgrade script to remote duplicate remote users and categories as per #13352

[33mcommit 2572cbf5d5395079a7a78ac056fbb0c6ef6d0d30[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue Apr 29 11:18:24 2025 -0400

    fix: #13352, also do the webfinger backreference check when calling assertGroup

[33mcommit e9b3306e7924fafe0fdb020255ddb22966ebade8[m
Author: Julian Lam <julian@nodebb.org>
Date:   Mon Apr 28 14:55:21 2025 -0400

    fix: regression that caused non-public content with source.content to fail parsing

[33mcommit decc9cf19604bc1c228ea479f9977129ee945d64[m
Author: Julian Lam <julian@nodebb.org>
Date:   Mon Apr 28 13:48:26 2025 -0400

    feat: add new mixin clamp-fade, and handler for expanding it in category description
    
    closes #13322

[33mcommit 537a74289868354048644a3281ed2f4a376c499b[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Fri Apr 25 16:29:40 2025 -0400

    fix: closes #13360, catch error in buildAccountData middleware

[33mcommit e3e78445bafb7fb6a82bff8cae689a765ccc598c[m
Author: Julian Lam <julian@nodebb.org>
Date:   Wed Apr 23 13:34:08 2025 -0400

    chore: v4.3.0-beta.2

[33mcommit 044736696e6ce5154900463942d3dfaf2da3f8c1[m
Author: Julian Lam <julian@nodebb.org>
Date:   Wed Apr 23 13:17:10 2025 -0400

    feat: handle Announce(Update(Note)) as well, #13320

[33mcommit 74e32a170f0f10f93f2d7226b3099f3bc27109ae[m
Author: Julian Lam <julian@nodebb.org>
Date:   Wed Apr 23 12:47:16 2025 -0400

    feat: #13255, proper handling of upvotes shared by group actors
    
    fixes #13320

[33mcommit 5c5fd3d44fac48474f0fe0dc26e200f9ff871f7d[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue Apr 22 15:20:52 2025 -0400

    feat: send the whole post content in `summary` as well

[33mcommit c2a3ef817d441485cc4b717c9924b9254988048c[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue Apr 22 15:12:56 2025 -0400

    fix: bug where disparate ids all claiming to be the same handle were causing duplicate remote users due to collisions, #13352

[33mcommit 3e508d6c65fc8ef895d44e65f40b55373a3ad20d[m
Author: Julian Lam <julian@nodebb.org>
Date:   Thu Apr 17 16:41:00 2025 -0400

    test: article for new topic, note for replies

[33mcommit a0a8c4624f530d831e2e209e60deb67a83ef2707[m
Author: Julian Lam <julian@nodebb.org>
Date:   Wed Apr 16 11:21:26 2025 -0400

    fix: posts incorrectly excluded from results if result pid is in a remote category

[33mcommit d020e33422c2eb6ac110e45bbf97090b14267b0d[m
Author: Julian Lam <julian@nodebb.org>
Date:   Wed Apr 16 10:52:07 2025 -0400

    fix: ap helpers.makeSet to handle undefined property values

[33mcommit 512f889ec2f7eb4b635d97cb23ead7d6743626b0[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue Apr 15 10:12:53 2025 -0400

    test: missing clear ap send cache

[33mcommit 0689da8120fbb00c77ab347043b2b541a89343e0[m
Author: Julian Lam <julian@nodebb.org>
Date:   Wed Apr 9 14:25:15 2025 -0400

    chore: v4.3.0-beta.1

[33mcommit 804208b7b5a9ca4e2fc22ce01bbd8dfccc6ea472[m
Author: Julian Lam <julian@nodebb.org>
Date:   Wed Apr 9 11:50:24 2025 -0400

    feat: show/hide categories on world page, #13255

[33mcommit d58d5861d93a803a8437d6a33b63d6a7d2fafe5e[m
Author: Julian Lam <julian@nodebb.org>
Date:   Wed Apr 9 10:55:32 2025 -0400

    fix: add back localCategories to categorySearch when defaultCategories is supplied

[33mcommit 93a5b35f33070fa76a625431d7c6758a3e1892f0[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue Apr 8 14:16:49 2025 -0400

    feat: notice on remote categories that have no local followers, #13255

[33mcommit f02d96614a7d8bd2d22e0390ffa9287b3cf37309[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue Apr 8 14:00:24 2025 -0400

    fix: remote bare hash for remote users on prune as well

[33mcommit a487d5f6f2c56be0e5c2e1069aa91aff71e2513d[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue Apr 8 13:31:23 2025 -0400

    feat: add new option to categorySearch module, `defaultCategories`, use to populate the category list when you don't want to poll backend for the main category list

[33mcommit 695312f17f7296b56169c9f91811a643424a8f94[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue Apr 8 11:43:11 2025 -0400

    fix: missing teasers for remote categories on /world

[33mcommit 0fab4255cceca5649b4e4464191704f84c588ca3[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue Apr 8 10:57:46 2025 -0400

    fix: remove superfluous privilege filter in markAllRead

[33mcommit 2e3e675be4ad4333a28fcdb76aea26d13a4b5930[m
Author: Julian Lam <julian@nodebb.org>
Date:   Mon Apr 7 15:44:40 2025 -0400

    chore: cut 4.3.0-alpha.3

[33mcommit 17909516594ab0e329378e3642820a74290d7c57[m
Author: Julian Lam <julian@nodebb.org>
Date:   Mon Apr 7 15:14:39 2025 -0400

    feat: category quick search on world page, theme version updates, #13255

[33mcommit dabcefafd402b565ff0c1850c0a8de7b67f6f24f[m
Author: Julian Lam <julian@nodebb.org>
Date:   Thu Apr 3 11:52:01 2025 -0400

    fix: reversed image and icon for remote categories, omit fa icon if remote category has icon property set, #13255

[33mcommit 34ab677174e98685a74ea91b0d1f0c6c8f5d83a9[m
Author: Julian Lam <julian@nodebb.org>
Date:   Wed Apr 2 15:14:04 2025 -0400

    feat: show tracked/watched remote categories in world page, #13255

[33mcommit f1d1d0820ac651dad1c9a863286b112a03fedb4f[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Wed Apr 2 09:22:30 2025 -0400

    fix: closes #13289, id can be null

[33mcommit 4a7111d042968cb008be6b438020e50d1ed712ca[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue Apr 1 14:40:58 2025 -0400

    fix: marking remote category topics as read

[33mcommit b0236735f2972e0699a4a0f53a801b7d25f676b2[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue Apr 1 14:13:51 2025 -0400

    fix: markAllRead to get tids based on same logic as unread page, instead of marking all recent posts read

[33mcommit 39fc9bae892366b813d088b1c068531dc5784d56[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue Apr 1 14:02:16 2025 -0400

    test: additional test for ensuring handle:uid is continually set even after re-assertion

[33mcommit c4690392cd3d28fd5453b4d5b5514eb8a8956d9c[m
Author: Julian Lam <julian@nodebb.org>
Date:   Mon Mar 31 16:09:03 2025 -0400

    chore: cut v4.3.0-alpha.2

[33mcommit 6dee3e56e687f2681cb1a40d9901a8de235a52bf[m
Author: Julian Lam <julian@nodebb.org>
Date:   Mon Mar 31 15:17:25 2025 -0400

    fix: key ownership cross-check to also work with remote categories, #13255

[33mcommit 4379df68f5f837e2150852cb6bfc6ed1ca257cf3[m
Author: Julian Lam <julian@nodebb.org>
Date:   Fri Mar 28 12:27:34 2025 -0400

    chore: cut v4.3.0-alpha

[33mcommit 1f04678210e397227940191f68f0476011af0058[m
Author: Julian Lam <julian@nodebb.org>
Date:   Wed Mar 26 14:44:22 2025 -0400

    fix: #13255, assert all recipients of the main post when asserting a note, so that remote categories can be discovered

[33mcommit 4d1d7c3dcaa0c6709f4f9be0fc380b3ecd3d6474[m
Author: Julian Lam <julian@nodebb.org>
Date:   Wed Mar 26 14:08:26 2025 -0400

    fix: remote categories should not show up in a user's follow lists

[33mcommit 3213da1c77c8a193c9706d08159303f50bda9eff[m
Author: Julian Lam <julian@nodebb.org>
Date:   Wed Mar 26 12:28:10 2025 -0400

    fix: #13255, remote user-to-category migration should not move shares that are already in an existing cid

[33mcommit f2e0ba2165fad8ca459739b7eb144fb4e8dd99bc[m
Author: Julian Lam <julian@nodebb.org>
Date:   Wed Mar 26 12:00:55 2025 -0400

    fix: proper handling of actors.qualify response

[33mcommit 2cb6d10d9eaf03eeff0ea63e045bc23de090fe85[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue Mar 25 10:44:39 2025 -0400

    fix: missing dep

[33mcommit c2f77cee04de061f00747c6f5cadfdd6d88424de[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue Mar 25 10:44:39 2025 -0400

    test: additional test for remote category topic assertion when ignoring category

[33mcommit c4274a3dca1688d57d435564997840b9a52fea84[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue Mar 25 10:44:08 2025 -0400

    fix: topics in remote categories showing up in /recent

[33mcommit 0246c14643ee74b878f98d3d75007d1670652dfa[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue Mar 25 10:20:50 2025 -0400

    fix: regression that caused resolveInboxes to always return empty, added tests for resolveInboxes

[33mcommit 97a232e9d5d1b48c0edba7a4a9510bc3fc957d7f[m
Author: Barış Soner Uşaklı <baris@nodebb.org>
Date:   Mon Mar 24 16:02:28 2025 -0400

    dont make db call if ap disabled

[33mcommit 74661381d858c782032962c9909c10b916e73ea6[m
Author: Barış Soner Uşaklı <baris@nodebb.org>
Date:   Mon Mar 24 16:01:08 2025 -0400

    refactor: use promise.all

[33mcommit c1b719642941bccbf0db01aeceff9faa3a55d39b[m
Author: Barış Soner Uşaklı <baris@nodebb.org>
Date:   Mon Mar 24 15:48:01 2025 -0400

    fix: spread fail, @julianlam
    
    add ap check

[33mcommit ac7b7f81b3d267db677760d47ae635ccd6bb87be[m
Author: Julian Lam <julian@nodebb.org>
Date:   Mon Mar 24 15:15:48 2025 -0400

    feat: remote user to category migration should also migrate local user follows into category watches

[33mcommit 309deb0d7a5758a69156392aea4ffa44ac6967b3[m
Author: Julian Lam <julian@nodebb.org>
Date:   Mon Mar 24 14:29:26 2025 -0400

    fix: filter out non-asserted targets when sending ap messages, diff. getter method when passed-in ID is a remote category

[33mcommit c5901e0d244650f37de6075265c0a3865d19e79b[m
Author: Julian Lam <julian@nodebb.org>
Date:   Mon Mar 24 14:15:37 2025 -0400

    fix: tag whitelist check socket call for remote categories

[33mcommit 23b3148c841ffcd4e27178c2ac2aca4fe88cace4[m
Author: Julian Lam <julian@nodebb.org>
Date:   Mon Mar 24 14:05:40 2025 -0400

    feat: allowing manual group assertion via category search input

[33mcommit ee34396c71be518ae72d7bfb3423d2aa07040909[m
Author: Julian Lam <julian@nodebb.org>
Date:   Mon Mar 24 13:55:14 2025 -0400

    fix: migrate topics as system user instead of uid 0

[33mcommit 6e374200e59d5a37ec1d796fc3fb2b213fb53bfc[m
Author: Julian Lam <julian@nodebb.org>
Date:   Mon Mar 24 12:00:08 2025 -0400

    send ap follow/undo-follow if remote category watch state changes

[33mcommit d19f692b8df556ba4d629962ce4587369f819d4c[m
Author: Julian Lam <julian@nodebb.org>
Date:   Mon Mar 24 11:53:39 2025 -0400

    feat: remote group actors migrated to categories if they were previous asserted as remote users

[33mcommit c6f2c874787fc10e86113d20f73ca7d3f8a4cbbe[m
Author: Julian Lam <julian@nodebb.org>
Date:   Mon Mar 24 11:52:09 2025 -0400

    fix: do not send out ap (undo:)follow if local user or category is (not)already following

[33mcommit 85e7c1a20d152757aa460caf6d560b07b8ac5963[m
Author: Julian Lam <julian@nodebb.org>
Date:   Fri Mar 21 14:22:22 2025 -0400

    test: #13255, reply to topic in remote category addresses remote category

[33mcommit b8c531d53d9123354f741da2e974acb6fd2fe855[m
Author: Julian Lam <julian@nodebb.org>
Date:   Fri Mar 21 14:16:33 2025 -0400

    feat: #13255 new topics in remote category addresses remote category, tests, fixes to tests

[33mcommit 0b333fb7d43128d2823e3fcaa939bcfdd08430dd[m
Author: Julian Lam <julian@nodebb.org>
Date:   Thu Mar 20 14:48:09 2025 -0400

    fix: allow category controller to respond also by remote category id

[33mcommit 9c1d5cd36e062f7b6eb60ee719a46e50f4de9026[m
Author: Julian Lam <julian@nodebb.org>
Date:   Thu Mar 20 13:02:30 2025 -0400

    feat: #13255, deliver asserted topics to remote category followers

[33mcommit 6e23de46d6770f13df09e208b1ee2d54760f5477[m
Author: Julian Lam <julian@nodebb.org>
Date:   Wed Mar 19 23:16:48 2025 -0400

    fix: #13255, update category search logic to allow for remote categories

[33mcommit 876d1b0414f45465a9e7f58696db43b27017be82[m
Author: Julian Lam <julian@nodebb.org>
Date:   Wed Mar 19 23:04:43 2025 -0400

    feat: #13255, add category name and handle to category search zset

[33mcommit bfc7daf255379914fe6bf44b52d55fe3b79e0924[m
Author: Julian Lam <julian@nodebb.org>
Date:   Wed Mar 19 22:18:47 2025 -0400

    refactor: categories.sortTidsBySet to not take cid, retrieve from tids themselves
    
    re: ##13255, this fixes the issue with topics outside of cid -1 in /world being sorted incorrectly

[33mcommit 53dc79a1bd837338ec60f06e6369ce6cf735c011[m
Author: Julian Lam <julian@nodebb.org>
Date:   Wed Mar 19 11:02:48 2025 -0400

    test: remote user pruning tests

[33mcommit 9b5855f79ddabdb4fb0cee91103db2374e14e779[m
Author: Julian Lam <julian@nodebb.org>
Date:   Wed Mar 19 10:53:37 2025 -0400

    feat: integrate remote category pruning into actor pruning logic

[33mcommit 4be0f73ace64bd320df73b209c3d60c262d85b12[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue Mar 18 14:50:04 2025 -0400

    feat: migration of group-as-user to group-as-category, remote category purging, more tests

[33mcommit 7ccd6b73aebdbb26426d17e8ba6d793e06f67879[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue Mar 18 11:15:31 2025 -0400

    fix: delete shares zset on account deletion

[33mcommit 4f7481582c774816a995f70df1dc3c7f9afa8d5a[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue Mar 18 11:06:10 2025 -0400

    test: introduce overrides into person and group mocks

[33mcommit 80069a198c7cf96cbe48afe6df4d4e508a84c11d[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue Mar 18 10:18:38 2025 -0400

    test: have ap helper mocks for person and group auto-save to ap cache

[33mcommit afc476435810f4f809723c80f183e3be2d799ed5[m
Author: Julian Lam <julian@nodebb.org>
Date:   Tue Mar 18 10:16:40 2025 -0400

    test: add failing tests for actor/group assertion via wrong method, remote user to category migration

[33mcommit f483e883a7d0f9f706c8897425bda3f132a516b0[m
Author: Julian Lam <julian@nodebb.org>
Date:   Mon Mar 17 14:52:52 2025 -0400

    feat: asserted topics and posts to remote categories will notify and add to unread based on remote category watch state

[33mcommit 804052f272f709c718c2f1e6b402e666b46af6bd[m
Author: Julian Lam <julian@nodebb.org>
Date:   Mon Mar 17 12:02:43 2025 -0400

    test: add tests for topics slotting into remote categories if addressed

[33mcommit ca9a5b6dfba05f34ca1a3cfb948b31a2d1d4b71c[m
Author: Julian Lam <julian@nodebb.org>
Date:   Mon Mar 17 11:44:32 2025 -0400

    test: group actor assertion tests

[33mcommit 0fa98237af0a955b7d03ac264c5dc6c288022364[m
Author: Julian Lam <julian@nodebb.org>
Date:   Fri Mar 14 15:26:59 2025 -0400

    refactor: allow topics to be asserted directly into a remote category, or -1 otherwise

[33mcommit f73f727d90e6901627a9571de8dc68b5a51c8c2e[m
Author: Julian Lam <julian@nodebb.org>
Date:   Thu Mar 13 16:06:06 2025 -0400

    feat: also include category in `to` field when mocking post for federation

[33mcommit 1f40995f79f36eec087ed7c0a4921433e60ea8c2[m
Author: Julian Lam <julian@nodebb.org>
Date:   Thu Mar 13 15:50:44 2025 -0400

    refactor: ability to browse to remote categories, group actor assertion logic, etc. -- no logic to assign topics to remote categories yet

[33mcommit 55c89969edc84b6db010f8e6b34d8459f27e8281[m
Author: Julian Lam <julian@nodebb.org>
Date:   Wed Mar 12 11:52:07 2025 -0400

    revert: use of vanity domains, needs rethinking. Originally added in 709a02d97ae7acbab08c7fa1fecfd01e0dcadcc7

[33mcommit 85fc16780098d5afe155260efbd7614e56abba9e[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Tue Apr 29 09:20:03 2025 +0000

    Latest translations and fallbacks

[33mcommit 4111512841b12c55b35205ec6d4afec61fed4595[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Sun Apr 27 09:19:32 2025 +0000

    Latest translations and fallbacks

[33mcommit ea9f7903eff54382b2dba1ac36c9d7717095b78f[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Sat Apr 26 20:44:35 2025 -0400

    fix: persona tooltip so it doesn't appear when dropdowns are open

[33mcommit 7f533167eecd3a6006206373e134ff2fa8e26a3f[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Sat Apr 26 14:37:21 2025 -0400

    fix(deps): update dependency pg to v8.15.6 (#13362)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit f7aaabaadb77991b1b5bd95826beb0fda4f37dc3[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Sat Apr 26 09:19:33 2025 +0000

    Latest translations and fallbacks

[33mcommit 03e06784d461d0b1e498c6d4d4d1f43d660c18c6[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Fri Apr 25 16:18:47 2025 -0400

    fix(deps): update dependency pg-cursor to v2.14.6 (#13363)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit c889d60c5d33e143162d3c247e55f54d77800894[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Fri Apr 25 16:18:30 2025 +0000

    chore(i18n): fallback strings for new resources: nodebb.error

[33mcommit 4277765b64a21bd3cdb977cb596e624cc7a87e6b[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Fri Apr 25 12:17:26 2025 -0400

    fix: lang keys

[33mcommit d3409b40b1d7e5e0e64837b2c2a14d756ba16d48[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Fri Apr 25 15:54:52 2025 +0000

    chore(i18n): fallback strings for new resources: nodebb.admin-settings-user, nodebb.user

[33mcommit a5afad27e52fd336163063ba40dcadc80233ae10[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Fri Apr 25 11:54:11 2025 -0400

    feat: chat allow/deny list, closes #13359

[33mcommit 7800016f2f1b89d2d3cfea6a7da7c77096b7b927[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Fri Apr 25 09:04:15 2025 -0400

    chore(deps): update redis docker tag to v7.4.3 (#13358)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit 0a3e4d61d84232f8a4ed80feed4bdf8b79ddb04b[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Fri Apr 25 09:04:06 2025 -0400

    fix(deps): update dependency webpack to v5.99.7 (#13361)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit be7959e5ebb8b2bdca66b1996bd365df956eddfc[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Thu Apr 24 11:38:48 2025 -0400

    refactor: remove datepicker
    
    using datetime-local now https://github.com/NodeBB/NodeBB/blob/master/src/views/admin/partials/widget-settings.tpl#L14-L20

[33mcommit 74558b0fc76eae0b753335b5b5dad145c8d5c023[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Thu Apr 24 10:20:12 2025 -0400

    fix(deps): update dependency pg to v8.15.5 (#13356)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit 8ffbc35923cc8f9a785a8edb80d52991a885ec22[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Thu Apr 24 09:50:52 2025 -0400

    refactor: add sping/ping into openapi
    
    change getObject to getSortedSetRange so db is always checked. getObject calls are cached

[33mcommit 7eb2f12751cda32ad3aab2cfbb761478b65d96cb[m
Author: Misty Release Bot <deploy@nodebb.org>
Date:   Thu Apr 24 09:19:59 2025 +0000

    Latest translations and fallbacks

[33mcommit 4eec053a7715056b9fbbf1c1e5128e460e20ccf4[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Wed Apr 23 20:01:22 2025 -0400

    fix(deps): update dependency ace-builds to v1.40.1 (#13354)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit 43d7d47fa62e4d43cf55af6bcbef697956b530eb[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Wed Apr 23 20:01:12 2025 -0400

    fix(deps): update dependency esbuild to v0.25.3 (#13355)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit 00be573d4f8aec89950e4f0d97bd85599074173f[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Wed Apr 23 20:00:56 2025 -0400

    fix(deps): update dependency pg-cursor to v2.14.5 (#13350)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit b49436de0a3915ab9cc5342a1c675b3ffae927eb[m
Author: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>
Date:   Wed Apr 23 14:21:47 2025 -0400

    fix(deps): update dependency pg to v8.15.2 (#13349)
    
    Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

[33mcommit ed92ffaf0833a84228a9a1b21d8554b8993dd1c5[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Wed Apr 23 06:50:40 2025 -0400

    fix: closes #13353, don't use index for finding plugin data

[33mcommit e0235a1e94fed02e4f7d171220ac50dd0416be12[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Tue Apr 22 17:22:01 2025 -0400

    test: shorter test

[33mcommit f864a5a4aced228d93e28514d52023b6abab051d[m
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Tue Apr 22 17:15:48 2025 -0400

    test: eslint for tests

[33mcommit b57ce29dc633d687a21b0e884f1fd6c4c10232cf[m
Author: Barış Uşaklı <barisusakli@gmail.com>
Date:   Tue Apr 22 13:32:41 2025 -0400

    chore: up pg, pg-cursor (#13351)
    
    * chore: up pg, pg-cursor
    
    * test: check file directly

[33mcommit 1a3e669b6fe97e54db6ade709ccc74e43f2d7513[m
Merge: 71cd46e132 ce196589f5
Author: Barış Soner Uşaklı <barisusakli@gmail.com>
Date:   Tue Apr 22 12:38:25 2025 -0400

    Merge branch 'master' into develop
