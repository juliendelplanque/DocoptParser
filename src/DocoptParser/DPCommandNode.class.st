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
DPCommandNode >> acceptVisitor: aDPVisitor [
	^ aDPVisitor visitDPCommandNode: self
]

{ #category : #accessing }
DPCommandNode >> commandName [
	^ commandName
]

{ #category : #accessing }
DPCommandNode >> commandName: anObject [
	commandName := anObject
]

{ #category : #printing }
DPCommandNode >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	aStream nextPutAll: self commandName.
	aStream nextPut: $)
]
