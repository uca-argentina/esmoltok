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
	boardLength := 20.
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
	self assert: (game positionFor: aPlayerNamedAlbert) equals: 0.
	self assert: (game positionFor: aPlayerNamedLeo) equals: 0.
	self assert: (game positionFor: aPlayerNamedGlenn) equals: 0
]

{ #category : #tests }
AtomicEffectTest >> testAtomicEffectAppliedEveryoneGoesBackToStart [
	| number positionAlbert positionGlenn positionLeo effect game aPlayerNamedLeo aPlayerNamedAlbert aPlayerNamedGlenn aDie anotherDie oneMoreDie boardLength |
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
	number := 5.
	effect := AtomicEffect new.
	positionAlbert := game positionFor: aPlayerNamedAlbert.
	positionLeo := game positionFor: aPlayerNamedLeo.
	positionGlenn := game positionFor: aPlayerNamedGlenn.
	effect triggerOn: game and: aPlayerNamedAlbert.
	self
		assert: (game positionFor: aPlayerNamedAlbert)
		equals: positionAlbert - positionAlbert.
	self
		assert: (game positionFor: aPlayerNamedLeo)
		equals: positionLeo - positionLeo.
	self
		assert: (game positionFor: aPlayerNamedGlenn)
		equals: positionGlenn - positionGlenn
]
