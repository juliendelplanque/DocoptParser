accessing
longOption
	^ ('--' asParser , (#letter asParser min: 2 max: Float infinity)) flatten , $= asParser optional