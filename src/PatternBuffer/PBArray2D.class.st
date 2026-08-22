"
I represent a matrix or a two-dimensional array. I provide methods for creating matrices and inspecting them as a table.

## Example

Evaluate and inspect the following to render a table view of the ASCII table.

```lang=pharo
| dec_array hex_array char_array ascii_dict columnNames rows columns cell_value |

dec_array := #( 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
                21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38
                39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56
                57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74
                75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92
                93 94 95 96 97 98 99 100 101 102 103 104 105 106 107
                108 109 110 111 112 113 114 115 116 117 118 119 120
                121 122 123 124 125 126 127 ).

hex_array := #( '00' '01' '02' '03' '04' '05' '06' '07' '08' '09' '0a'
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

char_array := #( 'NUL' 'SOH' 'STX' 'ETX' 'EOT' 'ENQ' 'ACK' 'BEL' 'BS'
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

ascii_dict := OrderedDictionary newFrom: {
		              ('dec' -> dec_array).
		              ('hex' -> hex_array).
		              ('char' -> char_array) }.

columnNames := ascii_dict keys.
rows := dec_array size.
columns := columnNames size.

cell_value := [ :row :column |
              ascii_dict at: (ascii_dict keys at: column) at: row ].

PBArray2D new
	rows: rows
	columns: columns
	tabulate: cell_value
	columnNames: columnNames
```
"
Class {
	#name : 'PBArray2D',
	#superclass : 'CTArray2D',
	#instVars : [
		'columnNames',
		'numberOfColumns',
		'numberOfRows'
	],
	#category : 'PatternBuffer',
	#package : 'PatternBuffer'
}

{ #category : 'testing' }
PBArray2D class >> isDeprecated [

	^ true
]

{ #category : 'row/column operations' }
PBArray2D >> atRow: rowNumber [

	(rowNumber between: 1 and: numberOfRows) ifFalse: [
		self error: '1st subscript out of range' ].
	^ contents
		  copyFrom: rowNumber - 1 * numberOfColumns + 1
		  to: rowNumber * numberOfColumns
]

{ #category : 'accessing' }
PBArray2D >> columnNames [

	^ columnNames
]

{ #category : 'inspector extensions' }
PBArray2D >> inspectionTable: specBuilder [

	<inspectorPresentationOrder: 10 title: 'Table'>
	| specTable |
	specTable := specBuilder newTable.
	specTable beResizable addColumn: (SpIndexTableColumn new
			 title: '#';
			 width: 30;
			 yourself).
	"beResizable;"

	1 to: numberOfColumns do: [ :index |
		specTable addColumn: (SpStringTableColumn new
				 title: (self columnNames at: index);
				 evaluated: [ :each | each at: index ];
				 beExpandable) ].

	specTable items:
		((1 to: numberOfRows) collect: [ :index | self atRow: index ]).
	^ specTable
]

{ #category : 'accessing - compatibility' }
PBArray2D >> numberOfRows [

	^ numberOfRows
]

{ #category : 'printing' }
PBArray2D >> printOn: aStream [

	aStream nextPutAll: '('.
	(1 to: self numberOfRows)
		do: [ :r |
			(self atRow: r)
				do: [ :each | aStream print: each ]
				separatedBy: [ aStream space ] ]
		separatedBy: [ aStream cr ].
	aStream nextPutAll: ' )'
]

{ #category : 'setter' }
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
