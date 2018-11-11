Class {
	#name : #AccelerationCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #interactions }
AccelerationCard >> activateOn: aGame to: aPlayerCollection [ 
		aGame updatePositionBy: 1 OfThePlayer: (aGame currentPlayerTurn)
]

{ #category : #interactions }
AccelerationCard >> applyOn: aGame to: aCollection [ 
	aGame updateLastPlayedCard: self.
	aGame addCard: self asociatedWith: (aGame positionOfPlayers keys)
]
