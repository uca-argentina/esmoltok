Class {
	#name : #OverloadCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #interaction }
OverloadCard >> activateOn: aGame to: aPlayerCollection [
	| aPlayer |
	aPlayer := aPlayerCollection first.
	aPlayer = (aGame currentPlayerTurn)
		ifTrue: [ aGame updatePositionBy: (2 negated) OfThePlayer: aPlayer ]
]

{ #category : #interaction }
OverloadCard >> applyOn: aGame to: aPlayerCollection [
	self validateCollectionIsAPlayer: aPlayerCollection.
	aGame updateLastPlayedCard: self.
	aGame addCard: self asociatedWith: aPlayerCollection 
]

{ #category : #validation }
OverloadCard >> validateCollectionIsAPlayer: aCollection [ 
	^(aCollection first isMemberOf: Player)
		ifFalse: [ AssertionFailure new signal: 'Overload Card only applies to players' ]
]

{ #category : #validation }
OverloadCard >> verifyCardIsApplicableBy: aPlayer on: aGame [ 
	aGame turnOf: aPlayer
]
