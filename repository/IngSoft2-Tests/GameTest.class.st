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
GameTest >> collectionOf16NoEffect [
	| noEffect result collection distributor |
	noEffect := NoEffect new.
	collection := {(noEffect -> 100)}.
	distributor := Distributor fillMetric: IterateThroughMetric new.
	result := distributor generateFrom: collection withLength: 16.
	^ result
]

{ #category : #tests }
GameTest >> collectionOf5NoEffect [
	| noEffect result collection distributor |
	noEffect := NoEffect new.
	collection := {(noEffect -> 100)}.
	distributor := Distributor fillMetric: IterateThroughMetric new.
	result := distributor generateFrom: collection withLength: 5.
	^ result
]

{ #category : #tests }
GameTest >> collectionOf80NoEffect [
	| noEffect result collection distributor |
	noEffect := NoEffect new.
	collection := {(noEffect -> 100)}.
	distributor := Distributor fillMetric: IterateThroughMetric new.
	result := distributor generateFrom: collection withLength: 80.
	^ result
]

{ #category : #tests }
GameTest >> testCreateGame [
	| game playerNamedLeo playerNamedGlenn die board collection |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedGlenn := Player named: 'Glenn'.
	collection := {1 . 2 . 3 . 4 . 5}.
	die := Die withSides: 4 andGenerator: (CircularIterator over: collection).
	board := UtilitiesForTests collectionOf20NoEffect.
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedGlenn}
		throwing:
			{die.
			die}
		in: board
		andAmountOfLaps: 1.
	self assert: game boardLength equals: 20.
	self assert: (game positionFor: playerNamedLeo) equals: 1.
	self assert: (game positionFor: playerNamedGlenn) equals: 1.
	self
		assert: game dice
		equals:
			{die.
			die}
]

{ #category : #tests }
GameTest >> testCreateGameWithBoard [
	| board game playerNamedLeo playerNamedGlenn die collection lapsAmount |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedGlenn := Player named: 'Glenn'.
	collection := {1 . 2 . 3 . 4 . 5}.
	die := Die withSides: 4 andGenerator: (CircularIterator over: collection).
	board := {NoEffect new.
	WormholeEffect new.
	SpeedUpEffect new.
	AtomicEffect new.
	(MoonWalkEffect withSteps: 1)}.
	lapsAmount := 3.
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedGlenn}
		throwing:
			{die.
			die}
		in: board
		andAmountOfLaps: lapsAmount.
	self assert: game board equals: board
]

{ #category : #tests }
GameTest >> testCreateGameWithDistribution [
	| noEffect wormHoleEffect speedUpEffect moonWalkEffect atomicEffect distributor game playerNamedLeo playerNamedGlenn die board collection lapsAmount |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedGlenn := Player named: 'Glenn'.
	distributor := Distributor fillMetric: IterateThroughMetric new.
	noEffect := NoEffect new.
	speedUpEffect := SpeedUpEffect new.
	wormHoleEffect := WormholeEffect new.
	moonWalkEffect := MoonWalkEffect withSteps: 2.
	atomicEffect := AtomicEffect new.
	collection := {(speedUpEffect -> 20).
	(noEffect -> 48).
	(wormHoleEffect -> 20).
	(moonWalkEffect -> 10).
	(atomicEffect -> 2)}.
	die := Die withSides: 4 andGenerator: (CircularIterator over: collection).
	board := distributor generateFrom: collection withLength: 100.
	lapsAmount := 3.
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedGlenn}
		throwing:
			{die.
			die}
		in: board
		andAmountOfLaps: lapsAmount.
	self
		assert: game board
		equals:
			{speedUpEffect.
			speedUpEffect.
			speedUpEffect.
			speedUpEffect.
			speedUpEffect.
			speedUpEffect.
			speedUpEffect.
			speedUpEffect.
			speedUpEffect.
			speedUpEffect.
			speedUpEffect.
			speedUpEffect.
			speedUpEffect.
			speedUpEffect.
			speedUpEffect.
			speedUpEffect.
			speedUpEffect.
			speedUpEffect.
			speedUpEffect.
			speedUpEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			wormHoleEffect.
			wormHoleEffect.
			wormHoleEffect.
			wormHoleEffect.
			wormHoleEffect.
			wormHoleEffect.
			wormHoleEffect.
			wormHoleEffect.
			wormHoleEffect.
			wormHoleEffect.
			wormHoleEffect.
			wormHoleEffect.
			wormHoleEffect.
			wormHoleEffect.
			wormHoleEffect.
			wormHoleEffect.
			wormHoleEffect.
			wormHoleEffect.
			wormHoleEffect.
			wormHoleEffect.
			moonWalkEffect.
			moonWalkEffect.
			moonWalkEffect.
			moonWalkEffect.
			moonWalkEffect.
			moonWalkEffect.
			moonWalkEffect.
			moonWalkEffect.
			moonWalkEffect.
			moonWalkEffect.
			atomicEffect.
			atomicEffect} asOrderedCollection
]

{ #category : #tests }
GameTest >> testCreateGameWithLaps [
	| game playerNamedLeo playerNamedGlenn die board collection lapsAmount |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedGlenn := Player named: 'Glenn'.
	collection := {1 . 2 . 3 . 4 . 5}.
	die := Die withSides: 4 andGenerator: (CircularIterator over: collection).
	board := UtilitiesForTests collectionOf20NoEffect.
	lapsAmount := 3.
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedGlenn}
		throwing:
			{die.
			die}
		in: board
		andAmountOfLaps: lapsAmount.
	self assert: game laps equals: 3
]

{ #category : #tests }
GameTest >> testCreateGameWithTurnOrder [
	| game playerNamedLeo playerNamedGlenn die board collection |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedGlenn := Player named: 'Glenn'.
	collection := {1 . 2 . 3 . 4 . 5}.
	die := Die withSides: 4 andGenerator: (CircularIterator over: collection).
	board := UtilitiesForTests collectionOf20NoEffect.
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedGlenn}
		throwing:
			{die.
			die}
		in: board
		andAmountOfLaps: 1.
	self assert: game boardLength equals: 20.
	self assert: (game positionFor: playerNamedLeo) equals: 1.
	self assert: (game positionFor: playerNamedGlenn) equals: 1.
	self
		assert: game dice
		equals:
			{die.
			die}.
	self assert: game turnOrder equals: {'Leo' . 'Glenn'}
]

{ #category : #tests }
GameTest >> testGameWithLapsHasEnded [
	| game playerNamedLeo die board |
	playerNamedLeo := Player named: 'Leo'.
	board := self collectionOf5NoEffect.
	die := Die withSides: 4 andGenerator: (CircularIterator over: {5}).
	game := Game
		playedBy: {playerNamedLeo}
		throwing: {die}
		in: board
		andAmountOfLaps: 3.
	self assert: (game lapFor: playerNamedLeo) equals: 0.
	self assert: (game positionFor: playerNamedLeo) equals: 1.
	playerNamedLeo takesATurnIn: game.
	self assert: (game lapFor: playerNamedLeo) equals: 1.
	self assert: (game positionFor: playerNamedLeo) equals: 1.
	playerNamedLeo takesATurnIn: game.
	self assert: (game lapFor: playerNamedLeo) equals: 2.
	self assert: (game positionFor: playerNamedLeo) equals: 1.
	playerNamedLeo takesATurnIn: game.
	self assert: (game lapFor: playerNamedLeo) equals: 3.
	self assert: (game positionFor: playerNamedLeo) equals: 1.
	playerNamedLeo takesATurnIn: game.
	self assert: (game lapFor: playerNamedLeo) equals: 3.
	self assert: (game positionFor: playerNamedLeo) equals: 1
]

{ #category : #tests }
GameTest >> testGiveResultUsingAnotherCircularIterator [
	| game playerNamedLeo playerNamedAlbert playerNamedGlenn die anotherDie oneMoreDie board |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedAlbert := Player named: 'Albert'.
	playerNamedGlenn := Player named: 'Glenn'.
	board := self collectionOf16NoEffect.
	die := Die withSides: 4 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4}).
	anotherDie := Die withSides: 6 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5 . 6}).
	oneMoreDie := Die withSides: 5 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedAlbert.
			playerNamedGlenn}
		throwing:
			{die.
			anotherDie.
			oneMoreDie}
		in: board
		andAmountOfLaps: 1.
	"1st round start:"
	playerNamedLeo takesATurnIn: game.
	playerNamedAlbert takesATurnIn: game.
	playerNamedGlenn takesATurnIn: game.
	"1st round end."
	self assert: (game positionFor: playerNamedLeo) equals: 4.
	self assert: (game positionFor: playerNamedAlbert) equals: 7.
	self assert: (game positionFor: playerNamedGlenn) equals: 10.
	"2nd round start:"
	playerNamedLeo takesATurnIn: game.
	playerNamedAlbert takesATurnIn: game.
	playerNamedGlenn takesATurnIn: game.
	"2nd round end."
	"results:"
	self assert: (game positionFor: playerNamedLeo) equals: 16.
	self assert: (game positionFor: playerNamedAlbert) equals: 7.
	self assert: (game positionFor: playerNamedGlenn) equals: 10
]

