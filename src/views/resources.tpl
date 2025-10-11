<div class="container py-4">
	<div class="row justify-content-center">
		<div class="col-12 col-lg-10">
			<h1 class="fs-3 mb-4">Class Resources</h1>
				{{{ if canAddResource }}}
					<div class="d-flex justify-content-end mb-3">
						<a href="{config.relative_path}/resources/new" class="btn btn-primary">
							Add a Resource
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
							<th scope="col"> Name</th>
							<th scope="col"> Description</th>
							<th scope="col"> Link</th>
						</tr>
					</thead>
					<tbody>
						{{{ each resources }}}
						<tr>
							<td class="fw-semibold">{./name}</td>
							<td>{./description}</td>
							<td><a href="{./url}" target="_blank" rel="noopener" class="text-decoration-none">Check it out here!</a></td>
						</tr>
						{{{ end }}}
					</tbody>
				</table>
			</div>
			{{{ end }}}
		</div>
	</div>
</div>
