Class {
	#name : #WormholeEffect,
	#superclass : #Effect,
	#category : #'IngSoft2-Model'
}

{ #category : #interactions }
WormholeEffect >> triggerOn: aGame and: aPlayer [
	aGame applyWormHoleEffectTo: aPlayer positionIncrementedBy: 4 negated
]
