Extension { #name : #Character }

{ #category : #'*Containers-Rope' }
Character >> isLineBreak [
	^ self = self class cr or: [ self = self class lf or: [ self = self class nel ] ]
]
