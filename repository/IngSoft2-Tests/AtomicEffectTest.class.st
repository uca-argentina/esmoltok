Class {
	#name : #AtomicEffectTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
AtomicEffectTest >> testAtomicEffectAppliedAfterATurnEveryoneGoesBackToStart [
	| effect game aPlayerNamedLeo aPlayerNamedAlbert aPlayerNamedGlenn aDie anotherDie oneMoreDie boardLength |
	aPlayerNamedLeo := Player named: 'Leo'.
	aPlayerNamedAlbert := Player named: 'Albert'.
	aPlayerNamedGlenn := Player named: 'Glenn'.
	boardLength := UtilitiesForTests collectionOf20NoEffect .
	aDie := Die withSides: 4 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4}).
	anotherDie := Die withSides: 6 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5 . 6}).
	oneMoreDie := Die withSides: 5 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	game := Game
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
	effect := AtomicEffect new.
	aPlayerNamedLeo takesATurnIn: game.
	aPlayerNamedAlbert takesATurnIn: game.
	aPlayerNamedGlenn takesATurnIn: game.
	effect triggerOn: game and: aPlayerNamedAlbert.
	self assert: (game positionFor: aPlayerNamedAlbert) equals: 1.
	self assert: (game positionFor: aPlayerNamedLeo) equals: 1.
	self assert: (game positionFor: aPlayerNamedGlenn) equals: 1
]

{ #category : #tests }
AtomicEffectTest >> testAtomicEffectAppliedEveryoneGoesBackToStart [
	| positionAlbert positionGlenn positionLeo effect game aPlayerNamedLeo aPlayerNamedAlbert aPlayerNamedGlenn aDie anotherDie oneMoreDie boardLength |
	aPlayerNamedLeo := Player named: 'Leo'.
	aPlayerNamedAlbert := Player named: 'Albert'.
	aPlayerNamedGlenn := Player named: 'Glenn'.
	boardLength := UtilitiesForTests collectionOf20NoEffect .
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
		in: boardLength
		andAmountOfLaps: 1.
	effect := AtomicEffect new.
	positionAlbert := game positionFor: aPlayerNamedAlbert.
	positionLeo := game positionFor: aPlayerNamedLeo.
	positionGlenn := game positionFor: aPlayerNamedGlenn.
	effect triggerOn: game and: aPlayerNamedAlbert.
	self
		assert: (game positionFor: aPlayerNamedAlbert)
		equals: 1.
	self
		assert: (game positionFor: aPlayerNamedLeo)
		equals: 1.
	self
		assert: (game positionFor: aPlayerNamedGlenn)
		equals: 1
]
