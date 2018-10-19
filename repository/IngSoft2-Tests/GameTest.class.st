Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameTest >> assert: a hasTheSameOrderThan: b [
	self assert: a equals: b asOrderedCollection
]

{ #category : #tests }
GameTest >> collectionOf20NoEffect [
	^ {NoEffect new.
	NoEffect new.
	NoEffect new.
	NoEffect new.
	NoEffect new.
	NoEffect new.
	NoEffect new.
	NoEffect new.
	NoEffect new.
	NoEffect new.
	NoEffect new.
	NoEffect new.
	NoEffect new.
	NoEffect new.
	NoEffect new.
	NoEffect new.
	NoEffect new.
	NoEffect new.
	NoEffect new.
	NoEffect new}
]

{ #category : #tests }
GameTest >> collectionOf5NoEffect [
	^ {NoEffect new.
	NoEffect new.
	NoEffect new.
	NoEffect new.
	NoEffect new}
]

{ #category : #tests }
GameTest >> testCreateGame [
	| aGame aPlayerNamedLeo aPlayerNamedGlenn aDie board aCollection |
	aPlayerNamedLeo := Player named: 'Leo'.
	aPlayerNamedGlenn := Player named: 'Glenn'.
	aCollection := {1 . 2 . 3 . 4 . 5}.
	aDie := Die
		withSides: 4
		andGenerator: (CircularIterator over: aCollection).
	board := self collectionOf20NoEffect.
	aGame := Game
		playedBy:
			{aPlayerNamedLeo.
			aPlayerNamedGlenn}
		throwing:
			{aDie.
			aDie}
		in: board
		andAmountOfLaps: 1.
	self assert: aGame boardLength equals: 20.
	self assert: (aGame positionFor: aPlayerNamedLeo) equals: 1.
	self assert: (aGame positionFor: aPlayerNamedGlenn) equals: 1.
	self
		assert: aGame dice
		equals:
			{aDie.
			aDie}
]

{ #category : #tests }
GameTest >> testCreateGameWithBoard [
| board aGame aPlayerNamedLeo aPlayerNamedGlenn aDie aCollection lapsAmount|
	aPlayerNamedLeo := Player named: 'Leo'.
	aPlayerNamedGlenn := Player named: 'Glenn'.
	aCollection := { 1 . 2 . 3 . 4 . 5 }.
	aDie := Die withSides: 4 andGenerator: (CircularIterator over: aCollection).
	board := { NoEffect new. WormholeEffect new. SpeedUpEffect new. AtomicEffect new. MoonWalkEffect withSteps: 1}.
	lapsAmount := 3.
	aGame := Game
		playedBy:
			{aPlayerNamedLeo.
			aPlayerNamedGlenn}
		throwing:
			{aDie.
			aDie}
		in: board
		andAmountOfLaps: lapsAmount.
		self assert: aGame board equals: board
]

{ #category : #tests }
GameTest >> testCreateGameWithLaps [
| aGame aPlayerNamedLeo aPlayerNamedGlenn aDie boardLength aCollection lapsAmount|
	aPlayerNamedLeo := Player named: 'Leo'.
	aPlayerNamedGlenn := Player named: 'Glenn'.
	aCollection := { 1 . 2 . 3 . 4 . 5 }.
	aDie := Die withSides: 4 andGenerator: (CircularIterator over: aCollection).
	boardLength := self collectionOf20NoEffect.
	lapsAmount := 3.
	aGame := Game
		playedBy:
			{aPlayerNamedLeo.
			aPlayerNamedGlenn}
		throwing:
			{aDie.
			aDie}
		in: boardLength
		andAmountOfLaps: lapsAmount.
		self assert: aGame laps equals: 3
]

{ #category : #tests }
GameTest >> testCreateGameWithTurnOrder [
	| aGame aPlayerNamedLeo aPlayerNamedGlenn aDie boardLength aCollection |
	aPlayerNamedLeo := Player named: 'Leo'.
	aPlayerNamedGlenn := Player named: 'Glenn'.
	aCollection := {1 . 2 . 3 . 4 . 5}.
	aDie := Die
		withSides: 4
		andGenerator: (CircularIterator over: aCollection).
	boardLength := self collectionOf20NoEffect.
	aGame := Game
		playedBy:
			{aPlayerNamedLeo.
			aPlayerNamedGlenn}
		throwing:
			{aDie.
			aDie}
		in: boardLength
		andAmountOfLaps: 1.
	self assert: aGame boardLength equals: 20.
	self assert: (aGame positionFor: aPlayerNamedLeo) equals: 1.
	self assert: (aGame positionFor: aPlayerNamedGlenn) equals: 1.
	self
		assert: aGame dice
		equals:
			{aDie.
			aDie}.
	self assert: aGame turnOrder equals: {'Leo' . 'Glenn'}
]

{ #category : #tests }
GameTest >> testGameWithLapsHasEnded [
	| aGame aPlayerNamedLeo aDie boardLength |
	aPlayerNamedLeo := Player named: 'Leo'.
	boardLength := self collectionOf5NoEffect.
	aDie := Die withSides: 4 andGenerator: (CircularIterator over: {5}).
	aGame := Game
		playedBy: {aPlayerNamedLeo}
		throwing: {aDie}
		in: boardLength
		andAmountOfLaps: 3.
	self assert: (aGame lapFor: aPlayerNamedLeo) equals: 0.
	self assert: (aGame positionFor: aPlayerNamedLeo) equals: 1.
	aPlayerNamedLeo takesATurnIn: aGame.
	self assert: (aGame lapFor: aPlayerNamedLeo) equals: 1.
	self assert: (aGame positionFor: aPlayerNamedLeo) equals: 1.
	aPlayerNamedLeo takesATurnIn: aGame.
	self assert: (aGame lapFor: aPlayerNamedLeo) equals: 2.
	self assert: (aGame positionFor: aPlayerNamedLeo) equals: 1.
	aPlayerNamedLeo takesATurnIn: aGame.
	self assert: (aGame lapFor: aPlayerNamedLeo) equals: 3.
	self assert: (aGame positionFor: aPlayerNamedLeo) equals: 1.
	aPlayerNamedLeo takesATurnIn: aGame.
	self assert: (aGame lapFor: aPlayerNamedLeo) equals: 3.
	self assert: (aGame positionFor: aPlayerNamedLeo) equals: 1
]

{ #category : #tests }
GameTest >> testGiveResultUsingArrayBasedRollGenerator [
	| aGame aPlayerNamedLeo aPlayerNamedAlbert aPlayerNamedGlenn aDie anotherDie oneMoreDie boardLength |
	aPlayerNamedLeo := Player named: 'Leo'.
	aPlayerNamedAlbert := Player named: 'Albert'.
	aPlayerNamedGlenn := Player named: 'Glenn'.
	boardLength := 80.
	aDie := Die
		withSides: 6
		andGenerator: (CircularIterator over: {1 . 2 . 3 . 5 . 6 . 40}).
	anotherDie := Die
		withSides: 6
		andGenerator: (CircularIterator over: {1 . 2 . 3 . 5 . 6 . 40}).
	oneMoreDie := Die
		withSides: 6
		andGenerator: (CircularIterator over: {1 . 2 . 3 . 5 . 6 . 40}).
	"this way, we are assured that the third player will win"
	aGame := Game
		playedBy:
			{aPlayerNamedLeo.
			aPlayerNamedAlbert.
			aPlayerNamedGlenn}
		throwing:
			{aDie.
			anotherDie.
			oneMoreDie}
		in: boardLength
		andAmountOfLaps: 1.
	"1st round start:"
	aPlayerNamedLeo takesATurnIn: aGame.
	aPlayerNamedAlbert takesATurnIn: aGame.
	aPlayerNamedGlenn takesATurnIn: aGame.
	"1st round end."
	"2nd round start:"
	aPlayerNamedLeo takesATurnIn: aGame.
	aPlayerNamedAlbert takesATurnIn: aGame.
	aPlayerNamedGlenn takesATurnIn: aGame.
	"2nd round end."
	"results:"
	self assert: (aGame positionFor: aPlayerNamedLeo) equals: 18.
	self assert: (aGame positionFor: aPlayerNamedAlbert) equals: 24.
	self assert: (aGame positionFor: aPlayerNamedGlenn) equals: 49
]

{ #category : #tests }
GameTest >> testGiveResultUsingSecuentialRollGenerator [
	| aGame aPlayerNamedLeo aPlayerNamedAlbert aPlayerNamedGlenn aDie anotherDie oneMoreDie boardLength |
	aPlayerNamedLeo := Player named: 'Leo'.
	aPlayerNamedAlbert := Player named: 'Albert'.
	aPlayerNamedGlenn := Player named: 'Glenn'.
	boardLength := 16.
	aDie := Die
		withSides: 4
		andGenerator: (CircularIterator over: {1 . 2 . 3 . 4}).
	anotherDie := Die
		withSides: 6
		andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5 . 6}).
	oneMoreDie := Die
		withSides: 5
		andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	aGame := Game
		playedBy:
			{aPlayerNamedLeo.
			aPlayerNamedAlbert.
			aPlayerNamedGlenn}
		throwing:
			{aDie.
			anotherDie.
			oneMoreDie}
		in: boardLength
		andAmountOfLaps: 1.
	"1st round start:"
	aPlayerNamedLeo takesATurnIn: aGame.
	aPlayerNamedAlbert takesATurnIn: aGame.
	aPlayerNamedGlenn takesATurnIn: aGame.
	"1st round end."
	self assert: (aGame positionFor: aPlayerNamedLeo) equals: 3.
	self assert: (aGame positionFor: aPlayerNamedAlbert) equals: 6.
	self assert: (aGame positionFor: aPlayerNamedGlenn) equals: 9.
	"2nd round start:"
	aPlayerNamedLeo takesATurnIn: aGame.
	aPlayerNamedAlbert takesATurnIn: aGame.
	aPlayerNamedGlenn takesATurnIn: aGame.
	"2nd round end."
	"results:"
	self assert: (aGame positionFor: aPlayerNamedLeo) equals: 15.
	self assert: (aGame positionFor: aPlayerNamedAlbert) equals: 1.
	self assert: (aGame positionFor: aPlayerNamedGlenn) equals: 9
]

{ #category : #tests }
GameTest >> testLapForPlayer [
	| aGame aPlayerNamedLeo aPlayerNamedAlbert aPlayerNamedGlenn aDie anotherDie oneMoreDie boardLength |
	aPlayerNamedLeo := Player named: 'Leo'.
	aPlayerNamedAlbert := Player named: 'Albert'.
	aPlayerNamedGlenn := Player named: 'Glenn'.
	boardLength := 20.
	aDie := Die
		withSides: 4
		andGenerator: (CircularIterator over: {1 . 7 . 1 }).
	anotherDie := Die
		withSides: 4
		andGenerator: (CircularIterator over: {1 . 7 . 1 }).
	oneMoreDie := Die
		withSides: 4
		andGenerator: (CircularIterator over: {1 . 7 . 1 }).
	aGame := Game
		playedBy:
			{aPlayerNamedLeo.
			aPlayerNamedAlbert.
			aPlayerNamedGlenn}
		throwing:
			{aDie.
			anotherDie.
			oneMoreDie}
		in: boardLength
		andAmountOfLaps: 2.
		aPlayerNamedLeo takesATurnIn: aGame.
		self assert: (aGame lapFor: aPlayerNamedLeo) equals: 1.
		aPlayerNamedAlbert takesATurnIn: aGame.
		self assert: (aGame positionFor: aPlayerNamedAlbert) equals: 1.
		self assert: (aGame lapFor: aPlayerNamedAlbert) equals: 2.
		aPlayerNamedGlenn takesATurnIn: aGame.
		self assert: (aGame lapFor: aPlayerNamedGlenn ) equals: 1.
		aPlayerNamedLeo takesATurnIn: aGame.
		self assert: (aGame lapFor: aPlayerNamedLeo) equals: 1.
		aPlayerNamedAlbert takesATurnIn: aGame.
		self assert: (aGame positionFor: aPlayerNamedAlbert) equals: 2.
		self assert: (aGame lapFor: aPlayerNamedAlbert) equals: 3.
]

{ #category : #tests }
GameTest >> testPositionForWithLaps [
	| aGame aPlayerNamedLeo aPlayerNamedAlbert aPlayerNamedGlenn aDie anotherDie oneMoreDie boardLength |
	aPlayerNamedLeo := Player named: 'Leo'.
	aPlayerNamedAlbert := Player named: 'Albert'.
	aPlayerNamedGlenn := Player named: 'Glenn'.
	boardLength := 20.
	aDie := Die
		withSides: 4
		andGenerator: (CircularIterator over: {1 . 5 . 1 }).
	anotherDie := Die
		withSides: 4
		andGenerator: (CircularIterator over: {1 . 5 . 1 }).
	oneMoreDie := Die
		withSides: 4
		andGenerator: (CircularIterator over: {1 . 5 . 1 }).
	aGame := Game
		playedBy:
			{aPlayerNamedLeo.
			aPlayerNamedAlbert.
			aPlayerNamedGlenn}
		throwing:
			{aDie.
			anotherDie.
			oneMoreDie}
		in: boardLength
		andAmountOfLaps: 2.
		aPlayerNamedLeo takesATurnIn: aGame.
		self assert: (aGame positionFor: aPlayerNamedLeo) equals: 3.
		aPlayerNamedAlbert takesATurnIn: aGame.
		self assert: (aGame positionFor: aPlayerNamedAlbert) equals: 15.
		aPlayerNamedGlenn takesATurnIn: aGame.
		self assert: (aGame positionFor: aPlayerNamedGlenn ) equals: 3.
		aPlayerNamedLeo takesATurnIn: aGame.
		self assert: (aGame positionFor: aPlayerNamedLeo) equals: 6.
		aPlayerNamedAlbert takesATurnIn: aGame.
		self assert: (aGame positionFor: aPlayerNamedAlbert) equals: 10.
]

{ #category : #tests }
GameTest >> testReturnLengthOfBoard [
| board aGame aPlayerNamedLeo aPlayerNamedGlenn aDie aCollection lapsAmount|
	aPlayerNamedLeo := Player named: 'Leo'.
	aPlayerNamedGlenn := Player named: 'Glenn'.
	aCollection := { 1 . 2 . 3 . 4 . 5 }.
	aDie := Die withSides: 4 andGenerator: (CircularIterator over: aCollection).
	board := { NoEffect new. WormholeEffect new. SpeedUpEffect new. AtomicEffect new. MoonWalkEffect withSteps: 1}.
	lapsAmount := 3.
	aGame := Game
		playedBy:
			{aPlayerNamedLeo.
			aPlayerNamedGlenn}
		throwing:
			{aDie.
			aDie}
		in: board
		andAmountOfLaps: lapsAmount.
		self assert: aGame boardLength  equals: board size
]

{ #category : #tests }
GameTest >> testReturnRanking [
	| aGame aPlayerNamedLeo aPlayerNamedAlbert aPlayerNamedGlenn aDie anotherDie oneMoreDie boardLength |
	aPlayerNamedLeo := Player named: 'Leo'.
	aPlayerNamedAlbert := Player named: 'Albert'.
	aPlayerNamedGlenn := Player named: 'Glenn'.
	boardLength := 16.
	aDie := Die withSides: 4 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4}).
	anotherDie := Die withSides: 6 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5 . 6}).
	oneMoreDie := Die withSides: 5 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	aGame := Game
		playedBy:
			{aPlayerNamedLeo.
			aPlayerNamedAlbert.
			aPlayerNamedGlenn}
		throwing:
			{aDie.
			anotherDie.
			oneMoreDie}
		in: boardLength
		andAmountOfLaps: 1.
	"1st round start:"
	aPlayerNamedLeo takesATurnIn: aGame.
	aPlayerNamedAlbert takesATurnIn: aGame.
	aPlayerNamedGlenn takesATurnIn: aGame.
	"1st round end."
	self assert: (aGame positionFor: aPlayerNamedLeo) equals: 3.
	self assert: (aGame positionFor: aPlayerNamedAlbert) equals: 6.
	self assert: (aGame positionFor: aPlayerNamedGlenn) equals: 9.
	self
		assert: aGame ranking
		hasTheSameOrderThan:
			{aPlayerNamedGlenn.
			aPlayerNamedAlbert.
			aPlayerNamedLeo}.
	"2nd round start:"
	aPlayerNamedLeo takesATurnIn: aGame.
	aPlayerNamedAlbert takesATurnIn: aGame.
	aPlayerNamedGlenn takesATurnIn: aGame.
	"2nd round end."
	"results:"
	self assert: (aGame positionFor: aPlayerNamedLeo) equals: 15.
	self assert: (aGame positionFor: aPlayerNamedAlbert) equals: 1.
	self assert: (aGame positionFor: aPlayerNamedGlenn) equals: 9
]

{ #category : #tests }
GameTest >> testSimulateTurn [
	| aGame aPlayerNamedLeo aPlayerNamedAlbert aPlayerNamedGlenn aDie anotherDie oneMoreDie boardLength |
	aPlayerNamedLeo := Player named: 'Leo'.
	aPlayerNamedAlbert := Player named: 'Albert'.
	aPlayerNamedGlenn := Player named: 'Glenn'.
	boardLength := 20.
	aDie := Die
		withSides: 4
		andGenerator: (CircularIterator over: {1 . 2 . 3 . 4}).
	anotherDie := Die
		withSides: 6
		andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5 . 6}).
	oneMoreDie := Die
		withSides: 5
		andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	aGame := Game
		playedBy:
			{aPlayerNamedLeo.
			aPlayerNamedAlbert.
			aPlayerNamedGlenn}
		throwing:
			{aDie.
			anotherDie.
			oneMoreDie}
		in: boardLength
		andAmountOfLaps: 1.
	aPlayerNamedLeo takesATurnIn: aGame.
	aPlayerNamedAlbert takesATurnIn: aGame.
	aPlayerNamedGlenn takesATurnIn: aGame.
	self assert: (aGame positionFor: aPlayerNamedLeo) equals: 3.
	self assert: (aGame positionFor: aPlayerNamedAlbert) equals: 6.
	self assert: (aGame positionFor: aPlayerNamedGlenn) equals: 9
]

{ #category : #tests }
GameTest >> testSimulateTurnWithAtomicEffect [
	| board aGame aPlayerNamedLeo aPlayerNamedGlenn aDie aCollection lapsAmount |
	aPlayerNamedLeo := Player named: 'Leo'.
	aPlayerNamedGlenn := Player named: 'Glenn'.
	aCollection := {1}.
	aDie := Die withSides: 4 andGenerator: (CircularIterator over: aCollection).
	board := {NoEffect new.
	NoEffect new.
	AtomicEffect new.
	NoEffect new.
	NoEffect new}.
	lapsAmount := 3.
	aGame := Game
		playedBy:
			{aPlayerNamedLeo.
			aPlayerNamedGlenn}
		throwing: {aDie}
		in: board
		andAmountOfLaps: lapsAmount.
	aPlayerNamedLeo takesATurnIn: aGame.
	self assert: (aGame positionFor: aPlayerNamedLeo) equals: 2.
	self assert: (aGame lapFor: aPlayerNamedLeo) equals: 0.
	aPlayerNamedGlenn takesATurnIn: aGame.
	self assert: (aGame positionFor: aPlayerNamedGlenn) equals: 2.
	self assert: (aGame lapFor: aPlayerNamedGlenn) equals: 0.
	aPlayerNamedLeo takesATurnIn: aGame.
	self assert: (aGame positionFor: aPlayerNamedLeo) equals: 0.
	self assert: (aGame lapFor: aPlayerNamedLeo) equals: 0.
	self assert: (aGame positionFor: aPlayerNamedGlenn) equals: 0.
	self assert: (aGame lapFor: aPlayerNamedGlenn) equals: 0
]

{ #category : #tests }
GameTest >> testSimulateTurnWithCorrectOrderOfPlayers [
	| aGame aPlayerNamedLeo aPlayerNamedAlbert aPlayerNamedGlenn aDie anotherDie oneMoreDie boardLength |
	aPlayerNamedLeo := Player named: 'Leo'.
	aPlayerNamedAlbert := Player named: 'Albert'.
	aPlayerNamedGlenn := Player named: 'Glenn'.
	boardLength := 20.
	aDie := Die
		withSides: 4
		andGenerator: (CircularIterator over: {1 . 2 . 3 . 4}).
	anotherDie := Die
		withSides: 6
		andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5 . 6}).
	oneMoreDie := Die
		withSides: 5
		andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	aGame := Game
		playedBy:
			{aPlayerNamedLeo.
			aPlayerNamedAlbert.
			aPlayerNamedGlenn}
		throwing:
			{aDie.
			anotherDie.
			oneMoreDie}
		in: boardLength
		andAmountOfLaps: 1.
	self assert: aGame currentPlayerTurn equals: 'Leo'.
	aPlayerNamedLeo takesATurnIn: aGame.
	self assert: aGame currentPlayerTurn equals: 'Albert'.
	aPlayerNamedAlbert takesATurnIn: aGame.
	self assert: aGame currentPlayerTurn equals: 'Glenn'.
	aPlayerNamedGlenn takesATurnIn: aGame.
	self assert: (aGame positionFor: aPlayerNamedLeo) equals: 3.
	self assert: (aGame positionFor: aPlayerNamedAlbert) equals: 6.
	self assert: (aGame positionFor: aPlayerNamedGlenn) equals: 9
]

{ #category : #tests }
GameTest >> testSimulateTurnWithMoonWalkEffect [
	| board aGame aPlayerNamedLeo aPlayerNamedGlenn aDie aCollection lapsAmount |
	aPlayerNamedLeo := Player named: 'Leo'.
	aPlayerNamedGlenn := Player named: 'Glenn'.
	aCollection := {1}.
	aDie := Die withSides: 4 andGenerator: (CircularIterator over: aCollection).
	board := {NoEffect new.
	(MoonWalkEffect withSteps: 2).
	NoEffect new.
	NoEffect new.
	NoEffect new}.
	lapsAmount := 3.
	aGame := Game
		playedBy:
			{aPlayerNamedLeo.
			aPlayerNamedGlenn}
		throwing: {aDie}
		in: board
		andAmountOfLaps: lapsAmount.
	aPlayerNamedLeo takesATurnIn: aGame.
	self assert: (aGame positionFor: aPlayerNamedLeo) equals: 2.
	self assert: (aGame lapFor: aPlayerNamedLeo) equals: 0.
	self assert: (aGame positionFor: aPlayerNamedGlenn) equals: 4.
	self assert: (aGame lapFor: aPlayerNamedGlenn) equals: -1
	"was in position 1 (NoEffect), die rolled 1, goes to position 2 but there's a MoonWalk (with 2 steps), everyone else goes 2 positions backwards, they end in position 4 on lap -1."
]

{ #category : #tests }
GameTest >> testSimulateTurnWithSpeedUpEffect [
	| board aGame aPlayerNamedLeo aPlayerNamedGlenn aDie aCollection lapsAmount |
	aPlayerNamedLeo := Player named: 'Leo'.
	aPlayerNamedGlenn := Player named: 'Glenn'.
	aCollection := {1}.
	aDie := Die withSides: 4 andGenerator: (CircularIterator over: aCollection).
	board := {NoEffect new.
	SpeedUpEffect new.
	NoEffect new.
	NoEffect new.
	NoEffect new}.
	lapsAmount := 3.
	aGame := Game
		playedBy:
			{aPlayerNamedLeo.
			aPlayerNamedGlenn}
		throwing: {aDie}
		in: board
		andAmountOfLaps: lapsAmount.
	aPlayerNamedLeo takesATurnIn: aGame.
	self assert: (aGame positionFor: aPlayerNamedLeo) equals: 1.
	self assert: (aGame lapFor: aPlayerNamedLeo) equals: 1
	"was in position 1 (NoEffect), die rolled 1, goes to position 2 but there's a SpeedUp, goes 4 positions forward, ends in position 1 on lap 1."
]

{ #category : #tests }
GameTest >> testSimulateTurnWithWormholeEffect [
	| board aGame aPlayerNamedLeo aPlayerNamedGlenn aDie aCollection lapsAmount |
	aPlayerNamedLeo := Player named: 'Leo'.
	aPlayerNamedGlenn := Player named: 'Glenn'.
	aCollection := {1}.
	aDie := Die withSides: 4 andGenerator: (CircularIterator over: aCollection).
	board := {NoEffect new.
	WormholeEffect new.
	NoEffect new.
	NoEffect new.
	NoEffect new}.
	lapsAmount := 3.
	aGame := Game
		playedBy:
			{aPlayerNamedLeo.
			aPlayerNamedGlenn}
		throwing: {aDie}
		in: board
		andAmountOfLaps: lapsAmount.
	aPlayerNamedLeo takesATurnIn: aGame.
	self assert: (aGame positionFor: aPlayerNamedLeo) equals: 3.
	self assert: (aGame lapFor: aPlayerNamedLeo) equals: -1
	"was in position 1 (NoEffect), die rolled 1, goes to position 2 but there's a Wormhole, goes back 4 positions, ends in position 3 on lap -1."
]

{ #category : #tests }
GameTest >> testSimulateTurnWithWrongOrderOfPlayersRaisesException [
	| aGame aPlayerNamedLeo aPlayerNamedAlbert aPlayerNamedGlenn aDie anotherDie oneMoreDie boardLength |
	aPlayerNamedLeo := Player named: 'Leo'.
	aPlayerNamedAlbert := Player named: 'Albert'.
	aPlayerNamedGlenn := Player named: 'Glenn'.
	boardLength := self collectionOf20NoEffect.
	aDie := Die
		withSides: 4
		andGenerator: (CircularIterator over: {1 . 2 . 3 . 4}).
	anotherDie := Die
		withSides: 6
		andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5 . 6}).
	oneMoreDie := Die
		withSides: 5
		andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	aGame := Game
		playedBy:
			{aPlayerNamedLeo.
			aPlayerNamedAlbert.
			aPlayerNamedGlenn}
		throwing:
			{aDie.
			anotherDie.
			oneMoreDie}
		in: boardLength
		andAmountOfLaps: 1.
	self assert: aGame currentPlayerTurn equals: 'Leo'.
	aPlayerNamedLeo takesATurnIn: aGame.
	self assert: aGame currentPlayerTurn equals: 'Albert'.
	self
		should: [ aPlayerNamedGlenn takesATurnIn: aGame ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | 
			self
				assert: signal messageText
				equals: 'This isn''t the turn of Glenn' ].
	aPlayerNamedAlbert takesATurnIn: aGame.
	self assert: aGame currentPlayerTurn equals: 'Glenn'.
	aPlayerNamedGlenn takesATurnIn: aGame.
	self assert: (aGame positionFor: aPlayerNamedLeo) equals: 4.
	self assert: (aGame positionFor: aPlayerNamedAlbert) equals: 7.
	self assert: (aGame positionFor: aPlayerNamedGlenn) equals: 10
]
