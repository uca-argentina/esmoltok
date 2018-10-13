Class {
	#name : #MoonWalkEffect,
	#superclass : #Object,
	#instVars : [
		'steps'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
MoonWalkEffect class >> withSteps: anInteger [
	^ self new initializeWithSteps: anInteger
]

{ #category : #initialization }
MoonWalkEffect >> initializeWithSteps: anInteger [
	steps := anInteger
]
