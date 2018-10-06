Class {
	#name : #DieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DieTest >> testInitializeWithGivenGenerator [
	| aDie aGenerator aCollection aNumberOfSides|
	aCollection:= { 4 . 6 . 2 . 9 . 14 }.
	aNumberOfSides := 5.
	aGenerator:= CircularIterator over: aCollection.
	aDie := Die withSides: aNumberOfSides andGenerator:  aGenerator.
	self assert: aDie roll equals: 4.
	self assert: aDie roll equals: 6.
	self assert: aDie roll equals: 2.
	self assert: aDie roll equals: 9.
	self assert: aDie roll equals: 14.
	self assert: aDie roll equals: 4.
	self assert: aDie roll equals: 6
]

{ #category : #tests }
DieTest >> testRollRandomDie [
	| aRandomDie |
	aRandomDie := Die withSides: 6 andGenerator:  RandomGenerator new.
	self assert: aRandomDie sides equals: 6.
	self assert: (aRandomDie roll between: 1 and: 6)
]

{ #category : #tests }
DieTest >> testVerifyNumberOfDieSides [
		| aDie aGenerator aCollection aNumberOfSides|
	aCollection:= { 4 }.
	aNumberOfSides := 5.
	aGenerator:= CircularIterator over: aCollection.
	aDie := Die withSides: aNumberOfSides andGenerator:  aGenerator.
	self assert: aDie sides equals: 5
]

{ #category : #tests }
DieTest >> testVerifyNumberOfDieSidesFourOrMore [
	| aDie aGenerator aCollection aNumberOfSides |
	aCollection := {4}.
	aNumberOfSides := 3.
	aGenerator := CircularIterator over: aCollection.
	self
		should: [ aDie := Die withSides: aNumberOfSides andGenerator: aGenerator ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'The number sides must be larger than or equal to 4' ]
]
