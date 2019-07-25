accessing
usagePattern
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