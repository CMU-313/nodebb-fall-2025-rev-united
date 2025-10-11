<div class="container py-4">
	<div class="row justify-content-center">
		<div class="col-12 col-lg-10">
			<h1 class="fs-3 mb-4">Class Resources</h1>
			{{{ if !resources.length }}}
			<div class="alert alert-info" role="alert">
				No Resources Yet!
			</div>
			{{{ else }}}
			<div class="table-responsive shadow-sm">
				<table class="table table-striped align-middle">
					<thead class="table-light">
						<tr>
							<th scope="col">[[global:resources-name]]</th>
							<th scope="col">[[global:resources-description]]</th>
							<th scope="col">[[global:resources-link]]</th>
						</tr>
					</thead>
					<tbody>
						{{{ each resources }}}
						<tr>
							<td class="fw-semibold">{./name}</td>
							<td>{./description}</td>
							<td><a href="{./url}" target="_blank" rel="noopener" class="text-decoration-none">[[global:resources-open-link]]</a></td>
						</tr>
						{{{ end }}}
					</tbody>
				</table>
			</div>
			{{{ end }}}
		</div>
	</div>
</div>
