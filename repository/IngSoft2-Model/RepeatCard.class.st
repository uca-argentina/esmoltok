Class {
	#name : #RepeatCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #interaction }
RepeatCard >> activateOn: aGame to: aCollection [
	| player effect| 
	effect := aGame lastEffectPlayer key.
	player := aGame lastEffectPlayer value.
	effect triggerOn: aGame and: player
]

{ #category : #interaction }
RepeatCard >> applyOn: aGame to: aPlayerCollection [ 
	aGame updateLastPlayedCard: self.
	self activateOn: aGame to: aPlayerCollection 
]

{ #category : #validation }
RepeatCard >> verifyCardIsApplicableBy: aPlayer on: aGame [ 
	^true
]
