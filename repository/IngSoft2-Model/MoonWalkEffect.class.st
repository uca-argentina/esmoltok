Class {
	#name : #MoonWalkEffect,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
MoonWalkEffect class >> withSteps: anInteger [
	^ self new initializeWithSteps: anInteger
]
