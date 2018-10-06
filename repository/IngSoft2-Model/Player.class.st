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
	aGame playTurn: self
]

{ #category : #interaction }
Player >> throwDice: aDice [
	^ aDice sumNumbers: [ :aDie | aDie roll ]
]

{ #category : #interaction }
Player >> throwDie: aDie [
	^ aDie roll
]
