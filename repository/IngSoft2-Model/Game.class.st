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
Game >> applyPositionEffectTo: aPlayer [ 
	(self effectInPositionOf: aPlayer) triggerOn: self and: aPlayer
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
	^ playersOrder currentElement
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
Game >> endsIfBoardLengthHasBeenReachedBy: aPlayer [
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
	playersOrder := CircularIterator over: (aCollectionOfPlayers collect: [ :each | each name ]).
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
	playersOrder updateIteration
]

{ #category : #updating }
Game >> playTurn: aPlayer [ 
	state nextTurnAt: self playedBy: aPlayer .
]

{ #category : #accessing }
Game >> positionFor: aPlayer [
	^ ((playersPosition at: aPlayer) % self boardLength = 0)
		ifTrue: [ self boardLength ]
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
Game >> turnOf: aName [
	^ aName = playersOrder currentElement 
		ifFalse: [ AssertionFailure signal: ('This isn''t the turn of {1}' format: {aName}) ]
]

{ #category : #accessing }
Game >> turnOrder [
	^ playersOrder collection
]

{ #category : #updating }
Game >> updatePositionBy: aNumberOfCells OfThePlayer: aPlayer [
	playersPosition at: aPlayer put: (playersPosition at: aPlayer) + aNumberOfCells.
	self endsIfBoardLengthHasBeenReachedBy: aPlayer
]
