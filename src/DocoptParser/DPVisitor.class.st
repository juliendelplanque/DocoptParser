"
I am a generic visitor which visit the Docopt's AST.
"
Class {
	#name : #DPVisitor,
	#superclass : #Object,
	#category : 'DocoptParser-Visitors'
}

{ #category : #visiting }
DPVisitor >> visit: anObject [
	^ anObject acceptVisitor: self
]

{ #category : #visiting }
DPVisitor >> visitDPAllOptionsNode: aDPAllOptionsNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitDPArgumentNode: aDPArgumentNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitDPCommandNode: aDPCommandNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitDPComposedShortOptionNode: aDPComposedShortOptionNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitDPDefaultValueNode: aDPDefaultValueNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitDPDocoptNode: aDPDocoptNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitDPElementsGroupNode: aDPElementsGroupNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitDPEllipsisNode: aDPEllipsisNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitDPLongOptionNode: aDPLongOptionNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitDPMutuallyExclusiveElementsNode: aDPMutuallyExclusiveElementsNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitDPOptionDescriptionPatternNode: aDPOptionDescriptionPatternNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitDPOptionDescriptionsNode: aDPOptionDescriptionsNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitDPOptionalElementsNode: aDPOptionalElementsNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitDPProgramNameNode: aDPProgramNameNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitDPRequiredElementsNode: aDPRequiredElementsNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitDPShortOptionNode: aDPShortOptionNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitDPUsageNode: aDPUsageNode [
	^ self subclassResponsibility
]

{ #category : #visiting }
DPVisitor >> visitDPUsagePatternNode: aDPUsagePatternNode [
	^ self subclassResponsibility
]
