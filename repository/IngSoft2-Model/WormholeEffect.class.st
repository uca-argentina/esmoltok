Class {
	#name : #WormholeEffect,
	#superclass : #Effect,
	#category : #'IngSoft2-Model'
}

{ #category : #interaction }
WormholeEffect >> triggerOn: aGame and: aPlayer [
	| steps |
	steps := 4 negated.
	aGame updatePositionBy: steps OfThePlayer: aPlayer
]
