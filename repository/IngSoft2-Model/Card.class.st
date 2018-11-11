Class {
	#name : #Card,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #interactions }
Card >> activateOn: aGame to: aPlayerCollection [ 
 ^self subclassResponsibility 
]

{ #category : #interactions }
Card >> applyOn: aGame to: aCollection [ 
	 ^ self subclassResponsibility 
]