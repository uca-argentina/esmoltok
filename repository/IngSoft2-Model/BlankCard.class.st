Class {
	#name : #BlankCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #interactions }
BlankCard >> activateOn: aGame to: aCollection [ 
	
]

{ #category : #interactions }
BlankCard >> applyOn: aGame to: aCollection [ 
	aGame updateLastPlayedCard: self.
	self activateOn: aGame to: aCollection 
]
