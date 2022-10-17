"
I represent python bindings for executing python scripts via terminal
"
Class {
	#name : #PBPython,
	#superclass : #Object,
	#instVars : [
		'pythonScript',
		'traceback'
	],
	#category : #PatternBuffer
}

{ #category : #'instance creation' }
PBPython >> fromString: aPythonScriptAsString [

	| stdout |
	pythonScript := aPythonScriptAsString.

	"clear traceback.log, if it exists"
	SICommand waitForCommand: 'rm' arguments: { 'traceback.log' }.

	"read contents of stdout"
	stdout := SICommand waitForCommand: 'printf' arguments: { 
			          ($' asString , pythonScript , $' asString).
			          '|'.
			          'python'.
			          '2>traceback.log' }.

	"read contents of traceback"
	traceback := 'traceback.log' asFileReference contents.

	('*Traceback*' match: traceback) ifTrue: [ Error signal: traceback ].

	^ stdout
]

{ #category : #accessing }
PBPython >> pythonScript [

	^ pythonScript
]

{ #category : #accessing }
PBPython >> traceback [

	^ traceback
]
