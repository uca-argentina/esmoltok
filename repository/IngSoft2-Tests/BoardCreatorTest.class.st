Class {
	#name : #BoardCreatorTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BoardCreatorTest >> testCreateABoard [
	| noEffect speedUpEffect result collection boardCreator |
	noEffect := NoEffect new.
	speedUpEffect := SpeedUpEffect new.
	collection := {(speedUpEffect -> 50).
	(noEffect -> 50)}.
	boardCreator := BoardCreator new.
	result := boardCreator generateFrom: collection withLength: 9.
	self
		assert: result
		equals:
			{speedUpEffect.
			speedUpEffect.
			speedUpEffect.
			speedUpEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			speedUpEffect} asOrderedCollection
]

{ #category : #tests }
BoardCreatorTest >> testCreateABoardAndVerifyPercentagesAreCorrectRaisesException [
	| noEffect speedUpEffect collection boardCreator |
	noEffect := NoEffect new.
	speedUpEffect := SpeedUpEffect new.
	collection := {(speedUpEffect -> 50).
	(noEffect -> 51)}.
	boardCreator := BoardCreator new.
	self
		should: [ boardCreator generateFrom: collection withLength: 9 ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'The sum of percentages should be 100' ]
]

{ #category : #tests }
BoardCreatorTest >> testCreateABoardWith7Elements [
	| noEffect speedUpEffect result collection boardCreator |
	noEffect := NoEffect new.
	speedUpEffect := SpeedUpEffect new.
	collection := {(speedUpEffect -> 50).
	(noEffect -> 50)}.
	boardCreator := BoardCreator new.
	result := boardCreator generateFrom: collection withLength: 7.
	self
		assert: result
		equals:
			{speedUpEffect.
			speedUpEffect.
			speedUpEffect.
			noEffect.
			noEffect.
			noEffect.
			speedUpEffect} asOrderedCollection
]

{ #category : #tests }
BoardCreatorTest >> testCreateABoardWithFixedDistribution [
	| atomicEffect moonWalkEffect wormHoleEffect noEffect speedUpEffect result collection boardCreator |
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
	boardCreator := BoardCreator new.
	result := boardCreator generateFrom: collection withLength: 100.
	self
		assert: result
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
			atomicEffect
			} asOrderedCollection
]

{ #category : #tests }
BoardCreatorTest >> testCreateAnEffectDistributor [
	| noEffect speedUpEffect result collection distributor |
	noEffect := NoEffect new.
	speedUpEffect := SpeedUpEffect new.
	collection := {(speedUpEffect -> 50).
	(noEffect -> 50)}.
	distributor := BoardCreator new.
	result := distributor generateFrom: collection withLength: 10.
	self
		assert: result
		equals:
			{speedUpEffect.
			speedUpEffect.
			speedUpEffect.
			speedUpEffect.
			speedUpEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect} asOrderedCollection
]

{ #category : #tests }
BoardCreatorTest >> testCreateAnEffectboardCreator [
	| noEffect speedUpEffect result collection boardCreator |
	noEffect := NoEffect new.
	speedUpEffect := SpeedUpEffect new.
	collection := {(speedUpEffect -> 50).
	(noEffect -> 50)}.
	boardCreator := BoardCreator new.
	result := boardCreator generateFrom: collection withLength: 10.
	self
		assert: result
		equals:
			{speedUpEffect.
			speedUpEffect.
			speedUpEffect.
			speedUpEffect.
			speedUpEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect.
			noEffect} asOrderedCollection
]
