Class {
	#name : #BlankCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #interaction }
BlankCard >> activateOn: aGame to: aCollection [ 
	
]

{ #category : #interaction }
BlankCard >> applyOn: aGame to: aCollection [ 
	self activateOn: aGame to: aCollection 
]

{ #category : #validation }
BlankCard >> verifyCardIsApplicableBy: aPlayer on: aGame [ 
	^true
]
