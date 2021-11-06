Class {
	#name : #PBPort,
	#superclass : #Object,
	#instVars : [
		'attribute',
		'in',
		'out',
		'inout'
	],
	#category : #'PatternBuffer-Base'
}

{ #category : #accessing }
PBPort >> attribute: anAttribute [

	attribute := anAttribute
]

{ #category : #accessing }
PBPort >> in: item [

	in := item
]

{ #category : #accessing }
PBPort >> inout: item [

	inout := item
]

{ #category : #accessing }
PBPort >> out: item [

	out := item
]
