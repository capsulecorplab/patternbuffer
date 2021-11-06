"
Represents the smallest logical element in an OSHW project. A Component may be a project in its own right (with a sub-component hierarchy) or may be nested as a sub-component in the ""source"" of another component.
"
Class {
	#name : #PBComponent,
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
		'interfaceConnections'
	],
	#category : #'PatternBuffer-Base'
}

{ #category : #'as yet unclassified' }
PBComponent >> assemblyStep [
	^ assemblySteps
]

{ #category : #'as yet unclassified' }
PBComponent >> assemblySteps: aListOfAssemblySteps [ 
	assemblySteps := aListOfAssemblySteps
]

{ #category : #accessing }
PBComponent >> author [
	^ author
]

{ #category : #accessing }
PBComponent >> author: anAuthorString [
	author := anAuthorString
]

{ #category : #accessing }
PBComponent >> components [
	^ components
]

{ #category : #accessing }
PBComponent >> components: componentsDict [
	components := componentsDict
]

{ #category : #accessing }
PBComponent >> dependencies [
	^ dependencies
]

{ #category : #accessing }
PBComponent >> dependencies: dependenciesDict [
	dependencies := dependenciesDict
]

{ #category : #accessing }
PBComponent >> description [
	^ description
]

{ #category : #accessing }
PBComponent >> description: aDescriptionString [
	description := aDescriptionString
]

{ #category : #'as yet unclassified' }
PBComponent >> interfaceConnections: anInterfaceConnectionsList [

	interfaceConnections := anInterfaceConnectionsList 
]

{ #category : #accessing }
PBComponent >> license [
	^ license
]

{ #category : #accessing }
PBComponent >> license: aLicenseString [
	license := aLicenseString
]

{ #category : #accessing }
PBComponent >> name [
	^ name
]

{ #category : #accessing }
PBComponent >> name: aNameString [
	name := aNameString
]

{ #category : #accessing }
PBComponent >> parts [
	^ parts
]

{ #category : #accessing }
PBComponent >> parts: aPartsDict [
	parts := aPartsDict
]

{ #category : #accessing }
PBComponent >> precautions [
	^ precautions
]

{ #category : #accessing }
PBComponent >> precautions: aPrecautionsList [
	precautions := aPrecautionsList
]

{ #category : #accessing }
PBComponent >> tools [
	^ tools
]

{ #category : #accessing }
PBComponent >> tools: aToolsDict [
	tools := aToolsDict
]

{ #category : #accessing }
PBComponent >> version [
	^ version
]

{ #category : #accessing }
PBComponent >> version: aVersionString [
	version := aVersionString
]
