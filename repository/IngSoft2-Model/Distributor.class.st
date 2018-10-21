Class {
	#name : #Distributor,
	#superclass : #Object,
	#instVars : [
		'fillMetric'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Distributor class >> fillMetric: aMetric [
	^ self new initializeWithFillMetric: aMetric
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
	^ fillMetric fill: anOrderedCollection upTo: aLength using: aCollection
]

{ #category : #initialization }
Distributor >> initializeWithFillMetric: aMetric [
	fillMetric := aMetric
]

{ #category : #assertions }
Distributor >> verifyPercentagesOf: aCollection [
	| percentages |
	percentages := aCollection collect: [ :each | each value ].
	^ (percentages sumNumbers: [ :each | each ]) = 100
		ifFalse: [ AssertionFailure signal: 'The sum of percentages should be 100' ]
]
