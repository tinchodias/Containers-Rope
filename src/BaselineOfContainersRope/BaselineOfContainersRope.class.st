Class {
	#name : #BaselineOfContainersRope,
	#superclass : #BaselineOf,
	#category : #BaselineOfContainersRope
}

{ #category : #baseline }
BaselineOfContainersRope >> baseline: spec [ 
	<baseline>

	spec for: #pharo do: [		
		spec package: 'Containers-Rope'.
		spec package: 'Containers-Rope-Example' with: [ spec requires: #('Containers-Rope') ]
	]
]
