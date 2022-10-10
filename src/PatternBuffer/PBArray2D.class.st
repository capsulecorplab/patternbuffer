"
I represent an Array2D object intended for rendering views from semantic data

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	columnName:		<Object>


    Implementation Points
"
Class {
	#name : #PBArray2D,
	#superclass : #Array2D,
	#instVars : [
		'columnNames'
	],
	#category : #PatternBuffer
}

{ #category : #accessing }
PBArray2D >> columnNames [

	^ columnNames
]

{ #category : #'*PatternBuffer' }
PBArray2D >> inspectorExtension [

	<inspectorPresentationOrder: 0 title: 'Matrix'>
	| specTable |
	specTable := SpTablePresenter new.
	specTable addColumn: (SpIndexTableColumn new
			 title: '#';
			 width: 30;
			 yourself).

	1 to: numberOfColumns do: [ :index | 
		specTable addColumn: (SpStringTableColumn new
				 title: (self columnNames at: index);
				 evaluated: [ :each | each at: index ];
				 beNotExpandable) ].

	specTable items:
		((1 to: numberOfRows) collect: [ :index | self atRow: index ]).
	^ specTable
]

{ #category : #'as yet unclassified' }
PBArray2D >> rows: rowNumber columns: columnNumber tabulate: aTwoArgumentBlock columnNames: anArrayOfColumnNames [

	"Answer a new Matrix of the given dimensions where
	 result at: i at: j is aTwoArgumentBlock value: i value: j"

	| a i |
	a := Array new: rowNumber * columnNumber.
	i := 0.
	1 to: rowNumber do: [ :row | 
		1 to: columnNumber do: [ :column | 
			a
				at: (i := i + 1)
				put: (aTwoArgumentBlock value: row value: column) ] ].

	columnNames := anArrayOfColumnNames.

	[ rowNumber isInteger and: [ rowNumber >= 0 ] ] assert.
	[ columnNumber isInteger and: [ columnNumber >= 0 ] ] assert.
	[ rowNumber * columnNumber = a size ] assert.
	numberOfRows := rowNumber.
	numberOfColumns := columnNumber.
	contents := a.
	^ self
]
