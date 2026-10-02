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
				package: 'PatternBuffer'
				with: [ spec requires: #( 'ContainersArray2D' ) ];
				package: 'PatternBuffer-Python';
				package: 'PatternBuffer-RDF' with: [
						spec
							requires: #( 'PatternBuffer-Python' 'PatternBuffer' );
							postLoadDoIt: #postload:package: ];
				package: 'PatternBuffer-Tests'
				with: [ spec requires: #( 'PatternBuffer' ) ];
				package: 'PatternBuffer-Python-Tests'
				with: [ spec requires: #( 'PatternBuffer-Python' ) ];
				package: 'PatternBuffer-RDF-Tests'
				with: [ spec requires: #( 'PatternBuffer-RDF' ) ].

			"Groups"
			spec
				group: 'default' with: #( 'PatternBuffer' );
				group: 'RDF'
				with: #( 'PatternBuffer-Python' 'PatternBuffer-RDF' );
				group: 'Python' with: #( 'PatternBuffer-Python' );
				group: 'Tests' with: #( 'PatternBuffer-Tests' );
				group: 'Python-Tests' with: #( 'PatternBuffer-Python-Tests' );
				group: 'RDF-Tests' with: #( 'PatternBuffer-RDF-Tests' ) ]
]

{ #category : 'dependencies' }
BaselineOfPatternBuffer >> containersArray2D: spec [
	"baseline for ContainersArray2D"

	spec baseline: 'ContainersArray2D' with: [
		spec
			loads: #( 'Containers-Array2D' );
			repository: 'github://pharo-containers/Containers-Array2D/src' ]
]

{ #category : 'actions' }
BaselineOfPatternBuffer >> postload: loader package: packageSpec [
	"Install RDFLib"

	PBRDFLib installRDFLib
]
