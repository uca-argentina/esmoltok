Class {
	#name : #RandomGeneratorTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
RandomGeneratorTest >> testNextNumber [
	"comment stating purpose of message"

	| aRandomGenerator |
	aRandomGenerator := RandomGenerator new.
	self assert: ((aRandomGenerator next: 7) between: 1 and: 7).
]
