Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'boardLength',
		'dice',
		'playersPosition',
		'state',
		'playersOrder',
		'laps'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> playedBy: aPlayer throwing: aDice inABoardOfLenght: aBoardLength andAmountOfLaps: aLapAmount [
	^ self new
		initializePlayedBy: aPlayer
		throwing: aDice
		inABoardOfLength: aBoardLength
		andAmountOfLaps: aLapAmount 
]

{ #category : #updating }
Game >> applyAtomicEffect: aPlayer [
	playersPosition
		associationsDo:
			[ :each | self updatePositionBy: (self positionFor: (Player named: each key)) OfThePlayer: (Player named: each key) ]
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
Game >> currentPlayerTurn [
	^playersOrder currentTurn  
]

{ #category : #accessing }
Game >> dice [
	^ dice
]

{ #category : #updating }
Game >> ends [
	state := FinishedState new.
]

{ #category : #updating }
Game >> gameHasEndedIfBoardLengthHasBeenReachedBy: aPlayer [
	(playersPosition at: aPlayer name) >=( boardLength * laps)
		ifTrue: [ self ends ]
]

{ #category : #initialization }
Game >> initializePlayedBy: aCollectionOfPlayers throwing: aCollectionOfDice inABoardOfLength: aBoardLength andAmountOfLaps: aLapAmount [
	boardLength := aBoardLength.
	laps :=aLapAmount .
	dice := aCollectionOfDice.
	playersPosition := Dictionary new.
	aCollectionOfPlayers
		inject: 0
		into: [ :position :each | playersPosition at: each name put: position ].
	playersOrder := Turn names: (aCollectionOfPlayers collect: [:each | each name]).
	state := RunningState new
]

{ #category : #updating }
Game >> isPlayedBy: aPlayer [
	| aNumberOfCells |
	self turnOf: aPlayer.
	aNumberOfCells := aPlayer throwDice: self dice.
	self updatePositionBy: aNumberOfCells OfThePlayer: aPlayer.
	self nextPlayerTurn
]

{ #category : #accessing }
Game >> lapFor: aPlayer [
	^ ((playersPosition at: aPlayer name) // boardLength)+1
]

{ #category : #accessing }
Game >> laps [
	^ laps
]

{ #category : #updating }
Game >> nextPlayerTurn [
	playersOrder updateToNextTurn
]

{ #category : #updating }
Game >> playTurn: aPlayer [ 
	state nextTurnAt: self playedBy: aPlayer .
]

{ #category : #accessing }
Game >> positionFor: aPlayer [
	^ ((playersPosition at: aPlayer name) % boardLength)
]

{ #category : #accessing }
Game >> positionOfPlayers [
	^ playersPosition
]

{ #category : #assertions }
Game >> turnOf: aPlayer [
	playersOrder turnOf: aPlayer name
]

{ #category : #accessing }
Game >> turnOrder [
	^ playersOrder order
]

{ #category : #updating }
Game >> updatePositionBy: aNumberOfCells OfThePlayer: aPlayer [
	playersPosition at: aPlayer name put: (self positionFor: aPlayer) + aNumberOfCells.
	self gameHasEndedIfBoardLengthHasBeenReachedBy: aPlayer
]
