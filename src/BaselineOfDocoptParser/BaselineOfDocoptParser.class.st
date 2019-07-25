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
				package: 'DocoptParser' with: [ spec requires: #('PetitParser') ].
			
			spec baseline: 'PetitParser' with: [ 
				spec repository: 'github://moosetechnology/PetitParser/src';
					loads: 'Core' ] ]
]
