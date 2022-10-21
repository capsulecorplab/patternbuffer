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
PBPython >> fromArrayOfStrings: aPythonScriptAsArrayOfStrings [

	"Execute a python script from an array of strings"

	| stdout |
	aPythonScriptAsArrayOfStrings.

	"clear script.py, if it exists"
	SICommand waitForCommand: 'rm' arguments: { 'script.py' }.

	"clear traceback.log, if it exists"
	SICommand waitForCommand: 'rm' arguments: { 'traceback.log' }.

	"write python script to a file"
	aPythonScriptAsArrayOfStrings do: [ :line | 
		SICommand waitForCommand: 'printf' arguments: { 
				($' asString , line , '\n' , $' asString).
				'>>'.
				'script.py' } ].

	"execute script.py, read contents of stdout, and pipe stderror to a log file"
	stdout := SICommand
		          waitForCommand: 'python'
		          arguments: { 'script.py'. '2>traceback.log' }.

	"read contents of traceback"
	pythonScript := 'script.py' asFileReference contents.

	"read contents of traceback"
	traceback := 'traceback.log' asFileReference contents.

	traceback contents isNotEmpty ifTrue: [ Error signal: traceback ].

	^ stdout
]

{ #category : #'instance creation' }
PBPython >> fromString: aPythonScriptAsString [

	"Execute a python script from a string"

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
