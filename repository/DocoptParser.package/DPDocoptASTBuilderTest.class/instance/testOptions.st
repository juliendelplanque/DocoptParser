tests-accessing
testOptions
	| node |
	node := self parse: '[options]' rule: #options.
	self assert: node class equals: DPAllOptionsNode.