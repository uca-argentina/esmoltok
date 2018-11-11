Class {
	#name : #RedoCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #interactions }
RedoCard >> activateOn: aGame to: aCollection [
	| card |
	card := (aGame lastPlayedCard) deepCopy.
	card applyOn: aGame to: aCollection
]

{ #category : #interactions }
RedoCard >> applyOn: aGame to: aCollection [
	self activateOn: aGame to: aCollection
]
