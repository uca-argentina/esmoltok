Class {
	#name : #MoonWalkEffectTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
MoonWalkEffectTest >> testMoonWalkAppliedMovesEveryoneBack5SpacesExceptThePlayer [
	| number positionAlbert effect game aPlayerNamedLeo aPlayerNamedAlbert aPlayerNamedGlenn aDie anotherDie oneMoreDie boardLength |
	aPlayerNamedLeo := Player named: 'Leo'.
	aPlayerNamedAlbert := Player named: 'Albert'.
	aPlayerNamedGlenn := Player named: 'Glenn'.
	boardLength := UtilitiesForTests collectionOf20NoEffect.
	aDie := Die withSides: 4 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4}).
	anotherDie := Die withSides: 6 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5 . 6}).
	oneMoreDie := Die withSides: 5 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	game := Game
		playedBy:
			{aPlayerNamedLeo.
			aPlayerNamedAlbert.
			aPlayerNamedGlenn}
		throwing:
			{aDie.
			anotherDie.
			oneMoreDie}
		in: boardLength
		andAmountOfLaps: 1.
	number := 5.
	effect := MoonWalkEffect withSteps: number.
	positionAlbert := game positionFor: aPlayerNamedAlbert.
	effect triggerOn: game and: aPlayerNamedAlbert.
	self assert: (game positionFor: aPlayerNamedAlbert) equals: positionAlbert.
	self assert: (game positionFor: aPlayerNamedLeo) equals: 16.
	self assert: (game positionFor: aPlayerNamedGlenn) equals: 16
]

{ #category : #tests }
MoonWalkEffectTest >> testMoonWalkInitializedWith7Steps [
	| number effect |

	number := 7.
	effect := MoonWalkEffect withSteps: number.
	self assert: effect steps equals: number
]
