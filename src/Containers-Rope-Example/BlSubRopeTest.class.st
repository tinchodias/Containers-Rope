"
I have been automatically converted and probably manually tweaked from BlSubRopeExamples. Pay attention there is an important design decision in such tests. First to let GT people execute them, the tests and helpers are tagged with <gtExample> do not remove them, let also the <label:...>.
	Finally and more important such tests should not use setup because every method should be in capacity of returning a fully working object called an example :)
"
Class {
	#name : #BlSubRopeTest,
	#superclass : #TestCase,
	#category : #'Containers-Rope-Example'
}

{ #category : #metadata }
BlSubRopeTest >> originClassName [
	"This test was generated from..."
	^ 'BlSubRopeExamples'
]

{ #category : #'seed example' }
BlSubRopeTest >> small [

	<gtExample>
	<label:
	'Creates an instance of the rope of size smaller than combineLength with one attribute applied on the whole rope'>
	| aCollectionRope aRope |
	aCollectionRope := BlCollectionRope collection: 'EarthHelloWorld'.
	aRope := BlSubRope rope: aCollectionRope offset: 5 length: 5.
	^ aRope
]

{ #category : #'seed example' }
BlSubRopeTest >> smallEmpty [

	<gtExample>
	| aRope anEmpty |
	aRope := self small.
	anEmpty := aRope empty.
	^ anEmpty
]

{ #category : #tests }
BlSubRopeTest >> testAttributesEmpty0To0 [

	<gtExample>
	| aRope anAttributedRope |
	aRope := self smallEmpty.
	anAttributedRope := aRope attributes: { 1 } from: 0 to: 0.

	self assert: anAttributedRope isNotEmpty.
	self assert: anAttributedRope attributes equals: { 1 }.
	self assert: anAttributedRope rope == aRope.

	^ anAttributedRope
]

{ #category : #tests }
BlSubRopeTest >> testAttributesSmall0To0 [

	<gtExample>
	| aRope anAttributedRope |
	aRope := self small.
	anAttributedRope := aRope attributes: { 1 } from: 0 to: 0.

	self assert: anAttributedRope left attributes equals: { 1 }.
	self assert: anAttributedRope left rope collection equals: ''.

	self assert: anAttributedRope right == aRope.

	^ anAttributedRope
]

{ #category : #tests }
BlSubRopeTest >> testAttributesSmall0To1 [

	<gtExample>
	| aRope anAttributedRope |
	aRope := self small.
	anAttributedRope := aRope attributes: { 1 } from: 0 to: 1.

	self assert: anAttributedRope left attributes equals: { 1 }.

	self assert: anAttributedRope left attributes equals: { 1 }.
	self assert: anAttributedRope left rope size equals: 1.
	self assert: anAttributedRope left rope offset equals: 5.
	self assert: anAttributedRope left rope rope == aRope rope.

	self assert: anAttributedRope right size equals: 4.
	self assert: anAttributedRope right offset equals: 6.
	self assert: anAttributedRope right rope == aRope rope.

	^ anAttributedRope
]

{ #category : #tests }
BlSubRopeTest >> testAttributesSmall0To5 [

	<gtExample>
	| aRope anAttributedRope |
	aRope := self small.
	anAttributedRope := aRope attributes: { 1 } from: 0 to: 5.

	self assert: anAttributedRope rope == aRope.
	self assert: anAttributedRope attributes equals: { 1 }.

	^ anAttributedRope
]

{ #category : #tests }
BlSubRopeTest >> testAttributesSmall2To2 [

	<gtExample>
	| aRope anAttributedRope |
	aRope := self small.
	anAttributedRope := aRope attributes: { 1 } from: 2 to: 2.


	self assert: anAttributedRope left size equals: 2.
	self assert: anAttributedRope left offset equals: 5.
	self assert: anAttributedRope left rope == aRope rope.

	self assert: anAttributedRope right left size equals: 0.
	self assert: anAttributedRope right left attributes equals: { 1 }.
	self assert: anAttributedRope right left rope collection equals: ''.

	self assert: anAttributedRope right right offset equals: 7.
	self assert: anAttributedRope right right rope == aRope rope.

	^ anAttributedRope
]

{ #category : #tests }
BlSubRopeTest >> testAttributesSmall4To5 [

	<gtExample>
	| aRope anAttributedRope |
	aRope := self small.
	anAttributedRope := aRope attributes: { 1 } from: 4 to: 5.

	self assert: anAttributedRope left size equals: 4.
	self assert: anAttributedRope left offset equals: 5.
	self assert: anAttributedRope left rope == aRope rope.

	self assert: anAttributedRope right attributes equals: { 1 }.
	self assert: anAttributedRope right rope size equals: 1.
	self assert: anAttributedRope right rope offset equals: 9.
	self assert: anAttributedRope right rope rope == aRope rope.

	^ anAttributedRope
]

{ #category : #tests }
BlSubRopeTest >> testAttributesSmall5To5 [

	<gtExample>
	| aRope anAttributedRope |
	aRope := self small.
	anAttributedRope := aRope attributes: { 1 } from: 5 to: 5.

	self assert: anAttributedRope left == aRope.

	self assert: anAttributedRope right attributes equals: { 1 }.
	self assert: anAttributedRope right rope collection equals: ''.

	^ anAttributedRope
]

{ #category : #tests }
BlSubRopeTest >> testClearAttributesEmpty0To0 [

	<gtExample>
	| anEmptyRope aRopeWithoutAttributes |
	anEmptyRope := self smallEmpty.
	aRopeWithoutAttributes := anEmptyRope clearAttributes: 0 to: 0.

	self assert: aRopeWithoutAttributes isEmpty.
	self assert: aRopeWithoutAttributes == anEmptyRope.

	^ aRopeWithoutAttributes
]

{ #category : #tests }
BlSubRopeTest >> testReadStreamSmall [

	<gtExample>
	| rope stream |
	rope := self small.
	stream := rope readStream.

	self assert: stream next equals: $H.
	self assert: (stream next: 3) asString equals: 'ell'.
	self assert: stream upToEnd asString equals: 'o'
]

{ #category : #tests }
BlSubRopeTest >> testSmall [

	<gtExample>
	<label:
	'Creates an instance of the rope of size smaller than combineLength with one attribute applied on the whole rope'>
	| aCollectionRope aRope |
	aCollectionRope := BlCollectionRope collection: 'EarthHelloWorld'.

	aRope := BlSubRope rope: aCollectionRope offset: 5 length: 5.

	"attribute rope does not increase depth because it is just a plain wrapper"
	self assert: aRope depth equals: 1.
	self assert: aRope size equals: 5.
	self assert: aRope offset equals: 5.
	self assert: aRope rope == aCollectionRope.
	self assert: aRope isLeaf not.
	self assert: aRope size <= BlRope combineLength.

	^ aRope
]

{ #category : #tests }
BlSubRopeTest >> testSmallAtEach [

	<gtExample>
	| aRope |
	aRope := self small.

	self assert: (aRope at: 1) equals: $H.
	self assert: (aRope at: 2) equals: $e.
	self assert: (aRope at: 3) equals: $l.
	self assert: (aRope at: 4) equals: $l.
	self assert: (aRope at: 5) equals: $o.

	^ aRope
]

{ #category : #tests }
BlSubRopeTest >> testSmallChildren [

	<gtExample>
	| aRope |
	aRope := self small.

	self assert: aRope children equals: { aRope rope }.

	^ aRope
]

{ #category : #tests }
BlSubRopeTest >> testSmallDelete0To0 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope delete: 0 to: 0.

	self assert: aNewRope == aRope.

	^ aNewRope
]

{ #category : #tests }
BlSubRopeTest >> testSmallDelete0To1 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope delete: 0 to: 1.

	self assert: aNewRope size equals: 4.
	self assert: aNewRope collection equals: 'ello'.

	^ aNewRope
]

{ #category : #tests }
BlSubRopeTest >> testSmallDelete0To5 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope delete: 0 to: 5.

	self assert: aNewRope size equals: 0.
	self assert: aNewRope collection equals: ''.

	^ aNewRope
]

{ #category : #tests }
BlSubRopeTest >> testSmallDelete1To1 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope delete: 1 to: 1.

	self assert: aNewRope == aRope.

	^ aNewRope
]

{ #category : #tests }
BlSubRopeTest >> testSmallDelete1To3 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope delete: 1 to: 3.

	self assert: aNewRope size equals: 3.
	self assert: aNewRope collection equals: 'Hlo'.

	^ aNewRope
]

{ #category : #tests }
BlSubRopeTest >> testSmallDelete1To5 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope delete: 1 to: 5.

	self assert: aNewRope size equals: 1.
	self assert: aNewRope collection equals: 'H'.

	^ aNewRope
]

{ #category : #tests }
BlSubRopeTest >> testSmallDelete4To5 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope delete: 4 to: 5.

	self assert: aNewRope size equals: 4.
	self assert: aNewRope collection equals: 'Hell'.

	^ aNewRope
]

{ #category : #tests }
BlSubRopeTest >> testSmallDelete5To5 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope delete: 5 to: 5.

	self assert: aNewRope == aRope.

	^ aNewRope
]

{ #category : #tests }
BlSubRopeTest >> testSmallDepth [

	<gtExample>
	| aRope |
	aRope := self small.

	self assert: aRope depth equals: 1.

	^ aRope
]

{ #category : #tests }
BlSubRopeTest >> testSmallDo [

	<gtExample>
	| aRope theIterated |
	aRope := self small.
	theIterated := String streamContents: [ :aStream | 
		               aRope do: [ :eachCharacter | 
			               aStream nextPut: eachCharacter ] ].

	self assert: theIterated equals: 'Hello'.

	^ theIterated
]

{ #category : #tests }
BlSubRopeTest >> testSmallEmpty [

	<gtExample>
	| aRope anEmpty |
	aRope := self small.
	anEmpty := aRope empty.

	self assert: anEmpty size equals: 0.
	self assert: anEmpty collection equals: ''.

	^ anEmpty
]

{ #category : #tests }
BlSubRopeTest >> testSmallFrom0To0 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope from: 0 to: 0.

	self assert: aNewRope size equals: 0.
	self assert: aNewRope collection equals: ''.

	^ aNewRope
]

{ #category : #tests }
BlSubRopeTest >> testSmallFrom0To0Do [

	<gtExample>
	| aRope theIterated |
	aRope := self small.
	theIterated := String streamContents: [ :aStream | 
		               aRope
			               from: 0
			               to: 0
			               do: [ :eachCharacter | 
			               aStream nextPut: eachCharacter ] ].

	self assert: theIterated equals: ''.

	^ theIterated
]

{ #category : #tests }
BlSubRopeTest >> testSmallFrom0To1 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope from: 0 to: 1.

	self assert: aNewRope size equals: 1.
	self assert: aNewRope offset equals: 5.
	self assert: aNewRope rope == aRope rope.

	^ aNewRope
]

{ #category : #tests }
BlSubRopeTest >> testSmallFrom0To1Do [

	<gtExample>
	| aRope theIterated |
	aRope := self small.
	theIterated := String streamContents: [ :aStream | 
		               aRope
			               from: 0
			               to: 1
			               do: [ :eachCharacter | 
			               aStream nextPut: eachCharacter ] ].

	self assert: theIterated equals: 'H'.

	^ theIterated
]

{ #category : #tests }
BlSubRopeTest >> testSmallFrom0To5 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope from: 0 to: 5.

	self assert: aNewRope == aRope.

	^ aNewRope
]

{ #category : #tests }
BlSubRopeTest >> testSmallFrom0To5Do [

	<gtExample>
	| aRope theIterated |
	aRope := self small.
	theIterated := String streamContents: [ :aStream | 
		               aRope
			               from: 0
			               to: 5
			               do: [ :eachCharacter | 
			               aStream nextPut: eachCharacter ] ].

	self assert: theIterated equals: 'Hello'.

	^ theIterated
]

{ #category : #tests }
BlSubRopeTest >> testSmallFrom1To1 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope from: 1 to: 1.

	self assert: aNewRope size equals: 0.
	self assert: aNewRope collection equals: ''.

	^ aNewRope
]

{ #category : #tests }
BlSubRopeTest >> testSmallFrom1To1Do [

	<gtExample>
	| aRope theIterated |
	aRope := self small.
	theIterated := String streamContents: [ :aStream | 
		               aRope
			               from: 1
			               to: 1
			               do: [ :eachCharacter | 
			               aStream nextPut: eachCharacter ] ].

	self assert: theIterated equals: ''.

	^ theIterated
]

{ #category : #tests }
BlSubRopeTest >> testSmallFrom1To2 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope from: 1 to: 2.

	self assert: aNewRope size equals: 1.
	self assert: aNewRope offset equals: 6.
	self assert: aNewRope rope == aRope rope.

	^ aNewRope
]

{ #category : #tests }
BlSubRopeTest >> testSmallFrom1To2Do [

	<gtExample>
	| aRope theIterated |
	aRope := self small.
	theIterated := String streamContents: [ :aStream | 
		               aRope
			               from: 1
			               to: 2
			               do: [ :eachCharacter | 
			               aStream nextPut: eachCharacter ] ].

	self assert: theIterated equals: 'e'.

	^ theIterated
]

{ #category : #tests }
BlSubRopeTest >> testSmallFrom1To5 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope from: 1 to: 5.

	self assert: aNewRope size equals: 4.
	self assert: aNewRope offset equals: 6.
	self assert: aNewRope rope == aRope rope.

	^ aNewRope
]

{ #category : #tests }
BlSubRopeTest >> testSmallFrom1To5Do [

	<gtExample>
	| aRope theIterated |
	aRope := self small.
	theIterated := String streamContents: [ :aStream | 
		               aRope
			               from: 1
			               to: 5
			               do: [ :eachCharacter | 
			               aStream nextPut: eachCharacter ] ].

	self assert: theIterated equals: 'ello'.

	^ theIterated
]

{ #category : #tests }
BlSubRopeTest >> testSmallFrom3To5 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope from: 3 to: 5.

	self assert: aNewRope size equals: 2.
	self assert: aNewRope offset equals: 8.
	self assert: aNewRope rope == aRope rope.

	^ aNewRope
]

{ #category : #tests }
BlSubRopeTest >> testSmallFrom3To5Do [

	<gtExample>
	| aRope theIterated |
	aRope := self small.
	theIterated := String streamContents: [ :aStream | 
		               aRope
			               from: 3
			               to: 5
			               do: [ :eachCharacter | 
			               aStream nextPut: eachCharacter ] ].

	self assert: theIterated equals: 'lo'.

	^ theIterated
]

{ #category : #tests }
BlSubRopeTest >> testSmallIsEmpty [

	<gtExample>
	| aRope |
	aRope := self small.

	self assert: aRope isEmpty not.

	^ aRope
]

{ #category : #tests }
BlSubRopeTest >> testSmallIsLeaf [

	<gtExample>
	| aRope |
	aRope := self small.

	self assert: aRope isLeaf not.

	^ aRope
]

{ #category : #tests }
BlSubRopeTest >> testSmallIsNotEmpty [

	<gtExample>
	| aRope |
	aRope := self small.

	self assert: aRope isNotEmpty.

	^ aRope
]

{ #category : #tests }
BlSubRopeTest >> testSmallSize [

	<gtExample>
	| aRope |
	aRope := self small.

	self assert: aRope size equals: 5.

	^ aRope
]
