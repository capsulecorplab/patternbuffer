Class {
	#name : #ComponentsListItemTests,
	#superclass : #TestCase,
	#category : #'PatternBuffer-Tests'
}

{ #category : #tests }
ComponentsListItemTests >> testHasDescription [
	| replicator |
	replicator := ComponentListItem new
		description: 'mid 24th century replicator'.
	self
		assert: replicator description
		equals: 'mid 24th century replicator'
]
