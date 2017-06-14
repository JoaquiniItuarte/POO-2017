!classDefinition: #TestTusLibros category: #'TusLibros-Solution'!
TestCase subclass: #TestTusLibros
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'Ji 6/13/2017 21:29:12'!
test001createAnEmptyShoppingCart
	|shoppingCart|
	shoppingCart := ShoppingCart initializeWithCatalog: {}.
	self assert: shoppingCart isEmpty.! !

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'Ji 6/13/2017 21:31:26'!
test002whenAddAnElementIntoTheShoopingCartItIsNotEmpty
	|shoppingCart anIsbnBook|
	anIsbnBook := 123123.
	shoppingCart := ShoppingCart initializeWithCatalog: {anIsbnBook}.
	shoppingCart add: anIsbnBook.
	self deny: shoppingCart isEmpty.! !

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'Ji 6/13/2017 21:32:14'!
test004canListTheElementsAddedToTheCart
	|shoppingCart anIsbnBook anIsbnBook2 contentsOfShoppingCart |
	anIsbnBook := 123123.
	anIsbnBook2 := 321321.
	shoppingCart := ShoppingCart initializeWithCatalog: {anIsbnBook. anIsbnBook2}.
	shoppingCart add: anIsbnBook.
	shoppingCart add: anIsbnBook2 .
	contentsOfShoppingCart := shoppingCart contents.
	
	self assert: (contentsOfShoppingCart includes: anIsbnBook ).
	self assert: (contentsOfShoppingCart includes: anIsbnBook2 ).! !

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'Ji 6/13/2017 21:32:52'!
test005canAddTheSameBookTwiceToTheShoppingCartAndKnowTheQuantiy
	|shoppingCart anIsbnBook |
	anIsbnBook := 123123.
	shoppingCart := ShoppingCart initializeWithCatalog: {anIsbnBook}.
	shoppingCart add: anIsbnBook withQuantity: 2.
	self assert: ((shoppingCart quantity: anIsbnBook) = 2).
! !

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'Ji 6/13/2017 21:29:36'!
test006addLessThanOneBookRaiseError
	|shoppingCart anIsbnBook |
	anIsbnBook := 123123.
	shoppingCart := ShoppingCart initializeWithCatalog: {}.
	
	self 
		should: [ shoppingCart add: anIsbnBook withQuantity: 0. ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: ShoppingCart canNotAddLessThanOneBook ]
! !

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'Ji 6/13/2017 21:24:14'!
test007cannotAddABokkThatIsNotInTheCatalog
	
	| aCart aCatalog aBook |
	aCatalog _ { 12 }.
	aCart _ ShoppingCart initializeWithCatalog: aCatalog.
	aBook _ 13.
	self should: [ aCart add: aBook] 
		raise: Error  
		withExceptionDo: [ :anError | self assert: anError messageText equals: 'No se puede agregar libro'.
				self assert: aCart isEmpty.]! !

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'Ji 6/13/2017 21:37:36'!
test008cannotAddABookWithANonIntegerAmount
	
	| aCart aCatalog aBook |
	aCatalog _ { 12 }.
	aCart _ ShoppingCart initializeWithCatalog: aCatalog.
	aBook _ 12.
	self should: [ aCart add: aBook withQuantity: 2/3] 
		raise: Error  
		withExceptionDo: [ :anError | self assert: anError messageText equals: 'No se puede agregar una cantidad no entera de libros'.
				self assert: aCart isEmpty.]! !

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'Ji 6/13/2017 21:45:04'!
test009aCashierCanNotCheckOutEmptyCart
	
	| aCart aCatalog aCashier |
	aCatalog _ { 12 }.
	aCart _ ShoppingCart initializeWithCatalog: aCatalog.
	aCashier _ Cashier new.
	self should: [ aCashier checkOut: aCart.]  
		raise: Error  
		withExceptionDo: [ :anError | self assert: anError messageText equals: 'No se puede hacer checkout de un carrito vacio'.]! !


!classDefinition: #Cashier category: #'TusLibros-Solution'!
Object subclass: #Cashier
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Cashier methodsFor: 'as yet unclassified' stamp: 'Ji 6/13/2017 21:47:01'!
checkOut: aShoppingCart
	aShoppingCart isEmpty ifTrue: [self error: (self class cannotCheckOutEmptyCart]! !

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
