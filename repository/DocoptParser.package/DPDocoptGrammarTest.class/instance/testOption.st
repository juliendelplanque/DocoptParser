tests-accessing
testOption
	self parse: '-s' rule: #option.
	self parse: '--short' rule: #option.
	self parse: '-abc' rule: #option