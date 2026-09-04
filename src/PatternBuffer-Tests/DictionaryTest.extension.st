Extension { #name : 'DictionaryTest' }

{ #category : '*PatternBuffer-Tests' }
DictionaryTest >> testInspectionTreeTable [

	| dict |
	dict := Dictionary newFrom: {
			        ('dec' -> 42).
			        ('hex' -> '2a').
			        ('char' -> '*') }.

	self
		assert: (dict inspectionTreeTable: SpPresenter new) class
		equals: SpTreeTablePresenter
]
