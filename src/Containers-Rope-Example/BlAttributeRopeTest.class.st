"
I have automatically converted and probably manually tweaked from BlAttributeRopeExamples. Pay attention there is an important design decision in such tests. First to let GT people execute them, the tests and helpers are tagged with <gtExample> do not remove them, let also the <label:...>.
	Finally and more important such tests should not use setup because every method should be in capacity of returning a fully working object called an example :)
"
Class {
	#name : #BlAttributeRopeTest,
	#superclass : #TestCase,
	#category : #'Containers-Rope-Example'
}

{ #category : #metadata }
BlAttributeRopeTest >> originClassName [
	"This test was generated from..."
	^ 'BlAttributeRopeExamples'
]

{ #category : #tests }
BlAttributeRopeTest >> small [
	<gtExample>
	<label:
	'Creates an instance of the rope of size smaller than combineLength with one attribute applied on the whole rope'>
	| aRope |
	aRope := BlAttributeRope
		         attributes: { 0 }
		         rope: (BlCollectionRope collection: 'Hello').

	^ aRope
]

{ #category : #tests }
BlAttributeRopeTest >> smallEmpty [

	<gtExample>
	| aRope anEmpty |
	aRope := self small.
	anEmpty := aRope empty.
	^ anEmpty
]

{ #category : #tests }
BlAttributeRopeTest >> testAttributesEmpty0To0 [

	<gtExample>
	| aRope anAttributedRope |
	aRope := self smallEmpty.
	anAttributedRope := aRope attributes: { 1 } from: 0 to: 0.

	self assert: anAttributedRope isNotEmpty.
	self assert: anAttributedRope attributes equals: { 0. 1 }.
	self assert: anAttributedRope rope == aRope rope.

	^ anAttributedRope
]

{ #category : #tests }
BlAttributeRopeTest >> testAttributesSmall0To0 [

	<gtExample>
	| aRope anAttributedRope |
	aRope := self small.
	anAttributedRope := aRope attributes: { 1 } from: 0 to: 0.

	self assert: anAttributedRope left attributes equals: { 0. 1 }.
	self assert: anAttributedRope left rope collection equals: ''.

	self assert: anAttributedRope right == aRope.

	^ anAttributedRope
]

{ #category : #tests }
BlAttributeRopeTest >> testAttributesSmall0To1 [

	<gtExample>
	| aRope anAttributedRope |
	aRope := self small.
	anAttributedRope := aRope attributes: { 1 } from: 0 to: 1.

	self assert: anAttributedRope left attributes equals: { 0. 1 }.
	self assert: anAttributedRope left rope collection equals: 'H'.

	self assert: anAttributedRope right attributes equals: { 0 }.
	self assert: anAttributedRope right rope collection equals: 'ello'.

	^ anAttributedRope
]

{ #category : #tests }
BlAttributeRopeTest >> testAttributesSmall0To5 [

	<gtExample>
	| aRope anAttributedRope |
	aRope := self small.
	anAttributedRope := aRope attributes: { 1 } from: 0 to: 5.

	self assert: anAttributedRope rope == aRope rope.
	self assert: anAttributedRope attributes equals: { 0. 1 }.

	^ anAttributedRope
]

{ #category : #tests }
BlAttributeRopeTest >> testAttributesSmall2To2 [

	<gtExample>
	| aRope anAttributedRope |
	aRope := self small.
	anAttributedRope := aRope attributes: { 1 } from: 2 to: 2.

	self assert: anAttributedRope left rope collection equals: 'He'.
	self assert: anAttributedRope left attributes equals: { 0 }.

	self assert: anAttributedRope right left rope collection equals: ''.
	self assert: anAttributedRope right left attributes equals: { 0. 1 }.

	self
		assert: anAttributedRope right right rope collection
		equals: 'llo'.
	self assert: anAttributedRope right right attributes equals: { 0 }.

	^ anAttributedRope
]

{ #category : #tests }
BlAttributeRopeTest >> testAttributesSmall4To5 [

	<gtExample>
	| aRope anAttributedRope |
	aRope := self small.
	anAttributedRope := aRope attributes: { 1 } from: 4 to: 5.

	self assert: anAttributedRope left attributes equals: { 0 }.
	self assert: anAttributedRope left rope collection equals: 'Hell'.

	self assert: anAttributedRope right attributes equals: { 0. 1 }.
	self assert: anAttributedRope right rope collection equals: 'o'.

	^ anAttributedRope
]

{ #category : #tests }
BlAttributeRopeTest >> testAttributesSmall5To5 [

	<gtExample>
	| aRope anAttributedRope |
	aRope := self small.
	anAttributedRope := aRope attributes: { 1 } from: 5 to: 5.

	self assert: anAttributedRope left == aRope.

	self assert: anAttributedRope right attributes equals: { 0. 1 }.
	self assert: anAttributedRope right rope collection equals: ''.

	^ anAttributedRope
]

{ #category : #tests }
BlAttributeRopeTest >> testClearAttributesEmpty0To0 [

	<gtExample>
	| anEmptyRope aRopeWithoutAttributes |
	anEmptyRope := self smallEmpty.

	"clearing attributes on the empty attributed rope actually completely removes attributes"
	aRopeWithoutAttributes := anEmptyRope clearAttributes: 0 to: 0.

	self assert: aRopeWithoutAttributes isEmpty.
	self assert: aRopeWithoutAttributes collection equals: ''.
	self assert: aRopeWithoutAttributes == anEmptyRope rope.

	^ aRopeWithoutAttributes
]

{ #category : #tests }
BlAttributeRopeTest >> testClearAttributesSmall0To0 [

	<gtExample>
	| aRope aRopeWithoutAttributes |
	aRope := self small.
	aRopeWithoutAttributes := aRope clearAttributes: 0 to: 0.

	self assert: aRopeWithoutAttributes == aRope.

	^ aRopeWithoutAttributes
]

{ #category : #tests }
BlAttributeRopeTest >> testClearAttributesSmall0To1 [

	<gtExample>
	| aRope aRopeWithoutAttributes |
	aRope := self small.
	aRopeWithoutAttributes := aRope clearAttributes: 0 to: 1.

	self assert: aRopeWithoutAttributes left collection equals: 'H'.

	self assert: aRopeWithoutAttributes right attributes equals: { 0 }.
	self
		assert: aRopeWithoutAttributes right rope collection
		equals: 'ello'.

	^ aRopeWithoutAttributes
]

{ #category : #tests }
BlAttributeRopeTest >> testMergeAttributes [

	<gtExample>
	| firstDuplicate secondDuplicate theOriginalAttributes theAddedAttributes theAttributesWithoutDuplicates |
	"they are equal but not identical"
	firstDuplicate := String fromString: 'Haba'.
	secondDuplicate := String fromString: 'Haba'.

	self assert: firstDuplicate equals: secondDuplicate.
	self assert: (firstDuplicate == secondDuplicate) not.

	theOriginalAttributes := { 
		                         firstDuplicate.
		                         1.
		                         2 }.
	theAddedAttributes := { 
		                      3.
		                      secondDuplicate }.

	theAttributesWithoutDuplicates := BlAttributeRope
		                                  mergeAttributes:
		                                  theOriginalAttributes
		                                  and: theAddedAttributes.

	self assert: theAttributesWithoutDuplicates equals: { 
			secondDuplicate.
			1.
			2.
			3 }.

	^ theAttributesWithoutDuplicates
]

{ #category : #tests }
BlAttributeRopeTest >> testRemoveDuplicates [

	<gtExample>
	| firstDuplicate secondDuplicate theOriginalAttributes theAttributesWithoutDuplicates |
	"they are equal but not identical"
	firstDuplicate := String fromString: 'Haba'.
	secondDuplicate := String fromString: 'Haba'.

	self assert: firstDuplicate equals: secondDuplicate.
	self assert: (firstDuplicate == secondDuplicate) not.

	theOriginalAttributes := { 
		                         firstDuplicate.
		                         1.
		                         2.
		                         3.
		                         secondDuplicate }.
	theAttributesWithoutDuplicates := BlAttributeRope removeDuplicates:
		                                  theOriginalAttributes.

	self assert: theAttributesWithoutDuplicates equals: { 
			secondDuplicate.
			1.
			2.
			3 }.

	^ theAttributesWithoutDuplicates
]

{ #category : #tests }
BlAttributeRopeTest >> testSmall [

	<gtExample>
	<label:
	'Creates an instance of the rope of size smaller than combineLength with one attribute applied on the whole rope'>
	| aRope |
	aRope := self small.

	"attribute rope does not increase depth because it is just a plain wrapper"
	self assert: aRope depth equals: 1.
	self assert: aRope size equals: 5.
	self assert: aRope attributes equals: { 0 }.
	self assert: aRope rope collection equals: 'Hello'.
	self assert: aRope isLeaf not.
	self assert: aRope size <= BlRope combineLength.

	^ aRope
]

{ #category : #tests }
BlAttributeRopeTest >> testSmallAtEach [

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
BlAttributeRopeTest >> testSmallChildren [

	<gtExample>
	| aRope |
	aRope := self small.

	self assert: aRope children equals: { aRope rope }.

	^ aRope
]

{ #category : #tests }
BlAttributeRopeTest >> testSmallDelete0To0 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope delete: 0 to: 0.

	self assert: aNewRope == aRope.

	^ aNewRope
]

{ #category : #tests }
BlAttributeRopeTest >> testSmallDelete0To1 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope delete: 0 to: 1.

	self assert: aNewRope size equals: 4.
	self assert: aNewRope attributes equals: { 0 }.
	self assert: aNewRope rope collection equals: 'ello'.

	^ aNewRope
]

{ #category : #tests }
BlAttributeRopeTest >> testSmallDelete0To5 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope delete: 0 to: 5.

	self assert: aNewRope size equals: 0.
	self assert: aNewRope attributes equals: { 0 }.
	self assert: aNewRope rope collection equals: ''.

	^ aNewRope
]

{ #category : #tests }
BlAttributeRopeTest >> testSmallDelete1To1 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope delete: 1 to: 1.

	self assert: aNewRope == aRope.

	^ aNewRope
]

{ #category : #tests }
BlAttributeRopeTest >> testSmallDelete1To3 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope delete: 1 to: 3.

	self assert: aNewRope size equals: 3.
	self assert: aNewRope attributes equals: { 0 }.
	self assert: aNewRope rope collection equals: 'Hlo'.

	^ aNewRope
]

{ #category : #tests }
BlAttributeRopeTest >> testSmallDelete1To5 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope delete: 1 to: 5.

	self assert: aNewRope size equals: 1.
	self assert: aNewRope attributes equals: { 0 }.
	self assert: aNewRope rope collection equals: 'H'.

	^ aNewRope
]

{ #category : #tests }
BlAttributeRopeTest >> testSmallDelete4To5 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope delete: 4 to: 5.

	self assert: aNewRope size equals: 4.
	self assert: aNewRope attributes equals: { 0 }.
	self assert: aNewRope rope collection equals: 'Hell'.

	^ aNewRope
]

{ #category : #tests }
BlAttributeRopeTest >> testSmallDelete5To5 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope delete: 5 to: 5.

	self assert: aNewRope == aRope.

	^ aNewRope
]

{ #category : #tests }
BlAttributeRopeTest >> testSmallDepth [

	<gtExample>
	| aRope |
	aRope := self small.

	self assert: aRope depth equals: 1.

	^ aRope
]

{ #category : #tests }
BlAttributeRopeTest >> testSmallDo [

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
BlAttributeRopeTest >> testSmallEmpty [

	<gtExample>
	| anEmpty |
	
	anEmpty := self smallEmpty.

	self assert: anEmpty size equals: 0.
	"is not actually empty, because it preserves the attributes of the original rope"
	self assert: anEmpty isNotEmpty.
	self assert: anEmpty attributes equals: { 0 }.
	self assert: anEmpty rope collection equals: ''.

	^ anEmpty
]

{ #category : #tests }
BlAttributeRopeTest >> testSmallFrom0To0 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope from: 0 to: 0.

	self assert: aNewRope size equals: 0.
	self assert: aNewRope attributes equals: { 0 }.
	self assert: aNewRope rope collection equals: ''.

	^ aNewRope
]

{ #category : #tests }
BlAttributeRopeTest >> testSmallFrom0To0Do [

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
BlAttributeRopeTest >> testSmallFrom0To1 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope from: 0 to: 1.

	self assert: aNewRope size equals: 1.
	self assert: aNewRope attributes equals: { 0 }.
	self assert: aNewRope rope collection equals: 'H'.

	^ aNewRope
]

{ #category : #tests }
BlAttributeRopeTest >> testSmallFrom0To1Do [

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
BlAttributeRopeTest >> testSmallFrom0To5 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope from: 0 to: 5.

	self assert: aNewRope == aRope.

	^ aNewRope
]

{ #category : #tests }
BlAttributeRopeTest >> testSmallFrom0To5Do [

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
BlAttributeRopeTest >> testSmallFrom1To1 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope from: 1 to: 1.

	self assert: aNewRope size equals: 0.
	self assert: aNewRope attributes equals: { 0 }.
	self assert: aNewRope rope collection equals: ''.

	^ aNewRope
]

{ #category : #tests }
BlAttributeRopeTest >> testSmallFrom1To1Do [

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
BlAttributeRopeTest >> testSmallFrom1To2 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope from: 1 to: 2.

	self assert: aNewRope size equals: 1.
	self assert: aNewRope attributes equals: { 0 }.
	self assert: aNewRope rope collection equals: 'e'.

	^ aNewRope
]

{ #category : #tests }
BlAttributeRopeTest >> testSmallFrom1To2Do [

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
BlAttributeRopeTest >> testSmallFrom1To5 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope from: 1 to: 5.

	self assert: aNewRope size equals: 4.
	self assert: aNewRope attributes equals: { 0 }.
	self assert: aNewRope rope collection equals: 'ello'.

	^ aNewRope
]

{ #category : #tests }
BlAttributeRopeTest >> testSmallFrom1To5Do [

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
BlAttributeRopeTest >> testSmallFrom3To5 [

	<gtExample>
	| aRope aNewRope |
	aRope := self small.
	aNewRope := aRope from: 3 to: 5.

	self assert: aNewRope size equals: 2.
	self assert: aNewRope attributes equals: { 0 }.
	self assert: aNewRope rope collection equals: 'lo'.

	^ aNewRope
]

{ #category : #tests }
BlAttributeRopeTest >> testSmallFrom3To5Do [

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
BlAttributeRopeTest >> testSmallIsEmpty [

	<gtExample>
	| aRope |
	aRope := self small.

	self assert: aRope isEmpty not.

	^ aRope
]

{ #category : #tests }
BlAttributeRopeTest >> testSmallIsLeaf [

	<gtExample>
	| aRope |
	aRope := self small.

	self assert: aRope isLeaf not.

	^ aRope
]

{ #category : #tests }
BlAttributeRopeTest >> testSmallIsNotEmpty [

	<gtExample>
	| aRope |
	aRope := self small.

	self assert: aRope isNotEmpty.

	^ aRope
]

{ #category : #tests }
BlAttributeRopeTest >> testSmallSize [

	<gtExample>
	| aRope |
	aRope := self small.

	self assert: aRope size equals: 5.

	^ aRope
]
