instance creation
optionalElements: anElementList
	^ self new
		optionalElements: anElementList;
		yourself