{ #category : #tests }
GameTest >> testGiveResultUsingCircularIterator [
	| game playerNamedLeo playerNamedAlbert playerNamedGlenn die anotherDie oneMoreDie board |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedAlbert := Player named: 'Albert'.
	playerNamedGlenn := Player named: 'Glenn'.
	board := self collectionOf80NoEffect.
	die := Die withSides: 6 andGenerator: (CircularIterator over: {1 . 2 . 3 . 5 . 6 . 40}).
	anotherDie := Die withSides: 6 andGenerator: (CircularIterator over: {1 . 2 . 3 . 5 . 6 . 40}).
	oneMoreDie := Die withSides: 6 andGenerator: (CircularIterator over: {1 . 2 . 3 . 5 . 6 . 40}).
	"this way, we are assured that the third player will win"
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedAlbert.
			playerNamedGlenn}
		throwing:
			{die.
			anotherDie.
			oneMoreDie}
		in: board
		andAmountOfLaps: 1.
	"1st round start:"
	playerNamedLeo takesATurnIn: game.
	playerNamedAlbert takesATurnIn: game.
	playerNamedGlenn takesATurnIn: game.
	"1st round end."
	"2nd round start:"
	playerNamedLeo takesATurnIn: game.
	playerNamedAlbert takesATurnIn: game.
	playerNamedGlenn takesATurnIn: game.
	"2nd round end."
	"results:"
	self assert: (game positionFor: playerNamedLeo) equals: 19.
	self assert: (game positionFor: playerNamedAlbert) equals: 25.
	self assert: (game positionFor: playerNamedGlenn) equals: 50
]

