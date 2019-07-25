tests-accessing
testDocopt
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