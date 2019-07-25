accessing
mutuallyExclusiveElementsRightPart
	^ $| asParser trim , (mutuallyExclusiveElements / element trim plus)