accessing
requiredElements
	^ $( asParser , (mutuallyExclusiveElements / element trim plus) , $) asParser