Class {
	#name : #CircularIteratorTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CircularIteratorTest >> testIterationsResult [
	| collectionIterator collection sides |
	collection := {3 . 4 . 5 . 7}.
	sides := 0.
	collectionIterator := CircularIterator over: collection.
	self assert: (collectionIterator next: sides) equals: 3.
	self assert: (collectionIterator next: sides) equals: 4.
	self assert: (collectionIterator next: sides) equals: 5.
	self assert: (collectionIterator next: sides) equals: 7.
	self assert: (collectionIterator next: sides) equals: 3
]
