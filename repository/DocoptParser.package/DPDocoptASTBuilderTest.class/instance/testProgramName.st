tests-accessing
testProgramName
	| node |
	node := self parse: 'naval_fate' rule: #programName.
	self assert: node class equals: DPProgramNameNode.
	self assert: node programName equals: 'naval_fate'