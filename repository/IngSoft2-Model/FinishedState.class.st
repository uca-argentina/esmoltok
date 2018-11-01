Class {
	#name : #FinishedState,
	#superclass : #GameState,
	#category : #'IngSoft2-Model'
}

{ #category : #interactions }
FinishedState >> nextTurnAt: aGame playedBy: aPlayer [
	^ AssertionFailure new signal: 'The game is over...'
]
