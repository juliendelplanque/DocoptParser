accessing
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec
				package: 'DocoptParser' with: [ spec requires: #('PetitParser') ];
				project: 'PetitParser' with: [ 
					spec
						className: 'ConfigurationOfPetitParser';
						version: #stable;
						repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main' ] ]