Class {
	#name : #RunningStateTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
RunningStateTest >> testPlayersPositionWhenRunning [
	| aRunningState aGame aPlayerNamedLeo aPlayerNamedGlenn aDie anotherDie board |
	aRunningState := RunningState new.
	aPlayerNamedLeo := Player named: 'Leo'.
	aPlayerNamedGlenn := Player named: 'Glenn'.
	aDie := Die
		withSides: 5
		andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	anotherDie := Die
		withSides: 5
		andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	board := UtilitiesForTests collectionOf20NoEffect.
	aGame := Game
		playedBy:
			{aPlayerNamedLeo.
			aPlayerNamedGlenn}
		throwing:
			{aDie.
			anotherDie}
		in: board
		andAmountOfLaps: 1.
	aRunningState nextTurnAt: aGame playedBy: aPlayerNamedLeo.
	aRunningState nextTurnAt: aGame playedBy: aPlayerNamedGlenn.
	self assert: (aGame positionFor: aPlayerNamedLeo ) equals: 3.
	self assert: (aGame positionFor: aPlayerNamedGlenn ) equals: 5
]
