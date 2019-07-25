tests-accessing
testUsagePattern
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