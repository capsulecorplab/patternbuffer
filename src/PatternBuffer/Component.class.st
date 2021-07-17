"
Represents the smallest logical element in an OSHW project. A Component may be a project in its own right (with a sub-component hierarchy) or may be nested as a sub-component in the ""source"" of another component.
"
Class {
	#name : #Component,
	#superclass : #Object,
	#instVars : [
		'name',
		'version',
		'description',
		'license',
		'author',
		'dependencies',
		'components',
		'parts',
		'tools',
		'precautions',
		'assemblySteps',
		'ports'
	],
	#category : #'PatternBuffer-Base'
}

{ #category : #'as yet unclassified' }
Component >> assemblyStep [
	^ assemblySteps
]

{ #category : #'as yet unclassified' }
Component >> assemblySteps: aListOfAssemblySteps [ 
	assemblySteps := aListOfAssemblySteps
]

{ #category : #accessing }
Component >> author [
	^ author
]

{ #category : #accessing }
Component >> author: anAuthorString [
	author := anAuthorString
]

{ #category : #accessing }
Component >> components [
	^ components
]

{ #category : #accessing }
Component >> components: componentsDict [
	components := componentsDict
]

{ #category : #accessing }
Component >> dependencies [
	^ dependencies
]

{ #category : #accessing }
Component >> dependencies: dependenciesDict [
	dependencies := dependenciesDict
]

{ #category : #accessing }
Component >> description [
	^ description
]

{ #category : #accessing }
Component >> description: aDescriptionString [
	description := aDescriptionString
]

{ #category : #accessing }
Component >> license [
	^ license
]

{ #category : #accessing }
Component >> license: aLicenseString [
	license := aLicenseString
]

{ #category : #accessing }
Component >> name [
	^ name
]

{ #category : #accessing }
Component >> name: aNameString [
	name := aNameString
]

{ #category : #accessing }
Component >> parts [
	^ parts
]

{ #category : #accessing }
Component >> parts: aPartsDict [
	parts := aPartsDict
]

{ #category : #'as yet unclassified' }
Component >> ports [
	^ ports
]

{ #category : #'as yet unclassified' }
Component >> ports: aDictionaryOf [
	ports := aDictionaryOf
]

{ #category : #accessing }
Component >> precautions [
	^ precautions
]

{ #category : #accessing }
Component >> precautions: aPrecautionsList [
	precautions := aPrecautionsList
]

{ #category : #accessing }
Component >> tools [
	^ tools
]

{ #category : #accessing }
Component >> tools: aToolsDict [
	tools := aToolsDict
]

{ #category : #accessing }
Component >> version [
	^ version
]

{ #category : #accessing }
Component >> version: aVersionString [
	version := aVersionString
]
