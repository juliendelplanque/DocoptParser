tests-accessing
testUsage
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