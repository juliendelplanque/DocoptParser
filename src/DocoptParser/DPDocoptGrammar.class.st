"
I am the parser for docopt command line descriptions.
"
Class {
	#name : #DPDocoptGrammar,
	#superclass : #PPCompositeParser,
	#instVars : [
		'docopt',
		'usage',
		'description',
		'usagePattern',
		'programName',
		'usagePatterns',
		'shortOption',
		'longOption',
		'option',
		'argument',
		'command',
		'element',
		'mutuallyExclusiveElements',
		'requiredElements',
		'optionalElements',
		'ellipsis',
		'options',
		'optionDescriptionPattern',
		'defaultValue',
		'optionDescriptions',
		'doubleDash',
		'simpleDash',
		'argumentUppercase',
		'argumentLesserGreater',
		'mutuallyExclusiveElementsRightPart',
		'optionDescriptionPatterns',
		'space'
	],
	#category : #'DocoptParser-Parser'
}

{ #category : #testing }
DPDocoptGrammar class >> isTypeCheckingEnabled [
	^ true
]

{ #category : #accessing }
DPDocoptGrammar >> argument [
	^ argumentLesserGreater / argumentUppercase
]

{ #category : #accessing }
DPDocoptGrammar >> argumentLesserGreater [
	^ $< asParser , #letter asParser plus flatten , $> asParser
]

{ #category : #accessing }
DPDocoptGrammar >> argumentUppercase [
	^ #uppercase asParser plus flatten
]

{ #category : #accessing }
DPDocoptGrammar >> command [
	^ (#word asParser / $_ asParser / $- asParser) plus flatten
]

{ #category : #accessing }
DPDocoptGrammar >> defaultValue [
	^ $[ asParser , 'default:' asParser , space , (#any asParser starLazy: $] asParser) flatten , $] asParser
]

{ #category : #accessing }
DPDocoptGrammar >> description [
	^ #any asParser starLazy: ('Usage:' asParser caseInsensitive)
]

{ #category : #accessing }
DPDocoptGrammar >> docopt [
	^ description flatten , usage , optionDescriptions
]

{ #category : #accessing }
DPDocoptGrammar >> doubleDash [
	^ '--' asParser
]

{ #category : #accessing }
DPDocoptGrammar >> element [
	^ options / optionalElements / requiredElements / option / argument / command / doubleDash / simpleDash
]

{ #category : #accessing }
DPDocoptGrammar >> ellipsis [
	^ '...' asParser
]

{ #category : #accessing }
DPDocoptGrammar >> longOption [
	^ ('--' asParser , (#letter asParser min: 2 max: Float infinity)) flatten , $= asParser optional
]

{ #category : #accessing }
DPDocoptGrammar >> mutuallyExclusiveElements [
	^ (element trim plus , $| asParser trim , element trim plus) , mutuallyExclusiveElementsRightPart star
]

{ #category : #accessing }
DPDocoptGrammar >> mutuallyExclusiveElementsRightPart [
	^ $| asParser trim , (mutuallyExclusiveElements / element trim plus)
]

{ #category : #accessing }
DPDocoptGrammar >> option [
	^ shortOption / longOption
]

{ #category : #accessing }
DPDocoptGrammar >> optionDescriptionPattern [
	^ #space asParser star,
	  option , (space optional , argument) star,
	  ((($, asParser , #space asParser star) / space plus) optional,
	  option , (space optional , argument) star) optional ,
	  (#space asParser min: 2 max: Float infinity) ,
	  (#letter asParser / #space asParser / $( asParser / $) asParser) star flatten , defaultValue optional , $. asParser optional , #newline asParser optional
]

{ #category : #accessing }
DPDocoptGrammar >> optionDescriptionPatterns [
	^ optionDescriptionPattern plus
]

{ #category : #accessing }
DPDocoptGrammar >> optionDescriptions [
	^ 'Options:' asParser trim , optionDescriptionPatterns
]

{ #category : #accessing }
DPDocoptGrammar >> optionalElements [
	^ $[ asParser , (mutuallyExclusiveElements / element trim plus) , $] asParser
]

{ #category : #accessing }
DPDocoptGrammar >> options [
	^ '[options]' asParser trim
]

{ #category : #accessing }
DPDocoptGrammar >> programName [
	^ (#word asParser / $_ asParser / $- asParser / $. asParser) plus flatten
]

{ #category : #accessing }
DPDocoptGrammar >> requiredElements [
	^ $( asParser , (mutuallyExclusiveElements / element trim plus) , $) asParser
]

{ #category : #accessing }
DPDocoptGrammar >> shortOption [
	^ ($- asParser , #letter asParser plus) flatten
]

{ #category : #accessing }
DPDocoptGrammar >> simpleDash [
	^ $- asParser trim
]

{ #category : #accessing }
DPDocoptGrammar >> space [
	^ Character space asParser
]

{ #category : #accessing }
DPDocoptGrammar >> start [
	^ docopt end
]

{ #category : #accessing }
DPDocoptGrammar >> usage [
	^ 'Usage:' asParser caseInsensitive trim , usagePatterns
]

{ #category : #accessing }
DPDocoptGrammar >> usagePattern [
	^ #space asParser star , programName , space star , element , space star ,  ellipsis optional , ($| asParser optional , space star , element , space star , ellipsis optional) star , #newline asParser optional
]

{ #category : #accessing }
DPDocoptGrammar >> usagePatterns [
	^ usagePattern trim plus
]
