Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'sides',
		'randomRollGenerator'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #validations }
Die class >> verifyMoreThanFourSides: aNumberOfSides [
	aNumberOfSides < 4
		ifTrue: [ AssertionFailure
				signal: 'The number sides must be larger than or equal to 4' ]
]

{ #category : #'instance creation' }
Die class >> withSides: aNumberOfSides andGenerator: aGenerator [
	self verifyMoreThanFourSides: aNumberOfSides.
	^ self new initializeWithSides: aNumberOfSides andGenerator: aGenerator
]

{ #category : #initialization }
Die >> initializeWithSides: anInteger andGenerator: aGenerator [
	sides := anInteger.
	randomRollGenerator := aGenerator
]

{ #category : #accessing }
Die >> roll [
	^ randomRollGenerator next: sides
]

{ #category : #accessing }
Die >> sides [
	^ sides
]
