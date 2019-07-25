"
I am the node which represent mutually exclusive elements (ie separated by | ).
"
Class {
	#name : #DPMutuallyExclusiveElementsNode,
	#superclass : #DPAbstractNode,
	#instVars : [
		'mutuallyExclusiveElements'
	],
	#category : 'DocoptParser-AST'
}

{ #category : #'instance creation' }
DPMutuallyExclusiveElementsNode class >> mutuallyExclusiveElements: aCollectionOfElements [
	^ self new
		mutuallyExclusiveElements: aCollectionOfElements;
		yourself
]

{ #category : #visiting }
DPMutuallyExclusiveElementsNode >> accept: aDPVisitor [
	^ aDPVisitor visitMutuallyExclusiveElementsNode: self
]

{ #category : #accessing }
DPMutuallyExclusiveElementsNode >> mutuallyExclusiveElements [
	^ mutuallyExclusiveElements
]

{ #category : #accessing }
DPMutuallyExclusiveElementsNode >> mutuallyExclusiveElements: anObject [
	mutuallyExclusiveElements := anObject
]
