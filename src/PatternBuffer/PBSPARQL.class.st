"
I perform queries against a SPARQL endpoint.

Internal Representation and Key Implementation Points.

    Instance Variables
	endpoint:		<Object>
	queryStream:		<ReadWriteStream>


    Implementation Points
   queryStream - Stream for appending query parameters

"
Class {
	#name : #PBSPARQL,
	#superclass : #Object,
	#instVars : [
		'endpoint',
		'queryStream',
		'result',
		'datastore',
		'data'
	],
	#category : #PatternBuffer
}

{ #category : #'as yet unclassified' }
PBSPARQL >> appendUrlEncodedSPARQLStringToQueryStream: aUrlEncodedSPARQLString [

	"Append aSPARQLString to the receiver's query stream, execute query, and cache results"

	queryStream
		nextPutAll: '?query=';
		nextPutAll: aUrlEncodedSPARQLString
]

{ #category : #'as yet unclassified' }
PBSPARQL >> datastore: aStringOrFileReference [

	"Sets path to and stores contents of RDF data from a file path to an RDF datastore, s.a. a .ttl or (TODO) .n3 file, to be used for directly executing SPARQL queries against."

	data := aStringOrFileReference asFileReference contents.
	datastore := aStringOrFileReference
]

{ #category : #accessing }
PBSPARQL >> endpoint [

	^ endpoint
]

{ #category : #'as yet unclassified' }
PBSPARQL >> endpoint: aUrl [

	endpoint := aUrl
]

{ #category : #initialization }
PBSPARQL >> initialize [

	" Private - Initialize the receiver's stream "

	super initialize.
	self queryStream: (ReadWriteStream on: String new)
]

{ #category : #accessing }
PBSPARQL >> query [

	" Answer a SPARQL <String> representing the current query "

	^ queryStream contents
]

{ #category : #accessing }
PBSPARQL >> query: aSPARQLString [

	"Executes a SPARQL query directly against a local RDF datastore.
	Otherwise, performs query against an endpoint"

	datastore isNotNil
		ifTrue: [ 
		result := PBRDFLib new datastore: datastore query: aSPARQLString ]
		ifFalse: [ 
			self appendUrlEncodedSPARQLStringToQueryStream:
				aSPARQLString urlEncoded.

			result := (ZnEasy get:
				           self endpoint contents , self queryStream contents
				           , '&format=json&output=json&results=json') contents ]
]

{ #category : #accessing }
PBSPARQL >> queryStream [

	^ queryStream
]

{ #category : #accessing }
PBSPARQL >> queryStream: anObject [

	queryStream := anObject
]

{ #category : #accessing }
PBSPARQL >> result [

	^ result
]

{ #category : #accessing }
PBSPARQL >> result: aString [

	result := aString
]

{ #category : #'as yet unclassified' }
PBSPARQL >> resultAsJSON [

	"returns query as JSON"

	^ result
]

{ #category : #'as yet unclassified' }
PBSPARQL >> resultAsTable [

	"Executes and returns query as Array2D object"

	| resultAsJSON parsedJSON bindings vars rowSize colSize "formattedValue" |
	resultAsJSON := self result contents.
	parsedJSON := NeoJSONReader fromString: resultAsJSON.
	bindings := (parsedJSON at: #results) at: #bindings.
	vars := (parsedJSON at: #head) at: #vars.
	rowSize := bindings size.
	colSize := vars size.
	"formattedValue := [ :input | 
	                  [ (input asString splitOn: '#') at: 2 ]
		                  on: Error
		                  do: [ input asString ] ]."

	^ PBArray2D new
		  rows: rowSize
		  columns: colSize
		  tabulate: [ :row :column | 
			  | value index |
			  value := bindings at: row.
			  value.
			  "formattedValue value: value"
			  index := vars at: column.
			  value at: index at: #value
			  "formattedValue value: ([ value at: index at: #value ]
					   on: KeyNotFound
					   do: [ '' ])" ]
		  columnNames: vars
]
