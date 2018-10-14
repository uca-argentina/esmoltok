Class {
	#name : #Turn,
	#superclass : #Object,
	#instVars : [
		'nameOrder',
		'currentTurn'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Turn class >> names: aCollection [ 
	^ self new initializeNames: aCollection.
]

{ #category : #accessing }
Turn >> currentTurn [
	^ currentTurn
]

{ #category : #initialization }
Turn >> initializeNames: aCollection [ 
	nameOrder:= aCollection.
	currentTurn:= aCollection first.
]

{ #category : #accessing }
Turn >> order [
	^ nameOrder
]

{ #category : #assertions }
Turn >> turnOf: aName [ 
	^(aName = currentTurn)
		ifFalse: [ AssertionFailure signal: ('This isn''t the turn of {1}' format: {aName}) ]
]

{ #category : #updating }
Turn >> updateToNextTurn [
	 currentTurn := currentTurn = nameOrder last
		ifTrue: [  nameOrder first ]
		ifFalse: [ nameOrder after: currentTurn ]
]
