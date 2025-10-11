<div class="row">
	<div class="col-12">
		<h1 class="h3 mb-3">[[pages:banned-review]]</h1>
	</div>

	{{{ if !posts.length }}}
	<div class="col-12">
		<div class="alert alert-info">[[banned-review:no-items]]</div>
	</div>
	{{{ else }}}
	<div class="col-12 posts-list list-group">
		{{{ each posts }}}
		<div class="list-group-item">
			<div class="d-flex flex-column gap-2">
				<!-- Title row -->
				<div class="d-flex align-items-center gap-2">
					<a class="text-decoration-none fw-semibold" href="{config.relative_path}/topic/{./post.tid}">
						{{{ if ./post.topic }}}
						{{{ if ./post.topic.title }}}
						{./post.topic.title}
						{{{ else }}}
						[[banned-review:no-title]]
						{{{ end }}}
						{{{ else }}}
						[[banned-review:no-title]]
						{{{ end }}}
					</a>
					<span class="ms-auto text-muted text-sm">
						<span class="timeago" title="{./post.timestampISO}"></span>
					</span>
				</div>

				<!-- Meta row -->
				<div class="d-flex align-items-center gap-2 text-muted text-sm">
					<a class="text-decoration-none" href="{config.relative_path}/post/{./post.pid}">#{./post.pid}</a>
				</div>

				<!-- Content preview -->
				<div class="text-break">
					{./post.content}
				</div>

				<!-- Matched banned words -->
				{{{ if ./matches.length }}}
				<div class="text-sm text-muted">
					[[banned-review:matched-words]]:
					{{{ each ./matches }}}
					<span class="badge text-bg-secondary me-1">{@value}</span>
					{{{ end }}}
				</div>
				{{{ end }}}
			</div>
		</div>
		{{{ end }}}
	</div>

	<div class="col-12 mt-3">
		{buildPagination(pagination)}
	</div>
	{{{ end }}}
</div>