Class {
	#name : #Turn,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Turn class >> names: aCollection [ 
	^ self new initializeNames: aCollection.
]
