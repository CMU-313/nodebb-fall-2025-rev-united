<div class="container py-4">
	<div class="row justify-content-center">
		<div class="col-12 col-lg-10">
			<h1 class="fs-3 mb-4">[[global:resources]]</h1>
			{{{ if !resources.length }}}
			<div class="alert alert-info" role="alert">
				[[global:no-resources]]
			</div>
			{{{ else }}}
			<div class="list-group shadow-sm">
				{{{ each resources }}}
				<a href="{./url}" class="list-group-item list-group-item-action" target="_blank" rel="noopener">
					<h2 class="h5 mb-1">{./name}</h2>
					{{{ if ./description }}}
					<p class="mb-0 text-muted">{./description}</p>
					{{{ end }}}
				</a>
				{{{ end }}}
			</div>
			{{{ end }}}
		</div>
	</div>
</div>
