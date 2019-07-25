accessing
docopt
	^ super docopt ==> [ :parsingItems |
		DPDocoptNode description: parsingItems first trim usage: parsingItems second optionDescription: parsingItems third ]