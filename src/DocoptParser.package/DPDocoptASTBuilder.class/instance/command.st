accessing
command
	^ super command ==> [ :parsingItems | DPCommandNode commandName: parsingItems ]