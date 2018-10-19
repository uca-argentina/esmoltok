Class {
	#name : #WormholeEffectTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
WormholeEffectTest >> testWormHoleAppliedGoBack4Positions [
	| position effect game aPlayerNamedLeo aPlayerNamedAlbert aPlayerNamedGlenn aDie anotherDie oneMoreDie board |
	aPlayerNamedLeo := Player named: 'Leo'.
	aPlayerNamedAlbert := Player named: 'Albert'.
	aPlayerNamedGlenn := Player named: 'Glenn'.
	board := UtilitiesForTests collectionOf20NoEffect .
	aDie := Die
		withSides: 4
		andGenerator: (CircularIterator over: {1 . 2 . 3 . 4}).
	anotherDie := Die
		withSides: 6
		andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5 . 6}).
	oneMoreDie := Die
		withSides: 5
		andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	game := Game
		playedBy:
			{aPlayerNamedLeo.
			aPlayerNamedAlbert.
			aPlayerNamedGlenn}
		throwing:
			{aDie.
			anotherDie.
			oneMoreDie}
		in: board
		andAmountOfLaps: 1.
	effect := WormholeEffect new.
	position := game positionFor: aPlayerNamedAlbert.
	self assert: position equals: 1.
	effect triggerOn: game and: aPlayerNamedAlbert.
	self
		assert: (game positionFor: aPlayerNamedAlbert)
		equals: 17.
		self assert: (game lapFor: aPlayerNamedAlbert) equals: -1.
]
