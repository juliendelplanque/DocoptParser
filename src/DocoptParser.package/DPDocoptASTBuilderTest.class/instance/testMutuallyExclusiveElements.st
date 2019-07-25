tests-accessing
testMutuallyExclusiveElements
	| array |
	array := self parse: '--verbose|--quiet' rule: #mutuallyExclusiveElements.
	self assert: array size equals: 1.
	self assert: array first class equals: DPMutuallyExclusiveElementsNode.
	self assert: array first mutuallyExclusiveElements size equals: 2.