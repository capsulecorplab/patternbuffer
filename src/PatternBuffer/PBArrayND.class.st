"
I represent a matrix or an n-dimensional array. I provide methods for creating matrices, inspecting the result as a table, and accessing elements of a matrix by column name, row number, or column number.

## Example

Evaluate and inspect the following to render a table view of the ASCII table.

```lang=pharo
| decArray hexArray charArray dictArray columnNames rows columns cellValue |

decArray := #( 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
                21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38
                39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56
                57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74
                75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92
                93 94 95 96 97 98 99 100 101 102 103 104 105 106 107
                108 109 110 111 112 113 114 115 116 117 118 119 120
                121 122 123 124 125 126 127 ).

hexArray := #( '00' '01' '02' '03' '04' '05' '06' '07' '08' '09' '0a'
                '0b' '0c' '0d' '0e' '0f' '10' '11' '12' '13' '14' '15'
                '16' '17' '18' '19' '1a' '1b' '1c' '1d' '1e' '1f' '20'
                '21' '22' '23' '24' '25' '26' '27' '28' '29' '2a' '2b'
                '2c' '2d' '2e' '2f' '30' '31' '32' '33' '34' '35' '36'
                '37' '38' '39' '3a' '3b' '3c' '3d' '3e' '3f' '40' '41'
                '42' '43' '44' '45' '46' '47' '48' '49' '4a' '4b' '4c'
                '4d' '4e' '4f' '50' '51' '52' '53' '54' '55' '56' '57'
                '58' '59' '5a' '5b' '5c' '5d' '5e' '5f' '60' '61' '62'
                '63' '64' '65' '66' '67' '68' '69' '6a' '6b' '6c' '6d'
                '6e' '6f' '70' '71' '72' '73' '74' '75' '76' '77' '78'
                '79' '7a' '7b' '7c' '7d' '7e' '7f' ).

charArray := #( 'NUL' 'SOH' 'STX' 'ETX' 'EOT' 'ENQ' 'ACK' 'BEL' 'BS'
                 'TAB' 'LF' 'VT' 'FF' 'CR' 'SO' 'SI' 'DLE' 'DC1' 'DC2'
                 'DC3' 'DC4' 'NAK' 'SYN' 'ETB' 'CAN' 'EM' 'SUB' 'ESC'
                 'FS' 'GS' 'RS' 'US' ' ' '!' '""' '#' '$' '%' '&' ''''
                 '(' ')' '*' '+' ',' '-' '.' '/' '0' '1' '2' '3' '4'
                 '5' '6' '7' '8' '9' ':' ';' '<' '=' '>' '?' '@' 'A'
                 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N'
                 'O' 'P' 'Q' 'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z' '['
                 '\' ']' '^' '_' '`' 'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h'
                 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u'
                 'v' 'w' 'x' 'y' 'z' '{' '|' '}' '~' 'δ' ).

dictArray := OrderedDictionary newFrom: {
		              ('dec' -> decArray).
		              ('hex' -> hexArray).
		              ('char' -> charArray) }.

columnNames := dictArray keys.
rows := decArray size.
columns := columnNames size.

cellValue := [ :column :row |
              dictArray at: (dictArray keys at: column) at: row ].

PBArrayND new
	rows: rows
	columns: columns
	tabulate: cellValue
	columnNames: columnNames
