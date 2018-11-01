Class {
	#name : #RandomGenerator,
	#superclass : #RollGenerator,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
RandomGenerator >> next: aLimit [
	^ aLimit atRandom
]
