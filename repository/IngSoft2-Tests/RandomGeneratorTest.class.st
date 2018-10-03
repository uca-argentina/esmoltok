Class {
	#name : #RandomGeneratorTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
RandomGeneratorTest >> testNextNumber [
	"comment stating purpose of message"

	| aRandomGenerator |
	aRandomGenerator := RandomGenerator withThisLimit: 7.
	self assert: (aRandomGenerator next between: 1 and: 7).
	self assert: aRandomGenerator limit equals: 7
]
