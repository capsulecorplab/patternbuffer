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
		'data',
		'rdfdata'
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

	data := aStringOrFileReference asFileReference contents
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

	"create rdf object"

	rdfdata := PBRDF new.
	rdfdata fromString: data.
	rdfdata datastore isNotNil
		ifTrue: [ 
			result := PBRDFLib new
				          datastore: rdfdata datastore
				          query: aSPARQLString ]
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
PBSPARQL >> resultAsGraph [

	"Executes and returns query as a Roassal graph of nodes and directed labeled edges"

	| resultAsSet edgesModel sources targets nodesModel graph inverseGraph edgeLabels relationsCount canvas nodes lb highlightable rsfbl resultAsArrayOfTriples |
	"convert result into a set"
	resultAsSet := Set new.
	self resultAsTable asArray do: [ :item | 
		item isNotNil ifTrue: [ resultAsSet add: item ] ].


	"use resultAsSet to filter rdf data for elements contained only in result"
	resultAsArrayOfTriples := rdfdata asArrayOfTriples collect: [ :triple | 
		                          triple isNotNil
		                          & (resultAsSet includes: (triple at: 1))
			                          ifTrue: [ triple ]
			                          ifFalse: [ 
			                          (resultAsSet includes: (triple at: 3)) 
				                          ifTrue: [ triple ] ] ].

	"use filtered triplestore as edgesModel"
	edgesModel := resultAsArrayOfTriples select: [ :item | item isNotNil ].

	sources := edgesModel collect: [ :triple | triple at: 1 ].
	targets := edgesModel collect: [ :triple | triple at: 3 ].

	"combine source and target into a set to create nodes model"
	nodesModel := Set new.
	sources do: [ :source | nodesModel add: source ].
	targets do: [ :target | nodesModel add: target ].
	nodesModel := nodesModel asArray.

	"dictionary of sources (keys) to targets (values)"
	graph := Dictionary new.

	"dictionary of targets (keys) to their sources (values)"
	inverseGraph := Dictionary new.

	edgeLabels := Dictionary new.

	"add nodesModel to graph and inverseGraph"
	nodesModel do: [ :aNode | 
		graph at: aNode put: Set new.
		inverseGraph at: aNode put: Set new ].

	"create key-value pairs for graph and inverseGraph from edgesModel"
	edgesModel do: [ :edge | 
		| fromNode toNode |
		fromNode := edge first.
		toNode := edge third.
		(graph at: fromNode) add: toNode.
		(inverseGraph at: toNode) add: fromNode ].

	"create edgeLabels from edgesModel"
	edgesModel do: [ :edge | 
		| fromNode toNode label |
		fromNode := edge first.
		toNode := edge third.
		label := edge second.
		edgeLabels at: fromNode at: toNode put: label ].

	"create relation count dictionary for setting RSForceBasedLayout charge from nodesModel, graph, and inversGraph"
	relationsCount := Dictionary new.
	nodesModel do: [ :node | 
		relationsCount
			at: node
			put: (graph at: node) size + (inverseGraph at: node) size ].

	canvas := RSCanvas new.
	nodes := RSCircle models: nodesModel forEach: [ :circle :model | 
		         circle
			         size: 10;
			         color: Color veryLightGray ].

	nodes
		@ RSDraggable;
		@ RSPopup;
		@ (RSLabeled new fontSize: 10).

	canvas addAll: nodes.

	lb := RSLineBuilder line.
	lb canvas: canvas.
	lb makeBidirectional.
	lb moveBehind.
	lb objects: nodesModel.
	lb connectToAll: [ :aNumber | graph at: aNumber ].
	canvas lines do: [ :line | 
		| edge label |
		edge := edgesModel detect: [ :e | 
			        e first = line model key and: [ e third = line model value ] ].

		"add line labels"
		label := RSLabel new text: (edgeLabels
				          at: line from model value
				          at: line to model value
				          ifAbsent: [ 0 ]).
		canvas add: label.

		"adjust line label position in the event in its length is extended"
		line when: RSExtentChangedEvent do: [ :evt | 
			label position: line startPoint + line endPoint / 2.0.
			label signalUpdate ].

		line attachPoint: (RSBorderAttachPoint new endOffset: 5).
		line markerEnd: (RSShapeFactory arrow size: 10) ].

	"how do i also highlight edgeLabels??"
	highlightable := RSHighlightable new.
	highlightable highlightColor: Color red.
	highlightable withEdges.
	"highlightable withConnectedShapes."
	canvas nodes @ highlightable. ", (canvas shapes select: [ :element | ('*RSLabel*' match: element className) ])"

	"RSForceBasedLayout new charge: -10000; ""doNotUseProgressBar;"" on: nodes."
	"nodes do: [:rsnode | Transcript show: (relationsCount at: rsnode model). Transcript cr]."

	"nodes do: [:rsnode | |g| g := RSGroup new. g add: rsnode. RSForceBasedLayout new charge: -10000 * (relationsCount at: rsnode model); ""doNotUseProgressBar;"" on: g]."

	rsfbl := RSForceBasedLayout new
		         charge: -10000;
		         "doNotUseProgressBar;"on: nodes.

	canvas @ RSCanvasController.
	^ canvas
]

{ #category : #'as yet unclassified' }
PBSPARQL >> resultAsJSON [

	"returns query as JSON"

	^ result
]

{ #category : #'as yet unclassified' }
PBSPARQL >> resultAsTable [

	"Executes and returns query as Array2D object"

	| resultAsJSON parsedJSON bindings vars rowSize colSize formattedValue |
	resultAsJSON := self result contents.
	parsedJSON := NeoJSONReader fromString: resultAsJSON.
	bindings := (parsedJSON at: #results) at: #bindings.
	vars := (parsedJSON at: #head) at: #vars.
	rowSize := bindings size.
	colSize := vars size.
	formattedValue := [ :input | 
	                  [ (input asString splitOn: '#') at: 2 ]
		                  on: Error
		                  do: [ input asString ] ].

	^ PBArray2D new
		  rows: rowSize
		  columns: colSize
		  tabulate: [ :row :column | 
			  | value index |
			  value := bindings at: row.
			  formattedValue value: value.
			  index := vars at: column.
			  formattedValue value: ([ value at: index at: #value ]
					   on: KeyNotFound
					   do: [ '' ]) ]
		  columnNames: vars
]
