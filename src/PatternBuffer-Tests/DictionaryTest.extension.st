Extension { #name : 'DictionaryTest' }

{ #category : '*PatternBuffer-Tests' }
DictionaryTest >> testInspectionTree [

	| dict |
	dict := Dictionary newFrom: {
			        ('dec' -> 42).
			        ('hex' -> '2a').
			        ('char' -> '*') }.

	self
		assert: (dict inspectionTree: SpPresenter new) class
		equals: SpTreeTablePresenter
]
