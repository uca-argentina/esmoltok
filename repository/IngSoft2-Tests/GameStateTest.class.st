Class {
	#name : #GameStateTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #'finished state tests' }
GameStateTest >> testPlayersPositionWhenFinished [
	| finishedState game playerNamedLeo playerNamedGlenn die board |
	finishedState := FinishedState new.
	playerNamedLeo := Player named: 'Leo'.
	playerNamedGlenn := Player named: 'Glenn'.
	die := Die withSides: 4 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	board := UtilitiesForTests collectionOf20NoEffect.
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedGlenn}
		throwing: {die}
		in: board
		andAmountOfLaps: 1.
	self
		should: [ finishedState nextTurnAt: game playedBy: playerNamedLeo ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'The game is over...' ]
]

{ #category : #'running state tests' }
GameStateTest >> testPlayersPositionWhenRunning [
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
