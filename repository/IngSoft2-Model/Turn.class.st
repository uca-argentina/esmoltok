Class {
	#name : #Turn,
	#superclass : #Object,
	#instVars : [
		'nameOrder',
		'currentTurn'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Turn class >> names: aCollection [ 
	^ self new initializeNames: aCollection.
]

{ #category : #accessing }
Turn >> currentTurn [
	^ currentTurn
]

{ #category : #initialization }
Turn >> initializeNames: aCollection [ 
	nameOrder:= aCollection.
	currentTurn:= aCollection first.
]
