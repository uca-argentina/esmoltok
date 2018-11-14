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
