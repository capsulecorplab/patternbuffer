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
	#name : 'PBRDFLib',
	#superclass : 'Object',
	#instVars : [
		'pythonScript'
	],
	#category : 'PatternBuffer-RDF',
	#package : 'PatternBuffer-RDF'
}

{ #category : 'installing' }
PBRDFLib class >> installRDFLib [
	"install rdflib with pip via python-venv"

	"initialize python as to ensure python venv already exists"
	PBPython new.

	"install rdflib via pip if not installed"
	('*rdflib*' match: (LibC resultOfCommand: './venv/bin/pip freeze'))
		ifFalse: [ LibC runCommand: './venv/bin/pip install rdflib' ]
]

{ #category : 'accessing - query' }
PBRDFLib >> datastore: aStringOrFileReference query: aString [
	"Executes a SPARQL directly against an RDF datastore using the RDFLib Python package"

	pythonScript := {
		                'from rdflib import Graph'.
		                ('datastore = """{1}"""' format:
			                 { aStringOrFileReference }).
		                ('query = """{1}"""' format: { aString }).
		                'g = Graph()'.
		                'g.parse(data=datastore, format="turtle")'.
		                'results = g.query(query)'.
		                'result_as_byte_string = results.serialize(format="json")'.
		                'result_as_json = str(result_as_byte_string, "utf-8")'.
		                'print(result_as_json)' }.


	^ PBPython new fromArrayOfStrings: pythonScript
]

{ #category : 'initialization' }
PBRDFLib >> initialize [
	"verify rdflib is installed. if not, throw an error"

	| pip errorMsg |
	super initialize.

	"create file reference object for pip"
	pip := './venv/bin/pip' asFileReference.

	"define error message"
	errorMsg := 'RDFLib not installed. Please install with `PBRDFLib installRDFLib`'.

	"verify pip exists"
	pip exists
		ifTrue: [ "Check result of pip freeze for rdflib"
				('*rdflib*' match: (LibC resultOfCommand: './venv/bin/pip freeze'))
					ifFalse: [ self error: errorMsg ] ]
		ifFalse: [ self error: errorMsg ]
]

{ #category : 'accessing' }
PBRDFLib >> pythonScript [

	^ pythonScript
]
