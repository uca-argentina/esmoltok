Class {
	#name : #MoonWalkEffectTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
MoonWalkEffectTest >> testMoonWalkAppliedMovesEveryoneBack5SpacesExceptThePlayer [
	| number positionAlbert effect game playerNamedLeo playerNamedAlbert playerNamedGlenn die anotherDie oneMoreDie board |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedAlbert := Player named: 'Albert'.
	playerNamedGlenn := Player named: 'Glenn'.
	board := UtilitiesForTests collectionOf20NoEffect.
	die := Die withSides: 4 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4}).
	anotherDie := Die withSides: 6 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5 . 6}).
	oneMoreDie := Die withSides: 5 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedAlbert.
			playerNamedGlenn}
		throwing:
			{die.
			anotherDie.
			oneMoreDie}
		in: board
		andAmountOfLaps: 1.
	number := 5.
	effect := MoonWalkEffect withSteps: number.
	positionAlbert := game positionFor: playerNamedAlbert.
	effect triggerOn: game and: playerNamedAlbert.
	self assert: (game positionFor: playerNamedAlbert) equals: positionAlbert.
	self assert: (game positionFor: playerNamedLeo) equals: 16.
	self assert: (game positionFor: playerNamedGlenn) equals: 16
]

{ #category : #tests }
MoonWalkEffectTest >> testMoonWalkInitializedWith7Steps [
	| number effect |
	number := 7.
	effect := MoonWalkEffect withSteps: number.
	self assert: effect steps equals: number
]
