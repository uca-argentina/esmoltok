Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'dice',
		'playersPosition',
		'state',
		'playersOrder',
		'laps',
		'board'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> playedBy: aPlayer throwing: aDice in: aBoard andAmountOfLaps: aLapAmount [
	^ self new
		initializePlayedBy: aPlayer
		throwing: aDice
		in: aBoard
		andAmountOfLaps: aLapAmount 
]

{ #category : #updating }
Game >> applyAtomicEffect: aPlayer [
	playersPosition
		associationsDo:
			[ :each | self updatePositionBy: (each value) negated OfThePlayer: each key]
]

{ #category : #updating }
Game >> applyMoonWalkEffectExcluding: aPlayer steps: steps [
	playersPosition
		associationsDo: [ :each | 
			each key = aPlayer
				ifFalse: [ self updatePositionBy: steps OfThePlayer: each key ] ]
]

{ #category : #'as yet unclassified' }
Game >> applyPositionEffectTo: aPlayer [ 
	(self effectInPositionOf: aPlayer) triggerOn: self and: aPlayer
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
Game >> board [
	^ board
]

{ #category : #accessing }
Game >> boardLength [
	^ board size
]

{ #category : #accessing }
Game >> currentPlayerTurn [
	^playersOrder currentTurn  
]

{ #category : #accessing }
Game >> dice [
	^ dice
]

{ #category : #accessing }
Game >> effectInPositionOf: aPlayer [ 
	^board at: (self positionFor: aPlayer)
]

{ #category : #updating }
Game >> ends [
	state := FinishedState new.
]

{ #category : #updating }
Game >> gameHasEndedIfBoardLengthHasBeenReachedBy: aPlayer [
	(playersPosition at: aPlayer) >=( self boardLength * laps)
		ifTrue: [ self ends ]
]

{ #category : #initialization }
Game >> initializePlayedBy: aCollectionOfPlayers throwing: aCollectionOfDice in: aBoard andAmountOfLaps: aLapAmount [
	board := aBoard.
	laps := aLapAmount.
	dice := aCollectionOfDice.
	playersPosition := Dictionary new.
	aCollectionOfPlayers do: [ :each | playersPosition at: each put: 1 ].
	playersOrder := Turn names: (aCollectionOfPlayers collect: [ :each | each name ]).
	state := RunningState new
]

{ #category : #updating }
Game >> isPlayedBy: aPlayer [
	| aNumberOfCells |
	self turnOf: aPlayer name.
	aNumberOfCells := aPlayer throwDice: self dice.
	self updatePositionBy: aNumberOfCells OfThePlayer: aPlayer.
	self applyPositionEffectTo: aPlayer.
	self nextPlayerTurn
]

{ #category : #accessing }
Game >> lapFor: aPlayer [
	^ (playersPosition at: aPlayer) // self boardLength
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
	^ (playersPosition at: aPlayer) = self boardLength
		ifTrue: [ 1 ]
		ifFalse: [ (playersPosition at: aPlayer) % self boardLength ]
]

{ #category : #accessing }
Game >> positionOfPlayers [
	^ playersPosition
]

{ #category : #interaction }
Game >> ranking [
	^(playersPosition associations asSortedCollection: [ :first :second | first value > second value ])
		collect: [ :assoc | assoc key ]
		
]

{ #category : #assertions }
Game >> turnOf: aPlayer [
	playersOrder turnOf: aPlayer
]

{ #category : #accessing }
Game >> turnOrder [
	^ playersOrder order
]

{ #category : #updating }
Game >> updatePositionBy: aNumberOfCells OfThePlayer: aPlayer [
	playersPosition at: aPlayer put: (playersPosition at: aPlayer) + aNumberOfCells.
	self gameHasEndedIfBoardLengthHasBeenReachedBy: aPlayer
]
