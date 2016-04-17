accessing
defaultValue
	^ $[ asParser , 'default:' asParser , Character space asParser , (#any asParser starLazy: $] asParser) flatten , $] asParser