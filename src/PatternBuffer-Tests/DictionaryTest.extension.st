Extension { #name : 'DictionaryTest' }

{ #category : '*PatternBuffer-Tests' }
DictionaryTest >> testInspectionItems [

	| dict |
	dict := Dictionary newFrom: {
			        ('dec' -> 42).
			        ('hex' -> '2a').
			        ('char' -> '*') }.

	self
		assert: (dict inspectionItems: SpPresenter new) class
		equals: SpTreeTablePresenter
]
