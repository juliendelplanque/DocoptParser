"
I am a node which represent an required element (ie an element between () ).
"
Class {
	#name : #DPRequiredElementsNode,
	#superclass : #DPAbstractNode,
	#instVars : [
		'requiredElements'
	],
	#category : 'DocoptParser-AST'
}

{ #category : #'instance creation' }
DPRequiredElementsNode class >> requiredElements: anElementList [
	^ self new
		requiredElements: anElementList;
		yourself
]

{ #category : #visiting }
DPRequiredElementsNode >> accept: aDPVisitor [
	^ aDPVisitor visitRequiredElementsNode: self
]

{ #category : #accessing }
DPRequiredElementsNode >> requiredElements [
	^ requiredElements
]

{ #category : #accessing }
DPRequiredElementsNode >> requiredElements: anObject [
	requiredElements := anObject
]
