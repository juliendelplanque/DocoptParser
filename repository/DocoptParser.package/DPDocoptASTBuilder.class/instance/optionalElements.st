accessing
optionalElements
	^ super optionalElements ==> [ :parsingItems | DPOptionalElementsNode optionalElements: parsingItems second ]