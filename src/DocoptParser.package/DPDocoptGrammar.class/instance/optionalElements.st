accessing
optionalElements
	^ $[ asParser , (mutuallyExclusiveElements / element trim plus) , $] asParser