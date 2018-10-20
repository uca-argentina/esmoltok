Class {
	#name : #DistributorTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DistributorTest >> testCreateABoard [
	| noEffect speedUpEffect result collection distributor |
	noEffect := NoEffect new.
	speedUpEffect := SpeedUpEffect new.
	collection := {(speedUpEffect -> 50).
	(noEffect -> 50)}.
	distributor := Distributor fillMetric: IterateThroughMetric new.
	result := distributor generateFrom: collection withLength: 9.
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
DistributorTest >> testCreateABoardWith7Elements [
	| noEffect speedUpEffect result collection distributor |
	noEffect := NoEffect new.
	speedUpEffect := SpeedUpEffect new.
	collection := {(speedUpEffect -> 50).
	(noEffect -> 50)}.
	distributor := Distributor fillMetric: IterateThroughMetric new.
	result := distributor generateFrom: collection withLength: 7.
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
DistributorTest >> testCreateABoardWithFixedDistribution [
	| atomicEffect moonWalkEffect wormHoleEffect noEffect speedUpEffect result collection distributor |
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
	distributor := Distributor fillMetric: IterateThroughMetric new.
	result := distributor generateFrom: collection withLength: 100.
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
DistributorTest >> testCreateAnEffectDistributor [
	| noEffect speedUpEffect result collection distributor |
	noEffect := NoEffect new.
	speedUpEffect := SpeedUpEffect new.
	collection := {(speedUpEffect -> 50).
	(noEffect -> 50)}.
	distributor := Distributor fillMetric: IterateThroughMetric new.
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
