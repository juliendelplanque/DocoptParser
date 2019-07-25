"
I am the node which represent the default value of an option ([default: x]).
"
Class {
	#name : #DPDefaultValueNode,
	#superclass : #DPAbstractNode,
	#instVars : [
		'defaultValue'
	],
	#category : 'DocoptParser-AST'
}

{ #category : #'instance creation' }
DPDefaultValueNode class >> defaultValue: aDefaultValue [
	^ self new
		defaultValue: aDefaultValue;
		yourself
]

{ #category : #visiting }
DPDefaultValueNode >> accept: aDPVisitor [
	^ aDPVisitor visitDefaultValueNode: self
]

{ #category : #accessing }
DPDefaultValueNode >> defaultValue [
	^ defaultValue
]

{ #category : #accessing }
DPDefaultValueNode >> defaultValue: anObject [
	defaultValue := anObject
]
