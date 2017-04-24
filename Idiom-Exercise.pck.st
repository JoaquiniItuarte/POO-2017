'From Cuis 5.0 of 7 November 2016 [latest update: #3068] on 24 April 2017 at 5:46:27 pm'!
'Description Please enter a description for this package'!
!provides: 'Idiom-Exercise' 1 1!
!classDefinition: #NotFound category: #'Idiom-Exercise'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Idiom-Exercise'!
!classDefinition: 'NotFound class' category: #'Idiom-Exercise'!
NotFound class
	instanceVariableNames: ''!

!classDefinition: #IdiomTest category: #'Idiom-Exercise'!
TestCase subclass: #IdiomTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Idiom-Exercise'!
!classDefinition: 'IdiomTest class' category: #'Idiom-Exercise'!
IdiomTest class
	instanceVariableNames: ''!

!classDefinition: #CustomerBook category: #'Idiom-Exercise'!
Object subclass: #CustomerBook
	instanceVariableNames: 'customers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Idiom-Exercise'!
!classDefinition: 'CustomerBook class' category: #'Idiom-Exercise'!
CustomerBook class
	instanceVariableNames: ''!


!IdiomTest methodsFor: 'testing' stamp: 'JK 4/22/2017 16:09:46'!
assert: aBlock shouldNotTakeMoreThan: milliseconds

	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue.
	aBlock value.
	millisecondsAfterRunning := Time millisecondClockValue.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < milliseconds 
	
! !

!IdiomTest methodsFor: 'testing' stamp: 'JI 4/24/2017 16:04:52'!
assert: aBlock withError: errorType conditionWithErrorAsArgument: argumentCondition conditionWithoutArgument: simpleCondition

	[ aBlock value. 
		self fail ]
		on: errorType
		do: [ :anError |
			self assert: (argumentCondition  value: anError) .
			self assert: simpleCondition value ].
	
	
! !

!IdiomTest methodsFor: 'testing' stamp: 'JI 4/24/2017 17:37:14'!
assert: aBlock withError: errorType conditionsWithErrorAsArgument: listOfConditionsWithErrorArgument conditionsWithoutArgument: listOfConditionsWithoutErrorArgument

	[ aBlock value. 
		self fail ]
		on: errorType
		do: [ :anError |
			listOfConditionsWithErrorArgument do: [ :cond | self assert: (cond value: anError) ].
			listOfConditionsWithoutErrorArgument do: [ :cond | self assert: (cond value) ].
			].
	
	
! !

!IdiomTest methodsFor: 'testing' stamp: 'JK 4/22/2017 16:11:45'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook  new.
	
	self assert: [ customerBook addCustomerNamed: 'John Lennon' ] shouldNotTakeMoreThan: 50.
	
! !

!IdiomTest methodsFor: 'testing' stamp: 'JK 4/22/2017 16:12:54'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook  new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	  
	self assert: [customerBook removeCustomerNamed: paulMcCartney] shouldNotTakeMoreThan: 100 
	
! !

!IdiomTest methodsFor: 'testing' stamp: 'JI 4/24/2017 17:37:54'!
test03CanNotAddACustomerWithEmptyName

	| customerBook listOfConditionsWithErrorArg listOfConditionsWithoutErrorArg |
			
	customerBook := CustomerBook new.

	'Creates a list of conditions that use the error as an argument'.
	listOfConditionsWithErrorArg _ OrderedCollection new.
	listOfConditionsWithErrorArg add: [ :arg | 
		arg messageText = CustomerBook customerCanNotBeEmptyErrorMessage ].
		
	'Creates a list of conditions that do not use arguments'.
	listOfConditionsWithoutErrorArg _ OrderedCollection new.
	listOfConditionsWithoutErrorArg add: [ customerBook isEmpty ].
	
	self assert: [ customerBook addCustomerNamed: ''] 
		withError: Error
		conditionsWithErrorAsArgument: listOfConditionsWithErrorArg 
		conditionsWithoutArgument: listOfConditionsWithoutErrorArg .! !

!IdiomTest methodsFor: 'testing' stamp: 'JI 4/24/2017 16:25:27'!
test03CanNotAddACustomerWithEmptyNameV2

	| customerBook |
			
	customerBook := CustomerBook new.

	self assert: [ customerBook addCustomerNamed: ''] 
		withError: Error
		conditionWithErrorAsArgument: [ :arg |
			 arg messageText = CustomerBook customerCanNotBeEmptyErrorMessage ]
		conditionWithoutArgument: [ customerBook  isEmpty ]! !

!IdiomTest methodsFor: 'testing' stamp: 'JI 4/24/2017 17:31:46'!
test04CanNotRemoveAndInvalidCustomer
	
	| customerBook johnLennon listOfConditionsWithErrorArg listOfConditionsWithoutErrorArg |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	'Creates a list of conditions that use the error as an argument'.
	listOfConditionsWithErrorArg _ OrderedCollection new.
	
	'Creates a list of conditions that do not use the error as an argument'.
	listOfConditionsWithoutErrorArg _ OrderedCollection new.
	listOfConditionsWithoutErrorArg add: [ customerBook numberOfCustomers = 1]; 
										add: [ customerBook includesCustomerNamed: johnLennon ].
	
	self assert: [ customerBook addCustomerNamed: ''] 
		withError: Error
		conditionsWithErrorAsArgument: listOfConditionsWithErrorArg 
		conditionsWithoutArgument: listOfConditionsWithoutErrorArg .! !

!IdiomTest methodsFor: 'testing' stamp: 'JI 4/24/2017 16:25:36'!
test04CanNotRemoveAndInvalidCustomerV2
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self assert: [ customerBook removeCustomerNamed: 'Paul McCartney']
		withError: NotFound
		conditionWithErrorAsArgument: [ :arg | customerBook numberOfCustomers = 1]
		conditionWithoutArgument: [ customerBook includesCustomerNamed: johnLennon ]! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:42'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(customers includes: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	customers add: aName ! !

!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:56'!
includesCustomerNamed: aName

	^customers includes: aName ! !

!CustomerBook methodsFor: 'initialization' stamp: 'HernanWilkinson 7/6/2011 17:42'!
initialize

	super initialize.
	customers := OrderedCollection new! !

!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:48'!
isEmpty
	
	^customers isEmpty  ! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:56'!
numberOfCustomers
	
	^customers size! !

!CustomerBook methodsFor: 'customer management' stamp: 'HAW 4/14/2017 16:55:43'!
removeCustomerNamed: aName
 
	customers remove: aName ifAbsent: [ NotFound signal ]! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:57'!
customerAlreadyExistsErrorMessage

	^'Customer already exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:53'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty'! !
