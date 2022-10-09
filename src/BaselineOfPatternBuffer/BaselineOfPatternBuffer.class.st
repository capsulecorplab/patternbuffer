Class {
	#name : #BaselineOfPatternBuffer,
	#superclass : #BaselineOf,
	#category : #BaselineOfPatternBuffer
}

{ #category : #baselines }
BaselineOfPatternBuffer >> baseline: spec [

	"baseline"

	<baseline>
	spec for: #common do: [ "Dependencies"
		self neoJSON: spec.
		self systemInteraction: spec.

		"Packages"
		spec
			package: 'PatternBuffer';
			package: 'PatternBuffer-Tests' ]
]

{ #category : #'as yet unclassified' }
BaselineOfPatternBuffer >> neoJSON: spec [

	"baseline for NeoJSON"

	spec
		baseline: 'NeoJSON'
		with: [ spec repository: 'github://svenvc/NeoJSON:v17/repository' ]
]

{ #category : #'as yet unclassified' }
BaselineOfPatternBuffer >> systemInteraction: spec [

	"baseline for SystemInteraction"

	spec
		baseline: 'SystemInteraction'
		with: [ 
		spec repository: 'github://jecisc/SystemInteraction:v1.0.3/src' ]
]
