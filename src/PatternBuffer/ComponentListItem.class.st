Class {
	#name : #ComponentListItem,
	#superclass : #Object,
	#instVars : [
		'id',
		'description',
		'descriptionLong',
		'descriptionSelected',
		'quantity',
		'quantityUnits',
		'options',
		'selectedOption',
		'notes'
	],
	#category : #'PatternBuffer-Base'
}

{ #category : #'as yet unclassified' }
ComponentListItem >> description [
	^ description
]

{ #category : #'as yet unclassified' }
ComponentListItem >> description: aDescriptionString [ 
	description := aDescriptionString
]
