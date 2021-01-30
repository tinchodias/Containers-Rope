Class {
	#name : #BlTextForegroundAttributeMock,
	#superclass : #Object,
	#instVars : [
		'paint'
	],
	#category : #'Containers-Rope-Example'
}

{ #category : #'public - shape' }
BlTextForegroundAttributeMock class >> paint: aColor [
	^ self new paint: aColor; yourself
]

{ #category : #accessing }
BlTextForegroundAttributeMock >> paint: aColor [

	paint := aColor
]