{ #category : #tests }
GameTest >> testLapForPlayer [
	| game playerNamedLeo playerNamedAlbert playerNamedGlenn die anotherDie oneMoreDie board |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedAlbert := Player named: 'Albert'.
	playerNamedGlenn := Player named: 'Glenn'.
	board := UtilitiesForTests collectionOf20NoEffect.
	die := Die withSides: 4 andGenerator: (CircularIterator over: {1 . 7 . 1}).
	anotherDie := Die withSides: 4 andGenerator: (CircularIterator over: {1 . 7 . 1}).
	oneMoreDie := Die withSides: 4 andGenerator: (CircularIterator over: {1 . 7 . 1}).
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedAlbert.
			playerNamedGlenn}
		throwing:
			{die.
			anotherDie.
			oneMoreDie}
		in: board
		andAmountOfLaps: 2.
	playerNamedLeo takesATurnIn: game.
	self assert: (game lapFor: playerNamedLeo) equals: 0.
	playerNamedAlbert takesATurnIn: game.
	self assert: (game positionFor: playerNamedAlbert) equals: 2.
	self assert: (game lapFor: playerNamedAlbert) equals: 1.
	playerNamedGlenn takesATurnIn: game.
	self assert: (game lapFor: playerNamedGlenn) equals: 0.
	playerNamedLeo takesATurnIn: game.
	self assert: (game lapFor: playerNamedLeo) equals: 0.
	playerNamedAlbert takesATurnIn: game.
	self assert: (game positionFor: playerNamedAlbert) equals: 3.
	self assert: (game lapFor: playerNamedAlbert) equals: 2
]

