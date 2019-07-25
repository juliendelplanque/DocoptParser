tests-accessing
testOptionDescriptionPattern
	| node |
	"Test 1"
	node := self parse: '--all,-a             List everything.' rule: #optionDescriptionPattern.
	self assert: node class equals: DPOptionDescriptionPatternNode.
	self assert: node commandAndArguments size equals: 1.
	{ DPLongOptionNode } doWithIndex: [ :class :i | self assert: class equals: (node commandAndArguments at: i) class ].
	self assert: node commandAliasAndArguments size equals: 1.
	{ DPShortOptionNode } doWithIndex: [ :class :i | self assert: class equals: (node commandAliasAndArguments at: i) class ].
	self assert: node description equals: 'List everything.'.
	self assert: node defaultValue isNil.
	"Test 2"
	node := self parse: '--output=FILE    Output file [default: test.txt].' rule: #optionDescriptionPattern.
	self assert: node class equals: DPOptionDescriptionPatternNode.
	self assert: node commandAndArguments size equals: 2.
	{ DPLongOptionNode . DPArgumentNode } doWithIndex: [ :class :i | self assert: class equals: (node commandAndArguments at: i) class ].
	self assert: node commandAliasAndArguments size equals: 0.
	self assert: node description equals: 'Output file.'.
	self assert: node defaultValue class equals: DPDefaultValueNode.
	self assert: node defaultValue defaultValue equals: 'test.txt'.
	"Test 3"
	node := self parse: '--output=FILE, -o FILE    Output file [default: test.txt].' rule: #optionDescriptionPattern.
	self assert: node class equals: DPOptionDescriptionPatternNode.
	self assert: node commandAndArguments size equals: 2.
	{ DPLongOptionNode . DPArgumentNode } doWithIndex: [ :class :i | self assert: class equals: (node commandAndArguments at: i) class ].
	self assert: node commandAliasAndArguments size equals: 2.
	{ DPShortOptionNode . DPArgumentNode } doWithIndex: [ :class :i | self assert: class equals: (node commandAliasAndArguments at: i) class ].
	self assert: node description equals: 'Output file.'.
	self assert: node defaultValue class equals: DPDefaultValueNode.
	self assert: node defaultValue defaultValue equals: 'test.txt'.