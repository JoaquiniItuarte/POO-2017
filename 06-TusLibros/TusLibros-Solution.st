!classDefinition: #TestTusLibros category: #'TusLibros-Solution'!
TestCase subclass: #TestTusLibros
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'JAK 6/10/2017 18:55:37'!
test001createAnEmptyShoppingCart
	|shoppingCart|
	shoppingCart := ShoppingCart initialize.
	self assert: shoppingCart isEmpty.! !

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'JAK 6/10/2017 19:08:19'!
test002whenAddAnElementIntoTheShoopingCartItIsNotEmpty
	|shoppingCart anIsbnBook|
	anIsbnBook := 123123.
	shoppingCart := ShoppingCart initialize.
	shoppingCart add: anIsbnBook.
	self deny: shoppingCart isEmpty.! !

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'JAK 6/10/2017 19:08:23'!
test003addAnElementIntoThenRemoveTheElementTheShoopingCartIsEmpty
	|shoppingCart anIsbnBook|
	anIsbnBook := 123123.
	shoppingCart := ShoppingCart initialize.
	shoppingCart add: anIsbnBook.
	shoppingCart remove: anIsbnBook .
	self assert: shoppingCart isEmpty.! !

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'Ji 6/13/2017 19:09:35'!
test004canListTheElementsAddedToTheCart
	|shoppingCart anIsbnBook anIsbnBook2 contentsOfShoppingCart |
	anIsbnBook := 123123.
	anIsbnBook2 := 321321.
	shoppingCart := ShoppingCart initialize.
	shoppingCart add: anIsbnBook.
	shoppingCart add: anIsbnBook2 .
	contentsOfShoppingCart := shoppingCart contents.
	
	self assert: (contentsOfShoppingCart includes: anIsbnBook ).
	self assert: (contentsOfShoppingCart includes: anIsbnBook2 ).! !

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'JAK 6/10/2017 19:55:56'!
test005canAddTheSameBookTwiceToTheShoppingCartAndKnowTheQuantiy
	|shoppingCart anIsbnBook |
	anIsbnBook := 123123.
	shoppingCart := ShoppingCart initialize.
	shoppingCart add: anIsbnBook withQuantity: 2.
	self assert: ((shoppingCart quantity: anIsbnBook) = 2).
! !

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'jak 6/13/2017 16:22:14'!
test006addLessThanOneBookRaiseError
	|shoppingCart anIsbnBook |
	anIsbnBook := 123123.
	shoppingCart := ShoppingCart initialize.
	
	self 
		should: [ shoppingCart add: anIsbnBook withQuantity: 0. ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: ShoppingCart canNotAddLessThanOneBook ]
! !


!TestTusLibros methodsFor: 'Testing Catalog' stamp: 'JAK 6/10/2017 19:22:39'!
test001anIsbnBelongsToCatalog
	|catalog anIsbnBook|
	catalog := Catalog initializeWithListOfBooks: {1234567890} .
	anIsbnBook := 1234567890.
	self assert: (catalog has: anIsbnBook) .! !

!TestTusLibros methodsFor: 'Testing Catalog' stamp: 'JAK 6/10/2017 19:29:27'!
test002anIsbnDoesNotBelongsToCatalog
	|catalog anIsbnBook|
	catalog := Catalog initializeWithListOfBooks: {0987654321} .
	anIsbnBook := 1234567890.
	self deny: (catalog has: anIsbnBook) .! !

!TestTusLibros methodsFor: 'Testing Catalog' stamp: 'Ji 6/13/2017 19:43:08'!
test003aNewCatalogIsEmpty

	| catalog |
	catalog _ Catalog createEmptyCatalog.
	self assert: catalog size = 0.! !

!TestTusLibros methodsFor: 'Testing Catalog' stamp: 'Ji 6/13/2017 19:46:58'!
test004addingElementsMakesTheCatalogNotEmpty

	| catalog |
	catalog _ Catalog createEmptyCatalog.
	catalog add: 123123.
	
	self deny: catalog size = 0.! !


