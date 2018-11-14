Class {
	#name : #Distributor,
	#superclass : #Object,
	#instVars : [
		'fillMetric'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #interaction }
Distributor >> fill: aCollection upTo: aLength using: aDistribution [
	| iterator |
	iterator := CircularIterator over: (aDistribution collect: [ :each | each key ]).
	[aCollection size < aLength] whileTrue: [ aCollection add: (iterator next: iterator) ].
	^ aCollection
	

]

{ #category : #interaction }
Distributor >> generateEffectCollectionWith: aLength and: anAssociation [
	| aCollection collectionSize |
	collectionSize := (anAssociation value / 100 * aLength) asInteger.
	aCollection := OrderedCollection new: collectionSize withAll: anAssociation key.
	^ aCollection
]

{ #category : #interaction }
Distributor >> generateFrom: aCollection withLength: aLength [
	| anOrderedCollection |
	self verifyPercentagesOf: aCollection.
	anOrderedCollection := OrderedCollection new.
	aCollection do: [ :eachDistributedEffect | anOrderedCollection addAll: (self generateEffectCollectionWith: aLength and: eachDistributedEffect) ].
	^ self  fill:  anOrderedCollection upTo: aLength using: aCollection
	

]

{ #category : #interaction }
Distributor >> generateUsingFixedDistributionWithLength: anInteger [ 
	self shouldBeImplemented.
]

{ #category : #assertion }
Distributor >> verifyPercentagesOf: aCollection [
	| percentages |
	percentages := aCollection collect: [ :each | each value ].
	^ (percentages sumNumbers: [ :each | each ]) = 100
		ifFalse: [ AssertionFailure signal: 'The sum of percentages should be 100' ]
]
