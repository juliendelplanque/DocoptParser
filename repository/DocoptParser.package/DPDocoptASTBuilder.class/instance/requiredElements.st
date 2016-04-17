accessing
requiredElements
	^ super requiredElements ==> [ :parsingItems | DPRequiredElementsNode requiredElements: parsingItems second ]