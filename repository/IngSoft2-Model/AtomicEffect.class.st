Class {
	#name : #AtomicEffect,
	#superclass : #Effect,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
AtomicEffect >> triggerOn: aGame and: aPlayer [
	aGame applyAtomicEffect: aPlayer
]
