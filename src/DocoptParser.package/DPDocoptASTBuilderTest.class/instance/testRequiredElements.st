tests-accessing
testRequiredElements
	| node |
	node := self parse: '(--speed=<kn>)' rule: #requiredElements.
	self assert: node class equals: DPRequiredElementsNode.
	self assert: node requiredElements size equals: 2.