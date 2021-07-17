Class {
	#name : #ComponentTests,
	#superclass : #TestCase,
	#category : #'PatternBuffer-Tests'
}

{ #category : #tests }
ComponentTests >> testHasADescription [
	| ncc1701 |
	ncc1701 := Component new description: 'Federation starship, designed for five-year missions in deep space'.
	self assert: ncc1701 description equals: 'Federation starship, designed for five-year missions in deep space'
]

{ #category : #tests }
ComponentTests >> testHasALicense [
	"License as per https://memory-alpha.fandom.com/wiki/USS_Enterprise_(NCC-1701)"

	| ncc1701 |
	ncc1701 := Component new license: 'CC-BY-NC'.
	self assert: ncc1701 license equals: 'CC-BY-NC'
]

{ #category : #tests }
ComponentTests >> testHasAName [
	| ncc1701 |
	ncc1701 := Component new name: 'USS Enterprise'.
	self assert: ncc1701 name equals: 'USS Enterprise'
]

{ #category : #tests }
ComponentTests >> testHasAVersion [
	| ncc1701 |
	ncc1701 := Component new version: 'constitution-class'.
	self assert: ncc1701 version equals: 'constitution-class'
]

{ #category : #tests }
ComponentTests >> testHasAnAuthor [
	"Author as per https://memory-alpha.fandom.com/wiki/USS_Enterprise_(NCC-1701)#Background_information"

	| ncc1701 |
	ncc1701 := Component new author: 'Matt Jefferies'.
	self assert: ncc1701 author equals: 'Matt Jefferies'
]

{ #category : #tests }
ComponentTests >> testHasAssemblySteps [
	| hotearlgreytea |
	hotearlgreytea := Component new
		name: 'hot earl grey tea';
		assemblySteps:
			{(ActivityStep new
				summary: 'request order from replicator';
				requiredParts: {'energy'};
				requiredTools: '24th century replicator';
				details: 'request for `tea, earl grey, hot` from replicator')}.
	self
		assert: (hotearlgreytea assemblyStep at: 1) summary
		equals: 'request order from replicator'
]

{ #category : #tests }
ComponentTests >> testHasComponents [
	| ncc1701 |
	ncc1701 := Component new
		components:
			(Dictionary
				newFrom: {('warp nacelle' -> (Component new name: 'warp nacelle'))}).
	self
		assert: (ncc1701 components at: 'warp nacelle') name
		equals: 'warp nacelle'
]

{ #category : #tests }
ComponentTests >> testHasDependencies [
	"Author as per https://memory-alpha.fandom.com/wiki/USS_Enterprise_(NCC-1701)#Background_information"

	| ncc1701A |
	ncc1701A := Component new dependencies: (Dictionary newFrom: { 'refit' -> '1701-A' }).
	self assert: (ncc1701A dependencies at: 'refit') equals: '1701-A'
]

{ #category : #tests }
ComponentTests >> testHasParts [
	| starship |
	starship := Component new
		name: 'J-type 327 Nubian starship';
		components:
			(Dictionary
				newFrom:
					{('hyperdrive'
						-> (ComponentListItem new description: 'T-14 hyperdrive generator'))}).
	self
		assert: (starship components at: 'hyperdrive') description
		equals: 'T-14 hyperdrive generator'
]

{ #category : #tests }
ComponentTests >> testHasPrecautions [
	| hotearlgreytea |
	hotearlgreytea := Component new
		name: 'tea, earl grey, hot';
		precautions: {'Warning: Tea is hot'}.
	self
		assert: (hotearlgreytea precautions at: 1)
		equals: 'Warning: Tea is hot'
]

{ #category : #tests }
ComponentTests >> testHasTools [
	| hotearlgreytea |
	hotearlgreytea := Component new
		name: 'tea, earl grey, hot';
		tools:
			(Dictionary
				newFrom:
					{('replicator'
						-> (ComponentListItem new description: 'mid 24th century replicator'))}).
	self
		assert: (hotearlgreytea tools at: 'replicator') description
		equals: 'mid 24th century replicator'
]
