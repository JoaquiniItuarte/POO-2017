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

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'JAK 6/10/2017 19:12:25'!
test004canListTheElementsAddedToTheCart
	|shoppingCart anIsbnBook anIsbnBook2 contentsOfShoppingCart addedBook addedBook2 |
	anIsbnBook := 123123.
	anIsbnBook2 := 321321.
	shoppingCart := ShoppingCart initialize.
	shoppingCart add: anIsbnBook.
	shoppingCart add: anIsbnBook2 .
	contentsOfShoppingCart := shoppingCart contents.
	addedBook := contentsOfShoppingCart at:1.
	addedBook2 := contentsOfShoppingCart at:2.
	self assert: addedBook = anIsbnBook.
	self assert: addedBook2 = anIsbnBook2.! !


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

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TestTusLibros class' category: #'TusLibros-Solution'!
TestTusLibros class
	instanceVariableNames: ''!

!TestTusLibros class methodsFor: 'Instance Creation' stamp: 'JAK 6/10/2017 18:55:19'!
initialize
! !


!classDefinition: #Catalog category: #'TusLibros-Solution'!
Object subclass: #Catalog
	instanceVariableNames: 'elementsBelongsToCatalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Catalog methodsFor: 'initialization' stamp: 'JAK 6/10/2017 19:24:34'!
initializeWithListOfBooks: aListOfElements 
	elementsBelongsToCatalog := aListOfElements .! !


!Catalog methodsFor: 'inspecting' stamp: 'JAK 6/10/2017 19:28:32'!
has: anElement
	^elementsBelongsToCatalog includes: anElement .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Catalog class' category: #'TusLibros-Solution'!
Catalog class
	instanceVariableNames: ''!

!Catalog class methodsFor: 'initialization' stamp: 'JAK 6/10/2017 19:23:28'!
initializeWithListOfBooks: aListOfElements
	^self new initializeWithListOfBooks: aListOfElements ! !


!classDefinition: #ShoppingCart category: #'TusLibros-Solution'!
Object subclass: #ShoppingCart
	instanceVariableNames: 'collectionOfElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!ShoppingCart methodsFor: 'inspecting' stamp: 'JAK 6/10/2017 19:12:52'!
contents
	^collectionOfElements ! !

!ShoppingCart methodsFor: 'inspecting' stamp: 'JAK 6/10/2017 19:04:20'!
isEmpty
	^collectionOfElements isEmpty .! !


!ShoppingCart methodsFor: 'operating' stamp: 'JAK 6/10/2017 19:01:15'!
add: anElement
	collectionOfElements add: anElement .! !

!ShoppingCart methodsFor: 'operating' stamp: 'JAK 6/10/2017 19:07:15'!
remove: anElement 
	collectionOfElements remove: anElement .! !


!ShoppingCart methodsFor: 'initialization' stamp: 'JAK 6/10/2017 19:02:39'!
initialize
	collectionOfElements := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ShoppingCart class' category: #'TusLibros-Solution'!
ShoppingCart class
	instanceVariableNames: ''!

!ShoppingCart class methodsFor: 'initialization' stamp: 'JAK 6/10/2017 18:54:56'!
initialize
	^self new initialize! !

TestTusLibros initialize!
ShoppingCart initialize!