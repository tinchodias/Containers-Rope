"
I have been automatically converted and probably manually tweaked from BlRopeIteratorExamples. Pay attention there is an important design decision in such tests. First to let GT people execute them, the tests and helpers are tagged with <gtExample> do not remove them, let also the <label:...>.
	Finally and more important such tests should not use setup because every method should be in capacity of returning a fully working object called an example :)
"
Class {
	#name : #BlRopeIteratorTest,
	#superclass : #TestCase,
	#category : #'Containers-Rope-Example'
}

{ #category : #metadata }
BlRopeIteratorTest >> originClassName [
	"This test was generated from..."
	^ 'BlRopeIteratorExamples'
]

{ #category : #tests }
BlRopeIteratorTest >> testNextLine123At0 [

	<gtExample>
	| anIterator |
	anIterator := (BlCollectionRope collection: '123') iterator.

	anIterator nextLineIndicesDo: [ :aStart :anEnd :anEndDelimiter | 
		self assert: aStart equals: 0.
		self assert: anEnd equals: 3.
		self assert: anEndDelimiter equals: 3 ].

	self assert: anIterator position equals: 3.

	^ anIterator
]

{ #category : #tests }
BlRopeIteratorTest >> testNextLine123CrAt0 [

	<gtExample>
	| anIterator |
	anIterator := (BlCollectionRope collection: '123' , String cr)
		              iterator.

	anIterator nextLineIndicesDo: [ :aStart :anEnd :anEndDelimiter | 
		self assert: aStart equals: 0.
		self assert: anEnd equals: 3.
		self assert: anEndDelimiter equals: 4 ].

	self assert: anIterator position equals: 4.

	^ anIterator
]

{ #category : #tests }
BlRopeIteratorTest >> testNextLine123CrabcAt0 [

	<gtExample>
	| anIterator |
	anIterator := (BlCollectionRope collection: '123' , String cr , 'abc')
		              iterator.

	anIterator nextLineIndicesDo: [ :aStart :anEnd :anEndDelimiter | 
		self assert: aStart equals: 0.
		self assert: anEnd equals: 3.
		self assert: anEndDelimiter equals: 4 ].

	self assert: anIterator position equals: 4.

	^ anIterator
]

{ #category : #tests }
BlRopeIteratorTest >> testNextLine123CrabcAt4 [

	<gtExample>
	| anIterator |
	anIterator := self next_line_123Crabc_at_0.

	anIterator nextLineIndicesDo: [ :aStart :anEnd :anEndDelimiter | 
		self assert: aStart equals: 4.
		self assert: anEnd equals: 7.
		self assert: anEndDelimiter equals: 7 ].

	self assert: anIterator position equals: 7.

	^ anIterator
]

{ #category : #tests }
BlRopeIteratorTest >> testNextLineCr123At0 [

	<gtExample>
	| anIterator |
	anIterator := (BlCollectionRope collection: String cr , '123')
		              iterator.

	anIterator nextLineIndicesDo: [ :aStart :anEnd :anEndDelimiter | 
		self assert: aStart equals: 0.
		self assert: anEnd equals: 0.
		self assert: anEndDelimiter equals: 1 ].

	self assert: anIterator position equals: 1.

	^ anIterator
]

{ #category : #tests }
BlRopeIteratorTest >> testNextLineCr123At1 [

	<gtExample>
	| anIterator |
	anIterator := self next_line_Cr123_at_0.

	anIterator nextLineIndicesDo: [ :aStart :anEnd :anEndDelimiter | 
		self assert: aStart equals: 1.
		self assert: anEnd equals: 4.
		self assert: anEndDelimiter equals: 4 ].

	self assert: anIterator position equals: 4.

	^ anIterator
]

{ #category : #tests }
BlRopeIteratorTest >> testNextLineCr1At0 [

	<gtExample>
	| anIterator |
	anIterator := (BlCollectionRope collection: String cr , '1') iterator.

	anIterator nextLineIndicesDo: [ :aStart :anEnd :anEndDelimiter | 
		self assert: aStart equals: 0.
		self assert: anEnd equals: 0.
		self assert: anEndDelimiter equals: 1 ].

	self assert: anIterator position equals: 1.

	^ anIterator
]

{ #category : #tests }
BlRopeIteratorTest >> testNextLineCr1At1 [

	<gtExample>
	| anIterator |
	anIterator := self next_line_Cr1_at_0.

	anIterator nextLineIndicesDo: [ :aStart :anEnd :anEndDelimiter | 
		self assert: aStart equals: 1.
		self assert: anEnd equals: 2.
		self assert: anEndDelimiter equals: 2 ].

	self assert: anIterator position equals: 2.

	^ anIterator
]

{ #category : #tests }
BlRopeIteratorTest >> testNextLineCrAt0 [

	<gtExample>
	| anIterator |
	anIterator := (BlCollectionRope collection: String cr) iterator.

	anIterator nextLineIndicesDo: [ :aStart :anEnd :anEndDelimiter | 
		self assert: aStart equals: 0.
		self assert: anEnd equals: 0.
		self assert: anEndDelimiter equals: 1 ].

	self assert: anIterator position equals: 1.

	^ anIterator
]

{ #category : #tests }
BlRopeIteratorTest >> testNextLineCrCrAt0 [

	<gtExample>
	| anIterator |
	anIterator := (BlCollectionRope collection: String cr , String cr)
		              iterator.

	anIterator nextLineIndicesDo: [ :aStart :anEnd :anEndDelimiter | 
		self assert: aStart equals: 0.
		self assert: anEnd equals: 0.
		self assert: anEndDelimiter equals: 1 ].

	self assert: anIterator position equals: 1.

	^ anIterator
]

{ #category : #tests }
BlRopeIteratorTest >> testNextLineCrCrAt1 [

	<gtExample>
	| anIterator |
	anIterator := self next_line_CrCr_at_0.

	anIterator nextLineIndicesDo: [ :aStart :anEnd :anEndDelimiter | 
		self assert: aStart equals: 1.
		self assert: anEnd equals: 1.
		self assert: anEndDelimiter equals: 2 ].

	self assert: anIterator position equals: 2.

	^ anIterator
]

{ #category : #tests }
BlRopeIteratorTest >> testNextLineCrLfAt0 [

	<gtExample>
	| anIterator |
	anIterator := (BlCollectionRope collection: String crlf) iterator.

	anIterator nextLineIndicesDo: [ :aStart :anEnd :anEndDelimiter | 
		self assert: aStart equals: 0.
		self assert: anEnd equals: 0.
		self assert: anEndDelimiter equals: 1 ].

	self assert: anIterator position equals: 1.

	^ anIterator
]

{ #category : #tests }
BlRopeIteratorTest >> testNextLineLfAt0 [

	<gtExample>
	| anIterator |
	anIterator := (BlCollectionRope collection: String lf) iterator.

	anIterator nextLineIndicesDo: [ :aStart :anEnd :anEndDelimiter | 
		self assert: aStart equals: 0.
		self assert: anEnd equals: 0.
		self assert: anEndDelimiter equals: 1 ].

	self assert: anIterator position equals: 1.

	^ anIterator
]

{ #category : #tests }
BlRopeIteratorTest >> testNextSegment123abcAt0 [

	<gtExample>
	| aRope anIterator aSegment |
	aRope := BlCollectionRope collection: '123abc'.
	anIterator := aRope iterator.

	aSegment := anIterator nextSegment: [ :aChar | aChar isDigit ].

	self assert: aSegment collection equals: '123'.
	self assert: anIterator position equals: 3.

	^ anIterator
]

{ #category : #tests }
BlRopeIteratorTest >> testNextSegment123abcAt3 [

	<gtExample>
	| anIterator aSegment |
	anIterator := self next_segment_123abc_at_0.

	aSegment := anIterator nextSegment: [ :aChar | aChar isDigit ].

	self assert: aSegment collection equals: 'abc'.
	self assert: anIterator position equals: 6.

	^ anIterator
]

{ #category : #tests }
BlRopeIteratorTest >> testNextSegment123abcAt6 [

	<gtExample>
	<label: 'Iterator throws an error when the end is reached'>
	| anIterator anError |
	anIterator := self next_segment_123abc_at_3.

	anError := nil.
	[ anIterator nextSegment: [ :aChar | aChar isDigit ] ]
		on: Error
		do: [ :e | anError := e ].

	self assert: anError isNotNil.

	^ anIterator
]

{ #category : #tests }
BlRopeIteratorTest >> testNextSegmentAAt0 [

	<gtExample>
	| aRope anIterator aSegment |
	aRope := BlCollectionRope collection: 'a'.
	anIterator := aRope iterator.

	aSegment := anIterator nextSegment: [ :aChar | aChar isDigit ].

	self assert: aSegment collection equals: 'a'.
	self assert: anIterator position equals: 1.

	^ anIterator
]

{ #category : #tests }
BlRopeIteratorTest >> testNextSegmentAbcAt0 [

	<gtExample>
	| aRope anIterator aSegment |
	aRope := BlCollectionRope collection: 'abc'.
	anIterator := aRope iterator.

	aSegment := anIterator nextSegment: [ :aChar | aChar isDigit ].

	self assert: aSegment collection equals: 'abc'.
	self assert: anIterator position equals: 3.

	^ anIterator
]

{ #category : #tests }
BlRopeIteratorTest >> testNextSpanFontColorOnA [

	<gtExample>
	| aRope anIterator aSpan |
	aRope := BlCollectionRope collection: 'A'.
	anIterator := aRope iterator.
	aSpan := anIterator nextSpan: [ :eachAttribute | 
		         eachAttribute isKindOf: BlTextForegroundAttribute ].

	self assert: aSpan == aRope.
	self assert: anIterator hasNext not.

	^ aSpan
]

{ #category : #tests }
BlRopeIteratorTest >> testNextSpanFontColorOnAWithColor [

	<gtExample>
	| aRope anIterator aSpan |
	aRope := (BlCollectionRope collection: 'A') attributes:
		         { (BlTextForegroundAttributeMock paint: Color red) }.

	anIterator := aRope iterator.
	aSpan := anIterator nextSpan: [ :eachAttribute | 
		         eachAttribute isKindOf: BlTextForegroundAttributeMock ].

	self assert: aSpan == aRope.
	self assert: anIterator hasNext not.

	^ aSpan
]

{ #category : #tests }
BlRopeIteratorTest >> testNextSpanFontColorOnHelloWorldWithColor [

	<gtExample>
	| aRope anIterator aSpan |
	aRope := BlCollectionRope collection: 'Hello World'.
	aRope := aRope
		         attributes:
		         { (BlTextForegroundAttributeMock paint: Color red) }
		         from: 0
		         to: 5.
	aRope := aRope
		         attributes:
		         { (BlTextForegroundAttributeMock paint: Color blue) }
		         from: 6
		         to: 11.

	anIterator := aRope iterator.

	aSpan := anIterator nextSpan: [ :eachAttribute | 
		         eachAttribute isKindOf: BlTextForegroundAttributeMock ].
	self assert: aSpan == aRope left.
	self assert: anIterator hasNext.
	self assert: aSpan asString equals: 'Hello'.

	aSpan := anIterator nextSpan: [ :eachAttribute | 
		         eachAttribute isKindOf: BlTextForegroundAttributeMock ].
	self assert: aSpan == aRope right left.
	self assert: anIterator hasNext.
	self assert: aSpan asString equals: ' '.

	aSpan := anIterator nextSpan: [ :eachAttribute | 
		         eachAttribute isKindOf: BlTextForegroundAttributeMock ].
	self assert: aSpan == aRope right right.
	self assert: anIterator hasNext not.
	self assert: aSpan asString equals: 'World'.

	^ aSpan
]
