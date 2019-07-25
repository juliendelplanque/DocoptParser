"
I am the node representing a set of elements grouped together. I am used with mutually exclusive elements.

For example: (--hello name | --goodbye name)
--hello name is hold in a DPElementsGroupNode.
--goodbye name is hold in aDPElementsGroupNode

And these two nodes are hold in a DPMutuallyExclusiveElementsNode.
"
Class {
	#name : #DPElementsGroupNode,
	#superclass : #DPAbstractNode,
	#instVars : [
		'elements'
	],
	#category : 'DocoptParser-AST'
}

{ #category : #'instance creation' }
DPElementsGroupNode class >> elements: aListOfElements [
	^ self new
		elements: aListOfElements;
		yourself
]

{ #category : #visiting }
DPElementsGroupNode >> accept: aDPVisitor [
	^ aDPVisitor visitElementsGroupNode: self
]

{ #category : #accessing }
DPElementsGroupNode >> elements [
	^ elements
]

{ #category : #accessing }
DPElementsGroupNode >> elements: anObject [
	elements := anObject
]
