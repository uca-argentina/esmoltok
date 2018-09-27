Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Player class >> named: aString [
	^ self new initializeWithName: aString
]

{ #category : #initialization }
Player >> initializeWithName: theirOwnName [
	name := theirOwnName
]

{ #category : #accessing }
Player >> name [
	^name 
]

{ #category : #interaction }
Player >> takesATurnIn: aGame [
	aGame letsPlay: self
]

{ #category : #interaction }
Player >> throwDice: aDice [
	| aResult |
	aResult := 0.
	1 to: aDice size do: [ :position | aResult := aResult + (aDice at: position) roll ].
	^ aResult
]

{ #category : #interaction }
Player >> throwDie: aDie [
	^ aDie roll
]
