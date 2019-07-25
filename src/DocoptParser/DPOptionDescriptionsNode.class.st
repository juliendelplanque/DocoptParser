"
I am the node which hold description patterns.
"
Class {
	#name : #DPOptionDescriptionsNode,
	#superclass : #DPAbstractNode,
	#instVars : [
		'optionDescriptions'
	],
	#category : 'DocoptParser-AST'
}

{ #category : #'instance creation' }
DPOptionDescriptionsNode class >> optionDescriptions: aListOfDescription [
	^ self new
		optionDescriptions: aListOfDescription;
		yourself
]

{ #category : #visiting }
DPOptionDescriptionsNode >> accept: aDPVisitor [
	^ aDPVisitor visitOptionDescriptionsNode: self
]

{ #category : #accessing }
DPOptionDescriptionsNode >> optionDescriptions [
	^ optionDescriptions
]

{ #category : #accessing }
DPOptionDescriptionsNode >> optionDescriptions: anObject [
	optionDescriptions := anObject
]