{ #category : #tests }
GameTest >> testPositionForWithLaps [
	| game playerNamedLeo playerNamedAlbert playerNamedGlenn die anotherDie oneMoreDie board |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedAlbert := Player named: 'Albert'.
	playerNamedGlenn := Player named: 'Glenn'.
	board := UtilitiesForTests collectionOf20NoEffect.
	die := Die withSides: 4 andGenerator: (CircularIterator over: {1 . 5 . 1}).
	anotherDie := Die withSides: 4 andGenerator: (CircularIterator over: {1 . 5 . 1}).
	oneMoreDie := Die withSides: 4 andGenerator: (CircularIterator over: {1 . 5 . 1}).
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedAlbert.
			playerNamedGlenn}
		throwing:
			{die.
			anotherDie.
			oneMoreDie}
		in: board
		andAmountOfLaps: 2.
	playerNamedLeo takesATurnIn: game.
	self assert: (game positionFor: playerNamedLeo) equals: 4.
	playerNamedAlbert takesATurnIn: game.
	self assert: (game positionFor: playerNamedAlbert) equals: 16.
	playerNamedGlenn takesATurnIn: game.
	self assert: (game positionFor: playerNamedGlenn) equals: 4.
	playerNamedLeo takesATurnIn: game.
	self assert: (game positionFor: playerNamedLeo) equals: 7.
	playerNamedAlbert takesATurnIn: game.
	self assert: (game positionFor: playerNamedAlbert) equals: 11
]

{ #category : #tests }
GameTest >> testReturnLengthOfBoard [
	| board game playerNamedLeo playerNamedGlenn die collection lapsAmount |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedGlenn := Player named: 'Glenn'.
	collection := {1 . 2 . 3 . 4 . 5}.
	die := Die withSides: 4 andGenerator: (CircularIterator over: collection).
	board := {NoEffect new.
	WormholeEffect new.
	SpeedUpEffect new.
	AtomicEffect new.
	(MoonWalkEffect withSteps: 1)}.
	lapsAmount := 3.
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedGlenn}
		throwing:
			{die.
			die}
		in: board
		andAmountOfLaps: lapsAmount.
	self assert: game boardLength equals: board size
]

{ #category : #tests }
GameTest >> testReturnRanking [
	| game playerNamedLeo playerNamedAlbert playerNamedGlenn die anotherDie oneMoreDie board |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedAlbert := Player named: 'Albert'.
	playerNamedGlenn := Player named: 'Glenn'.
	board := self collectionOf16NoEffect.
	die := Die withSides: 4 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4}).
	anotherDie := Die withSides: 6 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5 . 6}).
	oneMoreDie := Die withSides: 5 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedAlbert.
			playerNamedGlenn}
		throwing:
			{die.
			anotherDie.
			oneMoreDie}
		in: board
		andAmountOfLaps: 1.
	"1st round start:"
	playerNamedLeo takesATurnIn: game.
	playerNamedAlbert takesATurnIn: game.
	playerNamedGlenn takesATurnIn: game.
	"1st round end."
	self assert: (game positionFor: playerNamedLeo) equals: 4.
	self assert: (game positionFor: playerNamedAlbert) equals: 7.
	self assert: (game positionFor: playerNamedGlenn) equals: 10.
	self
		assert: game ranking
		hasTheSameOrderThan:
			{playerNamedGlenn.
			playerNamedAlbert.
			playerNamedLeo}.
	"2nd round start:"
	playerNamedLeo takesATurnIn: game.
	playerNamedAlbert takesATurnIn: game.
	playerNamedGlenn takesATurnIn: game.
	"2nd round end."
	"results:"
	self assert: (game positionFor: playerNamedLeo) equals: 16.
	self assert: (game positionFor: playerNamedAlbert) equals: 7.
	self assert: (game positionFor: playerNamedGlenn) equals: 10
]

{ #category : #tests }
GameTest >> testSimulateTurn [
	| game playerNamedLeo playerNamedAlbert playerNamedGlenn die anotherDie oneMoreDie board |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedAlbert := Player named: 'Albert'.
	playerNamedGlenn := Player named: 'Glenn'.
	board := UtilitiesForTests collectionOf20NoEffect.
	die := Die withSides: 4 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4}).
	anotherDie := Die withSides: 6 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5 . 6}).
	oneMoreDie := Die withSides: 5 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedAlbert.
			playerNamedGlenn}
		throwing:
			{die.
			anotherDie.
			oneMoreDie}
		in: board
		andAmountOfLaps: 1.
	playerNamedLeo takesATurnIn: game.
	playerNamedAlbert takesATurnIn: game.
	playerNamedGlenn takesATurnIn: game.
	self assert: (game positionFor: playerNamedLeo) equals: 4.
	self assert: (game positionFor: playerNamedAlbert) equals: 7.
	self assert: (game positionFor: playerNamedGlenn) equals: 10
]

