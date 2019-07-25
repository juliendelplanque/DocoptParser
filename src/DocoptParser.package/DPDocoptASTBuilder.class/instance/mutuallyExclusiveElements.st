accessing
mutuallyExclusiveElements
	^ super mutuallyExclusiveElements ==> [ :parsingItems |
		Array with: (DPMutuallyExclusiveElementsNode
							mutuallyExclusiveElements: ((parsingItems flattened splitOn: $|)
													collect: [ :list | DPElementsGroupNode elements: list ])) ]