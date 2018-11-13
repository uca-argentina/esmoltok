Class {
	#name : #UtilitiesForTests,
	#superclass : #Object,
	#category : #'IngSoft2-Tests'
}

{ #category : #interaction }
UtilitiesForTests class >> collectionOf20NoEffect [
	| noEffect result collection distributor |
	noEffect := NoEffect new.
	collection := {(noEffect -> 100)}.
	distributor := Distributor new.
	result := distributor generateFrom: collection withLength: 20.
	^ result
]
