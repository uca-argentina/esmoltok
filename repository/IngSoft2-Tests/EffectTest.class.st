Class {
	#name : #EffectTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #'utilities for tests' }
EffectTest >> gameForEffectsTestsWithPlayer: playerNamedLeo and: playerNamedAlbert and: playerNamedGlenn [
	| oneMoreDie anotherDie board die game deck |
	board := UtilitiesForTests collectionOf20NoEffect.
	deck := CircularIterator over: {OverloadCard new}.
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
		using: deck
		in: board
		andAmountOfLaps: 1.
	^ game
]

{ #category : #'atomic effect tests' }
EffectTest >> testAtomicEffectAppliedAfterATurnEveryoneGoesBackToStart [
	| effect game playerNamedLeo playerNamedAlbert playerNamedGlenn |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedAlbert := Player named: 'Albert'.
	playerNamedGlenn := Player named: 'Glenn'.
	game := self gameForEffectsTestsWithPlayer: playerNamedLeo and: playerNamedAlbert and: playerNamedGlenn.
	effect := AtomicEffect new.
	playerNamedLeo takesATurnIn: game.
	playerNamedAlbert takesATurnIn: game.
	playerNamedGlenn takesATurnIn: game.
	effect triggerOn: game and: playerNamedAlbert.
	self assert: (game positionFor: playerNamedAlbert) equals: 1.
	self assert: (game positionFor: playerNamedLeo) equals: 1.
	self assert: (game positionFor: playerNamedGlenn) equals: 1
]

{ #category : #'atomic effect tests' }
EffectTest >> testAtomicEffectAppliedEveryoneGoesBackToStart [
	| effect game playerNamedLeo playerNamedAlbert playerNamedGlenn |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedAlbert := Player named: 'Albert'.
	playerNamedGlenn := Player named: 'Glenn'.
	game := self gameForEffectsTestsWithPlayer: playerNamedLeo and: playerNamedAlbert and: playerNamedGlenn.
	effect := AtomicEffect new.
	effect triggerOn: game and: playerNamedAlbert.
	self assert: (game positionFor: playerNamedAlbert) equals: 1.
	self assert: (game positionFor: playerNamedLeo) equals: 1.
	self assert: (game positionFor: playerNamedGlenn) equals: 1
]

{ #category : #'moonwalk effect tests' }
EffectTest >> testMoonWalkAppliedMovesEveryoneBack5SpacesExceptThePlayer [
	| number positionAlbert effect game playerNamedLeo playerNamedAlbert playerNamedGlenn |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedAlbert := Player named: 'Albert'.
	playerNamedGlenn := Player named: 'Glenn'.
	game := self gameForEffectsTestsWithPlayer: playerNamedLeo and: playerNamedAlbert and: playerNamedGlenn.
	number := 5.
	effect := MoonWalkEffect withSteps: number.
	positionAlbert := game positionFor: playerNamedAlbert.
	effect triggerOn: game and: playerNamedAlbert.
	self assert: (game positionFor: playerNamedAlbert) equals: positionAlbert.
	self assert: (game positionFor: playerNamedLeo) equals: 16.
	self assert: (game positionFor: playerNamedGlenn) equals: 16
]

{ #category : #'moonwalk effect tests' }
EffectTest >> testMoonWalkInitializedWith7Steps [
	| number effect |
	number := 7.
	effect := MoonWalkEffect withSteps: number.
	self assert: effect steps equals: number
]

{ #category : #'no effect tests' }
EffectTest >> testNoEffectAppliedNoChangeToPlayerPosition [
	| position effect game playerNamedLeo playerNamedAlbert playerNamedGlenn |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedAlbert := Player named: 'Albert'.
	playerNamedGlenn := Player named: 'Glenn'.
	game := self gameForEffectsTestsWithPlayer: playerNamedLeo and: playerNamedAlbert and: playerNamedGlenn.
	effect := NoEffect new.
	position := game positionFor: playerNamedAlbert.
	effect triggerOn: game and: playerNamedAlbert.
	self assert: (game positionFor: playerNamedAlbert) equals: position
]

{ #category : #'random card tests' }
EffectTest >> testRandomEffectAppliedPlayerGetsCardFromCollection [
	| effect game playerNamedLeo playerNamedAlbert playerNamedGlenn overload speed |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedAlbert := Player named: 'Albert'.
	playerNamedGlenn := Player named: 'Glenn'.
	game := self gameForEffectsTestsWithPlayer: playerNamedLeo and: playerNamedAlbert and: playerNamedGlenn.
	overload := OverloadCard new.
   speed := SpeedCard new.
	effect := CardFromDeckEffect withDeck: (CircularIterator over: {overload . speed}).
	effect triggerOn: game and: playerNamedAlbert.
	effect triggerOn: game and: playerNamedLeo. 
	self assert: (playerNamedAlbert hasCard: overload) equals: true.
	self assert: (playerNamedLeo hasCard: speed) equals: true.

]

{ #category : #tests }
EffectTest >> testRandomEffectAppliedPlayerGetsRandomCardFromCollection [
	| effect game playerNamedLeo playerNamedAlbert playerNamedGlenn overload speed accelerate collection |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedAlbert := Player named: 'Albert'.
	playerNamedGlenn := Player named: 'Glenn'.
	game := self gameForEffectsTestsWithPlayer: playerNamedLeo and: playerNamedAlbert and: playerNamedGlenn.
	overload := OverloadCard new.
	speed := SpeedCard new.
	accelerate := AccelerationCard new.
	collection := {overload.
	speed.
	accelerate}.
	effect := CardFromDeckEffect withDeck: (RandomElementSelector over: collection).
	effect triggerOn: game and: playerNamedAlbert.
	effect triggerOn: game and: playerNamedLeo.
	self assert: (collection includes: playerNamedAlbert cardsInHand last) equals: true.
	self assert: (collection includes: playerNamedLeo cardsInHand last) equals: true
]

{ #category : #'speed up tests' }
EffectTest >> testSpeedUpAppliedGoForward4Positions [
	| position effect game playerNamedLeo playerNamedAlbert playerNamedGlenn |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedAlbert := Player named: 'Albert'.
	playerNamedGlenn := Player named: 'Glenn'.
	game := self gameForEffectsTestsWithPlayer: playerNamedLeo and: playerNamedAlbert and: playerNamedGlenn.
	effect := SpeedUpEffect new.
	position := game positionFor: playerNamedAlbert.
	effect triggerOn: game and: playerNamedAlbert.
	self assert: (game positionFor: playerNamedAlbert) equals: position + 4
]

{ #category : #'wormhole effect tests' }
EffectTest >> testWormHoleAppliedGoBack4Positions [
	| effect game playerNamedLeo playerNamedAlbert playerNamedGlenn |
	playerNamedLeo := Player named: 'Leo'.
	playerNamedAlbert := Player named: 'Albert'.
	playerNamedGlenn := Player named: 'Glenn'.
	game := self gameForEffectsTestsWithPlayer: playerNamedLeo and: playerNamedAlbert and: playerNamedGlenn.
	effect := WormholeEffect new.
	self assert: (game positionFor: playerNamedAlbert) equals: 1.
	effect triggerOn: game and: playerNamedAlbert.
	self assert: (game positionFor: playerNamedAlbert) equals: 17.
	self assert: (game lapFor: playerNamedAlbert) equals: -1
]
