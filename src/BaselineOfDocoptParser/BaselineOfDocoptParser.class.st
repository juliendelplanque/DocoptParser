"
I define the dependencies of packages from DoctopParser.
"
Class {
	#name : #BaselineOfDocoptParser,
	#superclass : #BaselineOf,
	#category : 'BaselineOfDocoptParser'
}

{ #category : #accessing }
BaselineOfDocoptParser >> baseline: spec [
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
]
