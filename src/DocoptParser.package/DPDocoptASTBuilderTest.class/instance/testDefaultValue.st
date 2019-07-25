tests-accessing
testDefaultValue
	| node |
	node := self parse: '[default: 2.5]' rule: #defaultValue.
	self assert: node class equals: DPDefaultValueNode.
	self assert: node defaultValue equals: '2.5'