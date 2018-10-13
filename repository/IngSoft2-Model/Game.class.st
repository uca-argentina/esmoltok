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

{ #category : #updating }
Game >> applyMoonWalkEffectExcluding: aPlayer steps: steps [
	playersPosition
		associationsDo: [ :each | 
			each key = aPlayer name
				ifFalse: [ self updatePositionBy: steps OfThePlayer: (Player named: each key) ] ]
]

{ #category : #updating }
Game >> applyNoEffectTo: aPlayer [
	
]

{ #category : #updating }
Game >> applySpeedUpEffectTo: aPlayer positionIncrementedBy: anInteger [ 
	self updatePositionBy: anInteger OfThePlayer: aPlayer
]

{ #category : #updating }
Game >> applyWormHoleEffectTo: aPlayer positionIncrementedBy: anInteger [
	self updatePositionBy: anInteger OfThePlayer: aPlayer
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
	(self positionFor: aPlayer) >= self boardLength
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
	self updatePositionBy: aNumberOfCells OfThePlayer: aPlayer
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
Game >> updatePositionBy: aNumberOfCells OfThePlayer: aPlayer [
	playersPosition at: aPlayer name put: (self positionFor: aPlayer) + aNumberOfCells.
	self gameHasEndedIfBoardLenghtHasBeenReachedBy: aPlayer
]
