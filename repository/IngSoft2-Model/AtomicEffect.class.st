Class {
	#name : #AtomicEffect,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
AtomicEffect >> triggerOn: aGame and: aPlayer [
	aGame applyAtomicEffect: aPlayer
]
