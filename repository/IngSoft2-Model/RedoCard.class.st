Class {
	#name : #RedoCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #interaction }
RedoCard >> activateOn: aGame to: aCollection [
	| card |
	card := (aGame lastPlayedCard) deepCopy.
	card applyOn: aGame to: aCollection
]

{ #category : #interaction }
RedoCard >> applyOn: aGame to: aCollection [
	self activateOn: aGame to: aCollection
]

{ #category : #validation }
RedoCard >> verifyCardIsApplicableBy: aPlayer on: aGame [ 
	^aGame lastPlayedCard verifyCardIsApplicableBy: aPlayer on: aGame
]
