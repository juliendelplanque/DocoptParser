tests-accessing
testDefaultValue
	self parse: '[default: 2.95]' rule: #defaultValue.
	self parse: '[default: test.txt]' rule: #defaultValue.
	self parse: '[default: ./]' rule: #defaultValue.