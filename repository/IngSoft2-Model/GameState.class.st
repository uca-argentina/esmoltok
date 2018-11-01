Class {
	#name : #GameState,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #interaction }
GameState >> nextTurnAt: aGame playedBy: aPlayer [
	self subclassResponsibility
]
