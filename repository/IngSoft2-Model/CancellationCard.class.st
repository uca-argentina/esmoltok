Class {
	#name : #CancellationCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #interactions }
CancellationCard >> activateOn: aGame to: aCollection [ 
	| card |
	card := aCollection first.
	(aGame hasCard: card)
		ifTrue: [ aGame removeCard: card ]
]

{ #category : #interactions }
CancellationCard >> applyOn: aGame to: aCollection [ 
	aGame updateLastPlayedCard: self.
	self activateOn: aGame  to: aCollection  
]
