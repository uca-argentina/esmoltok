Class {
	#name : #CircularIterator,
	#superclass : #Object,
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

{ #category : #initialization }
CircularIterator >> initializeOver: aCollection [
	collection := aCollection.
	currentElement := 0
]

{ #category : #accessing }
CircularIterator >> next: aSides [
	currentElement = collection  size
		ifTrue: [ currentElement := 0 ].
	currentElement := currentElement + 1.
	^ collection at: currentElement
]
