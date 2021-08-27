"
Defines a single step in an activity, e.g. assembly instructions.
"
Class {
	#name : #PBActivityStep,
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
PBActivityStep >> details [
	^ details
]

{ #category : #'as yet unclassified' }
PBActivityStep >> details: aDetailsString [ 
	details := aDetailsString
]

{ #category : #'as yet unclassified' }
PBActivityStep >> requiredParts [
	^ requiredParts
]

{ #category : #'as yet unclassified' }
PBActivityStep >> requiredParts: aRequiredPartsList [
	requiredParts := aRequiredPartsList
]

{ #category : #'as yet unclassified' }
PBActivityStep >> requiredTools [
	^ requiredTools
]

{ #category : #'as yet unclassified' }
PBActivityStep >> requiredTools: aRequiredToolsList [
	requiredTools := aRequiredToolsList
]

{ #category : #'as yet unclassified' }
PBActivityStep >> summary [
	^ summary
]

{ #category : #'as yet unclassified' }
PBActivityStep >> summary: aSummaryString [
	summary := aSummaryString
]
