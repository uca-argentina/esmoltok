Class {
	#name : #DieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DieTest >> testInitializeWithCollectionIteratesThroughIt [
	| die generator collection numberOfSides |
	collection := {4 . 6 . 2 . 9 . 14}.
	numberOfSides := 5.
	generator := CircularIterator over: collection.
	die := Die withSides: numberOfSides andGenerator: generator.
	self assert: die roll equals: 4.
	self assert: die roll equals: 6.
	self assert: die roll equals: 2.
	self assert: die roll equals: 9.
	self assert: die roll equals: 14.
	self assert: die roll equals: 4.
	self assert: die roll equals: 6
]

{ #category : #tests }
DieTest >> testRollRandomDie [
	| randomDie |
	randomDie := Die withSides: 6 andGenerator: RandomGenerator new.
	self assert: randomDie sides equals: 6.
	self assert: (randomDie roll between: 1 and: 6)
]

{ #category : #tests }
DieTest >> testVerifyIfDieHasFourSidesOrMore [
	| die generator collection numberOfSides |
	collection := {4}.
	numberOfSides := 3.
	generator := CircularIterator over: collection.
	self
		should: [ die := Die withSides: numberOfSides andGenerator: generator ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'The number sides must be larger than or equal to 4' ]
]

{ #category : #tests }
DieTest >> testVerifyNumberOfDieSides [
	| die generator collection numberOfSides |
	collection := {4}.
	numberOfSides := 5.
	generator := CircularIterator over: collection.
	die := Die withSides: numberOfSides andGenerator: generator.
	self assert: die sides equals: 5
]
