"
Defines a single step in an activity, e.g. assembly instructions.
"
Class {
	#name : #ActivityStep,
	#superclass : #Object,
	#instVars : [
		'summary',
		'requiredParts',
		'requiredTools',
		'details'
	],
	#category : #'PatternBuffer-Base'
}

{ #category : #'as yet unclassified' }
ActivityStep >> details [
	^ details
]

{ #category : #'as yet unclassified' }
ActivityStep >> details: aDetailsString [ 
	details := aDetailsString
]

{ #category : #'as yet unclassified' }
ActivityStep >> requiredParts [
	^ requiredParts
]

{ #category : #'as yet unclassified' }
ActivityStep >> requiredParts: aRequiredPartsList [
	requiredParts := aRequiredPartsList
]

{ #category : #'as yet unclassified' }
ActivityStep >> requiredTools [
	^ requiredTools
]

{ #category : #'as yet unclassified' }
ActivityStep >> requiredTools: aRequiredToolsList [
	requiredTools := aRequiredToolsList
]

{ #category : #'as yet unclassified' }
ActivityStep >> summary [
	^ summary
]

{ #category : #'as yet unclassified' }
ActivityStep >> summary: aSummaryString [
	summary := aSummaryString
]
