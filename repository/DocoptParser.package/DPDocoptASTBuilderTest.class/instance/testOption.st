tests-accessing
testOption
	| node |
	node := self parse: '--longoption' rule: #option.
	self assert: node class equals: DPLongOptionNode.
	self assert: node option equals: '--longoption'.
	
	node := self parse: '-s' rule: #option.
	self assert: node class equals: DPShortOptionNode.
	self assert: node option equals: '-s'.
	
	node := self parse: '-stu' rule: #option.
	self assert: node class equals: DPComposedShortOptionNode.
	self assert: node option equals: '-stu'.