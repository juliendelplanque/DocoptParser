tests-accessing
testOptionalElements
	| node |
	node := self parse: '[--speed=<kn>]' rule: #optionalElements.
	self assert: node class equals: DPOptionalElementsNode.
	self assert: node optionalElements size equals: 2.