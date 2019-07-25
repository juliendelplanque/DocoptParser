"
I am long option (ie. --long).
"
Class {
	#name : #DPLongOptionNode,
	#superclass : #DPOptionNode,
	#category : 'DocoptParser-AST'
}

{ #category : #visiting }
DPLongOptionNode >> accept: aDPVisitor [
	^ aDPVisitor visitLongOptionNode: self
]
