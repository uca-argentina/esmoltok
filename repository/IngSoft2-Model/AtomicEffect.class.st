Class {
	#name : #AtomicEffect,
	#superclass : #Effect,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
AtomicEffect >> triggerOn: aGame and: aPlayer [
	aGame positionOfPlayers
		associationsDo:
			[ :each | aGame updatePositionBy: ((aGame positionFor: each key) negated + 1) OfThePlayer: each key]
]
