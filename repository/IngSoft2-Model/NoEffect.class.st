Class {
	#name : #NoEffect,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #interactions }
NoEffect >> triggerOn: aGame and: aPlayer [ 
	aGame applyNoEffectTo: aPlayer 
]
