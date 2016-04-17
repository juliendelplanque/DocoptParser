tests-accessing
testShortOption
	self parse: '-l' rule: #shortOption.
	"Composed short options"
	self parse: '-abc' rule: #shortOption