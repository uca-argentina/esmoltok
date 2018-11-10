Class {
	#name : #RunningState,
	#superclass : #GameState,
	#category : #'IngSoft2-Model'
}

{ #category : #interactions }
RunningState >> nextTurnAt: aGame playedBy: aPlayer [ 
	aGame isPlayedBy: aPlayer.
]
