Extension { #name : 'OrderedDictionaryTest' }

{ #category : '*PatternBuffer-Tests' }
OrderedDictionaryTest >> testInspectionTree [

	| orderedDict |
	orderedDict := OrderedDictionary newFrom: {
			               ('dec' -> 42).
			               ('hex' -> '2a').
			               ('char' -> '*') }.

	self
		assert: (orderedDict inspectionTree: SpPresenter new) class
		equals: SpTreeTablePresenter
]
