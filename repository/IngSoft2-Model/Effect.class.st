Class {
	#name : #Effect,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #interaction }
Effect >> triggerOn: aGame afterMovementOf: aPlayer [
	self subclassResponsibility
]
