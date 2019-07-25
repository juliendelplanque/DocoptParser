"
I am the node which hold usage and options description. I am the root of the AST.
"
Class {
	#name : #DPDocoptNode,
	#superclass : #DPAbstractNode,
	#instVars : [
		'description',
		'usage',
		'optionDescription'
	],
	#category : 'DocoptParser-AST'
}

{ #category : #'instance creation' }
DPDocoptNode class >> description: aString usage: aDPUsageNode optionDescription: aDPOptionDescriptionNode [ 
	^ self new
		description: aString;
		usage: aDPUsageNode;
		optionDescription: aDPOptionDescriptionNode;
		yourself
]

{ #category : #visiting }
DPDocoptNode >> acceptVisitor: aDPVisitor [
	^ aDPVisitor visitDPDocoptNode: self
]

{ #category : #accessing }
DPDocoptNode >> description [
	^ description
]

{ #category : #accessing }
DPDocoptNode >> description: anObject [
	description := anObject
]

{ #category : #accessing }
DPDocoptNode >> optionDescription [
	^ optionDescription
]

{ #category : #accessing }
DPDocoptNode >> optionDescription: anObject [
	optionDescription := anObject
]

{ #category : #accessing }
DPDocoptNode >> usage [
	^ usage
]

{ #category : #accessing }
DPDocoptNode >> usage: anObject [
	usage := anObject
]
