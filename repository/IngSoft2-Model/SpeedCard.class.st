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
	self validateCollectionIsAPlayer: aPlayerCollection.
	aGame updateLastPlayedCard: self.
	aGame addCard: self asociatedWith: aPlayerCollection
]

{ #category : #verifications }
SpeedCard >> validateCollectionIsAPlayer: aCollection [ 
	^(aCollection first isMemberOf: Player)
		ifFalse: [ AssertionFailure new signal: 'Speed Card only applies to players' ]
]

{ #category : #'as yet unclassified' }
SpeedCard >> verifyCardIsApplicableBy: aPlayer on: aGame [ 
	aGame turnOf: aPlayer
]
