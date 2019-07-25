instance creation
option: aStringStartingWithDash
	(aStringStartingWithDash beginsWith: '---')
		ifTrue: [ InvalidOptionError signal ].
	(aStringStartingWithDash beginsWith: '--')
		ifTrue: [ ^ DPLongOptionNode new option: aStringStartingWithDash; yourself ].
	(aStringStartingWithDash beginsWith: '-')
		ifTrue: [ 
			(aStringStartingWithDash size = 2)
				ifTrue: [ ^ DPShortOptionNode new option: aStringStartingWithDash; yourself ].
			^ DPComposedShortOptionNode new option: aStringStartingWithDash; yourself ].
	InvalidOptionError signal.