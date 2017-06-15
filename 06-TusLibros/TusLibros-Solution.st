!classDefinition: #TestTusLibros category: #'TusLibros-Solution'!
TestCase subclass: #TestTusLibros
	instanceVariableNames: 'shoppingCartWithEmptyCatalog anIsbnBook anIsbnBook2 catalog1 catalog2 shoppingCartWithCatalog1 shoppingCartWithCatalog2 aCashier shoppingCartWithCatalog1Price shoppingCartWithCatalog2Price aCashier2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'JAK 6/14/2017 10:12:41'!
test001createAnEmptyShoppingCart

	self assert: shoppingCartWithEmptyCatalog isEmpty.! !

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'JI 6/15/2017 14:31:00'!
test002whenAddAnElementIntoTheShoopingCartItIsNotEmpty

	
	self deny: shoppingCartWithCatalog1 isEmpty.! !

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'JI 6/15/2017 14:31:32'!
test004canListTheElementsAddedToTheCart
	
	|contentsOfShoppingCart |
	
	contentsOfShoppingCart := shoppingCartWithCatalog2 contents.
	
	self assert: (contentsOfShoppingCart includes: anIsbnBook ).
	self assert: (contentsOfShoppingCart includes: anIsbnBook2 ).! !

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'JI 6/15/2017 14:31:53'!
test005canAddTheSameBookTwiceToTheShoppingCartAndKnowTheQuantiy


	self assert: ((shoppingCartWithCatalog2 quantity: anIsbnBook2) = 2).
! !

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'JI 6/15/2017 14:32:39'!
test006addLessThanOneBookRaiseError

	self 
		should: [ shoppingCartWithEmptyCatalog add: anIsbnBook withQuantity: 0. ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: ShoppingCart canNotAddLessThanOneBook.
			self assert: shoppingCartWithEmptyCatalog isEmpty ]
! !

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'JI 6/15/2017 14:33:04'!
test007cannotAddABookThatIsNotInTheCatalog
	
	self should: [ shoppingCartWithEmptyCatalog add: anIsbnBook2] 
		raise: Error  
		withExceptionDo: [ :anError | self assert: anError messageText equals: 'No se puede agregar libro'.
				self assert: shoppingCartWithEmptyCatalog isEmpty.]! !

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'JI 6/15/2017 14:41:54'!
test008cannotAddABookWithANonIntegerAmount
	
	self should: [ shoppingCartWithCatalog1 add: anIsbnBook withQuantity: 2/3] 
		raise: Error  
		withExceptionDo: [ :anError | self assert: anError messageText equals: 'No se puede agregar una cantidad no entera de libros'.
				self assert: (shoppingCartWithCatalog1 occurrencesOf: anIsbnBook) = 1 .]! !

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'JI 6/15/2017 14:40:21'!
test009aCashierCanNotCheckOutEmptyCart
	
	self should: [ aCashier checkOut: shoppingCartWithEmptyCatalog .]  
		raise: Error  
		withExceptionDo: [ :anError | self assert: anError messageText equals: 'No se puede hacer checkout de un carrito vacio'.]! !

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'JI 6/15/2017 14:40:42'!
test010aCashierChecksOutAnItem
	
	self assert: ( (aCashier checkOut: shoppingCartWithCatalog1) = 10).
	! !

!TestTusLibros methodsFor: 'Testing Shopping Cart' stamp: 'JI 6/15/2017 14:28:22'!
test011aCashierChecksOutItems
	
	self assert: ( (aCashier2 checkOut: shoppingCartWithCatalog2) = 50).
	! !


!TestTusLibros methodsFor: 'setUp' stamp: 'JI 6/15/2017 14:34:19'!
setUp
	shoppingCartWithEmptyCatalog _ ShoppingCart initializeWithCatalog: Dictionary new.
	anIsbnBook _ 123123.
	anIsbnBook2 := 321321.
	catalog1 _ Dictionary new.
	catalog1 at: anIsbnBook put: 10.
	catalog2 _ Dictionary new.
	catalog2 at: anIsbnBook put: 10.
	catalog2 at: anIsbnBook2 put: 20.
	shoppingCartWithCatalog1 _ ShoppingCart initializeWithCatalog: catalog1.
	shoppingCartWithCatalog1 add: anIsbnBook.
	shoppingCartWithCatalog2 _ ShoppingCart initializeWithCatalog: catalog2.
	shoppingCartWithCatalog2 add: anIsbnBook .
	shoppingCartWithCatalog2 add: anIsbnBook2 withQuantity:2. 

	
	aCashier _ Cashier initializeWithCatalog: catalog1 .
	aCashier2 _ Cashier initializeWithCatalog: catalog2 .
! !


!classDefinition: #Cashier category: #'TusLibros-Solution'!
Object subclass: #Cashier
	instanceVariableNames: 'catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Cashier methodsFor: 'as yet unclassified' stamp: 'JI 6/15/2017 14:30:07'!
checkOut: aShoppingCart
	| total |
	aShoppingCart isEmpty ifTrue: [self error: (self class cannotCheckOutEmptyCart)].
	
	total _ 0.
	aShoppingCart contents do: [ :aBook | total _ total + (self checkoutItem: aBook)].
	
	^total.! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'JI 6/15/2017 14:30:42'!
checkoutItem: aBook 
	
	^self checkoutItem: aBook withAmount: 1! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'JI 6/15/2017 14:10:34'!
checkoutItem: aBook withAmount: anAmount
	
	^ (catalog at: aBook) * anAmount ! !


!Cashier methodsFor: 'initialization' stamp: 'JI 6/15/2017 14:12:16'!
initializeWithCatalog: aCatalog
	 catalog _ aCatalog! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #'TusLibros-Solution'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'Ji 6/13/2017 21:47:39'!
cannotCheckOutEmptyCart
	^'No se puede hacer checkout de un carrito vacio'! !


!Cashier class methodsFor: 'initialization' stamp: 'JI 6/15/2017 14:11:38'!
initializeWithCatalog: aCatalog 
	^self new initializeWithCatalog: aCatalog ! !


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

!ShoppingCart methodsFor: 'operating' stamp: 'JI 6/15/2017 14:20:36'!
add: anElement withQuantity: quantity
	
	quantity isInteger ifFalse: [self error: (self class canNotAddNotIntegerQuantity) ].
	quantity < 1 ifTrue: [self error: (self class canNotAddLessThanOneBook )].
	(catalogo includesKey: anElement) ifFalse: [self error: (self class canNotAddABookThatIsNotInTheCatalog) ].
	
	collectionOfElements add: anElement withOccurrences: quantity .! !


!ShoppingCart methodsFor: 'initialization' stamp: 'Ji 6/13/2017 21:25:17'!
initializeWithCatalog: aCatalog 
	
	collectionOfElements _ Bag new.
	catalogo _ aCatalog.! !


!ShoppingCart methodsFor: 'as yet unclassified' stamp: 'JI 6/15/2017 14:39:00'!
occurrencesOf: aBook 
	
^collectionOfElements contents at:aBook ifAbsent: [0]! !

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
