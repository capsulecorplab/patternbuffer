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
