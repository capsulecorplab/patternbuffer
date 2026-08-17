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
		self containersArray2D: spec.

		"Packages"
		spec
			package: 'PatternBuffer';
			package: 'PatternBuffer-Tests' ]
]

{ #category : #dependencies }
BaselineOfPatternBuffer >> containersArray2D: spec [
	"baseline for ContainersArray2D"

	spec baseline: 'ContainersArray2D' with: [
		spec
			loads: #( 'Containers-Array2D' );
			repository: 'github://pharo-containers/Containers-Array2D/src' ]
]
