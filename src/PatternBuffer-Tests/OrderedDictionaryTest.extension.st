Extension { #name : 'OrderedDictionaryTest' }

{ #category : '*PatternBuffer-Tests' }
OrderedDictionaryTest >> testInspectionItems [

	| orderedDict |
	orderedDict := OrderedDictionary newFrom: {
			               ('dec' -> 42).
			               ('hex' -> '2a').
			               ('char' -> '*') }.

	self
		assert: (orderedDict inspectionItems: SpPresenter new) class
		equals: SpTreeTablePresenter
]
