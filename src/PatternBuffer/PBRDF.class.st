"
I represent an RDF data object
"
Class {
	#name : #PBRDF,
	#superclass : #Object,
	#instVars : [
		'data',
		'rdfAsJSON',
		'triplestore'
	],
	#category : #PatternBuffer
}

{ #category : #accessing }
PBRDF >> asArrayOfTriples [

	"accessor method for RDF data as an array of triples"

	| pythonScript datastore |
	datastore := self datastore.

	pythonScript := { 
		                'from rdflib import Graph'.
		                'from json import dump'.
		                'from os import linesep'.
		                ('datastore = """{1}"""' format: { self datastore }).
		                'g = Graph()'.
		                'g.parse(datastore, format="turtle")'.
		                'triples = []'.
		                'for s, p, o in g:'.
		                '    try:'.
		                '        sub = str(s).split("#")[1]'.
		                '    except:'.
		                '        sub = s'.
		                '    try:'.
		                '        pred = str(p).split("#")[1]'.
		                '    except:'.
		                '        pred = p'.
		                '    try:'.
		                '        obj = str(o).split("#")[1]'.
		                '    except:'.
		                '        obj = o'.
		                '    triples.append([str(sub), str(pred), str(obj)])'.
		                'with open("data.json", "w") as file:'.
		                '    file.write(str(triples))' }.

	PBPython new fromArrayOfStrings: pythonScript.

	rdfAsJSON := 'data.json' asFileReference contents.
	triplestore := STONJSON fromString: rdfAsJSON.
	^ triplestore
]

{ #category : #accessing }
PBRDF >> asGraph [

	"accessor method for RDF data as a graph of nodes and edges"

	self shouldBeImplemented
]

{ #category : #accessing }
PBRDF >> data [

	"accessor method for RDF data as a string"

	^ data
]

{ #category : #accessing }
PBRDF >> datastore [

	"accessor method for path to RDF datastore"

	| datastore |
	"save in-memory rdf data to local file system"
	SICommand waitForCommand: 'printf' arguments: { 
			($' asString , data , $' asString).
			'>'.
			'rdfdata.ttl'.
			'2>stderr.log' }.

	datastore := 'rdfdata.ttl'.

	^ datastore
]

{ #category : #'instance creation' }
PBRDF >> fromFile: aStringOrFileReference [

	"Store contents of file containing valid RDF syntax, s.a., Turtle or N3, in-memory"

	data := aStringOrFileReference asFileReference contents
]

{ #category : #'instance creation' }
PBRDF >> fromString: aString [

	"constructs a PBRDF object from a string containing valid RDF syntax, s.a., Turtle or N3"

	data := aString
]
