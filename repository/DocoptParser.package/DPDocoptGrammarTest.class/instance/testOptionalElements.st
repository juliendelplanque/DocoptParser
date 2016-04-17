tests-accessing
testOptionalElements
	self parse: '[ --test ]' rule: #optionalElements.
	self parse: '[ --test <arg> ]' rule: #optionalElements.
	self parse: '[--up | --down | --left | --right]' rule: #optionalElements.