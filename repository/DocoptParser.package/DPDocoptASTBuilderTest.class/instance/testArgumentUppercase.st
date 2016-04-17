tests-accessing
testArgumentUppercase
	| node |
	node := self parse: 'ARGUMENT' rule: #argumentUppercase.
	self assert: node class equals: DPArgumentNode.
	self assert: node argumentName equals: 'ARGUMENT'