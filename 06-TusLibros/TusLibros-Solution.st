!classDefinition: #TestTusLibros category: #'TusLibros-Solution'!
TestCase subclass: #TestTusLibros
	instanceVariableNames: 'shoppingCartWithEmptyCatalog anIsbnBook anIsbnBook2 catalog1 catalog2 shoppingCartWithCatalog1 shoppingCartWithCatalog2 aCashier'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'JAK 6/14/2017 10:12:41'!
test001createAnEmptyShoppingCart

	self assert: shoppingCartWithEmptyCatalog isEmpty.! !

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'JAK 6/14/2017 10:18:04'!
test002whenAddAnElementIntoTheShoopingCartItIsNotEmpty

	shoppingCartWithCatalog1 add: anIsbnBook.
	self deny: shoppingCartWithCatalog1 isEmpty.! !

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'JAK 6/14/2017 10:17:31'!
test004canListTheElementsAddedToTheCart
	
	|contentsOfShoppingCart |
	shoppingCartWithCatalog2 add: anIsbnBook.
	shoppingCartWithCatalog2 add: anIsbnBook2 .
	contentsOfShoppingCart := shoppingCartWithCatalog2 contents.
	
	self assert: (contentsOfShoppingCart includes: anIsbnBook ).
	self assert: (contentsOfShoppingCart includes: anIsbnBook2 ).! !

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'JAK 6/14/2017 10:18:37'!
test005canAddTheSameBookTwiceToTheShoppingCartAndKnowTheQuantiy

	shoppingCartWithCatalog1 add: anIsbnBook withQuantity: 2.
	self assert: ((shoppingCartWithCatalog1 quantity: anIsbnBook) = 2).
! !

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'JAK 6/14/2017 10:19:02'!
test006addLessThanOneBookRaiseError

	self 
		should: [ shoppingCartWithCatalog1 add: anIsbnBook withQuantity: 0. ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: ShoppingCart canNotAddLessThanOneBook ]
! !

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'JAK 6/14/2017 10:19:40'!
test007cannotAddABokkThatIsNotInTheCatalog
	
	self should: [ shoppingCartWithCatalog1 add: anIsbnBook2] 
		raise: Error  
		withExceptionDo: [ :anError | self assert: anError messageText equals: 'No se puede agregar libro'.
				self assert: shoppingCartWithCatalog1 isEmpty.]! !

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'JAK 6/14/2017 10:20:07'!
test008cannotAddABookWithANonIntegerAmount
	
	self should: [ shoppingCartWithCatalog1 add: anIsbnBook withQuantity: 2/3] 
		raise: Error  
		withExceptionDo: [ :anError | self assert: anError messageText equals: 'No se puede agregar una cantidad no entera de libros'.
				self assert: shoppingCartWithCatalog1 isEmpty.]! !

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'JAK 6/14/2017 10:21:13'!
test009aCashierCanNotCheckOutEmptyCart
	
	self should: [ aCashier checkOut: shoppingCartWithCatalog1.]  
		raise: Error  
		withExceptionDo: [ :anError | self assert: anError messageText equals: 'No se puede hacer checkout de un carrito vacio'.]! !


!TestTusLibros methodsFor: 'setUp' stamp: 'JAK 6/14/2017 10:21:04'!
setUp
	shoppingCartWithEmptyCatalog _ ShoppingCart initializeWithCatalog: {}.
	anIsbnBook _ 123123.
	anIsbnBook2 := 321321.
	catalog1 _ {anIsbnBook }.
	catalog2 _ {anIsbnBook. anIsbnBook2 }.
	shoppingCartWithCatalog1 _ ShoppingCart initializeWithCatalog: catalog1.
	shoppingCartWithCatalog2 _ ShoppingCart initializeWithCatalog: catalog2.
	aCashier _ Cashier new.
! !


!classDefinition: #Cashier category: #'TusLibros-Solution'!
Object subclass: #Cashier
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Cashier methodsFor: 'as yet unclassified' stamp: 'Ji 6/13/2017 21:47:01'!
checkOut: aShoppingCart
	aShoppingCart isEmpty ifTrue: [self error: (self class cannotCheckOutEmptyCart)]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #'TusLibros-Solution'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'Ji 6/13/2017 21:47:39'!
cannotCheckOutEmptyCart
	^'No se puede hacer checkout de un carrito vacio'! !


!classDefinition: #ShoppingCart category: #'TusLibros-Solution'!
Object subclass: #ShoppingCart
	instanceVariableNames: 'collectionOfElements catalogo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!ShoppingCart methodsFor: 'inspecting' stamp: 'Ji 6/13/2017 21:32:37'!
contents
	^collectionOfElements copy! !

!ShoppingCart methodsFor: 'inspecting' stamp: 'JAK 6/10/2017 19:04:20'!
isEmpty
	^collectionOfElements isEmpty .! !

!ShoppingCart methodsFor: 'inspecting' stamp: 'Ji 6/13/2017 21:33:49'!
quantity: anElement 

	^collectionOfElements occurrencesOf: anElement
! !


!ShoppingCart methodsFor: 'operating' stamp: 'JAK 6/10/2017 19:55:49'!
add: anElement
	self add: anElement withQuantity: 1.! !

!ShoppingCart methodsFor: 'operating' stamp: 'Ji 6/13/2017 21:41:02'!
add: anElement withQuantity: quantity
	
	quantity isInteger ifFalse: [self error: (self class canNotAddNotIntegerQuantity) ].
	quantity < 1 ifTrue: [self error: (self class canNotAddLessThanOneBook )].
	(catalogo includes: anElement) ifFalse: [self error: (self class canNotAddABookThatIsNotInTheCatalog) ].
	
	collectionOfElements add: anElement withOccurrences: quantity .! !


!ShoppingCart methodsFor: 'initialization' stamp: 'Ji 6/13/2017 21:25:17'!
initializeWithCatalog: aCatalog 
	
	collectionOfElements _ Bag new.
	catalogo _ aCatalog.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ShoppingCart class' category: #'TusLibros-Solution'!
ShoppingCart class
	instanceVariableNames: ''!

!ShoppingCart class methodsFor: 'initialization' stamp: 'Ji 6/13/2017 21:24:50'!
initializeWithCatalog: aCatalog 
	
	^ self new initializeWithCatalog: aCatalog! !


!ShoppingCart class methodsFor: 'errors' stamp: 'Ji 6/13/2017 21:41:36'!
canNotAddABookThatIsNotInTheCatalog
	^'No se puede agregar libro'! !

!ShoppingCart class methodsFor: 'errors' stamp: 'jak 6/13/2017 16:23:03'!
canNotAddLessThanOneBook
	^'No se puede agregar menos de un libro'! !

!ShoppingCart class methodsFor: 'errors' stamp: 'Ji 6/13/2017 21:40:17'!
canNotAddNotIntegerQuantity
	^'No se puede agregar una cantidad no entera de libros'! !
