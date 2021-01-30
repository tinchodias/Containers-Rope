"
I have been automatically converted and probably manually tweaked from BlCollectionRopeIteratorExamples. Pay attention there is an important design decision in such tests. First to let GT people execute them, the tests and helpers are tagged with <gtExample> do not remove them, let also the <label:...>.
	Finally and more important such tests should not use setup because every method should be in capacity of returning a fully working object called an example :)
	
Watch the tests in this classes are chained (for no immediate benefit).	
- this way if certain methods fail most of the tests fail for no added value. 
- in addition in term of cost all the intermediary steps are retested for nothing (because the assertions are reexecuted while they already got executed and validated in the previous test).

Strange design isn't.  
"
Class {
	#name : #BlCollectionRopeIteratorTest,
	#superclass : #TestCase,
	#category : #'Containers-Rope-Example'
}

{ #category : #metadata }
BlCollectionRopeIteratorTest >> originClassName [
	"This test was generated from..."
	^ 'BlCollectionRopeIteratorExamples'
]

{ #category : #'seed example' }
BlCollectionRopeIteratorTest >> small [

	<gtExample>
	| anIterator |
	anIterator := BlCollectionRopeTest new small iterator: 0 to: 5.
	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmall [

	<gtExample>
	| anIterator |
	anIterator := self small.

	self assert: anIterator position equals: 0.
	self assert: anIterator start equals: 0.
	self assert: anIterator end equals: 5.

	self assert: anIterator hasNext.
	self assert: anIterator hasPrevious not.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallNextAt0 [

	<gtExample>
	| anIterator anItem |
	anIterator := self small.
	
	anItem := anIterator next.

	self assert: anItem equals: $H.
	self assert: anIterator position equals: 1.
	self assert: anIterator hasNext.
	self assert: anIterator hasPrevious.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallNextAt1 [

	<gtExample>
	| anIterator anItem |
	anIterator := self testSmallNextAt0.

	anItem := anIterator next.

	self assert: anItem equals: $e.
	self assert: anIterator position equals: 2.
	self assert: anIterator hasNext.
	self assert: anIterator hasPrevious.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallNextAt2 [

	<gtExample>
	| anIterator anItem |
	anIterator := self testSmallNextAt1.

	anItem := anIterator next.

	self assert: anItem equals: $l.
	self assert: anIterator position equals: 3.
	self assert: anIterator hasNext.
	self assert: anIterator hasPrevious.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallNextAt3 [

	<gtExample>
	| anIterator anItem |
	anIterator := self testSmallNextAt2.

	anItem := anIterator next.

	self assert: anItem equals: $l.
	self assert: anIterator position equals: 4.
	self assert: anIterator hasNext.
	self assert: anIterator hasPrevious.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallNextAt4 [

	<gtExample>
	| anIterator anItem |
	anIterator := self testSmallNextAt3.

	anItem := anIterator next.

	self assert: anItem equals: $o.
	self assert: anIterator position equals: 5.
	self assert: anIterator hasNext not.
	self assert: anIterator hasPrevious.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallNextAt5 [

	<gtExample>
	<label: 'Iterator throws an error when the end is reached'>
	| anIterator anError |
	anIterator := self testSmallNextAt4.

	anError := nil.
	[ anIterator next ]
		on: Error
		do: [ :e | anError := e ].

	self assert: anError isNotNil.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallNextSpanAt0 [

	<gtExample>
	| anIterator aSpan |
	anIterator := self small.
	aSpan := anIterator nextSpan.
	
	self assert: aSpan collection equals: 'Hello'.
	self assert: anIterator position equals: 5.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallNextSpanAt1 [

	<gtExample>
	| anIterator aSpan |
	anIterator := self testSmallNextAt0.
	aSpan := anIterator nextSpan.

	self assert: aSpan collection equals: 'ello'.
	self assert: anIterator position equals: 5.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallNextSpanAt2 [

	<gtExample>
	| anIterator aSpan |
	anIterator := self testSmallNextAt1.
	aSpan := anIterator nextSpan.

	self assert: aSpan collection equals: 'llo'.
	self assert: anIterator position equals: 5.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallNextSpanAt3 [

	<gtExample>
	| anIterator aSpan |
	anIterator := self testSmallNextAt2.
	aSpan := anIterator nextSpan.

	self assert: aSpan collection equals: 'lo'.
	self assert: anIterator position equals: 5.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallNextSpanAt4 [

	<gtExample>
	| anIterator aSpan |
	anIterator := self testSmallNextAt3.
	aSpan := anIterator nextSpan.

	self assert: aSpan collection equals: 'o'.
	self assert: anIterator position equals: 5.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallNextSpanAt5 [

	<gtExample>
	<label: 'Iterator throws an error when the end is reached'>
	| anIterator anError |
	anIterator := self testSmallNextAt4.

	anError := nil.
	[ anIterator nextSpan ]
		on: Error
		do: [ :e | anError := e ].

	self assert: anError isNotNil.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallPeekAt0 [

	<gtExample>
	| anIterator anItem |
	anIterator := self small.

	anItem := anIterator peek.

	self assert: anItem equals: $H.
	self assert: anIterator position equals: 0.
	self assert: anIterator hasNext.
	self assert: anIterator hasPrevious not.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallPeekAt1 [

	<gtExample>
	| anIterator anItem |
	anIterator := self testSmallNextAt0.

	anItem := anIterator peek.

	self assert: anItem equals: $e.
	self assert: anIterator position equals: 1.
	self assert: anIterator hasNext.
	self assert: anIterator hasPrevious.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallPeekAt2 [

	<gtExample>
	| anIterator anItem |
	anIterator := self testSmallNextAt1.

	anItem := anIterator peek.

	self assert: anItem equals: $l.
	self assert: anIterator position equals: 2.
	self assert: anIterator hasNext.
	self assert: anIterator hasPrevious.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallPeekAt3 [

	<gtExample>
	| anIterator anItem |
	anIterator := self testSmallNextAt2.

	anItem := anIterator peek.

	self assert: anItem equals: $l.
	self assert: anIterator position equals: 3.
	self assert: anIterator hasNext.
	self assert: anIterator hasPrevious.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallPeekAt4 [

	<gtExample>
	| anIterator anItem |
	anIterator := self testSmallNextAt3.

	anItem := anIterator peek.

	self assert: anItem equals: $o.
	self assert: anIterator position equals: 4.
	self assert: anIterator hasNext.
	self assert: anIterator hasPrevious.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallPeekAt5 [

	<gtExample>
	<label: 'Iterator throws an error when the end is reached'>
	| anIterator anError |
	anIterator := self testSmallNextAt4.

	anError := nil.
	[ anIterator peek ]
		on: Error
		do: [ :e | anError := e ].

	self assert: anError isNotNil.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallPreviousAt0 [

	<gtExample>
	<label: 'Iterator throws an error when the start is reached'>
	| anIterator anError |
	anIterator := self small.
	anError := nil.
	[ anIterator previous ]
		on: Error
		do: [ :e | anError := e ].

	self assert: anError isNotNil.
	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallPreviousAt1 [

	<gtExample>
	| anIterator anItem |
	anIterator := self testSmallNextAt0.

	anItem := anIterator previous.

	self assert: anItem equals: $H.
	self assert: anIterator position equals: 0.
	self assert: anIterator hasNext.
	self assert: anIterator hasPrevious not.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallPreviousAt2 [

	<gtExample>
	| anIterator anItem |
	anIterator := self testSmallNextAt1.

	anItem := anIterator previous.

	self assert: anItem equals: $e.
	self assert: anIterator position equals: 1.
	self assert: anIterator hasNext.
	self assert: anIterator hasPrevious.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallPreviousAt3 [

	<gtExample>
	| anIterator anItem |
	anIterator := self testSmallNextAt2.

	anItem := anIterator previous.

	self assert: anItem equals: $l.
	self assert: anIterator position equals: 2.
	self assert: anIterator hasNext.
	self assert: anIterator hasPrevious.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallPreviousAt4 [

	<gtExample>
	| anIterator anItem |
	anIterator := self testSmallNextAt3.

	anItem := anIterator previous.

	self assert: anItem equals: $l.
	self assert: anIterator position equals: 3.
	self assert: anIterator hasNext.
	self assert: anIterator hasPrevious.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallPreviousAt5 [

	<gtExample>
	| anIterator anItem |
	anIterator := self testSmallNextAt4.

	anItem := anIterator previous.

	self assert: anItem equals: $o.
	self assert: anIterator position equals: 4.
	self assert: anIterator hasNext.
	self assert: anIterator hasPrevious.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallSkip0At0 [

	<gtExample>
	| anIterator |
	anIterator := self small.
	anIterator skip: 0.

	self assert: anIterator position equals: 0.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallSkip1At0 [

	<gtExample>
	| anIterator |
	anIterator := self small.
	anIterator skip: 1.

	self assert: anIterator position equals: 1.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallSkip2At0 [

	<gtExample>
	| anIterator |
	anIterator := self small.
	anIterator skip: 2.

	self assert: anIterator position equals: 2.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallSkip3At0 [

	<gtExample>
	| anIterator |
	anIterator := self small.
	anIterator skip: 3.

	self assert: anIterator position equals: 3.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallSkip4At0 [

	<gtExample>
	| anIterator |
	anIterator := self small.
	anIterator skip: 4.

	self assert: anIterator position equals: 4.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallSkip5At0 [

	<gtExample>
	| anIterator |
	anIterator := self small.
	anIterator skip: 5.

	self assert: anIterator position equals: 5.

	^ anIterator
]

{ #category : #tests }
BlCollectionRopeIteratorTest >> testSmallSkip6At0 [

	<gtExample>
	<label: 'Iterator throws an error when the end is reached'>
	| anIterator anError |
	anIterator := self small.

	anError := nil.
	[ anIterator skip: 6 ]
		on: Error
		do: [ :e | anError := e ].

	self assert: anError isNotNil.

	^ anIterator
]
