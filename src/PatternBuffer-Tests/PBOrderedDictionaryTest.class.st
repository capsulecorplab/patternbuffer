Class {
	#name : 'PBOrderedDictionaryTest',
	#superclass : 'TestCase',
	#instVars : [
		'orderedDict'
	],
	#category : 'PatternBuffer-Tests',
	#package : 'PatternBuffer-Tests'
}

{ #category : 'running' }
PBOrderedDictionaryTest >> setUp [

	super setUp.

	orderedDict := PBOrderedDictionary newFrom: {
			               ('dec' -> 42).
			               ('hex' -> '2a').
			               ('char' -> '*') }
]

{ #category : 'tests' }
PBOrderedDictionaryTest >> testAt [
	"test that value for a key-value pair can be accessed by index of key"

	self assert: (orderedDict at: 3) equals: '*'.
	self assert: (orderedDict at: 'char') equals: '*'
]

{ #category : 'tests' }
PBOrderedDictionaryTest >> testFirst [
	"test that value for a key-value pair can be accessed by first"

	self assert: orderedDict first equals: 42
]

{ #category : 'tests' }
PBOrderedDictionaryTest >> testLast [
	"test that value for a key-value pair can be accessed by last"

	self assert: orderedDict last equals: '*'
]
