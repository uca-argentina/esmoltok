Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'sides',
		'randomRollGenerator'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Die class >> containingTheGenerator: aGenerator [
	self verifyMoreThanFourSides: aGenerator limit.
	^ self new initializeWithTheGenerator: aGenerator
]

{ #category : #'as yet unclassified' }
Die class >> randomDieWithThisNumberOfSides: aNumberOfSides [ 
	self verifyMoreThanFourSides: aNumberOfSides.
	^self new initializeWithTheGenerator: (RandomGenerator withThisLimit: aNumberOfSides). 
]

{ #category : #'creation approval' }
Die class >> verifyMoreThanFourSides: aNumberOfSides [
	aNumberOfSides < 4
		ifTrue: [ AssertionFailure
				signal: 'The number sides must be larger than or equal to 4' ]
]

{ #category : #'instance creation' }
Die class >> withThisNumberOfSides: aNumberOfSides [ 
	self verifyMoreThanFourSides: aNumberOfSides.
	^self new initializeWithSides:aNumberOfSides.
]

{ #category : #initialization }
Die >> initializeWithSides: aNumberOfSides [
	sides := aNumberOfSides.
	randomRollGenerator := SecuentialGenerator withNumberLimit: aNumberOfSides "should be a random generator"
]

{ #category : #initialization }
Die >> initializeWithTheGenerator: aGenerator [
	randomRollGenerator := aGenerator.
	sides := randomRollGenerator limit
]

{ #category : #accessing }
Die >> roll [
	^ randomRollGenerator next
]

{ #category : #accessing }
Die >> sides [
	^ sides
]
