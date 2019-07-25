"
I am a composed short option (ie. -abc).
"
Class {
	#name : #DPComposedShortOptionNode,
	#superclass : #DPOptionNode,
	#category : 'DocoptParser-AST'
}

{ #category : #visiting }
DPComposedShortOptionNode >> acceptVisitor: aDPVisitor [
	^ aDPVisitor visitDPComposedShortOptionNode: self
]
