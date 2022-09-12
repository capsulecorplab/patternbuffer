Class {
	#name : #PBSPARQLTest,
	#superclass : #TestCase,
	#instVars : [
		'sparqlClient'
	],
	#category : #'PatternBuffer-Tests'
}

{ #category : #initialization }
PBSPARQLTest >> setUp [

	sparqlClient := PBSPARQL new
]

{ #category : #accessing }
PBSPARQLTest >> sparqlString [

	^ 'SELECT DISTINCT ?concept
WHERE {
    ?s a ?concept .
} LIMIT 50'
]

{ #category : #tests }
PBSPARQLTest >> testEndpoint [

	sparqlClient endpoint: 'http://localhost:3030/database/sparql'.
	self assert: (sparqlClient endpoint isKindOf: String).
	self assert: sparqlClient endpoint notEmpty.
	self assert: (sparqlClient endpoint beginsWith: 'http:')
]

{ #category : #tests }
PBSPARQLTest >> testQuery [

	sparqlClient query: self sparqlString.
	self assert:
		(sparqlClient query includesSubstring: self sparqlString urlEncoded)
]

{ #category : #tests }
PBSPARQLTest >> testQueryStream [

	self assert: (sparqlClient queryStream isKindOf: Stream)
]
