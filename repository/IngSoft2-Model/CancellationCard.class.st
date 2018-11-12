Class {
	#name : #CancellationCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #interaction }
CancellationCard >> activateOn: aGame to: aCollection [ 
	| card |
	card := aCollection first.
	(aGame hasCard: card)
		ifTrue: [ aGame removeCard: card ]
]

{ #category : #interaction }
CancellationCard >> applyOn: aGame to: aCollection [
	self validateCollectionIsACard: aCollection.
	self validateGameHasCards: aGame.
	aGame updateLastPlayedCard: self.
	self activateOn: aGame to: aCollection
]

{ #category : #validation }
CancellationCard >> validateCollectionIsACard: aCollection [ 
	^(aCollection first isKindOf: Card)
		ifFalse: [ AssertionFailure new signal: 'Cancellation Card only applies to other cards' ]
]

{ #category : #interaction }
CancellationCard >> validateGameHasCards: aGame [
	(aGame hasPermanentCards)
		ifFalse: [ AssertionFailure new
				signal: 'There are no permanent cards in the game' ]
]

{ #category : #validation }
CancellationCard >> verifyCardIsApplicableBy: aPlayer on: aGame [ 
	^true
]
