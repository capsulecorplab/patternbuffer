Extension { #name : 'OrderedDictionaryTest' }

{ #category : '*PatternBuffer-Tests' }
OrderedDictionaryTest >> testInspectionTreeTable [

	| orderedDict |
	orderedDict := OrderedDictionary newFrom: {
			               ('dec' -> 42).
			               ('hex' -> '2a').
			               ('char' -> '*') }.

	self
		assert: (orderedDict inspectionTreeTable: SpPresenter new) class
		equals: SpTreeTablePresenter
]
