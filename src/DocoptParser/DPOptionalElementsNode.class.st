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
DPOptionalElementsNode >> accept: aDPVisitor [
	^ aDPVisitor visitOptionalElementsNode: self
]

{ #category : #accessing }
DPOptionalElementsNode >> optionalElements [
	^ optionalElements
]

{ #category : #accessing }
DPOptionalElementsNode >> optionalElements: anObject [
	optionalElements := anObject
]
