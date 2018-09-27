Class {
	#name : #ArrayBasedGenerator,
	#superclass : #Object,
	#instVars : [
		'array',
		'currentIndex'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
ArrayBasedGenerator class >> whoUsesTheArray: anArray [ 
	^ self new initializeUsingArray: anArray.
]

{ #category : #accessing }
ArrayBasedGenerator >> baseArray [
	^ array.
]

{ #category : #initialization }
ArrayBasedGenerator >> initializeUsingArray: anArray [ 
	array:= anArray.
	currentIndex := 0.
]

{ #category : #accessing }
ArrayBasedGenerator >> limit [
	^ self baseArray size
]

{ #category : #accessing }
ArrayBasedGenerator >> next [
	currentIndex = self baseArray size
		ifTrue: [ currentIndex := 0 ].
	currentIndex := currentIndex + 1.
	^ self baseArray at: currentIndex
]
