Class {
	#name : #FinishedState,
	#superclass : #GameState,
	#category : #'IngSoft2-Model'
}

{ #category : #interaction }
FinishedState >> playNextTurnIn: aGame playedBy: aPlayer [
	^ AssertionFailure new signal: 'The game is over...'
]
