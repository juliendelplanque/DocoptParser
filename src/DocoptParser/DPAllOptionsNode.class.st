"
I am the node which represents [options] keyword in command line arguments.
"
Class {
	#name : #DPAllOptionsNode,
	#superclass : #DPAbstractNode,
	#category : 'DocoptParser-AST'
}

{ #category : #visiting }
DPAllOptionsNode >> acceptVisitor: aDPVisitor [
	^ aDPVisitor visitDPAllOptionsNode: self
]
