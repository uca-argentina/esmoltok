Class {
	#name : #SpeedUpEffect,
	#superclass : #Effect,
	#category : #'IngSoft2-Model'
}

{ #category : #interactions }
SpeedUpEffect >> triggerOn: aGame and: aPlayer [
	aGame applySpeedUpEffectTo: aPlayer positionIncrementedBy: 4
]
