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
	self validateCollectionIsAPlayer: aPlayerCollection.
	aGame updateLastPlayedCard: self.
	aGame addCard: self asociatedWith: aPlayerCollection 
]

{ #category : #validations }
OverloadCard >> validateCollectionIsAPlayer: aCollection [ 
	^(aCollection first isMemberOf: Player)
		ifFalse: [ AssertionFailure new signal: 'Overload Card only applies to players' ]
]

{ #category : #'as yet unclassified' }
OverloadCard >> verifyCardIsApplicableBy: aPlayer on: aGame [ 
	aGame turnOf: aPlayer
]
