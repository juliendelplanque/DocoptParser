tests-accessing
testCommand
	| node |
	node := self parse: 'naval_fate' rule: #command.
	self assert: node class equals: DPCommandNode.
	self assert: node commandName equals: 'naval_fate'