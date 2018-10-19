Class {
	#name : #TurnTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
TurnTest >> testCorrectTurnOrder [
	| namesAndTurns |
	namesAndTurns := Turn names: {'Glenn' . 'Albert' . 'Leo'}.
	self assert: namesAndTurns currentTurn equals: 'Glenn'.
	namesAndTurns updateToNextTurn.
	self assert: namesAndTurns currentTurn equals: 'Albert'.
	namesAndTurns updateToNextTurn.
	self assert: namesAndTurns currentTurn equals: 'Leo'.
	namesAndTurns updateToNextTurn.
	self assert: namesAndTurns currentTurn equals: 'Glenn'.
	namesAndTurns updateToNextTurn
]
