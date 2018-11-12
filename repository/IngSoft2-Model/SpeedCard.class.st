Class {
	#name : #SpeedCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #interaction }
SpeedCard >> activateOn: aGame to: aPlayerCollection [ 
	| aPlayer |
	aPlayer := aPlayerCollection first.
	aPlayer = (aGame currentPlayerTurn)
		ifTrue: [ aGame updatePositionBy: 1 OfThePlayer: aPlayer ]
]

{ #category : #interaction }
SpeedCard >> applyOn: aGame to: aPlayerCollection [
	self validateCollectionIsAPlayer: aPlayerCollection.
	aGame updateLastPlayedCard: self.
	aGame addCard: self asociatedWith: aPlayerCollection
]

{ #category : #validation }
SpeedCard >> validateCollectionIsAPlayer: aCollection [ 
	^(aCollection first isMemberOf: Player)
		ifFalse: [ AssertionFailure new signal: 'Speed Card only applies to players' ]
]

{ #category : #validation }
SpeedCard >> verifyCardIsApplicableBy: aPlayer on: aGame [ 
	aGame turnOf: aPlayer
]
