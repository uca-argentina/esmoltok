Class {
	#name : #FinishedStateTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
FinishedStateTest >> testPlayersPositionWhenFinished [
	| finishedState game playerNamedLeo playerNamedGlenn die board |
	finishedState := FinishedState new.
	playerNamedLeo := Player named: 'Leo'.
	playerNamedGlenn := Player named: 'Glenn'.
	die := Die withSides: 4 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	board := 3.
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedGlenn}
		throwing:
			{die.
			die}
		in: board
		andAmountOfLaps: 1.
	self assert: (finishedState nextTurnAt: game playedBy: playerNamedLeo) equals: game positionOfPlayers
]
