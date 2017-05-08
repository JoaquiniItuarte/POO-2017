!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:31'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/8/2012 08:20'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:33'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:36'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JI 5/7/2017 14:29:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #Container category: #'Stack-Exercise'!
Object subclass: #Container
	instanceVariableNames: 'element'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Container methodsFor: 'initialization' stamp: 'JI 5/8/2017 15:22:52'!
initializeWith: anObject

	element _ anObject ! !


!Container methodsFor: 'elementObtainer' stamp: 'JI 5/8/2017 15:25:26'!
element
	^element ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Container class' category: #'Stack-Exercise'!
Container class
	instanceVariableNames: ''!

!Container class methodsFor: 'instance creation' stamp: 'JI 5/8/2017 15:22:23'!
initializeWith: anObject

	^self new initializeWith: anObject 
	! !


!classDefinition: #EmptyContainer category: #'Stack-Exercise'!
Object subclass: #EmptyContainer
	instanceVariableNames: 'element'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyContainer methodsFor: 'initialization' stamp: 'JI 5/8/2017 15:26:53'!
initialize

! !


!EmptyContainer methodsFor: 'elementObtainer' stamp: 'JI 5/8/2017 15:47:53'!
element

	(self error: (self class  stackEmptyErrorDescription ) )! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyContainer class' category: #'Stack-Exercise'!
EmptyContainer class
	instanceVariableNames: ''!

!EmptyContainer class methodsFor: 'instance creation' stamp: 'JI 5/8/2017 15:29:42'!
initialize

	^self new initialize ! !


!EmptyContainer class methodsFor: 'error handling' stamp: 'JI 5/8/2017 15:48:10'!
stackEmptyErrorDescription

	^OOStack stackEmptyErrorDescription! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'JI 5/8/2017 15:38:23'!
isEmpty
	^ (self size  = 0)! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'JI 5/8/2017 15:37:57'!
pop
	
	| lastContainer lastElement |
	
	lastContainer _ stack removeLast.
	lastElement _ (lastContainer element).
	
	
	^ lastElement! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'JI 5/8/2017 15:37:17'!
push: anElement 
	stack addLast: (Container initializeWith: anElement).! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'JI 5/8/2017 15:38:12'!
size
	^ stack size-1! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'JI 5/8/2017 15:41:20'!
top

	^ (stack at: (stack size)) element
	! !


!OOStack methodsFor: 'initialization' stamp: 'JI 5/8/2017 15:35:52'!
initialize
	super initialize .
	
	stack _ OrderedCollection new.
	
	stack add: EmptyContainer initialize .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !

EmptyContainer initialize!