"
I am the node which represent an option description.
"
Class {
	#name : #DPOptionDescriptionPatternNode,
	#superclass : #DPAbstractNode,
	#instVars : [
		'description',
		'defaultValue',
		'commandAndArguments',
		'commandAliasAndArguments'
	],
	#category : 'DocoptParser-AST'
}

{ #category : #visiting }
DPOptionDescriptionPatternNode >> accept: aDPVisitor [
	^ aDPVisitor visitOptionDescriptionPatternNode: self
]

{ #category : #accessing }
DPOptionDescriptionPatternNode >> commandAliasAndArguments [
	^ commandAliasAndArguments
]

{ #category : #accessing }
DPOptionDescriptionPatternNode >> commandAliasAndArguments: anObject [
	commandAliasAndArguments := anObject
]

{ #category : #accessing }
DPOptionDescriptionPatternNode >> commandAndArguments [
	^ commandAndArguments
]

{ #category : #accessing }
DPOptionDescriptionPatternNode >> commandAndArguments: anObject [
	commandAndArguments := anObject
]

{ #category : #accessing }
DPOptionDescriptionPatternNode >> defaultValue [
	^ defaultValue
]

{ #category : #accessing }
DPOptionDescriptionPatternNode >> defaultValue: anObject [
	defaultValue := anObject
]

{ #category : #accessing }
DPOptionDescriptionPatternNode >> description [
	^ description
]

{ #category : #accessing }
DPOptionDescriptionPatternNode >> description: anObject [
	description := anObject
]

{ #category : #initialization }
DPOptionDescriptionPatternNode >> initialize [
	super initialize.
	self commandAndArguments: Array new.
	self commandAliasAndArguments: Array new
]
