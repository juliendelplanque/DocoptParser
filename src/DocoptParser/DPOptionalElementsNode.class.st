"
I am a node which represent an optional element (ie an element between [] ).
"
Class {
	#name : #DPOptionalElementsNode,
	#superclass : #DPAbstractNode,
	#instVars : [
		'optionalElements'
	],
	#category : 'DocoptParser-AST'
}

{ #category : #'instance creation' }
DPOptionalElementsNode class >> optionalElements: anElementList [
	^ self new
		optionalElements: anElementList;
		yourself
]

{ #category : #visiting }
DPOptionalElementsNode >> acceptVisitor: aDPVisitor [
	^ aDPVisitor visitDPOptionalElementsNode: self
]

{ #category : #accessing }
DPOptionalElementsNode >> optionalElements [
	^ optionalElements
]

{ #category : #accessing }
DPOptionalElementsNode >> optionalElements: anObject [
	optionalElements := anObject
]

{ #category : #printing }
DPOptionalElementsNode >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: '(['.
	self optionalElements printOn: aStream.
	aStream nextPutAll: '])'
]
