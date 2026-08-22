Class {
	#name : 'PBPythonTest',
	#superclass : 'TestCase',
	#category : 'PatternBuffer-Tests',
	#package : 'PatternBuffer-Tests'
}

{ #category : 'tests' }
PBPythonTest >> testFromArrayOfStrings [

	"tests Hello, world! example from an array of strings"

	| pythonScriptAsArrayOfStrings pythonClient stdout |
	pythonScriptAsArrayOfStrings := { 'string = "Hello, world!"'.
	                                'print(string)' }.
	pythonClient := PBPython new.
	stdout := pythonClient fromArrayOfStrings:
		          pythonScriptAsArrayOfStrings.
	self assert: stdout equals: 'Hello, world!' , Character lf asString
]

{ #category : 'tests' }
PBPythonTest >> testFromString [

	"tests Hello, world! example from a string"

	| pythonScript pythonClient stdout |
	pythonScript := 'print("Hello, world!")'.
	pythonClient := PBPython new.
	stdout := pythonClient fromString: pythonScript.
	self assert: stdout equals: 'Hello, world!' , Character lf asString
]

{ #category : 'tests' }
PBPythonTest >> testPythonScript [
	"tests Hello, world! example"

	| pythonScript pythonClient |
	pythonScript := 'print("Hello, world!")'.
	pythonClient := PBPython new.
	pythonClient fromString: pythonScript.
	self
		assert: pythonClient pythonScript
		equals: 'print("Hello, world!")'
]

{ #category : 'tests' }
PBPythonTest >> testTraceback [
	"tests Tracebacks are piped from stderr to a log file and yields an error in Pharo"

	| pythonScript pythonClient exception expectedError |
	exception := 'Ye cannae change the laws of physics!'.
	pythonScript := 'raise Exception("' , exception , '")'.
	pythonClient := PBPython new.
	expectedError := 'Traceback (most recent call last):'
	                 , Character lf asString , '  File "'
	                 , pythonClient scriptpy pathString
	                 , '", line 1, in <module>' , Character lf asString
	                 , '    ' , pythonScript , Character lf asString
	                 , 'Exception: ' , exception , ''
	                 , Character lf asString.
	self assert: ([ pythonClient fromString: pythonScript ]
			 on: Error
			 do: [ pythonClient traceback = expectedError ])
]
