Class {
	#name : #Port,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'PatternBuffer-Base'
}

{ #category : #accessing }
Port >> name [
	^ name
]

{ #category : #accessing }
Port >> name: aNameString [
	name := aNameString
]
