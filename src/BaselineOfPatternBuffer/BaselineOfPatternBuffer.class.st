Class {
	#name : #BaselineOfPatternBuffer,
	#superclass : #BaselineOf,
	#category : #BaselineOfPatternBuffer
}

{ #category : #baselines }
BaselineOfPatternBuffer >> baseline: spec [

	"baseline"

	<baseline>
	spec for: #common do: [ "Packages"
		spec
			package: 'PatternBuffer';
			package: 'PatternBuffer-Tests' ]
]
