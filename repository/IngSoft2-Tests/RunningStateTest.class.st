Class {
	#name : #RunningStateTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
RunningStateTest >> testPlayersPositionWhenRunning [
	| runningState game playerNamedLeo playerNamedGlenn die anotherDie board |
	runningState := RunningState new.
	playerNamedLeo := Player named: 'Leo'.
	playerNamedGlenn := Player named: 'Glenn'.
	die := Die withSides: 5 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	anotherDie := Die withSides: 5 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	board := UtilitiesForTests collectionOf20NoEffect.
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedGlenn}
		throwing:
			{die.
			anotherDie}
		in: board
		andAmountOfLaps: 1.
	runningState nextTurnAt: game playedBy: playerNamedLeo.
	runningState nextTurnAt: game playedBy: playerNamedGlenn.
	self assert: (game positionFor: playerNamedLeo) equals: 3.
	self assert: (game positionFor: playerNamedGlenn) equals: 5
]