{ #category : #tests }
GameTest >> testSimulateTurnWithAtomicEffect [
	| board game playerNamedLeo playerNamedGlenn die collection lapsAmount |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedGlenn := Player named: 'Glenn'.
	collection := {1}.
	die := Die withSides: 4 andGenerator: (CircularIterator over: collection).
	board := {NoEffect new.
	NoEffect new.
	AtomicEffect new.
	NoEffect new.
	NoEffect new}.
	lapsAmount := 3.
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedGlenn}
		throwing: {die}
		in: board
		andAmountOfLaps: lapsAmount.
	playerNamedLeo takesATurnIn: game.
	self assert: (game positionFor: playerNamedLeo) equals: 2.
	self assert: (game lapFor: playerNamedLeo) equals: 0.
	playerNamedGlenn takesATurnIn: game.
	self assert: (game positionFor: playerNamedGlenn) equals: 2.
	self assert: (game lapFor: playerNamedGlenn) equals: 0.
	playerNamedLeo takesATurnIn: game.
	self assert: (game positionFor: playerNamedLeo) equals: 1.
	self assert: (game lapFor: playerNamedLeo) equals: 0.
	self assert: (game positionFor: playerNamedGlenn) equals: 1.
	self assert: (game lapFor: playerNamedGlenn) equals: 0
]

{ #category : #tests }
GameTest >> testSimulateTurnWithAtomicEffectOnLapNumber1 [
	| board game playerNamedLeo playerNamedGlenn die collection lapsAmount |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedGlenn := Player named: 'Glenn'.
	collection := {6 . 6 . 1}.
	die := Die withSides: 4 andGenerator: (CircularIterator over: collection).
	board := {NoEffect new.
	NoEffect new.
	AtomicEffect new.
	NoEffect new.
	NoEffect new}.
	lapsAmount := 3.
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedGlenn}
		throwing: {die}
		in: board
		andAmountOfLaps: lapsAmount.
	playerNamedLeo takesATurnIn: game.
	self assert: (game positionFor: playerNamedLeo) equals: 2.
	self assert: (game lapFor: playerNamedLeo) equals: 1.
	playerNamedGlenn takesATurnIn: game.
	self assert: (game positionFor: playerNamedGlenn) equals: 2.
	self assert: (game lapFor: playerNamedGlenn) equals: 1.
	playerNamedLeo takesATurnIn: game.
	self assert: (game positionFor: playerNamedLeo) equals: 1.
	self assert: (game lapFor: playerNamedLeo) equals: 1.
	self assert: (game positionFor: playerNamedGlenn) equals: 1.
	self assert: (game lapFor: playerNamedGlenn) equals: 1
]

{ #category : #tests }
GameTest >> testSimulateTurnWithCorrectOrderOfPlayers [
	| game playerNamedLeo playerNamedAlbert playerNamedGlenn die anotherDie oneMoreDie board |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedAlbert := Player named: 'Albert'.
	playerNamedGlenn := Player named: 'Glenn'.
	board := UtilitiesForTests collectionOf20NoEffect.
	die := Die withSides: 4 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4}).
	anotherDie := Die withSides: 6 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5 . 6}).
	oneMoreDie := Die withSides: 5 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedAlbert.
			playerNamedGlenn}
		throwing:
			{die.
			anotherDie.
			oneMoreDie}
		in: board
		andAmountOfLaps: 1.
	self assert: game currentPlayerTurn equals: 'Leo'.
	playerNamedLeo takesATurnIn: game.
	self assert: game currentPlayerTurn equals: 'Albert'.
	playerNamedAlbert takesATurnIn: game.
	self assert: game currentPlayerTurn equals: 'Glenn'.
	playerNamedGlenn takesATurnIn: game.
	self assert: (game positionFor: playerNamedLeo) equals: 4.
	self assert: (game positionFor: playerNamedAlbert) equals: 7.
	self assert: (game positionFor: playerNamedGlenn) equals: 10
]

