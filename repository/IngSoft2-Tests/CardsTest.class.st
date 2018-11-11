Class {
	#name : #CardsTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #overload }
CardsTest >> testAddCardToGame [
	"comment stating purpose of message"

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
		throwing:
			{die}
		in: board
		andAmountOfLaps: 1.
	overloadCard := OverloadCard new.
	overloadCard applyOn: game to: {playerNamedLeo}.
	self assert: (game hasCard: overloadCard) equals: true.
	self assert: (game cards values first) equals: {playerNamedLeo }.
	self assert: (game cards keys first) equals: overloadCard 
]

{ #category : #acceleration }
CardsTest >> testApplyAccelerationAdd1ToAll [
	"comment stating purpose of message"
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
		throwing:
			{die}
		in: board
		andAmountOfLaps: 1.
	accelerationCard := AccelerationCard new.
	accelerationCard  applyOn: game to: {playerNamedLeo}.
	self assert: (game hasCard: accelerationCard ) equals: true.
	playerNamedLeo takesATurnIn: game.
	self assert: (game positionFor: playerNamedLeo ) equals: 6.
	self assert: (game positionFor: playerNamedGlenn  ) equals: 1.
	playerNamedGlenn takesATurnIn: game.
	self assert: (game positionFor: playerNamedGlenn  ) equals: 4
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
		throwing:
			{die}
		in: board
		andAmountOfLaps: 1.
	overloadCard := OverloadCard new.
	overloadCard applyOn: game to: {playerNamedLeo}.
	self assert: (game hasCard: overloadCard) equals: true.
	cancellationCard := CancellationCard new.
	cancellationCard  applyOn: game to: {overloadCard }.
	self assert: (game hasCard: overloadCard) equals: false.
]

{ #category : #overload }
CardsTest >> testApplyOverloadSubstract2 [
	"comment stating purpose of message"

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
		throwing:
			{die}
		in: board
		andAmountOfLaps: 1.
	overloadCard := OverloadCard new.
	overloadCard applyOn: game to: {playerNamedLeo}.
	self assert: (game hasCard: overloadCard) equals: true.
	playerNamedLeo takesATurnIn: game.
	self assert: (game positionFor: playerNamedLeo ) equals: 3
]

{ #category : #speed }
CardsTest >> testApplySpeedAdd1 [
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
	speedCard applyOn: game to: {playerNamedLeo}.
	self assert: (game hasCard: speedCard) equals: true.
	playerNamedLeo takesATurnIn: game.
	self assert: (game positionFor: playerNamedLeo) equals: 6
]
