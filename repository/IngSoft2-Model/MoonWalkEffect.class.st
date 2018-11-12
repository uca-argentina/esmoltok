Class {
	#name : #MoonWalkEffect,
	#superclass : #Effect,
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

{ #category : #accessing }
MoonWalkEffect >> steps [
	^ steps
]

{ #category : #interaction }
MoonWalkEffect >> triggerOn: aGame and: aPlayer [
	aGame positionOfPlayers
		associationsDo: [ :each | 
			each key = aPlayer
				ifFalse: [ aGame updatePositionBy: steps negated OfThePlayer: each key ] ]
]
