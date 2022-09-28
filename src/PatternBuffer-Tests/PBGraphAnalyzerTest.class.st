Class {
	#name : #PBGraphAnalyzerTest,
	#superclass : #TestCase,
	#instVars : [
		'graph'
	],
	#category : #'PatternBuffer-Tests'
}

{ #category : #running }
PBGraphAnalyzerTest >> setUp [

	super setUp.
	graph := PBGraphAnalyzer new
		         elements: Collection withAllSubclasses;
		         relation: [ :cls | cls dependentClasses ];
		         scale: #numberOfMethods;
		         build
]

{ #category : #tests }
PBGraphAnalyzerTest >> testNodesAndEdgesNotEmpty [

	self assert: graph nodes notEmpty.
	self assert: graph edges notEmpty
]
