Class {
	#name : #SecuentialGeneratorTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
SecuentialGeneratorTest >> testInitializeWithLimit [
	| generator |
	generator := SecuentialGenerator withNumberLimit: 6.
	self assert: generator limit equals: 6
]

{ #category : #tests }
SecuentialGeneratorTest >> testNextNumber [
	| generator |
	generator := SecuentialGenerator withNumberLimit: 6.
	self assert: generator next equals: 1
]
