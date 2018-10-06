Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'boardLength',
		'dice',
		'playersPosition',
		'state'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> playedBy: aPlayer throwing: aDice inABoardOfLenght: aBoardLength [
	^ self new initializeWithLength: aBoardLength dice: aDice player: aPlayer
]

{ #category : #accessing }
Game >> boardLength [
	^ boardLength
]

{ #category : #accessing }
Game >> dice [
	^ dice
]

{ #category : #updating }
Game >> endsTheGame [
	state := FinishedState new.
]

{ #category : #updating }
Game >> gameHasEndedIfBoardLenghtHasBeenReachedBy: aPlayer [
	(self positionOfPlayers at: aPlayer) >= self boardLength
		ifTrue: [ self endsTheGame ]
]

{ #category : #initialization }
Game >> initializeWithLength: aBoardLength dice: aCollectionOfDice player: aCollectionOfPlayers [
	boardLength := aBoardLength.
	dice := aCollectionOfDice.
	playersPosition := Dictionary new.
	aCollectionOfPlayers
		inject: 0
		into: [ :position :each | playersPosition at: each name put: position ].
	state := RunningState new
]

{ #category : #updating }
Game >> isPlayedBy: aPlayer [
	| aNumberOfCells |
	aNumberOfCells := aPlayer throwDice: self dice.
	self updatePositionBy: aNumberOfCells OfThePlayerNamed: aPlayer name
]

{ #category : #updating }
Game >> playTurn: aPlayer [ 
	state nextTurnAt: self playedBy: aPlayer .
]

{ #category : #accessing }
Game >> positionFor: aPlayer [
  ^playersPosition at: aPlayer name
	
]

{ #category : #accessing }
Game >> positionOfPlayers [
	^ playersPosition
]

{ #category : #updating }
Game >> updatePositionBy: aNumberOfCells OfThePlayerNamed: aPlayer [
	playersPosition at: aPlayer put: (playersPosition at: aPlayer) + aNumberOfCells.
	self gameHasEndedIfBoardLenghtHasBeenReachedBy: aPlayer
]