```
"
Class {
	#name : 'PBArrayND',
	#superclass : 'CTArray2D',
	#instVars : [
		'columnNames'
	],
	#category : 'PatternBuffer',
	#package : 'PatternBuffer'
}

{ #category : 'accessing convenience' }
PBArrayND >> at: columnNameOrRowNumber [
	"access a column using its column name (string) or row number (positive integer)"

	columnNameOrRowNumber isString
		ifTrue: [ ^ self atColumnName: columnNameOrRowNumber ]
		ifFalse: [ ^ self atRow: columnNameOrRowNumber ]
]

{ #category : 'accessing convenience' }
PBArrayND >> at: aColumnNameOrRowNumber at: aRowNumberOrColumnNumberOrColumnName [
	"conventiently access a cell in the matrix"

	aColumnNameOrRowNumber isString
		ifTrue: [
				aRowNumberOrColumnNumberOrColumnName isInteger
					ifTrue: [ "by column name (string) and row number (positive integer)"
							^ (self atColumnName: aColumnNameOrRowNumber) at:
								  aRowNumberOrColumnNumberOrColumnName ]
					ifFalse: [ self error: 'Expected positive integer' ] ]
		ifFalse: [
				aColumnNameOrRowNumber isInteger
					ifTrue: [
							aRowNumberOrColumnNumberOrColumnName isString
								ifTrue: [ "by row number (positive integer) and column name (string)"
										^ (self atColumnName: aRowNumberOrColumnNumberOrColumnName)
											  at: aColumnNameOrRowNumber ]
								ifFalse: [
										aRowNumberOrColumnNumberOrColumnName isInteger
											ifTrue: [ "by row number (positive integer) and column number (positive integer)"
													^ (self at: aColumnNameOrRowNumber) at:
														  aRowNumberOrColumnNumberOrColumnName ]
											ifFalse: [
											self error: 'Expected string or positive integer' ] ] ]
					ifFalse: [ self error: 'Expected string or positive integer' ] ]
]

{ #category : 'accessing convenience' }
PBArrayND >> atColumn: aColumnNameOrNumber [
	"access a column using its column name (string) or column number (positive integer)"

	aColumnNameOrNumber isString
		ifTrue: [ ^ self atColumn: (columnNames indexOf: aColumnNameOrNumber) ]
		ifFalse: [ ^ super atColumn: aColumnNameOrNumber ]
]

{ #category : 'accessing convenience' }
PBArrayND >> atColumnName: columnName [
	"access a column using its column name (string)"

	columnName isString ifTrue: [ ^ self atColumn: (columnNames indexOf: columnName) ]
]

{ #category : 'accessing rows/columns' }
PBArrayND >> atRow: aRowNumber [

	| a orderedDict |
	a := super atRow: aRowNumber.
	a size > 1
		ifTrue: [
				orderedDict := PBOrderedDictionary new.
				columnNames do: [ :columnName |
						orderedDict
							at: columnName
							put: ((self atColumnName: columnName) at: aRowNumber) ].
				^ orderedDict ]
		ifFalse: [ ^ a ]
]

{ #category : 'accessing' }
PBArrayND >> columnNames [

	^ columnNames
]

{ #category : 'inspector extensions' }
PBArrayND >> inspectionTable: specBuilder [

	<inspectorPresentationOrder: 10 title: 'Table'>
	| specTable |
	specTable := specBuilder newTable.
	specTable beResizable addColumn: (SpIndexTableColumn new
			 title: '#';
			 width: 30;
			 yourself).
	"beResizable;"

	1 to: width do: [ :index |
			specTable addColumn: (SpStringTableColumn new
					 title: (self columnNames at: index);
					 evaluated: [ :each | each at: index ];
					 beExpandable) ].

	specTable items:
		((1 to: self height) collect: [ :index | self atRow: index ]).
	^ specTable
]

{ #category : 'accessing convenience' }
PBArrayND >> items [
	"access contents as an array of PBOrderedDictionary objects"

	| a |
	a := OrderedCollection new.
	1 to: self height do: [ :row |
			| orderedDict |
			orderedDict := PBOrderedDictionary new.
			columnNames do: [ :columnName | orderedDict at: columnName put: ((self atColumnName: columnName) at: row) ].
			a add: orderedDict ].
	^ a asArray
]

{ #category : 'printing' }
PBArrayND >> printOn: aStream [

	aStream nextPutAll: '('.
	(1 to: self height)
		do: [ :r |
				(self atRow: r)
					do: [ :each | aStream print: each ]
					separatedBy: [ aStream space ] ]
		separatedBy: [ aStream cr ].
	aStream nextPutAll: ' )'
]

{ #category : 'setter' }
PBArrayND >> rows: aNumberOfRows columns: aNumberOfColumns tabulate: aTwoArgumentBlock columnNames: anArrayOfColumnNames [
	"Set contents to a new matrix of the given dimensions
	 whereby an element of the matrix is evaluated from aTwoArgumentBlock value: aColumnNumber value: aRowNumber"

	| a |
	columnNames := anArrayOfColumnNames.

	a := self class
		     width: aNumberOfColumns
		     height: aNumberOfRows
		     tabulate: aTwoArgumentBlock.

	[ aNumberOfRows isInteger and: [ aNumberOfRows >= 0 ] ] assert.
	[ aNumberOfColumns isInteger and: [ aNumberOfColumns >= 0 ] ] assert.
	[ aNumberOfRows * aNumberOfColumns = a size ] assert.
	contents := a contents.
	width := a width.
	^ self
]
