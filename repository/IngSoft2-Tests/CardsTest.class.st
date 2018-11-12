Class {
	#name : #CardsTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #overload }
CardsTest >> testAddCardToGame [
	| overloadCard game playerNamedLeo playerNamedGlenn die board collection |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedGlenn := Player named: 'Glenn'.
	collection := {4 . 2 . 3 . 4 . 5}.
	die := Die withSides: 4 andGenerator: (CircularIterator over: collection).
	board := UtilitiesForTests collectionOf20NoEffect.
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedGlenn}
		throwing: {die}
		in: board
		andAmountOfLaps: 1.
	overloadCard := OverloadCard new.
	overloadCard applyOn: game to: playerNamedLeo.
	self assert: (game hasCard: overloadCard) equals: true.
	self assert: game cards values first equals: playerNamedLeo.
	self assert: game cards keys first equals: overloadCard
]

{ #category : #acceleration }
CardsTest >> testApplyAccelerationAddsOneToEveryRoll [
	| accelerationCard game playerNamedLeo playerNamedGlenn die board collection |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedGlenn := Player named: 'Glenn'.
	collection := {4 . 2 . 3 . 4 . 5}.
	die := Die withSides: 4 andGenerator: (CircularIterator over: collection).
	board := UtilitiesForTests collectionOf20NoEffect.
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedGlenn}
		throwing: {die}
		in: board
		andAmountOfLaps: 1.
	accelerationCard := AccelerationCard new.
	accelerationCard applyOn: game to: playerNamedLeo.
	self assert: (game hasCard: accelerationCard) equals: true.
	self assert: (game positionFor: playerNamedLeo) equals: 1.
	playerNamedLeo takesATurnIn: game.
	self assert: (game positionFor: playerNamedLeo) equals: 6.
	self assert: (game positionFor: playerNamedGlenn) equals: 1.
	playerNamedGlenn takesATurnIn: game.
	self assert: (game positionFor: playerNamedGlenn) equals: 4
]

{ #category : #cancellation }
CardsTest >> testApplyCancellationRemoveChosenCard [
	| cancellationCard overloadCard game playerNamedLeo playerNamedGlenn die board collection |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedGlenn := Player named: 'Glenn'.
	collection := {4 . 2 . 3 . 4 . 5}.
	die := Die withSides: 4 andGenerator: (CircularIterator over: collection).
	board := UtilitiesForTests collectionOf20NoEffect.
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedGlenn}
		throwing: {die}
		in: board
		andAmountOfLaps: 1.
	overloadCard := OverloadCard new.
	overloadCard applyOn: game to: playerNamedLeo.
	self assert: (game hasCard: overloadCard) equals: true.
	cancellationCard := CancellationCard new.
	cancellationCard applyOn: game to: overloadCard.
	self assert: (game hasCard: overloadCard) equals: false
]

{ #category : #overload }
CardsTest >> testApplyOverloadCardWithCardRaisesException [
	| overloadCard game playerNamedLeo playerNamedGlenn die board collection |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedGlenn := Player named: 'Glenn'.
	collection := {4 . 2 . 3 . 4 . 5}.
	die := Die withSides: 4 andGenerator: (CircularIterator over: collection).
	board := UtilitiesForTests collectionOf20NoEffect.
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedGlenn}
		throwing: {die}
		in: board
		andAmountOfLaps: 1.
	overloadCard := OverloadCard new.
	self
		should: [ overloadCard applyOn: game to: overloadCard ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'Overload Card only applies to players' ]
]

{ #category : #overload }
CardsTest >> testApplyOverloadSubstractsTwoToPlayerRoll [
	| overloadCard game playerNamedLeo playerNamedGlenn die board collection |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedGlenn := Player named: 'Glenn'.
	collection := {4 . 2 . 3 . 4 . 5}.
	die := Die withSides: 4 andGenerator: (CircularIterator over: collection).
	board := UtilitiesForTests collectionOf20NoEffect.
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedGlenn}
		throwing: {die}
		in: board
		andAmountOfLaps: 1.
	overloadCard := OverloadCard new.
	overloadCard applyOn: game to: playerNamedLeo.
	self assert: (game hasCard: overloadCard) equals: true.
	playerNamedLeo takesATurnIn: game.
	self assert: (game positionFor: playerNamedLeo) equals: 3
]

