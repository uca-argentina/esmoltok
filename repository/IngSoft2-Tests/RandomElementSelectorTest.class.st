Class {
	#name : #RandomElementSelectorTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
RandomElementSelectorTest >> testNextGivesRandomElementInCollection [
	| randomCollectionIterator collection |
	collection := {3 . 4 . 5 . 7}.
	randomCollectionIterator := RandomElementSelector over: collection.
	self assert: (collection includes: (randomCollectionIterator next: collection)) equals: true
]
