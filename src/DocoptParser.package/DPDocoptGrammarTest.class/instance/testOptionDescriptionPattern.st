tests-accessing
testOptionDescriptionPattern
	self parse: '-q        Quit.' rule: #optionDescriptionPattern.
	self parse: '-o FILE   Output file.' rule: #optionDescriptionPattern.
	self parse: '--stdout  Use stdout.' rule: #optionDescriptionPattern.
	self parse: '-o FILE --output=FILE  Output file.' rule: #optionDescriptionPattern.
	self parse: '-i <file>, --input <file>  Output file.' rule: #optionDescriptionPattern.