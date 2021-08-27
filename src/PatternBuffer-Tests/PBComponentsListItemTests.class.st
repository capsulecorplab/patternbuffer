Class {
	#name : #PBComponentsListItemTests,
	#superclass : #TestCase,
	#category : #'PatternBuffer-Tests'
}

{ #category : #tests }
PBComponentsListItemTests >> testHasDescription [
	| replicator |
	replicator := PBComponentListItem new
		description: 'mid 24th century replicator'.
	self
		assert: replicator description
		equals: 'mid 24th century replicator'
]
