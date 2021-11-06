Class {
	#name : #PBInterface,
	#superclass : #Object,
	#instVars : [
		'ends'
	],
	#category : #'PatternBuffer-Base'
}

{ #category : #accessing }
PBInterface >> ends [

	^ ends
]

{ #category : #accessing }
PBInterface >> ends: portList [

	ends := portList
]
