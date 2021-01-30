Class {
	#name : #BlRopeableCollectionFileFinalizer,
	#superclass : #Object,
	#instVars : [
		'binaryStream'
	],
	#category : #'Containers-Rope-MayForBloc'
}

{ #category : #accessing }
BlRopeableCollectionFileFinalizer >> binaryStream [
	^ binaryStream
]

{ #category : #accessing }
BlRopeableCollectionFileFinalizer >> binaryStream: anObject [
	binaryStream := anObject
]

{ #category : #finalization }
BlRopeableCollectionFileFinalizer >> finalize [ 

	binaryStream close.
]
