Class {
	#name : #IterateThroughMetric,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #interaction }
IterateThroughMetric >> fill: aCollection upTo: aLength using: aDistribution [
	| iterator |
	iterator := CircularIterator over: (aDistribution collect: [ :each | each key ]).
	[aCollection size < aLength] whileTrue: [ aCollection add: (iterator next: iterator) ].
	^ aCollection
]