!classDefinition: #Catalog category: #'TusLibros-Solution'!
Object subclass: #Catalog
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Catalog methodsFor: 'initialization' stamp: 'Ji 6/13/2017 19:48:39'!
initializeWithListOfBooks: aSetOfElements 
	elements := aSetOfElements asSet .! !


!Catalog methodsFor: 'inspecting' stamp: 'Ji 6/13/2017 19:48:16'!
has: anElement
	^elements includes: anElement .! !


!Catalog methodsFor: 'as yet unclassified' stamp: 'Ji 6/13/2017 19:47:26'!
add: aSmallInteger 
	elements add: aSmallInteger ! !

!Catalog methodsFor: 'as yet unclassified' stamp: 'Ji 6/13/2017 19:44:23'!
createEmptyCatalog
	
	
	elements _ Set new.
! !

!Catalog methodsFor: 'as yet unclassified' stamp: 'Ji 6/13/2017 19:45:34'!
size
	^ elements size! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Catalog class' category: #'TusLibros-Solution'!
Catalog class
	instanceVariableNames: ''!

!Catalog class methodsFor: 'initialization' stamp: 'JAK 6/10/2017 19:23:28'!
initializeWithListOfBooks: aListOfElements
	^self new initializeWithListOfBooks: aListOfElements ! !


!Catalog class methodsFor: 'as yet unclassified' stamp: 'Ji 6/13/2017 19:43:34'!
createEmptyCatalog
	^ self new createEmptyCatalog ! !


!classDefinition: #ShoppingCart category: #'TusLibros-Solution'!
Object subclass: #ShoppingCart
	instanceVariableNames: 'collectionOfElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!ShoppingCart methodsFor: 'inspecting' stamp: 'Ji 6/13/2017 19:37:00'!
contents
	^collectionOfElements keys! !

!ShoppingCart methodsFor: 'inspecting' stamp: 'JAK 6/10/2017 19:04:20'!
isEmpty
	^collectionOfElements isEmpty .! !

!ShoppingCart methodsFor: 'inspecting' stamp: 'Ji 6/13/2017 19:41:20'!
quantity: anElement 

	(collectionOfElements includesKey: anElement) ifTrue: [	^collectionOfElements at: anElement]  ifFalse:  [^0] 
! !


!ShoppingCart methodsFor: 'operating' stamp: 'JAK 6/10/2017 19:55:49'!
add: anElement
	self add: anElement withQuantity: 1.! !

!ShoppingCart methodsFor: 'operating' stamp: 'Ji 6/13/2017 19:34:41'!
add: anElement withQuantity: quantity
	
	quantity < 1 ifTrue: [self error: (self class canNotAddLessThanOneBook )].
	
	collectionOfElements at: anElement ifPresent: [ collectionOfElements at: anElement put: ((collectionOfElements at: anElement)+quantity) ] 
											ifAbsent: [ collectionOfElements at: anElement put: quantity ] .! !

!ShoppingCart methodsFor: 'operating' stamp: 'Ji 6/13/2017 19:39:18'!
remove: anElement 
	collectionOfElements removeKey: anElement ifAbsent: [] .! !


!ShoppingCart methodsFor: 'initialization' stamp: 'Ji 6/13/2017 19:27:13'!
initialize
	collectionOfElements := Dictionary new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ShoppingCart class' category: #'TusLibros-Solution'!
ShoppingCart class
	instanceVariableNames: ''!

!ShoppingCart class methodsFor: 'initialization' stamp: 'JAK 6/10/2017 18:54:56'!
initialize
	^self new initialize! !


!ShoppingCart class methodsFor: 'errors' stamp: 'jak 6/13/2017 16:23:03'!
canNotAddLessThanOneBook
	^'No se puede agregar menos de un libro'! !

ShoppingCart initialize!