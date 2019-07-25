tests-accessing
testRequiredElements
	self parse: '(--option <arg>)' rule: #requiredElements.
	self parse: '(--help | -h)' rule: #requiredElements.
	self parse: '(--up | --down | --left | --right)' rule: #requiredElements