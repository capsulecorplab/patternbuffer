Class {
	#name : #PBActivityStepTests,
	#superclass : #TestCase,
	#category : #'PatternBuffer-Tests'
}

{ #category : #tests }
PBActivityStepTests >> testHasDetails [
	| replicatetea |
	replicatetea := PBActivityStep new
		details: 'request for `tea, earl grey, hot` from replicator'.
	self
		assert: replicatetea details
		equals: 'request for `tea, earl grey, hot` from replicator'
]

{ #category : #tests }
PBActivityStepTests >> testHasRequiredParts [
	| replicatetea |
	replicatetea := PBActivityStep new requiredParts: {'energy'}.
	self assert: (replicatetea requiredParts at: 1) equals: 'energy'
]

{ #category : #tests }
PBActivityStepTests >> testHasRequiredTools [
	| replicatetea |
	replicatetea := PBActivityStep new
		requiredTools: {'24th century replicator'}.
	self
		assert: (replicatetea requiredTools at: 1)
		equals: '24th century replicator'
]

{ #category : #tests }
PBActivityStepTests >> testHasSummary [
	| replicatetea |
	replicatetea := PBActivityStep new
		summary: 'request order from replicator'.
	self
		assert: replicatetea summary
		equals: 'request order from replicator'
]
