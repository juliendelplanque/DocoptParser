tests-accessing
testMutuallyExclusiveElementsRightPart
	self parse: '| -c' rule: #mutuallyExclusiveElementsRightPart.
	self parse: '| -c | -d' rule: #mutuallyExclusiveElementsRightPart.
	self parse: '| -c | -d | --long <arg>' rule: #mutuallyExclusiveElementsRightPart.