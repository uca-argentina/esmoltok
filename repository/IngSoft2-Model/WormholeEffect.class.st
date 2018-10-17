Class {
	#name : #WormholeEffect,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #interactions }
WormholeEffect >> triggerOn: aGame and: aPlayer [
	aGame applyWormHoleEffectTo: aPlayer positionIncrementedBy: 4 negated
]
