"
I am the node which represent an argument of a command or a parameter.
"
Class {
	#name : #DPArgumentNode,
	#superclass : #DPAbstractNode,
	#instVars : [
		'argumentName'
	],
	#category : 'DocoptParser-AST'
}

{ #category : #'instance creation' }
DPArgumentNode class >> argumentName: aString [
	^ self new
		argumentName: aString;
		yourself
]

{ #category : #visiting }
DPArgumentNode >> accept: aDPVisitor [
	^ aDPVisitor visitArgumentNode: self
]

{ #category : #accessing }
DPArgumentNode >> argumentName [
	^ argumentName
]

{ #category : #accessing }
DPArgumentNode >> argumentName: anObject [
	argumentName := anObject
]
