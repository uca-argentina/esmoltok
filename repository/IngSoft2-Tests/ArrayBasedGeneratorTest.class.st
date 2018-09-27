Class {
	#name : #ArrayBasedGeneratorTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ArrayBasedGeneratorTest >> testCorrectFunctioning [
	| anArrayGenerator anArray |
	anArray := {3 . 4 . 5 . 7}.
	anArrayGenerator := ArrayBasedGenerator whoUsesTheArray: anArray.
	self assert: anArrayGenerator limit equals: 4.
	self assert: anArrayGenerator next equals: 3.
	self assert: anArrayGenerator next equals: 4.
	self assert: anArrayGenerator next equals: 5.
	self assert: anArrayGenerator next equals: 7.
	self assert: anArrayGenerator next equals: 3.
]
