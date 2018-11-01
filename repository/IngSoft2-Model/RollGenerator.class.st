Class {
	#name : #RollGenerator,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
RollGenerator >> next: aLimit [
	self subclassResponsibility
]
