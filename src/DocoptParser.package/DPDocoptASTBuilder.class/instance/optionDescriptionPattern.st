accessing
optionDescriptionPattern
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