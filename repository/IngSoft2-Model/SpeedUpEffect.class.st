Class {
	#name : #SpeedUpEffect,
	#superclass : #Effect,
	#category : #'IngSoft2-Model'
}

{ #category : #interactions }
SpeedUpEffect >> triggerOn: aGame and: aPlayer [
	| steps |
	steps := 4.
	aGame updatePositionBy: steps OfThePlayer: aPlayer
]
