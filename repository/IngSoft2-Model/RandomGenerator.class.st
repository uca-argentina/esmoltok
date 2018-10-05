Class {
	#name : #RandomGenerator,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
RandomGenerator >> next: aLimit [
	^ aLimit atRandom
]
