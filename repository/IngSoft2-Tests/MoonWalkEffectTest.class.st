Class {
	#name : #MoonWalkEffectTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
MoonWalkEffectTest >> testMoonWalkInitializedWith7Steps [
	| number effect |

	number := 7.
	effect := MoonWalkEffect withSteps: number.
	self assert: effect steps equals: number
]
