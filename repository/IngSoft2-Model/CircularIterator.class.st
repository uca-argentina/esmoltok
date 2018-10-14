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
	currentElement := collection first
]

{ #category : #accessing }
CircularIterator >> next: aSides [
	| outElement |
	outElement := currentElement.
	self updateIteration.
	^ outElement
]

{ #category : #updating }
CircularIterator >> updateIteration [
	currentElement := currentElement = collection last
		ifTrue: [ collection first ]
		ifFalse: [ collection after: currentElement ]
]
