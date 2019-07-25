"
I build the ast from tokenized docopt description.
"
Class {
	#name : #DPDocoptASTBuilder,
	#superclass : #DPDocoptGrammar,
	#category : 'DocoptParser-Parser'
}

{ #category : #accessing }
DPDocoptASTBuilder >> argumentLesserGreater [
	^ super argumentLesserGreater ==> [ :parsingItems | DPArgumentNode argumentName: parsingItems second ]
]

{ #category : #accessing }
DPDocoptASTBuilder >> argumentUppercase [
	^ super argumentUppercase ==> [ :parsingItems | DPArgumentNode argumentName: parsingItems ]
]

{ #category : #accessing }
DPDocoptASTBuilder >> command [
	^ super command ==> [ :parsingItems | DPCommandNode commandName: parsingItems ]
]

{ #category : #accessing }
DPDocoptASTBuilder >> defaultValue [
	^ super defaultValue ==> [ :parsingItems | DPDefaultValueNode defaultValue: parsingItems fourth ]
]

{ #category : #accessing }
DPDocoptASTBuilder >> docopt [
	^ super docopt ==> [ :parsingItems |
		DPDocoptNode description: parsingItems first trim usage: parsingItems second optionDescription: parsingItems third ]
]

{ #category : #accessing }
DPDocoptASTBuilder >> ellipsis [
	^ super ellipsis ==> [ :parsingItems | DPEllipsisNode new ]
]

{ #category : #accessing }
DPDocoptASTBuilder >> longOption [
	^ super longOption ==> [ :parsingItems | parsingItems first ]
]

{ #category : #accessing }
DPDocoptASTBuilder >> mutuallyExclusiveElements [
	^ super mutuallyExclusiveElements ==> [ :parsingItems |
		Array with: (DPMutuallyExclusiveElementsNode
							mutuallyExclusiveElements: ((parsingItems flattened splitOn: $|)
													collect: [ :list | DPElementsGroupNode elements: list ])) ]
]

{ #category : #accessing }
DPDocoptASTBuilder >> option [
	^ super option ==> [ :parsingItems | DPOptionNode option: parsingItems ]
]

{ #category : #accessing }
DPDocoptASTBuilder >> optionDescriptionPattern [
	| flatItems optionAndArgs i j optionDescription selectors |
	^ super optionDescriptionPattern ==> [ :parsingItems | 
		optionAndArgs := OrderedCollection new.
		flatItems := (parsingItems flattened select: #isNotNil) reject: #isCharacter.
		i := (flatItems collect: #class) indexOf: DPLongOptionNode.
		j := (flatItems collect: #class) indexOf: DPShortOptionNode.
		optionDescription := DPOptionDescriptionPatternNode new.
		selectors := #(#commandAndArguments: #commandAliasAndArguments:).
		({ i . j } select: [ :x | x ~= 0 ]) doWithIndex: [ :k :index |
			| start list |
			start := k + 1.
			list := OrderedCollection with: (flatItems at: k).
			[ (flatItems at: start) class = DPArgumentNode ]
				whileTrue: [
					list add: (flatItems at: start).
					start := start + 1 ].
			optionDescription perform: (selectors at: index) with: list ].
		optionDescription description: ((flatItems detect: #isString) trim , '.').
		flatItems
			detect: [ :item | item class = DPDefaultValueNode ]
			ifFound: [ :item | optionDescription defaultValue: item ].
		optionDescription ]
]

{ #category : #accessing }
DPDocoptASTBuilder >> optionDescriptions [
	^ super optionDescriptions ==> [ :parsingItems | DPOptionDescriptionsNode optionDescriptions: parsingItems second ]
]

{ #category : #accessing }
DPDocoptASTBuilder >> optionalElements [
	^ super optionalElements ==> [ :parsingItems | DPOptionalElementsNode optionalElements: parsingItems second ]
]

{ #category : #accessing }
DPDocoptASTBuilder >> options [
	^ super options ==> [ :parsingItems | DPAllOptionsNode new ]
]

{ #category : #accessing }
DPDocoptASTBuilder >> programName [
	^ super programName ==> [ :parsingItems | DPProgramNameNode programName: parsingItems ]
]

{ #category : #accessing }
DPDocoptASTBuilder >> requiredElements [
	^ super requiredElements ==> [ :parsingItems | DPRequiredElementsNode requiredElements: parsingItems second ]
]

{ #category : #accessing }
DPDocoptASTBuilder >> usage [
	^ super usage ==> [ :parsingItems | DPUsageNode usagePatterns: parsingItems second ]
]

{ #category : #accessing }
DPDocoptASTBuilder >> usagePattern [
	| flatItems elements |
	^ super usagePattern ==> [ :parsingItems |
		flatItems := parsingItems flattened.
		(flatItems anySatisfy: [ :any | any = $| ])
			ifFalse: [ 
				DPUsagePatternNode
					usagePattern: (flatItems
											reject: [ :item | item isNil or: [ item isCharacter ] ]) ]
			ifTrue: [
				programName := flatItems first.
				elements := (flatItems copyFrom: 2 to: flatItems size)
									reject: [ :e | (e isCharacter and: [ e ~= $| ]) or: [ e isNil ] ].
				mutuallyExclusiveElements := (elements splitOn: $|)
														collect: [ :list | DPElementsGroupNode elements: list ].
				DPUsagePatternNode usagePattern: (Array
																with: programName
																with: (DPMutuallyExclusiveElementsNode
																			mutuallyExclusiveElements: mutuallyExclusiveElements)) ] ]
]
