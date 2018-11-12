Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'dice',
		'playersPosition',
		'state',
		'playersOrder',
		'laps',
		'board',
		'cards',
		'lastEffectPlayer',
		'lastPlayedCard'
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
Game >> addCard: aCard asociatedWith: aPlayerCollection [ 
	cards at: aCard put: aPlayerCollection
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
Game >> cards [
	^ cards
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

{ #category : #assertion }
Game >> hasCard: aCard [ 
	^cards includesKey: aCard  
]

{ #category : #assertion }
Game >> hasPermanentCards [
	^(cards isNotEmpty)
]

{ #category : #initialization }
Game >> initializePlayedBy: aCollectionOfPlayers throwing: aCollectionOfDice in: aBoard andAmountOfLaps: aLapAmount [
	board := aBoard.
	laps := aLapAmount.
	dice := aCollectionOfDice.
	playersPosition := Dictionary new.
	aCollectionOfPlayers do: [ :each | playersPosition at: each put: 1 ].
	playersOrder := CircularIterator over: (aCollectionOfPlayers collect: [ :each | each]).
	state := RunningState new.
	cards := Dictionary new.
	lastEffectPlayer := (NoEffect new)->(self currentPlayerTurn).
	lastPlayedCard := BlankCard new
]

{ #category : #testing }
Game >> isPlayedBy: aPlayer [
	| aNumberOfCells |
	self turnOf: aPlayer.
	aNumberOfCells := aPlayer throwDice: self dice.
	self updatePositionBy: aNumberOfCells OfThePlayer: aPlayer.
	self updateLastEffectPlayer: aPlayer.
	self playCards.
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

{ #category : #accessing }
Game >> lastEffectPlayer [
	^lastEffectPlayer
]

{ #category : #accessing }
Game >> lastPlayedCard [
	^lastPlayedCard
]

{ #category : #updating }
Game >> nextPlayerTurn [
	playersOrder updateIteration
]

{ #category : #interaction }
Game >> playCards [
	cards associationsDo:
			[ :each | each key activateOn: self to: (each value)]
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

{ #category : #updating }
Game >> removeCard: aCard [ 
	cards removeKey: aCard 
]

{ #category : #assertion }
Game >> turnOf: player [
	^ player = playersOrder currentElement 
		ifFalse: [ AssertionFailure signal: ('This isn''t the turn of {1}' format: {player name}) ]
]

{ #category : #accessing }
Game >> turnOrder [
	^ playersOrder collection
]

{ #category : #updating }
Game >> updateLastEffectPlayer: aPlayer [ 
	lastEffectPlayer := (self effectInPositionOf: aPlayer)->(aPlayer)
]

{ #category : #updating }
Game >> updateLastPlayedCard: aCard [ 
	lastPlayedCard := aCard 
]

{ #category : #updating }
Game >> updatePositionBy: aNumberOfCells OfThePlayer: aPlayer [
	playersPosition at: aPlayer put: (playersPosition at: aPlayer) + aNumberOfCells.
	self endsIfBoardLengthHasBeenReachedBy: aPlayer
]
