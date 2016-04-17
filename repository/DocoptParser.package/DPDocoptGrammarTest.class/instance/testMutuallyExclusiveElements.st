tests-accessing
testMutuallyExclusiveElements
	self parse: '-h | --help' rule: #mutuallyExclusiveElements.
	self parse: '-h | --help | -v | --version' rule: #mutuallyExclusiveElements.
	self fail: '--hello <arg>' rule: #mutuallyExclusiveElements.
	self parse: '--verbose|--quiet' rule: #mutuallyExclusiveElements.