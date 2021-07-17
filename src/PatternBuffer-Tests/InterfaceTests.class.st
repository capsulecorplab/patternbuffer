Class {
	#name : #InterfaceTests,
	#superclass : #TestCase,
	#category : #'PatternBuffer-Tests'
}

{ #category : #tests }
InterfaceTests >> testInterfacePortsListItemPointsToPort [
	| warpconduit warpcore warpnacelle |
	warpcore := Component new
		name: 'warp core';
		description: 'powers propulsion system for a warp-capable starship';
		ports: {(Port new name: 'warp core port')}.
	warpnacelle := Component new
		name: 'warp nacelle';
		description: 'propulsion system for a warp-capable starship';
		ports: {(Port new name: 'warp nacelle port')}.
	warpconduit := Interface new
		name: 'warp conduit';
		description: 'transfers warp field energy from the warp core to warp nacelles';
		data: 'warpfield energy';
		ports:
			{(warpcore ports at: 1).
			(warpnacelle ports at: 1)}.
	self assert: (warpconduit ports at: 1) name equals: 'warp core port'.
	self assert: (warpconduit ports at: 2) name equals: 'warp nacelle port'
]
