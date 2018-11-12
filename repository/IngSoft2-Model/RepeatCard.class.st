Class {
	#name : #RepeatCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #interactions }
RepeatCard >> activateOn: aGame to: aCollection [
	| player effect| 
	effect := aGame lastEffectPlayer key.
	player := aGame lastEffectPlayer value.
	effect triggerOn: aGame and: player
]

{ #category : #interactions }
RepeatCard >> applyOn: aGame to: aPlayerCollection [ 
	aGame updateLastPlayedCard: self.
	self activateOn: aGame to: aPlayerCollection 
]

{ #category : #'as yet unclassified' }
RepeatCard >> verifyCardIsApplicableBy: aPlayer on: aGame [ 
	^true
]
