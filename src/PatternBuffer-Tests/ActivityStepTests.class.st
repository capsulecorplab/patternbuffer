Class {
	#name : #ActivityStepTests,
	#superclass : #TestCase,
	#category : #'PatternBuffer-Tests'
}

{ #category : #tests }
ActivityStepTests >> testHasDetails [
	| replicatetea |
	replicatetea := ActivityStep new
		details: 'request for `tea, earl grey, hot` from replicator'.
	self
		assert: replicatetea details
		equals: 'request for `tea, earl grey, hot` from replicator'
]

{ #category : #tests }
ActivityStepTests >> testHasRequiredParts [
	| replicatetea |
	replicatetea := ActivityStep new requiredParts: {'energy'}.
	self assert: (replicatetea requiredParts at: 1) equals: 'energy'
]

{ #category : #tests }
ActivityStepTests >> testHasRequiredTools [
	| replicatetea |
	replicatetea := ActivityStep new
		requiredTools: {'24th century replicator'}.
	self
		assert: (replicatetea requiredTools at: 1)
		equals: '24th century replicator'
]

{ #category : #tests }
ActivityStepTests >> testHasSummary [
	| replicatetea |
	replicatetea := ActivityStep new
		summary: 'request order from replicator'.
	self
		assert: replicatetea summary
		equals: 'request order from replicator'
]
