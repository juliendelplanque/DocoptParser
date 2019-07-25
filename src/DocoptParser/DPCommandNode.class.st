"
I am the node which represent a command in the command line arguments.
"
Class {
	#name : #DPCommandNode,
	#superclass : #DPAbstractNode,
	#instVars : [
		'commandName'
	],
	#category : 'DocoptParser-AST'
}

{ #category : #'instance creation' }
DPCommandNode class >> commandName: aString [
	^ self new
		commandName: aString;
		yourself
]

{ #category : #visiting }
DPCommandNode >> accept: aDPVisitor [
	^ aDPVisitor visitCommandNode: self
]

{ #category : #accessing }
DPCommandNode >> commandName [
	^ commandName
]

{ #category : #accessing }
DPCommandNode >> commandName: anObject [
	commandName := anObject
]
