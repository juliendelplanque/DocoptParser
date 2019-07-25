"
I am a node which represent the program name.
"
Class {
	#name : #DPProgramNameNode,
	#superclass : #DPAbstractNode,
	#instVars : [
		'name'
	],
	#category : #'DocoptParser-AST'
}

{ #category : #'instance creation' }
DPProgramNameNode class >> name: aString [
	^ self new
		name: aString;
		yourself
]

{ #category : #visiting }
DPProgramNameNode >> accept: aDPVisitor [
	^ aDPVisitor visitProgramNameNode: self
]

{ #category : #accessing }
DPProgramNameNode >> name [
	^ name
]

{ #category : #accessing }
DPProgramNameNode >> name: anObject [
	name := anObject
]
