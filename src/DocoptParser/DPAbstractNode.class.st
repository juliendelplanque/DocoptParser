"
I am an abstract node of the docopt's AST.
"
Class {
	#name : #DPAbstractNode,
	#superclass : #Object,
	#category : 'DocoptParser-AST'
}

{ #category : #visiting }
DPAbstractNode >> accept: aDPVisitor [
	self subclassResponsibility
]
