Class {
	#name : #PlayerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
PlayerTest >> testAssignCardsToPlayer [
	"comment stating purpose of message"

	| player firstCard secondCard |
	
	player := Player named: 'Alber'.
	firstCard := OverloadCard new.
	secondCard := CancellationCard new.
	player addCard: firstCard.
	player addCard: secondCard.
	self assert: (player hasCard: firstCard) equals: true.
	self assert: (player hasCard: secondCard) equals: true.
]

{ #category : #tests }
PlayerTest >> testCheckPlayerName [
	| player |
	player := Player named: 'Leo'.
	self assert: player name equals: 'Leo'
]

{ #category : #tests }
PlayerTest >> testCheckTurnBeforeUsingAccelerationCard [
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
	playerNamedGlenn addCard: accelerationCard.
	self
		should: [ playerNamedGlenn useCard: accelerationCard on: game affecting: {playerNamedGlenn} ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'This isn''t the turn of Glenn' ]
]

{ #category : #tests }
PlayerTest >> testCheckTurnBeforeUsingBlankCard [
	| blankCard game playerNamedLeo playerNamedGlenn die board collection |
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
	blankCard := BlankCard new.
	playerNamedGlenn addCard: blankCard.
	playerNamedGlenn useCard: blankCard on: game affecting: {playerNamedLeo}.
	self assert: (playerNamedGlenn hasCard: blankCard ) equals: false
]

{ #category : #tests }
PlayerTest >> testCheckTurnBeforeUsingCancellationCard [
	| overloadCard cancellationCard game playerNamedLeo playerNamedGlenn die board collection |
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
	overloadCard := OverloadCard new.
	playerNamedLeo addCard: overloadCard .
	playerNamedLeo useCard: overloadCard on: game affecting: {playerNamedGlenn}.
	playerNamedGlenn addCard: cancellationCard.
	playerNamedGlenn useCard: cancellationCard on: game affecting: {overloadCard}.
	self assert: (playerNamedGlenn hasCard: cancellationCard) equals: false
]

{ #category : #tests }
PlayerTest >> testCheckTurnBeforeUsingOverloadCard [
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
	playerNamedGlenn addCard: overloadCard.
	self
		should: [ playerNamedGlenn useCard: overloadCard on: game affecting: {playerNamedGlenn} ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'This isn''t the turn of Glenn' ]
]

{ #category : #tests }
PlayerTest >> testCheckTurnBeforeUsingRedoCard [
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
	redoCard := RedoCard new.
	playerNamedLeo addCard: overloadCard.
	playerNamedGlenn addCard: redoCard.
	playerNamedLeo useCard: overloadCard on: game affecting: {playerNamedGlenn}.
	self
		should: [ playerNamedGlenn useCard: redoCard on: game affecting: {playerNamedGlenn} ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'This isn''t the turn of Glenn' ]
]

{ #category : #tests }
PlayerTest >> testCheckTurnBeforeUsingRepeatCard [
	| repeatCard game playerNamedLeo playerNamedGlenn die board collection |
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
	repeatCard := RepeatCard new.
	playerNamedGlenn addCard: repeatCard .
	playerNamedGlenn useCard: repeatCard on: game affecting: {playerNamedGlenn}.
	self assert: (playerNamedGlenn hasCard: repeatCard ) equals: false
]

{ #category : #tests }
PlayerTest >> testCheckTurnBeforeUsingSpeedCard [
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
	playerNamedGlenn addCard: speedCard.
	self
		should: [ playerNamedGlenn useCard: speedCard on: game affecting: {playerNamedGlenn} ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'This isn''t the turn of Glenn' ]
]

{ #category : #tests }
PlayerTest >> testPlayerThrowADie [
	| player die |
	player := Player named: 'Leo'.
	die := Die withSides: 5 andGenerator: (CircularIterator over: {1 . 2}).
	self assert: (player throwDice: {die}) equals: 1.
	self assert: (player throwDice: {die}) equals: 2
]

{ #category : #tests }
PlayerTest >> testPlayerThrowDice [
	| player die die2 die3 |
	die := Die withSides: 5 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	die2 := Die withSides: 5 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	die3 := Die withSides: 5 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	player := Player named: 'Leo'.
	self
		assert:
			(player
				throwDice:
					{die.
					die2.
					die3})
		equals: 3.
	self
		assert:
			(player
				throwDice:
					{die.
					die2.
					die3})
		equals: 6.
	self
		assert:
			(player
				throwDice:
					{die.
					die2.
					die3})
		equals: 9
]

{ #category : #tests }
PlayerTest >> testPlayerUseCard [
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
	playerNamedLeo addCard: accelerationCard.
	playerNamedLeo useCard: accelerationCard on: game affecting: {playerNamedGlenn}.
	self assert: (playerNamedLeo hasCard: accelerationCard) equals: false
]
