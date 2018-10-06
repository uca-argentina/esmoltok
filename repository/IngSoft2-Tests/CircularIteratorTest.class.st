Class {
	#name : #CircularIteratorTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CircularIteratorTest >> testIterationsResult [
	| aCollectionIterator aCollection sides |
	aCollection := {3 . 4 . 5 . 7}.
	sides := 0.
	aCollectionIterator := CircularIterator over: aCollection.
	self assert: (aCollectionIterator next: sides) equals: 3.
	self assert: (aCollectionIterator next: sides) equals: 4.
	self assert: (aCollectionIterator next: sides) equals: 5.
	self assert: (aCollectionIterator next: sides) equals: 7.
	self assert: (aCollectionIterator next: sides) equals: 3
]
