<div class="container py-4">
	<div class="row justify-content-center">
		<div class="col-12 col-lg-10">
			<h1 class="fs-3 mb-4">Class Resources</h1>
			{{{ if error }}}
				<div class="alert alert-danger" role="alert">
					{error}
				</div>
			{{{ end }}}
			{{{ if canAddResource }}}
				<div class="d-flex justify-content-end mb-3">
					<a href="{config.relative_path}/resources/new" class="btn btn-primary">
						[[global:resources-add]]
					</a>
				</div>
			{{{ end }}}
			{{{ if !resources.length }}}
			<div class="alert alert-info" role="alert">
				No Resources Yet!
			</div>
			{{{ else }}}
			<div class="table-responsive shadow-sm">
				<table class="table table-striped align-middle">
					<thead class="table-light">
						<tr>
							<th scope="col">Name</th>
							<th scope="col">Description</th>
						<th scope="col">Link</th>
						{{{ if canEditResource }}}
							<th scope="col" class="text-end">[[global:resources-edit]]</th>
						{{{ end }}}
						{{{ if canDeleteResource }}}
							<th scope="col" class="text-end">[[global:resources-delete]]</th>
						{{{ end }}}
						</tr>
					</thead>
					<tbody>
						{{{ each resources }}}
						<tr>
							<td class="fw-semibold">{./name}</td>
							<td>{./description}</td>
							<td><a href="{./url}" target="_blank" rel="noopener" class="text-decoration-none">[[global:resources-open-link]]</a></td>
							{{{ if ../canEditResource }}}
								<td class="text-end">
									<a href="{config.relative_path}/resources/{./id}/edit" class="btn btn-sm btn-outline-primary">[[global:resources-edit]]</a>
								</td>
							{{{ end }}}
							{{{ if ../canDeleteResource }}}
								<td class="text-end">
									<form method="post" action="{config.relative_path}/resources/{./id}/delete" class="d-inline">
										<input type="hidden" name="_csrf" value="{config.csrf_token}" />
										<input type="hidden" name="noscript" value="true" />
										<button type="submit" class="btn btn-sm btn-outline-danger" data-component="resource-delete">[[global:resources-delete]]</button>
									</form>
								</td>
							{{{ end }}}
						</tr>
						{{{ end }}}
					</tbody>
				</table>
			</div>
			{{{ end }}}
		</div>
	</div>
</div>
