!classDefinition: #OOStackTestNullPattern category: #'Stack-ExerciseConNullPattern'!
TestCase subclass: #OOStackTestNullPattern
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-ExerciseConNullPattern'!

!OOStackTestNullPattern methodsFor: 'test' stamp: 'jak 5/7/2017 17:43:06'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStackAbs new.
	
	self assert: stack isEmpty! !

!OOStackTestNullPattern methodsFor: 'test' stamp: 'jak 5/7/2017 17:43:10'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStackAbs new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTestNullPattern methodsFor: 'test' stamp: 'jak 5/7/2017 17:43:13'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStackAbs new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTestNullPattern methodsFor: 'test' stamp: 'jak 5/7/2017 17:43:16'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStackAbs new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTestNullPattern methodsFor: 'test' stamp: 'jak 5/7/2017 17:43:19'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStackAbs new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTestNullPattern methodsFor: 'test' stamp: 'jak 5/7/2017 17:43:24'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStackAbs new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTestNullPattern methodsFor: 'test' stamp: 'jak 5/7/2017 17:43:27'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStackAbs new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTestNullPattern methodsFor: 'test' stamp: 'jak 5/7/2017 17:43:36'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStackAbs new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStackAbs stackEmptyErrorDescription ]
		
! !

!OOStackTestNullPattern methodsFor: 'test' stamp: 'jak 5/7/2017 17:43:41'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStackAbs new.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStackAbs stackEmptyErrorDescription ]
		
! !

!OOStackTestNullPattern methodsFor: 'test' stamp: 'jak 5/7/2017 17:43:45'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStackAbs new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStackAbs stackEmptyErrorDescription ]
		
! !


!classDefinition: #OOStackAbs category: #'Stack-ExerciseConNullPattern'!
Object subclass: #OOStackAbs
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-ExerciseConNullPattern'!

!OOStackAbs methodsFor: 'initialization' stamp: 'jak 5/7/2017 18:10:38'!
initialize
	super initialize .
	
	stack _ OOStackAbsEmpty new.! !


!OOStackAbs methodsFor: 'inspecting' stamp: 'jak 5/7/2017 18:47:49'!
isEmpty

	^ stack isEmpty ! !


!OOStackAbs methodsFor: 'as yet unclassified' stamp: 'jak 5/7/2017 19:42:03'!
pop
	
	|lastElement|
	lastElement := stack pop.
	(stack size = 0) ifTrue: [stack := OOStackAbsEmpty new].
	^ lastElement ! !

!OOStackAbs methodsFor: 'as yet unclassified' stamp: 'jak 5/7/2017 18:28:20'!
push: anElement 
	(stack isMemberOf: OOStackAbsEmpty) ifTrue: [stack := OOStackAbsNotEmpty new].
	stack push: anElement ! !

!OOStackAbs methodsFor: 'as yet unclassified' stamp: 'jak 5/7/2017 18:48:39'!
size

	^ stack size ! !

!OOStackAbs methodsFor: 'as yet unclassified' stamp: 'jak 5/7/2017 18:48:44'!
top

	^ stack top
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackAbs class' category: #'Stack-ExerciseConNullPattern'!
OOStackAbs class
	instanceVariableNames: ''!

!OOStackAbs class methodsFor: 'error descriptions' stamp: 'jak 5/7/2017 17:41:25'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackAbsEmpty category: #'Stack-ExerciseConNullPattern'!
OOStackAbs subclass: #OOStackAbsEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-ExerciseConNullPattern'!

!OOStackAbsEmpty methodsFor: 'as yet unclassified' stamp: 'jak 5/7/2017 18:33:32'!
initialize
! !

!OOStackAbsEmpty methodsFor: 'as yet unclassified' stamp: 'jak 5/7/2017 19:01:25'!
isEmpty

	^true ! !

!OOStackAbsEmpty methodsFor: 'as yet unclassified' stamp: 'jak 5/7/2017 18:24:04'!
pop

	self error: self class stackEmptyErrorDescription! !

!OOStackAbsEmpty methodsFor: 'as yet unclassified' stamp: 'jak 5/7/2017 18:25:09'!
push: anElement! !

!OOStackAbsEmpty methodsFor: 'as yet unclassified' stamp: 'jak 5/7/2017 18:22:44'!
size

	^0! !

!OOStackAbsEmpty methodsFor: 'as yet unclassified' stamp: 'jak 5/7/2017 18:21:23'!
top

	self error: self class stackEmptyErrorDescription! !


!classDefinition: #OOStackAbsNotEmpty category: #'Stack-ExerciseConNullPattern'!
OOStackAbs subclass: #OOStackAbsNotEmpty
	instanceVariableNames: 'anArray'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-ExerciseConNullPattern'!


!OOStackAbsNotEmpty methodsFor: 'as yet unclassified' stamp: 'jak 5/7/2017 18:20:05'!
initialize
	anArray := OrderedCollection new! !

!OOStackAbsNotEmpty methodsFor: 'as yet unclassified' stamp: 'jak 5/7/2017 18:49:23'!
isEmpty

	^false ! !

!OOStackAbsNotEmpty methodsFor: 'as yet unclassified' stamp: 'jak 5/7/2017 19:02:37'!
pop
	
	| lastElement |
	lastElement _ self top.
	anArray removeLast .
	(anArray size).
	^ lastElement! !

!OOStackAbsNotEmpty methodsFor: 'as yet unclassified' stamp: 'jak 5/7/2017 18:26:38'!
push: anElement

	anArray addLast: anElement.! !

!OOStackAbsNotEmpty methodsFor: 'as yet unclassified' stamp: 'jak 5/7/2017 18:26:10'!
size

	^anArray size! !

!OOStackAbsNotEmpty methodsFor: 'as yet unclassified' stamp: 'jak 5/7/2017 18:26:25'!
top

	^ anArray at: anArray size! !
