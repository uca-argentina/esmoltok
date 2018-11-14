Class {
	#name : #FixedDistributorTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
FixedDistributorTest >> testGenerateBoardOfExpectedLength [
	| board distributor |
	distributor := FixedDistributor
		withProbabilityOfSpeedUp: 20
		wormhole: 20
		atomic: 2
		noEffect: 48
		moonwalk: 10
		andMaximumMoonwalkSteps: 5.
	board := distributor boardOfLength: 10.
	self assert: board size equals: 10
]

{ #category : #tests }
FixedDistributorTest >> testGenerateBoardOfOnlyAtomicEffectCheckClassOfContents [
	| board distributor |
	distributor := FixedDistributor
		withProbabilityOfSpeedUp: 0
		wormhole: 0
		atomic: 100
		noEffect: 0
		moonwalk: 0
		andMaximumMoonwalkSteps: 5.
	board := distributor boardOfLength: 7.
	self assert: board size equals: 7.
	self assert: (board first isMemberOf: AtomicEffect) equals: true
]

{ #category : #tests }
FixedDistributorTest >> testGenerateBoardOfOnlyMoonwalkEffectCheckClassOfContents [
	| board distributor |
	distributor := FixedDistributor
		withProbabilityOfSpeedUp: 0
		wormhole: 0
		atomic: 0
		noEffect: 0
		moonwalk: 100
		andMaximumMoonwalkSteps: 5.
	board := distributor boardOfLength: 7.
	self assert: board size equals: 7.
	self assert: (board first isMemberOf: MoonWalkEffect) equals: true
]

{ #category : #tests }
FixedDistributorTest >> testGenerateBoardOfOnlyNoEffectCheckClassOfContents [
	| board distributor |
	distributor := FixedDistributor
		withProbabilityOfSpeedUp: 0
		wormhole: 0
		atomic: 0
		noEffect: 100
		moonwalk: 0
		andMaximumMoonwalkSteps: 5.
	board := distributor boardOfLength: 7.
	self assert: board size equals: 7.
	self assert: (board first isMemberOf: NoEffect) equals: true
]

{ #category : #tests }
FixedDistributorTest >> testGenerateBoardOfOnlySpeedUpEffectCheckClassOfContents [
	| board distributor |
	distributor := FixedDistributor
		withProbabilityOfSpeedUp: 100
		wormhole: 0
		atomic: 0
		noEffect: 0
		moonwalk: 0
		andMaximumMoonwalkSteps: 5.
	board := distributor boardOfLength: 7.
	self assert: board size equals: 7.
	self assert: (board first isMemberOf: SpeedUpEffect) equals: true
]

{ #category : #tests }
FixedDistributorTest >> testGenerateBoardOfOnlyWormholeEffectCheckClassOfContents [
	| board distributor |
	distributor := FixedDistributor
		withProbabilityOfSpeedUp: 0
		wormhole: 100
		atomic: 0
		noEffect: 0
		moonwalk: 0
		andMaximumMoonwalkSteps: 5.
	board := distributor boardOfLength: 7.
	self assert: board size equals: 7.
	self assert: (board first isMemberOf: WormholeEffect) equals: true
]

{ #category : #tests }
FixedDistributorTest >> testRaisesExceptionWhenWrongProbabilities [
	self
		should: [ FixedDistributor
				withProbabilityOfSpeedUp: 20
				wormhole: 200
				atomic: 2
				noEffect: 47
				moonwalk: 10
				andMaximumMoonwalkSteps: 5 ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'The sum of probabilities should be 100' ]
]
