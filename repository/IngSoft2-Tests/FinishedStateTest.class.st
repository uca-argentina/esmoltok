Class {
	#name : #FinishedStateTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
FinishedStateTest >> testPlayersPositionWhenFinished [
	| aFinishedState aGame aPlayerNamedLeo aPlayerNamedGlenn aDie boardLength |
	aFinishedState := FinishedState new.
	aPlayerNamedLeo := Player named: 'Leo'.
	aPlayerNamedGlenn := Player named: 'Glenn'.
	aDie := Die
		withSides: 4
		andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	boardLength := 3.
	aGame := Game
		playedBy:
			{aPlayerNamedLeo.
			aPlayerNamedGlenn}
		throwing:
			{aDie.
			aDie}
		inABoardOfLenght: boardLength
		andAmountOfLaps: 1.
	self
		assert: (aFinishedState nextTurnAt: aGame playedBy: aPlayerNamedLeo)
		equals: aGame positionOfPlayers
]
