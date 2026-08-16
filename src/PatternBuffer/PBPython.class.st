"
I represent python bindings for executing python scripts via terminal
"
Class {
	#name : #PBPython,
	#superclass : #Object,
	#instVars : [
		'pythonScript',
		'scriptpy',
		'traceback',
		'tracebacklog'
	],
	#category : #PatternBuffer
}

{ #category : #'instance creation' }
PBPython >> fromArrayOfStrings: aPythonScriptAsArrayOfStrings [
	"Execute a python script from an array of strings"

	| aPythonScriptAsString |
	aPythonScriptAsString := String lf join:
		                         aPythonScriptAsArrayOfStrings.

	^ self fromString: aPythonScriptAsString
]

{ #category : #'instance creation' }
PBPython >> fromString: aPythonScriptAsString [
	"Execute a python script from a string"

	| stream stdouttxt stdout |
	"create file reference object for script.py"
	stdouttxt := 'stdout.txt' asFileReference.

	"delete stdout.txt, if it exists"
	stdouttxt exists ifTrue: [ stdouttxt delete ].

	"delete script.py, if it exists"
	scriptpy exists ifTrue: [ scriptpy delete ].

	"delete traceback.log, if it exists"
	tracebacklog exists ifTrue: [ tracebacklog delete ].

	"write contents of script.py to stream"
	stream := scriptpy writeStream.
	stream nextPutAll: aPythonScriptAsString.
	stream close.

	"execute script.py, read contents of stdout, and pipe stderror to a log file"
	LibC runCommand:
		'./venv/bin/python script.py >stdout.txt 2>traceback.log'.

	"read contents of stdout"
	stdout := stdouttxt contents.

	"read contents of traceback"
	pythonScript := scriptpy contents.

	"read contents of traceback"
	traceback := tracebacklog contents.

	"throw error if traceback"
	traceback isNotEmpty ifTrue: [ Error signal: traceback ].

	^ stdout
]

{ #category : #initialization }
PBPython >> initialize [
	" Initialize python-venv if none exists "

	self setupPythonVenv.

	"create file reference object for script.py"
	scriptpy := 'script.py' asFileReference.

	"create file reference object for script.py"
	tracebacklog := 'traceback.log' asFileReference
]

{ #category : #accessing }
PBPython >> pythonScript [

	^ pythonScript
]

{ #category : #accessing }
PBPython >> scriptpy [

	^ scriptpy
]

{ #category : #accessing }
PBPython >> traceback [

	^ traceback
]
