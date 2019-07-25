accessing
programName
	^ super programName ==> [ :parsingItems | DPProgramNameNode programName: parsingItems ]