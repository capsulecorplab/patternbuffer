Class {
	#name : 'BaselineOfPatternBuffer',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfPatternBuffer',
	#package : 'BaselineOfPatternBuffer'
}

{ #category : 'baselines' }
BaselineOfPatternBuffer >> baseline: spec [
	"baseline"

	<baseline>
	spec for: #common do: [ "Dependencies"
			self containersArray2D: spec.

			"Packages"
			spec
				package: 'PatternBuffer';
				package: 'PatternBuffer-Tests' ].

	"Groups"
	spec
		group: 'RDF' with: #( 'PatternBuffer-Python' 'PatternBuffer-RDF' );
		group: 'Python' with: #( 'PatternBuffer-Python' );
		group: 'Tests' with: #( 'PatternBuffer-Tests' );
		group: 'All'
		with: #( 'PatternBuffer' 'PatternBuffer-RDF' 'PatternBuffer-Python'
			   'PatternBuffer-Tests' )
]

{ #category : 'dependencies' }
BaselineOfPatternBuffer >> containersArray2D: spec [
	"baseline for ContainersArray2D"

	spec baseline: 'ContainersArray2D' with: [
		spec
			loads: #( 'Containers-Array2D' );
			repository: 'github://pharo-containers/Containers-Array2D/src' ]
]
