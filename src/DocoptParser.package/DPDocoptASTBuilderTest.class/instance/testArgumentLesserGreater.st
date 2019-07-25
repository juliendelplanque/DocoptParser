tests-accessing
testArgumentLesserGreater
	| node |
	node := self parse: '<arg>' rule: #argumentLesserGreater.
	self assert: node class equals: DPArgumentNode.
	self assert: node argumentName equals: 'arg'