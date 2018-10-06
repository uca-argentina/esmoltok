Class {
	#name : #FinishedState,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #interactions }
FinishedState >> nextTurnAt: aGame playedBy: aPlayer [
	^aGame positionOfPlayers
]
