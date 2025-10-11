<div class="container py-4">
	<div class="row justify-content-center">
		<div class="col-12 col-lg-8 col-xl-6">
			<h1 class="fs-3 mb-4">[[global:resources-add]]</h1>
			{{{ if error }}}
				<div class="alert alert-danger" role="alert">
					{error}
				</div>
			{{{ end }}}
			<form method="post" action="{config.relative_path}/resources/new" class="card shadow-sm border-0">
				<div class="card-body d-flex flex-column gap-3">
					<div class="mb-1">
						<label for="resource-name" class="form-label">[[global:resources-name]]</label>
					<input type="text" id="resource-name" name="name" class="form-control" required value="{values.name}" />
					</div>
					<div class="mb-1">
						<label for="resource-description" class="form-label">[[global:resources-description]]</label>
						<textarea id="resource-description" name="description" class="form-control" rows="4">{values.description}</textarea>
					</div>
					<div class="mb-1">
						<label for="resource-url" class="form-label">[[global:resources-link]]</label>
						<input type="url" id="resource-url" name="url" class="form-control" required value="{values.url}" placeholder="https://example.com" />
					</div>
				</div>
				<div class="card-footer bg-transparent border-0 d-flex justify-content-end gap-2">
					<a class="btn btn-outline-secondary" href="{config.relative_path}/resources">[[global:cancel]]</a>
					<button type="submit" class="btn btn-primary">[[global:resources-add]]</button>
				</div>
				<input type="hidden" name="_csrf" value="{config.csrf_token}" />
				<input type="hidden" name="noscript" value="true" />
			</form>
		</div>
	</div>
</div>
