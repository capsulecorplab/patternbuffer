"
I model an attribute of a Dictionary in the StInspector. I am used in the Raw presentation of a Dictionary.
"
Class {
	#name : 'PBDictionaryInspectorAssociationNode',
	#superclass : 'StInspectorAssociationNode',
	#category : 'PatternBuffer',
	#package : 'PatternBuffer'
}

{ #category : 'accessing' }
PBDictionaryInspectorAssociationNode >> children [

	^ self value inspectorDictionaryNodes
]
