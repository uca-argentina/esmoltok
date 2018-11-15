Class {
	#name : #RandomElementSelector,
	#superclass : #RollGenerator,
	#instVars : [
		'collection'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
RandomElementSelector class >> over: aCollection [
	^ self new initializeOver: aCollection
]

{ #category : #initialization }
RandomElementSelector >> initializeOver: aCollection [
	collection := aCollection asOrderedCollection
]

{ #category : #interaction }
RandomElementSelector >> next: aCollection [
	^ collection shuffled first
]