{ #category : #redo }
CardsTest >> testApplyRedoReapplyOverloadCard [
	| redoCard overloadCard game playerNamedLeo playerNamedGlenn die board collection |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedGlenn := Player named: 'Glenn'.
	collection := {4 . 2 . 3 . 4 . 5}.
	die := Die withSides: 4 andGenerator: (CircularIterator over: collection).
	board := UtilitiesForTests collectionOf20NoEffect.
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedGlenn}
		throwing: {die}
		in: board
		andAmountOfLaps: 1.
	overloadCard := OverloadCard new.
	overloadCard applyOn: game to: playerNamedLeo.
	redoCard := RedoCard new.
	redoCard applyOn: game to: playerNamedLeo.
	playerNamedLeo takesATurnIn: game.
	self assert: (game positionFor: playerNamedLeo) equals: 1
]

{ #category : #repeat }
CardsTest >> testApplyRepeatRepeatsSpeedUpEffect [
	| repeatCard game playerNamedLeo playerNamedGlenn die board collection |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedGlenn := Player named: 'Glenn'.
	collection := {4 . 2 . 3 . 4 . 5}.
	die := Die withSides: 4 andGenerator: (CircularIterator over: collection).
	board := {NoEffect new.
	NoEffect new.
	NoEffect new.
	NoEffect new.
	SpeedUpEffect new.
	NoEffect new.
	NoEffect new.
	NoEffect new.
	NoEffect new.
	NoEffect new}.
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedGlenn}
		throwing: {die}
		in: board
		andAmountOfLaps: 1.
	repeatCard := RepeatCard new.
	playerNamedLeo takesATurnIn: game.
	repeatCard applyOn: game to: playerNamedLeo.
	self assert: (game positionFor: playerNamedLeo) equals: 3
]

{ #category : #speed }
CardsTest >> testApplySpeedAddsOneToPlayerRoll [
	| speedCard game playerNamedLeo playerNamedGlenn die board collection |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedGlenn := Player named: 'Glenn'.
	collection := {4 . 2 . 3 . 4 . 5}.
	die := Die withSides: 4 andGenerator: (CircularIterator over: collection).
	board := UtilitiesForTests collectionOf20NoEffect.
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedGlenn}
		throwing: {die}
		in: board
		andAmountOfLaps: 1.
	speedCard := SpeedCard new.
	speedCard applyOn: game to: playerNamedLeo.
	self assert: (game hasCard: speedCard) equals: true.
	playerNamedLeo takesATurnIn: game.
	self assert: (game positionFor: playerNamedLeo) equals: 6
]

{ #category : #speed }
CardsTest >> testApplySpeedCardWithCardRaisesException [
	| speedCard game playerNamedLeo playerNamedGlenn die board collection |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedGlenn := Player named: 'Glenn'.
	collection := {4 . 2 . 3 . 4 . 5}.
	die := Die withSides: 4 andGenerator: (CircularIterator over: collection).
	board := UtilitiesForTests collectionOf20NoEffect.
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedGlenn}
		throwing: {die}
		in: board
		andAmountOfLaps: 1.
	speedCard := SpeedCard new.
	self
		should: [ speedCard applyOn: game to: speedCard ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'Speed Card only applies to players' ]
]

{ #category : #cancellation }
CardsTest >> testApplyWithPlayerRaisesException [
	| cancellationCard game playerNamedLeo playerNamedGlenn die board collection |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedGlenn := Player named: 'Glenn'.
	collection := {4 . 2 . 3 . 4 . 5}.
	die := Die withSides: 4 andGenerator: (CircularIterator over: collection).
	board := UtilitiesForTests collectionOf20NoEffect.
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedGlenn}
		throwing: {die}
		in: board
		andAmountOfLaps: 1.
	cancellationCard := CancellationCard new.
	self
		should: [ cancellationCard applyOn: game to: playerNamedLeo ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'Cancellation Card only applies to other cards' ]
]

{ #category : #cancellation }
CardsTest >> testRaiseExceptionIfGameHasNoCards [
	| cancellationCard game playerNamedLeo playerNamedGlenn die board collection |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedGlenn := Player named: 'Glenn'.
	collection := {4 . 2 . 3 . 4 . 5}.
	die := Die withSides: 4 andGenerator: (CircularIterator over: collection).
	board := UtilitiesForTests collectionOf20NoEffect.
	game := Game
		playedBy:
			{playerNamedLeo.
			playerNamedGlenn}
		throwing: {die}
		in: board
		andAmountOfLaps: 1.
	cancellationCard := CancellationCard new.
	self
		should: [ cancellationCard applyOn: game to: cancellationCard ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'There are no permanent cards in the game' ]
]
