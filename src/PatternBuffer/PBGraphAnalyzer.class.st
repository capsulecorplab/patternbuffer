"
I represent a class for visualizing graphs in Roassal3.
	
I am responsible for generating an expoitable graph visualization of model elements and relations.

Example Usage

```smalltalk
g := PBGraphAnalyzer new.
g elements: Collection withAllSubclasses.
g relation: [ :cls | cls dependentClasses ].
g scale: #numberOfMethods.
g build
```

"
Class {
	#name : #PBGraphAnalyzer,
	#superclass : #Object,
	#instVars : [
		'canvas',
		'layout',
		'elements'
	],
	#category : #PatternBuffer
}

{ #category : #initialization }
PBGraphAnalyzer >> build [

	layout on: elements.
	^ canvas
]

{ #category : #initialization }
PBGraphAnalyzer >> elements: aCollectionOfElements [

	"adds a collection of elements as an RSGroup to canvas"

	elements := aCollectionOfElements
		            collect: [ :m | 
			            RSEllipse new
				            size: 10;
				            model: m ]
		            as: RSGroup.

	canvas addAll: elements.

	"Make each element have a popup text and allow it to be dragged"
	elements @ RSPopup.
	elements @ RSDraggable.
	elements @ (RSLabeled new fontSize: 2)
]

{ #category : #initialization }
PBGraphAnalyzer >> initialize [

	super initialize.
	canvas := RSCanvas new.
	canvas @ RSCanvasController.
	layout := RSForceBasedLayout new charge: -200
]

{ #category : #initialization }
PBGraphAnalyzer >> layout: aLayout [

	"option to set layout"

	layout := aLayout
]

{ #category : #initialization }
PBGraphAnalyzer >> relation: aBlockOrSymbol [

	"creates edges between nodes in canvas from a block or symbol representing their relation"

	| eb |
	eb := RSLineBuilder line.
	eb moveBehind.
	eb shape color: Color gray.
	eb withBorderAttachPoint.
	eb canvas: canvas.
	eb connectToAll: aBlockOrSymbol.

	canvas edges do: #withBorder.
	canvas edges @ RSHighlightable red.
	canvas nodes @ RSHighlightable red withOutgoingEdges
]

{ #category : #initialization }
PBGraphAnalyzer >> scale: aBlockOrSymbol [

	"option to set scale"

	RSNormalizer size
		shapes: elements;
		from: 8;
		to: 25;
		normalize: aBlockOrSymbol
]
