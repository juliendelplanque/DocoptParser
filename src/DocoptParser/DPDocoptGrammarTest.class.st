Class {
	#name : #DPDocoptGrammarTest,
	#superclass : #PPCompositeParserTest,
	#category : 'DocoptParser-Parser-Tests'
}

{ #category : #accessing }
DPDocoptGrammarTest >> parserClass [
	^ DPDocoptGrammar
]

{ #category : #'tests-accessing' }
DPDocoptGrammarTest >> testArgument [
	self parse: '<arg>' rule: #argument.
	self parse: 'ARG' rule: #argument.
]

{ #category : #'tests-accessing' }
DPDocoptGrammarTest >> testCommand [
	self parse: 'naval_fate' rule: #command
]

{ #category : #'tests-accessing' }
DPDocoptGrammarTest >> testDefaultValue [
	self parse: '[default: 2.95]' rule: #defaultValue.
	self parse: '[default: test.txt]' rule: #defaultValue.
	self parse: '[default: ./]' rule: #defaultValue.
]

{ #category : #'tests-accessing' }
DPDocoptGrammarTest >> testDocopt [
	self parse: 'Naval Fate.

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
  --drifting    Drifting mine.' rule: #docopt
]

{ #category : #'tests-accessing' }
DPDocoptGrammarTest >> testEllipsis [
	self parse: '...' rule: #ellipsis
]

{ #category : #'tests-accessing' }
DPDocoptGrammarTest >> testLongOption [
	self parse: '--long' rule: #longOption
]

{ #category : #'tests-accessing' }
DPDocoptGrammarTest >> testMutuallyExclusiveElements [
	self parse: '-h | --help' rule: #mutuallyExclusiveElements.
	self parse: '-h | --help | -v | --version' rule: #mutuallyExclusiveElements.
	self fail: '--hello <arg>' rule: #mutuallyExclusiveElements.
	self parse: '--verbose|--quiet' rule: #mutuallyExclusiveElements.
]

{ #category : #'tests-accessing' }
DPDocoptGrammarTest >> testMutuallyExclusiveElementsRightPart [
	self parse: '| -c' rule: #mutuallyExclusiveElementsRightPart.
	self parse: '| -c | -d' rule: #mutuallyExclusiveElementsRightPart.
	self parse: '| -c | -d | --long <arg>' rule: #mutuallyExclusiveElementsRightPart.
]

{ #category : #'tests-accessing' }
DPDocoptGrammarTest >> testOption [
	self parse: '-s' rule: #option.
	self parse: '--short' rule: #option.
	self parse: '-abc' rule: #option
]

{ #category : #'tests-accessing' }
DPDocoptGrammarTest >> testOptionDescriptionPattern [
	self parse: '-q        Quit.' rule: #optionDescriptionPattern.
	self parse: '-o FILE   Output file.' rule: #optionDescriptionPattern.
	self parse: '--stdout  Use stdout.' rule: #optionDescriptionPattern.
	self parse: '-o FILE --output=FILE  Output file.' rule: #optionDescriptionPattern.
	self fail: '-o FILE, --output=FILE  Output file.' rule: #optionDescriptionPattern.
	self parse: '-i <file>, --input <file>  Output file.' rule: #optionDescriptionPattern.
	self fail: '-i <file> --input <file>  Output file.' rule: #optionDescriptionPattern.
]

{ #category : #'tests-accessing' }
DPDocoptGrammarTest >> testOptionalElements [
	self parse: '[ --test ]' rule: #optionalElements.
	self parse: '[ --test <arg> ]' rule: #optionalElements.
	self parse: '[--up | --down | --left | --right]' rule: #optionalElements.
]

{ #category : #'tests-accessing' }
DPDocoptGrammarTest >> testOptions [
	self parse: '[options]' rule: #options
]

{ #category : #'tests-accessing' }
DPDocoptGrammarTest >> testRequiredElements [
	self parse: '(--option <arg>)' rule: #requiredElements.
	self parse: '(--help | -h)' rule: #requiredElements.
	self parse: '(--up | --down | --left | --right)' rule: #requiredElements
]

{ #category : #'tests-accessing' }
DPDocoptGrammarTest >> testShortOption [
	self parse: '-l' rule: #shortOption.
	"Composed short options"
	self parse: '-abc' rule: #shortOption
]
