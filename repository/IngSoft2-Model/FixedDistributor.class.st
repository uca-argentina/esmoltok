Class {
	#name : #FixedDistributor,
	#superclass : #Object,
	#instVars : [
		'board'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
FixedDistributor class >> withProbabilityOfSpeedUp: aSpeedUpProbability wormhole: aWormholeProbability atomic: aAtomicProbability noEffect: aNoEffectProbability moonwalk: aMoonWalkProbability andMaximumMoonwalkSteps: aMaximumMoonwalkSteps [ 
	
	^self new initializeWithProbabilityOfSpeedUp: aSpeedUpProbability wormhole: aWormholeProbability atomic: aAtomicProbability noEffect: aNoEffectProbability moonwalk: aMoonWalkProbability andMaximumMoonwalkSteps: aMaximumMoonwalkSteps 
]

{ #category : #interaction }
FixedDistributor >> boardOfLength: aSize [
	| collection |
	collection := OrderedCollection new.
	aSize timesRepeat: [ collection add: self generateARandomEffectFromDistribution ].
	^ collection
]

{ #category : #interaction }
FixedDistributor >> collectionOf: aSize containingAll: aClass [
	^ OrderedCollection new: aSize withAll: aClass new
]

{ #category : #interaction }
FixedDistributor >> generateARandomEffectFromDistribution [
	^ board shuffled first
]

{ #category : #initialization }
FixedDistributor >> initializeWithProbabilityOfSpeedUp: aSpeedUpProbability wormhole: aWormholeProbability atomic: aAtomicProbability noEffect: aNoEffectProbability moonwalk: aMoonWalkProbability andMaximumMoonwalkSteps: aMaximumMoonwalkSteps [
	self
		verifyCorrectProbabilitiesSum:
			{aSpeedUpProbability.
			aWormholeProbability.
			aAtomicProbability.
			aNoEffectProbability.
			aMoonWalkProbability}.
	board := OrderedCollection new.
	board add: (self collectionOf: aSpeedUpProbability containingAll: SpeedUpEffect).
	board add: (self collectionOf: aWormholeProbability containingAll: WormholeEffect).
	board add: (self collectionOf: aAtomicProbability containingAll: AtomicEffect).
	board add: (self collectionOf: aNoEffectProbability containingAll: NoEffect).
	board add: (self moonWalkcollectionOf: aMoonWalkProbability andMaximumSteps: aMaximumMoonwalkSteps)
]

{ #category : #interaction }
FixedDistributor >> moonWalkcollectionOf: aSize andMaximumSteps: steps [
	| collection |
	collection := OrderedCollection new.
	aSize timesRepeat: [ collection add: (MoonWalkEffect withSteps: steps atRandom) ].
	^ collection
]

{ #category : #validation }
FixedDistributor >> verifyCorrectProbabilitiesSum: aCollection [ 
	^ (aCollection sumNumbers: [ :each | each ]) = 100
		ifFalse: [ AssertionFailure signal: 'The sum of probabilities should be 100' ]
]
