accessing
mutuallyExclusiveElements
	^ (element trim plus , $| asParser trim , element trim plus) , mutuallyExclusiveElementsRightPart star