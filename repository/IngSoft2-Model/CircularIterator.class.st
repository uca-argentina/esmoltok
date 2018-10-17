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
	currentElement := 1
]

{ #category : #accessing }
CircularIterator >> next: aSides [
	|ourElement|
	ourElement := collection at: currentElement. 
	self updateIteration.
	^ourElement 
]

{ #category : #updating }
CircularIterator >> updateIteration [
	currentElement := currentElement = collection size
		ifTrue: [ 1 ]
		ifFalse: [ currentElement + 1 ]
]
