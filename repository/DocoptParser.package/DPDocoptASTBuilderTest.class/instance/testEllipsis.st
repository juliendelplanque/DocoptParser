tests-accessing
testEllipsis
	| node |
	node := self parse: '...' rule: #ellipsis.
	self assert: node class equals: DPEllipsisNode