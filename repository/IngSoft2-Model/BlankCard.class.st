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
	self activateOn: aGame to: aCollection 
]

{ #category : #'as yet unclassified' }
BlankCard >> verifyCardIsApplicableBy: aPlayer on: aGame [ 
	^true
]
