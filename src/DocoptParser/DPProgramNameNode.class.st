"
I am a node which represent the program name.
"
Class {
	#name : #DPProgramNameNode,
	#superclass : #DPAbstractNode,
	#instVars : [
		'programName'
	],
	#category : 'DocoptParser-AST'
}

{ #category : #'instance creation' }
DPProgramNameNode class >> programName: aString [
	^ self new
		programName: aString;
		yourself
]

{ #category : #visiting }
DPProgramNameNode >> accept: aDPVisitor [
	^ aDPVisitor visitProgramNameNode: self
]

{ #category : #accessing }
DPProgramNameNode >> programName [
	^ programName
]

{ #category : #accessing }
DPProgramNameNode >> programName: anObject [
	programName := anObject
]
