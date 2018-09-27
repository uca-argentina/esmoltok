Class {
	#name : #PlayerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
PlayerTest >> testCheckPlayerName [
	| player |
	player := Player named: 'Leo'.
	self assert: player name equals: 'Leo'
]

{ #category : #tests }
PlayerTest >> testPlayerThrowADie [
	| aPlayer aDice |
	aPlayer := Player named: 'Leo'.
	aDice := Die withThisNumberOfSides: 5.
	self assert: (aPlayer throwDie: aDice) equals: 1.
	self assert: (aPlayer throwDie: aDice) equals: 2
]

{ #category : #tests }
PlayerTest >> testPlayerThrowDice [
	| aPlayer aDice aDice2 aDice3 |
	aDice := Die withThisNumberOfSides: 5.
	aDice2 := Die withThisNumberOfSides: 5.
	aDice3 := Die withThisNumberOfSides: 5.
	aPlayer := Player named: 'Leo'.
	self
		assert:
			(aPlayer
				throwDice:
					{aDice.
					aDice2.
					aDice3})
		equals: 3.
	self
		assert:
			(aPlayer
				throwDice:
					{aDice.
					aDice2.
					aDice3})
		equals: 6.
	self
		assert:
			(aPlayer
				throwDice:
					{aDice.
					aDice2.
					aDice3})
		equals: 9
]
