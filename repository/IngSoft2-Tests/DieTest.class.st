Class {
	#name : #DieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DieTest >> testInitializeWithGivenGenerator [
	| aDie aGenerator anArray|
	anArray:= { 4 . 6 . 2 . 9 . 14 }.
	aGenerator:= ArrayBasedGenerator whoUsesTheArray: anArray.
	aDie := Die containingTheGenerator: aGenerator.
	self assert: aDie roll equals: 4.
	self assert: aDie roll equals: 6.
	self assert: aDie roll equals: 2.
	self assert: aDie roll equals: 9.
	self assert: aDie roll equals: 14.
	self assert: aDie roll equals: 4.
	self assert: aDie roll equals: 6
]

{ #category : #tests }
DieTest >> testRollADie [
	| aDie |
	aDie := Die withThisNumberOfSides: 6.
	self assert: aDie roll == 1.
	self assert: aDie roll == 2.
	self assert: aDie roll == 3.
	self assert: aDie roll == 4.
	self assert: aDie roll == 5.
	self assert: aDie roll == 6.
	self assert: aDie roll == 1
]

{ #category : #tests }
DieTest >> testVerifyNumberOfDieSides [
	| aDie |
	aDie := Die withThisNumberOfSides: 6.
	self assert: aDie sides equals: 6
]

{ #category : #tests }
DieTest >> testVerifyNumberOfDieSidesFourOrMore [
	| aDie |
	self should: [ aDie := Die withThisNumberOfSides: 3 ] raise: AssertionFailure
]
