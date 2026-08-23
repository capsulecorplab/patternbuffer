"
I represent an ordered dictionary. I provide methods for accessing elements of an ordered dictionary by key name or by index.

## Example

```lang=pharo
| orderedDict |
orderedDict := PBOrderedDictionary newFrom: {
			               ('dec' -> 42).
			               ('hex' -> '2a').
			               ('char' -> '*') }.
orderedDict at: 3
```
"
Class {
	#name : 'PBOrderedDictionary',
	#superclass : 'OrderedDictionary',
	#category : 'PatternBuffer',
	#package : 'PatternBuffer'
}

{ #category : 'accessing' }
PBOrderedDictionary >> at: aKeyOrIndex [

	aKeyOrIndex isInteger
		ifTrue: [ ^ super at: (self keys at: aKeyOrIndex) ]
		ifFalse: [ ^ super at: aKeyOrIndex ]
]

{ #category : 'accessing' }
PBOrderedDictionary >> first [

	^ self at: 1
]

{ #category : 'accessing' }
PBOrderedDictionary >> last [

	^ self at: self size
]
