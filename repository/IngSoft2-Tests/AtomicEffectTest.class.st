Class {
	#name : #AtomicEffectTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
AtomicEffectTest >> testAtomicEffectAppliedAfterATurnEveryoneGoesBackToStart [
	| effect game playerNamedLeo playerNamedAlbert playerNamedGlenn die anotherDie oneMoreDie board |
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
	effect := AtomicEffect new.
	playerNamedLeo takesATurnIn: game.
	playerNamedAlbert takesATurnIn: game.
	playerNamedGlenn takesATurnIn: game.
	effect triggerOn: game and: playerNamedAlbert.
	self assert: (game positionFor: playerNamedAlbert) equals: 1.
	self assert: (game positionFor: playerNamedLeo) equals: 1.
	self assert: (game positionFor: playerNamedGlenn) equals: 1
]

{ #category : #tests }
AtomicEffectTest >> testAtomicEffectAppliedEveryoneGoesBackToStart [
	| effect game playerNamedLeo playerNamedAlbert playerNamedGlenn die anotherDie oneMoreDie board |
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
	effect := AtomicEffect new.
	effect triggerOn: game and: playerNamedAlbert.
	self assert: (game positionFor: playerNamedAlbert) equals: 1.
	self assert: (game positionFor: playerNamedLeo) equals: 1.
	self assert: (game positionFor: playerNamedGlenn) equals: 1
]
