"
I am the which represent an ellipsis  (...).
"
Class {
	#name : #DPEllipsisNode,
	#superclass : #DPAbstractNode,
	#category : 'DocoptParser-AST'
}

{ #category : #visiting }
DPEllipsisNode >> acceptVisitor: aDPVisitor [
	^ aDPVisitor visitDPEllipsisNode: self
]
