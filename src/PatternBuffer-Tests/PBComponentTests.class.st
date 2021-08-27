Class {
	#name : #PBComponentTests,
	#superclass : #TestCase,
	#category : #'PatternBuffer-Tests'
}

{ #category : #tests }
PBComponentTests >> testHasADescription [
	| ncc1701 |
	ncc1701 := PBComponent new description: 'Federation starship, designed for five-year missions in deep space'.
	self assert: ncc1701 description equals: 'Federation starship, designed for five-year missions in deep space'
]

{ #category : #tests }
PBComponentTests >> testHasALicense [
	"License as per https://memory-alpha.fandom.com/wiki/USS_Enterprise_(NCC-1701)"

	| ncc1701 |
	ncc1701 := PBComponent new license: 'CC-BY-NC'.
	self assert: ncc1701 license equals: 'CC-BY-NC'
]

{ #category : #tests }
PBComponentTests >> testHasAName [
	| ncc1701 |
	ncc1701 := PBComponent new name: 'Constitution class starship'.
	self assert: ncc1701 name equals: 'Constitution class starship'
]

{ #category : #tests }
PBComponentTests >> testHasAVersion [
	| constitutionclassrefit |
	constitutionclassrefit := PBComponent new version: '1.1.0'.
	self assert: constitutionclassrefit version equals: '1.1.0'
]

{ #category : #tests }
PBComponentTests >> testHasAnAuthor [
	"Author as per https://memory-alpha.fandom.com/wiki/USS_Enterprise_(NCC-1701)#Background_information"

	| ncc1701 |
	ncc1701 := PBComponent new author: 'Matt Jefferies'.
	self assert: ncc1701 author equals: 'Matt Jefferies'
]

{ #category : #tests }
PBComponentTests >> testHasAssemblySteps [
	| hotearlgreytea |
	hotearlgreytea := PBComponent new
		name: 'hot earl grey tea';
		assemblySteps:
			{(PBActivityStep new
				summary: 'request order from replicator';
				requiredParts: {'energy'};
				requiredTools: '24th century replicator';
				details: 'request for `tea, earl grey, hot` from replicator')}.
	self
		assert: (hotearlgreytea assemblyStep at: 1) summary
		equals: 'request order from replicator'
]

{ #category : #tests }
PBComponentTests >> testHasComponents [
	| ncc1701 |
	ncc1701 := PBComponent new
		components:
			(Dictionary
				newFrom: {('warp nacelle' -> (PBComponent new name: 'warp nacelle'))}).
	self
		assert: (ncc1701 components at: 'warp nacelle') name
		equals: 'warp nacelle'
]

{ #category : #tests }
PBComponentTests >> testHasDependencies [

	| ncc1701A |
	ncc1701A := PBComponent new dependencies: (Dictionary newFrom: { 'constitutionclassrefit' -> '1.1.0' }).
	self assert: (ncc1701A dependencies at: 'constitutionclassrefit') equals: '1.1.0'
]

{ #category : #tests }
PBComponentTests >> testHasParts [
	| starship |
	starship := PBComponent new
		name: 'J-type 327 Nubian starship';
		components:
			(Dictionary
				newFrom:
					{('hyperdrive'
						-> (PBComponentListItem new description: 'T-14 hyperdrive generator'))}).
	self
		assert: (starship components at: 'hyperdrive') description
		equals: 'T-14 hyperdrive generator'
]

{ #category : #tests }
PBComponentTests >> testHasPrecautions [
	| hotearlgreytea |
	hotearlgreytea := PBComponent new
		name: 'tea, earl grey, hot';
		precautions: {'Warning: Tea is hot'}.
	self
		assert: (hotearlgreytea precautions at: 1)
		equals: 'Warning: Tea is hot'
]

{ #category : #tests }
PBComponentTests >> testHasTools [
	| hotearlgreytea |
	hotearlgreytea := PBComponent new
		name: 'tea, earl grey, hot';
		tools:
			(Dictionary
				newFrom:
					{('replicator'
						-> (PBComponentListItem new description: 'mid 24th century replicator'))}).
	self
		assert: (hotearlgreytea tools at: 'replicator') description
		equals: 'mid 24th century replicator'
]
