Class {
	#name : #DPDocoptASTBuilderTest,
	#superclass : #PPCompositeParserTest,
	#category : 'DocoptParser-Parser-Tests'
}

{ #category : #accessing }
DPDocoptASTBuilderTest >> parserClass [
	^ DPDocoptASTBuilder
]

{ #category : #'tests-accessing' }
DPDocoptASTBuilderTest >> testArgumentLesserGreater [
	| node |
	node := self parse: '<arg>' rule: #argumentLesserGreater.
	self assert: node class equals: DPArgumentNode.
	self assert: node argumentName equals: 'arg'
]

{ #category : #'tests-accessing' }
DPDocoptASTBuilderTest >> testArgumentUppercase [
	| node |
	node := self parse: 'ARGUMENT' rule: #argumentUppercase.
	self assert: node class equals: DPArgumentNode.
	self assert: node argumentName equals: 'ARGUMENT'
]

{ #category : #'tests-accessing' }
DPDocoptASTBuilderTest >> testCommand [
	| node |
	node := self parse: 'naval_fate' rule: #command.
	self assert: node class equals: DPCommandNode.
	self assert: node commandName equals: 'naval_fate'
]

{ #category : #'tests-accessing' }
DPDocoptASTBuilderTest >> testDefaultValue [
	| node |
	node := self parse: '[default: 2.5]' rule: #defaultValue.
	self assert: node class equals: DPDefaultValueNode.
	self assert: node defaultValue equals: '2.5'
]

{ #category : #'tests-accessing' }
DPDocoptASTBuilderTest >> testDocopt [
	| node |
	node := self parse: 'Naval Fate.

Usage:
  naval_fate ship new <name>...
  naval_fate ship <name> move <x> <y> [--speed=<kn>]
  naval_fate ship shoot <x> <y>
  naval_fate mine (set|remove) <x> <y> [--moored|--drifting]
  naval_fate -h | --help
  naval_fate --version

Options:
  -h --help     Show this screen.
  --version     Show version.
  --speed=<kn>  Speed in knots [default: 10].
  --moored      Moored (anchored) mine.
  --drifting    Drifting mine.'.

	self assert: node class equals: DPDocoptNode.
	self assert: node description equals: 'Naval Fate.'.
	self assert: node usage class equals: DPUsageNode.
	self assert: node usage usagePatterns size equals: 6.
	self assert: node optionDescription class equals: DPOptionDescriptionsNode.
	self assert: node optionDescription optionDescriptions size equals: 5
]

{ #category : #'tests-accessing' }
DPDocoptASTBuilderTest >> testEllipsis [
	| node |
	node := self parse: '...' rule: #ellipsis.
	self assert: node class equals: DPEllipsisNode
]

{ #category : #'tests-accessing' }
DPDocoptASTBuilderTest >> testLongOption [
	| node |
	node := self parse: '--long' rule: #option.
	self assert: node class equals: DPLongOptionNode.
	self assert: node option equals: '--long'
]

{ #category : #'tests-accessing' }
DPDocoptASTBuilderTest >> testMutuallyExclusiveElements [
	| array |
	array := self parse: '--verbose|--quiet' rule: #mutuallyExclusiveElements.
	self assert: array size equals: 1.
	self assert: array first class equals: DPMutuallyExclusiveElementsNode.
	self assert: array first mutuallyExclusiveElements size equals: 2.
]

{ #category : #'tests-accessing' }
DPDocoptASTBuilderTest >> testOption [
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
]

{ #category : #'tests-accessing' }
DPDocoptASTBuilderTest >> testOptionDescriptionPattern [
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
]

{ #category : #'tests-accessing' }
DPDocoptASTBuilderTest >> testOptionalElements [
	| node |
	node := self parse: '[--speed=<kn>]' rule: #optionalElements.
	self assert: node class equals: DPOptionalElementsNode.
	self assert: node optionalElements size equals: 2.
]

{ #category : #'tests-accessing' }
DPDocoptASTBuilderTest >> testOptions [
	| node |
	node := self parse: '[options]' rule: #options.
	self assert: node class equals: DPAllOptionsNode.
]

{ #category : #'tests-accessing' }
DPDocoptASTBuilderTest >> testProgramName [
	| node |
	node := self parse: 'naval_fate' rule: #programName.
	self assert: node class equals: DPProgramNameNode.
	self assert: node programName equals: 'naval_fate'
]

{ #category : #'tests-accessing' }
DPDocoptASTBuilderTest >> testRequiredElements [
	| node |
	node := self parse: '(--speed=<kn>)' rule: #requiredElements.
	self assert: node class equals: DPRequiredElementsNode.
	self assert: node requiredElements size equals: 2.
]

{ #category : #'tests-accessing' }
DPDocoptASTBuilderTest >> testUsage [
	| node |
	node := self parse: 'Usage:
  naval_fate ship new <name>...
  naval_fate ship <name> move <x> <y> [--speed=<kn>]
  naval_fate ship shoot <x> <y>
  naval_fate mine (set|remove) <x> <y> [--moored|--drifting]
  naval_fate -h | --help
  naval_fate --version
' rule: #usage.
	self assert: node class equals: DPUsageNode.
	self assert: node usagePatterns size equals: 6
]

{ #category : #'tests-accessing' }
DPDocoptASTBuilderTest >> testUsagePattern [
	| node |
	"Test 1"
	node := self parse: 'naval_fate ship new <name>...' rule: #usagePattern.
	self assert: node class equals: DPUsagePatternNode.
	self assert: node usagePattern size equals: 5.
	{ DPProgramNameNode . DPCommandNode . DPCommandNode . DPArgumentNode . DPEllipsisNode  } doWithIndex: [ :class :i |
		self assert: class equals: (node usagePattern at: i) class ].
	"Test 2"
	node := self parse: 'naval_fate ship <name> move <x> <y> [--speed=<kn>]' rule: #usagePattern.
	self assert: node class equals: DPUsagePatternNode.
	self assert: node usagePattern size equals: 7.
	{ DPProgramNameNode . DPCommandNode . DPArgumentNode . DPCommandNode . DPArgumentNode . DPArgumentNode . DPOptionalElementsNode }
		doWithIndex: [ :class :i | self assert: class equals: (node usagePattern at: i) class ].
	"Test 3"
	node := self parse: 'naval_fate mine (set|remove) <x> <y> [--moored|--drifting]' rule: #usagePattern.
	self assert: node class equals: DPUsagePatternNode.
	self assert: node usagePattern size equals: 6.
	{ DPProgramNameNode . DPCommandNode . DPRequiredElementsNode . DPArgumentNode . DPArgumentNode . DPOptionalElementsNode }
		doWithIndex: [ :class :i | self assert: class equals: (node usagePattern at: i) class ].
	"Test 4"
	node := self parse: 'naval_fate -h | --help' rule: #usagePattern.
	self assert: node class equals: DPUsagePatternNode.
	self assert: node usagePattern size equals: 2.
	{ DPProgramNameNode . DPMutuallyExclusiveElementsNode }
		doWithIndex: [ :class :i | self assert: class equals: (node usagePattern at: i) class ].
	self assert: node usagePattern second mutuallyExclusiveElements size equals: 2
]
