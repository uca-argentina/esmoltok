Class {
	#name : #RunningState,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #interactions }
RunningState >> nextTurnAt: aGame playedBy: aPlayer [ 
	aGame isPlayedBy: aPlayer.
]
