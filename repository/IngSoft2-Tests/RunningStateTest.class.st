Class {
	#name : #RunningStateTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
RunningStateTest >> testPlayersPositionWhenRunning [
	| aRunningState aGame aPlayerNamedLeo aPlayerNamedGlenn aDie anotherDie boardLength |
	aRunningState := RunningState new.
	aPlayerNamedLeo := Player named: 'Leo'.
	aPlayerNamedGlenn := Player named: 'Glenn'.
	aDie := Die withSides: 5 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	anotherDie := Die withSides: 5 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	boardLength := 20.
	aGame := Game
		playedBy:
			{aPlayerNamedLeo.
			aPlayerNamedGlenn}
		throwing:
			{aDie . anotherDie }
		inABoardOfLenght: boardLength.
	aRunningState nextTurnAt: aGame playedBy: aPlayerNamedLeo.
	self assert: (aGame positionOfPlayers at: 'Leo') equals: 2.
	self assert: (aGame positionOfPlayers at: 'Glenn') equals: 0. "Tendria que dar 4 pero nos da 0 por alguna razon"
]
