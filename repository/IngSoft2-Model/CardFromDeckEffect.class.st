Class {
	#name : #CardFromDeckEffect,
	#superclass : #Effect,
	#instVars : [
		'deck'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
CardFromDeckEffect class >> withDeck: aDeck [
	^ self new initializeWithDeck: aDeck
]

{ #category : #initialization }
CardFromDeckEffect >> initializeWithDeck: aDeck [
	deck := aDeck
]

{ #category : #accessing }
CardFromDeckEffect >> triggerOn: aGame afterMovementOf: aPlayer [
	aPlayer drawCardFrom: deck
]
