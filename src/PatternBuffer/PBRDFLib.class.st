"
I represent python bindings for the RDFLib Python package.

My main responsibilities are handling SPARQL queries directly against RDF datastores, s.a., TTL or N3.

Example usage:

PBRDFLib datastore: 'firesat.ttl' query: 'PREFIX fse:   <http://opencaesar.io/examples/firesat/disciplines/fse/fse#>
PREFIX base:   <http://imce.jpl.nasa.gov/foundation/base#>
SELECT ?assembly ?subassembly
WHERE {
	?assembly base:contains ?subassembly
}'.
"
Class {
	#name : #PBRDFLib,
	#superclass : #Object,
	#instVars : [
		'pythonScript'
	],
	#category : #PatternBuffer
}

{ #category : #'as yet unclassified' }
PBRDFLib >> datastore: aStringOrFileReference query: aString [

	"Executes a SPARQL directly against an RDF datastore using the RDFLib Python package"

	pythonScript := { 
		                'from rdflib import Graph'.
		                ('datastore = """{1}"""' format:
			                 { aStringOrFileReference }).
		                ('query = """{1}"""' format: { aString }).
		                'g = Graph()'.
		                'g.parse(datastore, format="turtle")'.
		                'results = g.query(query)'.
		                'result_as_byte_string = results.serialize(format="json")'.
		                'result_as_json = str(result_as_byte_string, "utf-8")'.
		                'print(result_as_json)' }.


	^ PBPython new fromArrayOfStrings: pythonScript
]

{ #category : #accessing }
PBRDFLib >> pythonScript [

	^ pythonScript
]
