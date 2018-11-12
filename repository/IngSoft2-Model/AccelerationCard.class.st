Class {
	#name : #AccelerationCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #interaction }
AccelerationCard >> activateOn: aGame to: aPlayerCollection [ 
		aGame updatePositionBy: 1 OfThePlayer: (aGame currentPlayerTurn)
]

{ #category : #interaction }
AccelerationCard >> applyOn: aGame to: aCollection [ 
	aGame updateLastPlayedCard: self.
	aGame addCard: self asociatedWith: (aGame positionOfPlayers keys)
]

{ #category : #validation }
AccelerationCard >> verifyCardIsApplicableBy: aPlayer on: aGame [ 
	aGame turnOf: aPlayer
]
