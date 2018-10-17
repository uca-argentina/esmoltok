Class {
	#name : #NoEffectTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
NoEffectTest >> testNoEffectAppliedNoChangeToPlayerPosition [
	| position effect game aPlayerNamedLeo aPlayerNamedAlbert aPlayerNamedGlenn aDie anotherDie oneMoreDie boardLength |
	aPlayerNamedLeo := Player named: 'Leo'.
	aPlayerNamedAlbert := Player named: 'Albert'.
	aPlayerNamedGlenn := Player named: 'Glenn'.
	boardLength := 20.
	aDie := Die
		withSides: 4
		andGenerator: (CircularIterator over: {1 . 2 . 3 . 4}).
	anotherDie := Die
		withSides: 6
		andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5 . 6}).
	oneMoreDie := Die
		withSides: 5
		andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	game := Game
		playedBy:
			{aPlayerNamedLeo.
			aPlayerNamedAlbert.
			aPlayerNamedGlenn}
		throwing:
			{aDie.
			anotherDie.
			oneMoreDie}
		inABoardOfLenght: boardLength
		andAmountOfLaps: 1.
	effect := NoEffect new.
	position := game positionFor: aPlayerNamedAlbert.
	effect triggerOn: game and: aPlayerNamedAlbert.
	self assert: (game positionFor: aPlayerNamedAlbert) equals: position
]
