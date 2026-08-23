Class {
	#name : 'PBArrayNDTest',
	#superclass : 'TestCase',
	#instVars : [
		'ndArray'
	],
	#category : 'PatternBuffer-Tests',
	#package : 'PatternBuffer-Tests'
}

{ #category : 'accessing' }
PBArrayNDTest >> asciiDict [
	"Ordered dictionary of ASCII table decimals, hexadecimals, and characters"

	^ OrderedDictionary newFrom: {
			  ('dec' -> self decArray).
			  ('hex' -> self hexArray).
			  ('char' -> self charArray) }
]

{ #category : 'accessing' }
PBArrayNDTest >> charArray [
	"Literal array of ASCII table characters"

	^ #( 'NUL' 'SOH' 'STX' 'ETX' 'EOT' 'ENQ' 'ACK' 'BEL' 'BS' 'TAB' 'LF'
	     'VT' 'FF' 'CR' 'SO' 'SI' 'DLE' 'DC1' 'DC2' 'DC3' 'DC4' 'NAK'
	     'SYN' 'ETB' 'CAN' 'EM' 'SUB' 'ESC' 'FS' 'GS' 'RS' 'US' ' ' '!'
	     '"' '#' '$' '%' '&' '''' '(' ')' '*' '+' ',' '-' '.' '/' '0' '1'
	     '2' '3' '4' '5' '6' '7' '8' '9' ':' ';' '<' '=' '>' '?' '@' 'A'
	     'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N' 'O' 'P' 'Q'
	     'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z' '[' '\' ']' '^' '_' '`' 'a'
	     'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q'
	     'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z' '{' '|' '}' '~' 'δ' )
]

{ #category : 'accessing' }
PBArrayNDTest >> decArray [
	"Literal array of ASCII table decimals"

	^ #( 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
	     25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
	     46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66
	     67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87
	     88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106
	     107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122
	     123 124 125 126 127 )
]

{ #category : 'accessing' }
PBArrayNDTest >> hexArray [
	"Literal array of ASCII table hexadecimals"

	^ #( '00' '01' '02' '03' '04' '05' '06' '07' '08' '09' '0a' '0b' '0c'
   '0d' '0e' '0f' '10' '11' '12' '13' '14' '15' '16' '17' '18' '19'
   '1a' '1b' '1c' '1d' '1e' '1f' '20' '21' '22' '23' '24' '25' '26'
   '27' '28' '29' '2a' '2b' '2c' '2d' '2e' '2f' '30' '31' '32' '33'
   '34' '35' '36' '37' '38' '39' '3a' '3b' '3c' '3d' '3e' '3f' '40'
   '41' '42' '43' '44' '45' '46' '47' '48' '49' '4a' '4b' '4c' '4d'
   '4e' '4f' '50' '51' '52' '53' '54' '55' '56' '57' '58' '59' '5a'
   '5b' '5c' '5d' '5e' '5f' '60' '61' '62' '63' '64' '65' '66' '67'
   '68' '69' '6a' '6b' '6c' '6d' '6e' '6f' '70' '71' '72' '73' '74'
   '75' '76' '77' '78' '79' '7a' '7b' '7c' '7d' '7e' '7f' )
]

{ #category : 'running' }
PBArrayNDTest >> setUp [
	"Setup ASCII table as PBArrayND object"

	| columnNames rows columns cellValue |
	super setUp.

	columnNames := self asciiDict keys.
	rows := self decArray size.
	columns := columnNames size.

	cellValue := [ :column :row |
	             self asciiDict
		             at: (self asciiDict keys at: column)
		             at: row ].

	ndArray := PBArrayND new
		           rows: rows
		           columns: columns
		           tabulate: cellValue
		           columnNames: columnNames
]

{ #category : 'tests' }
PBArrayNDTest >> testAt [
	"Test that PBArrayND>>at: returns either a column for a column name (string) or a row for a row number (positive integer)"

	self assert: ((ndArray at: 'dec') at: 43) equals: 42.
	self assert: ((ndArray at: 'hex') at: 43) equals: '2a'.
	self assert: ((ndArray at: 'char') at: 43) equals: '*'.
	self assert: (ndArray at: 43) first equals: 42.
	self assert: ((ndArray at: 43) at: 2) equals: '2a'.
	self assert: ((ndArray at: 43) at: 3) equals: '*'
]

{ #category : 'tests' }
PBArrayNDTest >> testAtAt [
	"Test that PBArrayND>>at:at: returns expected value"

	"by column name (string) and row number (positive integer)"

	self assert: (ndArray at: 'dec' at: 43) equals: 42.
	self assert: (ndArray at: 'hex' at: 43) equals: '2a'.
	self assert: (ndArray at: 'char' at: 43) equals: '*'.

	"by row number (positive integer) and column number"

	self assert: (ndArray at: 43 at: 1) equals: 42.
	self assert: (ndArray at: 43 at: 2) equals: '2a'.
	self assert: (ndArray at: 43 at: 3) equals: '*'.

	"by row number (positive integer) and column number"

	self assert: (ndArray at: 43 at: 'dec') equals: 42.
	self assert: (ndArray at: 43 at: 'hex') equals: '2a'.
	self assert: (ndArray at: 43 at: 'char') equals: '*'
]

{ #category : 'tests' }
PBArrayNDTest >> testAtColumn [
	"Test that PBArrayND>>atColumn: returns either a column for a column name (string) or a column for a column number (positive integer)"

	self assert: ((ndArray atColumn: 'dec') at: 43) equals: 42.
	self assert: ((ndArray atColumn: 'hex') at: 43) equals: '2a'.
	self assert: ((ndArray atColumn: 'char') at: 43) equals: '*'.
	self assert: ((ndArray atColumn: 1) at: 43) equals: 42.
	self assert: ((ndArray atColumn: 2) at: 43) equals: '2a'.
	self assert: ((ndArray atColumn: 3) at: 43) equals: '*'
]

{ #category : 'tests' }
PBArrayNDTest >> testAtColumnName [
	"Test that PBArrayND>>atColumn: returns either a column for a column name (string) or a column for a column number (positive integer)"

	self assert: ((ndArray atColumnName: 'dec') at: 43) equals: 42.
	self assert: ((ndArray atColumnName: 'hex') at: 43) equals: '2a'.
	self assert: ((ndArray atColumnName: 'char') at: 43) equals: '*'
]

{ #category : 'tests' }
PBArrayNDTest >> testAtRow [

	self assert: (ndArray atRow: 43) first equals: 42.
	self assert: ((ndArray atRow: 43) at: 2) equals: '2a'.
	self assert: ((ndArray atRow: 43) at: 3) equals: '*'
]

{ #category : 'tests' }
PBArrayNDTest >> testColumnNames [

	self assert: ndArray columnNames first equals: 'dec'.
	self assert: (ndArray columnNames at: 2) equals: 'hex'.
	self assert: ndArray columnNames last equals: 'char'
]

{ #category : 'tests' }
PBArrayNDTest >> testInspectionTable [

	self
		assert: (ndArray inspectionTable: SpPresenter new) class
		equals: SpTablePresenter
]

{ #category : 'tests' }
PBArrayNDTest >> testItems [
	"Test that PBArrayND>>items returns an array of PBOrderedDictionaries"

	self assert: (ndArray items at: 43) first equals: 42.
	self assert: ((ndArray items at: 43) at: 2) equals: '2a'.
	self assert: ((ndArray items at: 43) at: 3) equals: '*'
]
