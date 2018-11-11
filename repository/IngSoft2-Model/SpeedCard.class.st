Class {
	#name : #SpeedCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #interactions }
SpeedCard >> activateOn: aGame to: aPlayerCollection [ 
	| aPlayer |
	aPlayer := aPlayerCollection first.
	aPlayer = (aGame currentPlayerTurn)
		ifTrue: [ aGame updatePositionBy: 1 OfThePlayer: aPlayer ]
]

{ #category : #interactions }
SpeedCard >> applyOn: aGame to: aPlayerCollection [ 
	aGame addCard: self asociatedWith: aPlayerCollection
]
