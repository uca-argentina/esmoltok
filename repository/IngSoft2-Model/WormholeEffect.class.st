Class {
	#name : #WormholeEffect,
	#superclass : #Effect,
	#category : #'IngSoft2-Model'
}

{ #category : #interactions }
WormholeEffect >> triggerOn: aGame and: aPlayer [
	aGame applyWormHoleEffectTo: aPlayer positionDecrementedBy: 4 negated
]
