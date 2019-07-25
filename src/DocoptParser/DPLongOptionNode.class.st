"
I am long option (ie. --long).
"
Class {
	#name : #DPLongOptionNode,
	#superclass : #DPOptionNode,
	#category : 'DocoptParser-AST'
}

{ #category : #visiting }
DPLongOptionNode >> acceptVisitor: aDPVisitor [
	^ aDPVisitor visitDPLongOptionNode: self
]

{ #category : #'as yet unclassified' }
DPLongOptionNode >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: '('.
	aStream nextPutAll: self option.
	aStream nextPutAll: ')'.
]
