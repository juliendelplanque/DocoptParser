"
I am the node which old usage patterns.
"
Class {
	#name : #DPUsageNode,
	#superclass : #DPAbstractNode,
	#instVars : [
		'usagePatterns'
	],
	#category : 'DocoptParser-AST'
}

{ #category : #'instance creation' }
DPUsageNode class >> usagePatterns: aListOfPatterns [
	^ self new
		usagePatterns: aListOfPatterns;
		yourself
]

{ #category : #visiting }
DPUsageNode >> accept: aDPVisitor [
	^ aDPVisitor visitUsageNode: self
]

{ #category : #accessing }
DPUsageNode >> usagePatterns [
	^ usagePatterns
]

{ #category : #accessing }
DPUsageNode >> usagePatterns: anObject [
	usagePatterns := anObject
]
