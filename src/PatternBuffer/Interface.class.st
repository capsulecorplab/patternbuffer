Class {
	#name : #Interface,
	#superclass : #Object,
	#instVars : [
		'name',
		'description',
		'data',
		'ports'
	],
	#category : #'PatternBuffer-Base'
}

{ #category : #accessing }
Interface >> data [
	^ data
]

{ #category : #accessing }
Interface >> data: aDataString [
	data := aDataString
]

{ #category : #accessing }
Interface >> description [
	^ description
]

{ #category : #accessing }
Interface >> description: aDescriptionString [
	description := aDescriptionString
]

{ #category : #accessing }
Interface >> name [
	^ name
]

{ #category : #accessing }
Interface >> name: aNameString [
	name := aNameString
]

{ #category : #accessing }
Interface >> ports [
	^ ports
]

{ #category : #accessing }
Interface >> ports: aPortList [
	ports := aPortList
]
