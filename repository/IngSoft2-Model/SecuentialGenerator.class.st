Class {
	#name : #SecuentialGenerator,
	#superclass : #Object,
	#instVars : [
		'limit',
		'currentNumber'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
SecuentialGenerator class >> withNumberLimit: aLimit [
	^ self new initializeWithLimit: aLimit
]

{ #category : #initialization }
SecuentialGenerator >> initializeWithLimit: aLimit [
	limit := aLimit.
	currentNumber := 0
]

{ #category : #accessing }
SecuentialGenerator >> limit [
	^ limit
]

{ #category : #accessing }
SecuentialGenerator >> next [
	(currentNumber == self limit)
		ifTrue: [ currentNumber := 0 ].
	currentNumber := currentNumber + 1.
	^ currentNumber
]
