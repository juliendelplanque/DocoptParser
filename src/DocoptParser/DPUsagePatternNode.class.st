"
I am the node which represnet a usage pattern (ie. my_program command <arg>).
"
Class {
	#name : #DPUsagePatternNode,
	#superclass : #DPAbstractNode,
	#instVars : [
		'usagePattern'
	],
	#category : 'DocoptParser-AST'
}

{ #category : #'instance creation' }
DPUsagePatternNode class >> usagePattern: aListOfElement [
	^ self new
		usagePattern: aListOfElement;
		yourself
]

{ #category : #visiting }
DPUsagePatternNode >> accept: aDPVisitor [
	^ aDPVisitor visitUsagePatternNode: self
]

{ #category : #accessing }
DPUsagePatternNode >> usagePattern [
	^ usagePattern
]

{ #category : #accessing }
DPUsagePatternNode >> usagePattern: anObject [
	usagePattern := anObject
]