{ #category : #tests }
GameTest >> testSimulateTurnWithMoonWalkEffect [
	| board game playerNamedLeo playerNamedGlenn die collection lapsAmount |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedGlenn := Player named: 'Glenn'.
	collection := {1}.
	die := Die withSides: 4 andGenerator: (CircularIterator over: collection).
	board := {NoEffect new.
	(MoonWalkEffect withSteps: 2).
	NoEffect new.
	NoEffect new.
	NoEffect new}.
	lapsAmount := 3.
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedGlenn}
		throwing: {die}
		in: board
		andAmountOfLaps: lapsAmount.
	playerNamedLeo takesATurnIn: game.
	self assert: (game positionFor: playerNamedLeo) equals: 2.
	self assert: (game lapFor: playerNamedLeo) equals: 0.
	self assert: (game positionFor: playerNamedGlenn) equals: 4.
	self assert: (game lapFor: playerNamedGlenn) equals: -1
	"was in position 1 (NoEffect), die rolled 1, goes to position 2 but there's a MoonWalk (with 2 steps), everyone else goes 2 positions backwards, they end in position 4 on lap -1."
]

{ #category : #tests }
GameTest >> testSimulateTurnWithSpeedUpEffect [
	| board game playerNamedLeo playerNamedGlenn die collection lapsAmount |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedGlenn := Player named: 'Glenn'.
	collection := {1}.
	die := Die withSides: 4 andGenerator: (CircularIterator over: collection).
	board := {NoEffect new.
	SpeedUpEffect new.
	NoEffect new.
	NoEffect new.
	NoEffect new}.
	lapsAmount := 3.
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedGlenn}
		throwing: {die}
		in: board
		andAmountOfLaps: lapsAmount.
	playerNamedLeo takesATurnIn: game.
	self assert: (game positionFor: playerNamedLeo) equals: 1.
	self assert: (game lapFor: playerNamedLeo) equals: 1
	"was in position 1 (NoEffect), die rolled 1, goes to position 2 but there's a SpeedUp, goes 4 positions forward, ends in position 1 on lap 1."
]

{ #category : #tests }
GameTest >> testSimulateTurnWithWormholeEffect [
	| board game playerNamedLeo playerNamedGlenn die collection lapsAmount |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedGlenn := Player named: 'Glenn'.
	collection := {1}.
	die := Die withSides: 4 andGenerator: (CircularIterator over: collection).
	board := {NoEffect new.
	WormholeEffect new.
	NoEffect new.
	NoEffect new.
	NoEffect new}.
	lapsAmount := 3.
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedGlenn}
		throwing: {die}
		in: board
		andAmountOfLaps: lapsAmount.
	playerNamedLeo takesATurnIn: game.
	self assert: (game positionFor: playerNamedLeo) equals: 3.
	self assert: (game lapFor: playerNamedLeo) equals: -1
	"was in position 1 (NoEffect), die rolled 1, goes to position 2 but there's a Wormhole, goes back 4 positions, ends in position 3 on lap -1."
]

{ #category : #tests }
GameTest >> testSimulateTurnWithWrongOrderOfPlayersRaisesException [
	| game playerNamedLeo playerNamedAlbert playerNamedGlenn die anotherDie oneMoreDie board |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedAlbert := Player named: 'Albert'.
	playerNamedGlenn := Player named: 'Glenn'.
	board := UtilitiesForTests collectionOf20NoEffect.
	die := Die withSides: 4 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4}).
	anotherDie := Die withSides: 6 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5 . 6}).
	oneMoreDie := Die withSides: 5 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedAlbert.
			playerNamedGlenn}
		throwing:
			{die.
			anotherDie.
			oneMoreDie}
		in: board
		andAmountOfLaps: 1.
	self assert: game currentPlayerTurn equals: 'Leo'.
	playerNamedLeo takesATurnIn: game.
	self assert: game currentPlayerTurn equals: 'Albert'.
	self
		should: [ playerNamedGlenn takesATurnIn: game ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'This isn''t the turn of Glenn' ].
	playerNamedAlbert takesATurnIn: game.
	self assert: game currentPlayerTurn equals: 'Glenn'.
	playerNamedGlenn takesATurnIn: game.
	self assert: (game positionFor: playerNamedLeo) equals: 4.
	self assert: (game positionFor: playerNamedAlbert) equals: 7.
	self assert: (game positionFor: playerNamedGlenn) equals: 10
]
