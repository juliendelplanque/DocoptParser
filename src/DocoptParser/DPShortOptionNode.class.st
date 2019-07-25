"
I am a short option (ie. -a).
"
Class {
	#name : #DPShortOptionNode,
	#superclass : #DPOptionNode,
	#category : 'DocoptParser-AST'
}

{ #category : #visiting }
DPShortOptionNode >> accept: aDPVisitor [
	^ aDPVisitor visitShortOptionNode: self
]
