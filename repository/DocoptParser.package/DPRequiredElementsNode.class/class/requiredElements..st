instance creation
requiredElements: anElementList
	^ self new
		requiredElements: anElementList;
		yourself