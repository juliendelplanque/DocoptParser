"
I am a short option (ie. -a).
"
Class {
	#name : #DPShortOptionNode,
	#superclass : #DPOptionNode,
	#category : 'DocoptParser-AST'
}

{ #category : #visiting }
DPShortOptionNode >> acceptVisitor: aDPVisitor [
	^ aDPVisitor visitDPShortOptionNode: self
]
