Class {
	#name : #PBComponentListItem,
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
PBComponentListItem >> description [
	^ description
]

{ #category : #'as yet unclassified' }
PBComponentListItem >> description: aDescriptionString [ 
	description := aDescriptionString
]
