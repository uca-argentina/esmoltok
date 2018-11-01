Class {
	#name : #CircularIterator,
	#superclass : #RollGenerator,
	#instVars : [
		'collection',
		'currentElement'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
CircularIterator class >> over: anArray [ 
	^ self new initializeOver: anArray.
]

{ #category : #accessing }
CircularIterator >> collection [
	^ collection
]

{ #category : #accessing }
CircularIterator >> currentElement [
	^ collection at: currentElement
]

{ #category : #initialization }
CircularIterator >> initializeOver: aCollection [
	collection := aCollection.
	currentElement := 1
]

{ #category : #accessing }
CircularIterator >> next: aLimit [
	| ourElement |
	ourElement := collection at: currentElement.
	self updateIteration.
	^ ourElement
]

{ #category : #updating }
CircularIterator >> updateIteration [
	currentElement := currentElement = collection size
		ifTrue: [ 1 ]
		ifFalse: [ currentElement + 1 ]
]
