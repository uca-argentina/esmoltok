Class {
	#name : #SpeedUpEffect,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #interactions }
SpeedUpEffect >> triggerOn: aGame and: aPlayer [
	aGame applySpeedUpEffectTo: aPlayer positionIncrementedBy: 4
]
