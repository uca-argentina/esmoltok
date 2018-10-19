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
	| player die |
	player := Player named: 'Leo'.
	die := Die withSides: 5 andGenerator: (CircularIterator over: {1 . 2}).
	self assert: (player throwDice: {die}) equals: 1.
	self assert: (player throwDice: {die}) equals: 2
]

{ #category : #tests }
PlayerTest >> testPlayerThrowDice [
	| player die die2 die3 |
	die := Die withSides: 5 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	die2 := Die withSides: 5 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	die3 := Die withSides: 5 andGenerator: (CircularIterator over: {1 . 2 . 3 . 4 . 5}).
	player := Player named: 'Leo'.
	self
		assert:
			(player
				throwDice:
					{die.
					die2.
					die3})
		equals: 3.
	self
		assert:
			(player
				throwDice:
					{die.
					die2.
					die3})
		equals: 6.
	self
		assert:
			(player
				throwDice:
					{die.
					die2.
					die3})
		equals: 9
]
