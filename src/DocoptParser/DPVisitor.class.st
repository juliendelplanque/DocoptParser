"
I am a generic visitor which visit the Docopt's AST.
"
Class {
	#name : #DPVisitor,
	#superclass : #Object,
	#category : 'DocoptParser-Visitors'
}

{ #category : #visiting }
DPVisitor >> visitAllOptionsNode: aDPAllOptionNode [
	self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitArgumentNode: aDPArgumentNode [
	self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitCommandNode: aDPCommandNode [
	self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitComposedShortOptionNode: aDPComposedShortOptionNode [
	self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitDefaultValueNode: aDPDefaultValueNode [
	self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitDocoptNode: aDPDocoptNode [
	self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitElementsGroupNode: aDPElementsGroupNode [
	self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitEllipsisNode: aDPEllipsisNode [
	self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitLongOptionNode: aDPLongOptionNode [
	self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitMutuallyExclusiveElementsNode: aDPMutuallyExclusiveElementsNode [
	self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitOptionDescriptionPatternNode: aDPOptionDescriptionPatternNode [
	self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitOptionDescriptionsNode: aDPOptionDescriptionNode [
	self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitOptionalElementsNode: aDPOptionalElementsNode [
	self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitProgramNameNode: aDPProgramNameNode [
	self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitRequiredElementsNode: aDPRequiredElementsNode [
	self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitShortOptionNode: aDPShortOptionNode [
	self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitUsageNode: aDPUsageNode [
	self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitUsagePatternNode: aDPUsagePatternNode [
	self subclassResponsibility
]
