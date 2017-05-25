!classDefinition: #DistanceTest category: #'Distance-Solution'!
TestCase subclass: #DistanceTest
	instanceVariableNames: 'unMetro'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/25/2017 03:47:34'!
test01_AMeterIsEqualToAnotherMeter
	| otroMetro |
	unMetro := Metro initializeWith: 1.
	otroMetro := Metro initializeWith: 1.
	self assert: unMetro = otroMetro.! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/25/2017 03:47:54'!
test02_100CentimetersIsEqualToAMetro
	| cienCentimetros |
	unMetro := Metro initializeWith: 1.
	cienCentimetros := Centimetro initializeWith: 100.

	self assert: cienCentimetros = unMetro .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/25/2017 03:47:42'!
test02_AMeterIsEqualTo100Centimeters
	| cienCentimetros |
	unMetro := Metro initializeWith: 1.
	cienCentimetros := Centimetro initializeWith: 100.
	self assert: unMetro = cienCentimetros .
! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/25/2017 03:48:14'!
test03_1000MilimitersIsEquealTo100Centimiter
	| cienCentimetros milMilimetros |
	cienCentimetros := Centimetro initializeWith: 100.
	milMilimetros := Milimetros initializeWith: 1000.
	self assert: milMilimetros = cienCentimetros .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/25/2017 03:48:21'!
test03_100CentimiterIsEquealTo1000Milimiters
	| cienCentimetros milMilimetros |
	cienCentimetros := Centimetro initializeWith: 100.
	milMilimetros := Milimetros initializeWith: 1000.
	self assert: cienCentimetros = milMilimetros.
! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/25/2017 03:59:19'!
test04_1000MilimetrosIsEqualToAMetro
	| milMilimetros |
	unMetro := Metro initializeWith: 1.
	milMilimetros := Milimetros initializeWith: 1000.

	self assert:  unMetro = milMilimetros.! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/25/2017 03:57:40'!
test04_AMetroIsEqualTo1000Milimetros
	| milMilimetros |
	unMetro := Metro initializeWith: 1.
	milMilimetros := Milimetros initializeWith: 1000.

	self assert: milMilimetros = unMetro .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/25/2017 04:04:43'!
test05_ACentimetroIsEqualToAnotherCentimetro
	| unCentimetro anotherCentimetro |
	unCentimetro := Centimetro initializeWith: 1.
	anotherCentimetro := Centimetro initializeWith: 1.

	self assert: unCentimetro = anotherCentimetro .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/25/2017 04:08:08'!
test06_AMilimetroIsEqualToAnotherMilimetro
	| aMilimetros anotherMilimetro |
	anotherMilimetro := Milimetros initializeWith: 1.
	aMilimetros := Milimetros initializeWith: 1.

	self assert: aMilimetros = anotherMilimetro .! !


!classDefinition: #DistanceUnits category: #'Distance-Solution'!
Object subclass: #DistanceUnits
	instanceVariableNames: 'quantity'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!


!DistanceUnits methodsFor: 'comparing' stamp: 'JI 5/25/2017 03:20:42'!
= anotherDistance
	^self subclassResponsibility.
	! !


!DistanceUnits methodsFor: 'operating' stamp: 'jak 5/21/2017 17:18:12'!
+ anotherDistance
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DistanceUnits class' category: #'Distance-Solution'!
DistanceUnits class
	instanceVariableNames: ''!

!DistanceUnits class methodsFor: 'class initialization' stamp: 'jak 5/21/2017 17:22:17'!
initializeWith: aQuantity 
	self subclassResponsibility ! !


!classDefinition: #Centimetro category: #'Distance-Solution'!
DistanceUnits subclass: #Centimetro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Centimetro methodsFor: 'initialization' stamp: 'jak 5/21/2017 17:26:25'!
initializeWith: aQuantity 
	quantity := aQuantity ! !


!Centimetro methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 03:32:01'!
= anotherDistance
	^ anotherDistance isEqualToCentimetros: quantity .! !

!Centimetro methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 04:05:04'!
isEqualToCentimetros: someCentimetros
	^ quantity = someCentimetros! !

!Centimetro methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 03:31:48'!
isEqualToMetros: someMetros
	^someMetros  * 100 = quantity ! !

!Centimetro methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 03:43:14'!
isEqualToMilimetros: someMilimetros 
	^ someMilimetros  = (quantity * 10)! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Centimetro class' category: #'Distance-Solution'!
Centimetro class
	instanceVariableNames: ''!

!Centimetro class methodsFor: 'class initialization' stamp: 'jak 5/21/2017 17:22:26'!
initializeWith: aQuantity 
	^self new initializeWith: aQuantity! !


!classDefinition: #Metro category: #'Distance-Solution'!
DistanceUnits subclass: #Metro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Metro methodsFor: 'initialization' stamp: 'jak 5/21/2017 17:21:57'!
initializeWith: aQuantity 
	quantity := aQuantity! !


!Metro methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 03:35:13'!
isEqualToCentimetros: someCentimetros 
	^ someCentimetros = (quantity * 100)! !

!Metro methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 03:58:51'!
isEqualToMilimetros: someMilimetros
	^ quantity * 1000 = someMilimetros ! !


!Metro methodsFor: 'operating' stamp: 'jak 5/21/2017 17:25:26'!
+ aMetro 
	^Metro initializeWith: (quantity + aMetro unit)! !

!Metro methodsFor: 'operating' stamp: 'JI 5/25/2017 03:31:35'!
= anotherDistance
	^ anotherDistance isEqualToMetros: quantity .! !

!Metro methodsFor: 'operating' stamp: 'JI 5/25/2017 03:31:22'!
isEqualToMetros: someMetros
	^ someMetros = quantity ! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Metro class' category: #'Distance-Solution'!
Metro class
	instanceVariableNames: ''!

!Metro class methodsFor: 'class initialization' stamp: 'jak 5/21/2017 17:22:07'!
initializeWith: aQuantity 
	^self new initializeWith: aQuantity ! !


!classDefinition: #Milimetros category: #'Distance-Solution'!
DistanceUnits subclass: #Milimetros
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Milimetros methodsFor: 'initialization' stamp: 'jak 5/21/2017 17:25:03'!
initializeWith: anInteger 
	quantity := anInteger ! !


!Milimetros methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 03:44:08'!
= anotherDistance 
	^anotherDistance isEqualToMilimetros: quantity ! !

!Milimetros methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 03:32:09'!
isEqualToCentimetros: someCentimetros
	^ someCentimetros * 10 = quantity ! !

!Milimetros methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 03:59:46'!
isEqualToMetros: someMetros
	^ someMetros * 1000 = quantity ! !

!Milimetros methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 04:08:31'!
isEqualToMilimetros: someMilimetros
	^ someMilimetros = quantity ! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Milimetros class' category: #'Distance-Solution'!
Milimetros class
	instanceVariableNames: ''!

!Milimetros class methodsFor: 'class initialization' stamp: 'jak 5/20/2017 18:25:03'!
initializeWith: anInteger 
	^self new initializeWith: anInteger.! !
