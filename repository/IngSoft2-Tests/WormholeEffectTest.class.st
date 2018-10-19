Class {
	#name : #WormholeEffectTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
WormholeEffectTest >> testWormHoleAppliedGoBack4Positions [
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
	effect := WormholeEffect new.
	self assert: (game positionFor: playerNamedAlbert) equals: 1.
	effect triggerOn: game and: playerNamedAlbert.
	self assert: (game positionFor: playerNamedAlbert) equals: 17.
	self assert: (game lapFor: playerNamedAlbert) equals: -1
]
