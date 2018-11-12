Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'name',
		'cards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Player class >> named: aString [
	^ self new initializeNamed: aString
]

{ #category : #updating }
Player >> addCard: aCard [ 
	cards add: aCard 
]

{ #category : #testing }
Player >> hasCard: aCard [ 
	^cards includes: aCard 
]

{ #category : #initialization }
Player >> initializeNamed: theirOwnName [
	name := theirOwnName.
	cards := {  } asOrderedCollection 
]

{ #category : #accessing }
Player >> name [
	^name 
]

{ #category : #updating }
Player >> removeCard: aCard [ 
	cards remove: aCard
]

{ #category : #interaction }
Player >> takesATurnIn: aGame [
	aGame playTurn: self
]

{ #category : #interaction }
Player >> throwDice: aDice [
	^ aDice sumNumbers: [ :aDie | aDie roll ]
]

{ #category : #interactions }
Player >> useCard: aCard on: aGame affecting: aCollection [
	(self hasCard: aCard)
		ifTrue: [ aCard verifyCardIsApplicableBy: self on: aGame.
			aCard applyOn: aGame to: aCollection.
			self removeCard: aCard ]
]
