"
I am a generic option, my subclasses represent concrete options.
"
Class {
	#name : #DPOptionNode,
	#superclass : #DPAbstractNode,
	#instVars : [
		'option'
	],
	#category : 'DocoptParser-AST'
}

{ #category : #'instance creation' }
DPOptionNode class >> option: aStringStartingWithDash [
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
]

{ #category : #accessing }
DPOptionNode >> option [
	^ option
]

{ #category : #accessing }
DPOptionNode >> option: anObject [
	option := anObject
]
