Class {
	#name : #GameState,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #interaction }
GameState >> playNextTurnIn: aGame playedBy: aPlayer [
	self subclassResponsibility
]
