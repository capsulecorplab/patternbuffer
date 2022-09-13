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
		'queryStream'
	],
	#category : #PatternBuffer
}

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

	^ self queryStream contents
]

{ #category : #accessing }
PBSPARQL >> query: aSPARQLString [

	" Append aSPARQLString to the receiver's query stream "

	self queryStream
		nextPutAll: '?query=';
		nextPutAll: aSPARQLString urlEncoded
]

{ #category : #accessing }
PBSPARQL >> queryStream [

	^ queryStream
]

{ #category : #accessing }
PBSPARQL >> queryStream: anObject [

	queryStream := anObject
]

{ #category : #'as yet unclassified' }
PBSPARQL >> resultAsJSON [

	"Executes and returns query as JSON"

	^ (ZnEasy get: self endpoint contents , self queryStream contents
		   , '&format=json&output=json&results=json') contents
]

{ #category : #'as yet unclassified' }
PBSPARQL >> resultAsTable [

	"Executes and returns query as Array2D object"

	| resultAsJSON |
	resultAsJSON := self resultAsJSON.
	^ Array2D
		  rows:
			  (((NeoJSONReader fromString: resultAsJSON) at: #results) at:
				   #bindings) size
		  columns:
		  (((NeoJSONReader fromString: resultAsJSON) at: #head) at: #vars)
			  size
		  tabulate: [ :row :column | 
			  ((((NeoJSONReader fromString: resultAsJSON) at: #results) at:
				    #bindings) at: row)
				  at:
					  ((((NeoJSONReader fromString: resultAsJSON) at: #head) at:
						    #vars) at: column)
				  at: #value ]
]
