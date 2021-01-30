"
I have been automatically converted and probably manually tweaked from BlCollectionRopeExamples. Pay attention there is an important design decision in such tests. First to let GT people execute them, the tests and helpers are tagged with <gtExample> do not remove them, let also the <label:...>.
	Finally and more important such tests should not use setup because every method should be in capacity of returning a fully working object called an example :)
"
Class {
	#name : #BlCollectionRopeTest,
	#superclass : #TestCase,
	#category : #'Containers-Rope-Example'
}

{ #category : #metadata }
BlCollectionRopeTest >> originClassName [
	"This test was generated from..."
	^ 'BlCollectionRopeExamples'
]

{ #category : #'seed example' }
BlCollectionRopeTest >> small [

	<gtExample>
	<label:
	'Creates an instance of the rope of size smaller than combineLength'>
	| aRope |
	aRope := BlCollectionRope collection: 'Hello'.
	^ aRope
]

{ #category : #'seed example' }
BlCollectionRopeTest >> smallEmpty [

	<gtExample>
	| aRope anEmpty |
	aRope := self small.
	anEmpty := aRope empty.
	^ anEmpty
]

{ #category : #tests }
BlCollectionRopeTest >> testAttributesEmpty0To0 [

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
BlCollectionRopeTest >> testAttributesSmall0To0 [

	<gtExample>
	| aRope anAttributedRope |
	aRope := self small.
	anAttributedRope := aRope attributes: { 1 } from: 0 to: 0.

	self assert: anAttributedRope left attributes equals: { 1 }.
	self assert: anAttributedRope left rope asString equals: ''.

	self assert: anAttributedRope right == aRope.

	^ anAttributedRope
]

{ #category : #tests }
BlCollectionRopeTest >> testAttributesSmall0To1 [

	<gtExample>
	| aRope anAttributedRope |
	aRope := self small.
	anAttributedRope := aRope attributes: { 1 } from: 0 to: 1.

	self assert: anAttributedRope left attributes equals: { 1 }.
	self assert: anAttributedRope left rope asString equals: 'H'.

	self assert: anAttributedRope right asString equals: 'ello'.

	^ anAttributedRope
]

{ #category : #tests }
BlCollectionRopeTest >> testAttributesSmall0To5 [

	<gtExample>
	| aRope anAttributedRope |
	aRope := self small.
	anAttributedRope := aRope attributes: { 1 } from: 0 to: 5.

	self assert: anAttributedRope rope == aRope.
	self assert: anAttributedRope attributes equals: { 1 }.

	^ anAttributedRope
]

{ #category : #tests }
BlCollectionRopeTest >> testAttributesSmall2To2 [

	<gtExample>
	| aRope anAttributedRope |
	aRope := self small.
	anAttributedRope := aRope attributes: { 1 } from: 2 to: 2.

	self assert: anAttributedRope left asString equals: 'He'.

	self assert: anAttributedRope right left rope asString equals: ''.
	self assert: anAttributedRope right left attributes equals: { 1 }.

	self assert: anAttributedRope right right asString equals: 'llo'.

	^ anAttributedRope
]

{ #category : #tests }
BlCollectionRopeTest >> testAttributesSmall4To5 [

	<gtExample>
	| aRope anAttributedRope |
	aRope := self small.
	anAttributedRope := aRope attributes: { 1 } from: 4 to: 5.

	self assert: anAttributedRope left asString equals: 'Hell'.

	self assert: anAttributedRope right attributes equals: { 1 }.
	self assert: anAttributedRope right rope asString equals: 'o'.

	^ anAttributedRope
]

{ #category : #tests }
BlCollectionRopeTest >> testAttributesSmall5To5 [

	<gtExample>
	| aRope anAttributedRope |
	aRope := self small.
	anAttributedRope := aRope attributes: { 1 } from: 5 to: 5.

	self assert: anAttributedRope left asString equals: 'Hello'.

	self assert: anAttributedRope right attributes equals: { 1 }.
	self assert: anAttributedRope right rope asString equals: ''.

	^ anAttributedRope
]

{ #category : #tests }
BlCollectionRopeTest >> testClearAttributesEmpty0To0 [

	<gtExample>
	| anEmptyRope aRopeWithoutAttributes |
	anEmptyRope := self smallEmpty.
	aRopeWithoutAttributes := anEmptyRope clearAttributes: 0 to: 0.

	self assert: aRopeWithoutAttributes isEmpty.
	self assert: aRopeWithoutAttributes == anEmptyRope.

	^ aRopeWithoutAttributes
]

{ #category : #tests }
BlCollectionRopeTest >> testSmall [

	<gtExample>
	<label:
	'Creates an instance of the rope of size smaller than combineLength'>
	| aRope |
	aRope := self small.

	self assert: aRope depth equals: 1.
	self assert: aRope size equals: 5.
	self assert: aRope collection equals: 'Hello'.
	self assert: aRope isLeaf.
	self assert: aRope size <= BlRope combineLength.

	^ aRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallAtEach [

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
BlCollectionRopeTest >> testSmallChildren [

	<gtExample>
	| aRope |
	aRope := self small.

	self assert: aRope children equals: {  }.

	^ aRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallDelete0To0 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope delete: 0 to: 0.

	self assert: aNewRope == aRope.

	^ aNewRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallDelete0To1 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope delete: 0 to: 1.

	self assert: aNewRope size equals: 4.
	self assert: aNewRope asString equals: 'ello'.

	^ aNewRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallDelete0To5 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope delete: 0 to: 5.

	self assert: aNewRope size equals: 0.
	self assert: aNewRope asString equals: ''.

	^ aNewRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallDelete1To1 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope delete: 1 to: 1.

	self assert: aNewRope == aRope.

	^ aNewRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallDelete1To3 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope delete: 1 to: 3.

	self assert: aNewRope size equals: 3.
	self assert: aNewRope asString equals: 'Hlo'.

	^ aNewRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallDelete1To5 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope delete: 1 to: 5.

	self assert: aNewRope size equals: 1.
	self assert: aNewRope asString equals: 'H'.

	^ aNewRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallDelete4To5 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope delete: 4 to: 5.

	self assert: aNewRope size equals: 4.
	self assert: aNewRope asString equals: 'Hell'.

	^ aNewRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallDelete5To5 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope delete: 5 to: 5.

	self assert: aNewRope == aRope.

	^ aNewRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallDepth [

	<gtExample>
	| aRope |
	aRope := self small.

	self assert: aRope depth equals: 1.

	^ aRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallDo [

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
BlCollectionRopeTest >> testSmallEmpty [

	<gtExample>
	| aRope anEmpty |
	aRope := self small.
	anEmpty := aRope empty.

	self assert: anEmpty size equals: 0.
	self assert: anEmpty asString equals: ''.

	^ anEmpty
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallFrom0To0 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope from: 0 to: 0.

	self assert: aNewRope size equals: 0.
	self assert: aNewRope asString equals: ''.

	^ aNewRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallFrom0To0Do [

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
BlCollectionRopeTest >> testSmallFrom0To1 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope from: 0 to: 1.

	self assert: aNewRope size equals: 1.
	self assert: aNewRope asString equals: 'H'.

	^ aNewRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallFrom0To1Do [

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
BlCollectionRopeTest >> testSmallFrom0To5 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope from: 0 to: 5.

	self assert: aNewRope == aRope.

	^ aNewRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallFrom0To5Do [

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
BlCollectionRopeTest >> testSmallFrom1To1 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope from: 1 to: 1.

	self assert: aNewRope size equals: 0.
	self assert: aNewRope asString equals: ''.

	^ aNewRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallFrom1To1Do [

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
BlCollectionRopeTest >> testSmallFrom1To2 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope from: 1 to: 2.

	self assert: aNewRope size equals: 1.
	self assert: aNewRope asString equals: 'e'.

	^ aNewRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallFrom1To2Do [

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
BlCollectionRopeTest >> testSmallFrom1To5 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope from: 1 to: 5.

	self assert: aNewRope size equals: 4.
	self assert: aNewRope asString equals: 'ello'.

	^ aNewRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallFrom1To5Do [

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
BlCollectionRopeTest >> testSmallFrom3To5 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope from: 3 to: 5.

	self assert: aNewRope size equals: 2.
	self assert: aNewRope asString equals: 'lo'.

	^ aNewRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallFrom3To5Do [

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
BlCollectionRopeTest >> testSmallInsertRope123At0 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope insert: (BlCollectionRope collection: '123') at: 0.

	self assert: aNewRope size equals: 8.
	self assert: aNewRope asString equals: '123Hello'.

	^ aNewRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallInsertRope123At1 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope insert: (BlCollectionRope collection: '123') at: 1.

	self assert: aNewRope size equals: 8.
	self assert: aNewRope asString equals: 'H123ello'.

	^ aNewRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallInsertRope123At2 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope insert: (BlCollectionRope collection: '123') at: 2.

	self assert: aNewRope size equals: 8.
	self assert: aNewRope asString equals: 'He123llo'.

	^ aNewRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallInsertRope123At3 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope insert: (BlCollectionRope collection: '123') at: 3.

	self assert: aNewRope size equals: 8.
	self assert: aNewRope asString equals: 'Hel123lo'.

	^ aNewRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallInsertRope123At4 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope insert: (BlCollectionRope collection: '123') at: 4.

	self assert: aNewRope size equals: 8.
	self assert: aNewRope asString equals: 'Hell123o'.

	^ aNewRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallInsertRope123At5 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope insert: (BlCollectionRope collection: '123') at: 5.

	self assert: aNewRope size equals: 8.
	self assert: aNewRope asString equals: 'Hello123'.

	^ aNewRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallInsertString123At0 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope insertItems: '123' at: 0.

	self assert: aNewRope size equals: 8.
	self assert: aNewRope asString equals: '123Hello'.

	^ aNewRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallInsertString123At1 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope insertItems: '123' at: 1.

	self assert: aNewRope size equals: 8.
	self assert: aNewRope asString equals: 'H123ello'.

	^ aNewRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallInsertString123At2 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope insertItems: '123' at: 2.

	self assert: aNewRope size equals: 8.
	self assert: aNewRope asString equals: 'He123llo'.

	^ aNewRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallInsertString123At3 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope insertItems: '123' at: 3.

	self assert: aNewRope size equals: 8.
	self assert: aNewRope asString equals: 'Hel123lo'.

	^ aNewRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallInsertString123At4 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope insertItems: '123' at: 4.

	self assert: aNewRope size equals: 8.
	self assert: aNewRope asString equals: 'Hell123o'.

	^ aNewRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallInsertString123At5 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope insertItems: '123' at: 5.

	self assert: aNewRope size equals: 8.
	self assert: aNewRope asString equals: 'Hello123'.

	^ aNewRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallIsEmpty [

	<gtExample>
	| aRope |
	aRope := self small.

	self assert: aRope isEmpty not.

	^ aRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallIsLeaf [

	<gtExample>
	| aRope |
	aRope := self small.

	self assert: aRope isLeaf.

	^ aRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallIsNotEmpty [

	<gtExample>
	| aRope |
	aRope := self small.

	self assert: aRope isNotEmpty.

	^ aRope
]

{ #category : #tests }
BlCollectionRopeTest >> testSmallSize [

	<gtExample>
	| aRope |
	aRope := self small.

	self assert: aRope size equals: 5.

	^ aRope
]
