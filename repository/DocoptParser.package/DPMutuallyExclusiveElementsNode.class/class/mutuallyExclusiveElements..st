instance creation
mutuallyExclusiveElements: aCollectionOfElements
	^ self new
		mutuallyExclusiveElements: aCollectionOfElements;
		yourself