"
I am a composed short option (ie. -abc).
"
Class {
	#name : #DPComposedShortOptionNode,
	#superclass : #DPOptionNode,
	#category : 'DocoptParser-AST'
}

{ #category : #visiting }
DPComposedShortOptionNode >> accept: aDPVisitor [
	^ aDPVisitor visitComposedShortOptionNode: self
]
