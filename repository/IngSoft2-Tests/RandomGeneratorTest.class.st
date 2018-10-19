Class {
	#name : #RandomGeneratorTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
RandomGeneratorTest >> testNextNumber [
	| randomGenerator |
	randomGenerator := RandomGenerator new.
	self assert: ((randomGenerator next: 7) between: 1 and: 7)
]
