Class {
	#name : #FixedDistributorTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
FixedDistributorTest >> occurrencesOf: aClass in: aCollection [
	^ (aCollection select: [ :each | each isMemberOf: aClass ]) size
]

{ #category : #tests }
FixedDistributorTest >> testCheckRangeOfDistributionForEffects [
	| board distributor |
	distributor := FixedDistributor
		withProbabilityOfSpeedUp: 20
		wormhole: 20
		atomic: 2
		noEffect: 48
		moonwalk: 10
		andMaximumMoonwalkSteps: 5.
	board := distributor boardOfLength: 100.
	self assert: (self occurrencesOf: NoEffect in: board) equals: 48.
	self assert: (self occurrencesOf: SpeedUpEffect in: board) equals: 20.
	self assert: (self occurrencesOf: MoonWalkEffect in: board) equals: 10.
	self assert: (self occurrencesOf: AtomicEffect in: board) equals: 2.
	self assert: (self occurrencesOf: WormholeEffect in: board) equals: 20
]

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
	| board distributor boardLength |
	distributor := FixedDistributor
		withProbabilityOfSpeedUp: 0
		wormhole: 0
		atomic: 100
		noEffect: 0
		moonwalk: 0
		andMaximumMoonwalkSteps: 5.
	boardLength := 7.
	board := distributor boardOfLength: boardLength.
	self assert: board size equals: boardLength.
	1 to: boardLength do: [ :eachIndex | self assert: ((board at: eachIndex) isMemberOf: AtomicEffect) equals: true ]
]

{ #category : #tests }
FixedDistributorTest >> testGenerateBoardOfOnlyMoonwalkEffectCheckClassOfContents [
	| board distributor boardLength |
	distributor := FixedDistributor
		withProbabilityOfSpeedUp: 0
		wormhole: 0
		atomic: 0
		noEffect: 0
		moonwalk: 100
		andMaximumMoonwalkSteps: 5.
	boardLength := 7.
	board := distributor boardOfLength: boardLength.
	self assert: board size equals: boardLength.
	1 to: boardLength do: [ :eachIndex | self assert: ((board at: eachIndex) isMemberOf: MoonWalkEffect) equals: true ]
]

{ #category : #tests }
FixedDistributorTest >> testGenerateBoardOfOnlyNoEffectCheckClassOfContents [
	| board distributor boardLength |
	distributor := FixedDistributor
		withProbabilityOfSpeedUp: 0
		wormhole: 0
		atomic: 0
		noEffect: 100
		moonwalk: 0
		andMaximumMoonwalkSteps: 5.
	boardLength := 7.
	board := distributor boardOfLength: boardLength.
	self assert: board size equals: boardLength.
	1 to: boardLength do: [ :eachIndex | self assert: ((board at: eachIndex) isMemberOf: NoEffect) equals: true ]
]

{ #category : #tests }
FixedDistributorTest >> testGenerateBoardOfOnlySpeedUpEffectCheckClassOfContents [
	| board distributor boardLength |
	distributor := FixedDistributor
		withProbabilityOfSpeedUp: 100
		wormhole: 0
		atomic: 0
		noEffect: 0
		moonwalk: 0
		andMaximumMoonwalkSteps: 5.
	boardLength := 7.
	board := distributor boardOfLength: boardLength.
	self assert: board size equals: boardLength.
	1 to: boardLength do: [ :eachIndex | self assert: ((board at: eachIndex) isMemberOf: SpeedUpEffect) equals: true ]
]

{ #category : #tests }
FixedDistributorTest >> testGenerateBoardOfOnlyWormholeEffectCheckClassOfContents [
	| board distributor boardLength |
	distributor := FixedDistributor
		withProbabilityOfSpeedUp: 0
		wormhole: 100
		atomic: 0
		noEffect: 0
		moonwalk: 0
		andMaximumMoonwalkSteps: 5.
	boardLength := 7.
	board := distributor boardOfLength: boardLength.
	self assert: board size equals: boardLength.
	1 to: boardLength do: [ :eachIndex | self assert: ((board at: eachIndex) isMemberOf: WormholeEffect) equals: true ]
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
