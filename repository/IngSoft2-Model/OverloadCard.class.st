Class {
	#name : #OverloadCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #interactions }
OverloadCard >> activateOn: aGame to: aPlayerCollection [
	| aPlayer |
	aPlayer := aPlayerCollection first.
	aPlayer = (aGame currentPlayerTurn)
		ifTrue: [ aGame updatePositionBy: (2 negated) OfThePlayer: aPlayer ]
]

{ #category : #interactions }
OverloadCard >> applyOn: aGame to: aPlayerCollection [ 
	aGame updateLastPlayedCard: self.
	aGame addCard: self asociatedWith: aPlayerCollection 
]
