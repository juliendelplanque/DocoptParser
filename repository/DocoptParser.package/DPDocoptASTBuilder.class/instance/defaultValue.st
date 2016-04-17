accessing
defaultValue
	^ super defaultValue ==> [ :parsingItems | DPDefaultValueNode defaultValue: parsingItems fourth ]