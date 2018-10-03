Class {
	#name : #RandomGenerator,
	#superclass : #Object,
	#instVars : [
		'limit'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
RandomGenerator class >> withThisLimit: anInteger [ 
	^self new withThisLimit: anInteger 
]

{ #category : #accessing }
RandomGenerator >> limit [
	^limit
]

{ #category : #accesing }
RandomGenerator >> next [
	^limit atRandom 
]

{ #category : #initialization }
RandomGenerator >> withThisLimit: anInteger [ 
	limit:=anInteger
]
