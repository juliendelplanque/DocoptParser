tests-accessing
testLongOption
	| node |
	node := self parse: '--long' rule: #option.
	self assert: node class equals: DPLongOptionNode.
	self assert: node option equals: '--long'