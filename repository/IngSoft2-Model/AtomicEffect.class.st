Class {
	#name : #AtomicEffect,
	#superclass : #Effect,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
AtomicEffect >> triggerOn: aGame and: aPlayer [
	aGame playersPlaying do:
			[ :each | aGame updatePositionBy: ((aGame positionFor: each) negated + 1) OfThePlayer: each]
]
