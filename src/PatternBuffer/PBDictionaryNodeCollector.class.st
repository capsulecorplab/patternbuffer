"
I am a tool to collect Dictionary inspection nodes.
"
Class {
	#name : 'PBDictionaryNodeCollector',
	#superclass : 'StNodeCollector',
	#category : 'PatternBuffer',
	#package : 'PatternBuffer'
}

{ #category : 'building' }
PBDictionaryNodeCollector >> collectNodes [

	^ self object associations collect: [ :assoc |
		  PBDictionaryInspectorAssociationNode hostObject: assoc ]
]
