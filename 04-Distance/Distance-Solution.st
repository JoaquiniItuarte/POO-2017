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

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/25/2017 19:17:09'!
test04_1000MilimetrosIsEqualToAMetro
	| milMilimetros |
	unMetro := Metro initializeWith: 1.
	milMilimetros := Milimetros initializeWith: 1000.

	self assert: milMilimetros = unMetro .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/25/2017 19:17:18'!
test04_AMetroIsEqualTo1000Milimetros
	| milMilimetros |
	unMetro := Metro initializeWith: 1.
	milMilimetros := Milimetros initializeWith: 1000.

	self assert: unMetro = milMilimetros .! !

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

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/25/2017 18:52:27'!
test07_SomeMetrosPlusSomeMetrosAddsRight
	
	| someMetros anotherSomeMetros tresMetros |
	someMetros := Metro initializeWith: 1.
	anotherSomeMetros := Metro initializeWith: 2.
	tresMetros _ Metro initializeWith: 3.
	
	self assert: someMetros + anotherSomeMetros = tresMetros .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/25/2017 18:58:55'!
test08_SomeMetrosPlusSomeCentimetrosAddsRight
	
	| someMetros someCentimetros cientoVeinteCentimetros |
	someMetros := Metro initializeWith: 1.
	someCentimetros := Centimetro initializeWith: 20.
	cientoVeinteCentimetros _ Centimetro initializeWith: 120.
	
	self assert: someMetros + someCentimetros = cientoVeinteCentimetros .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/25/2017 19:01:25'!
test09_SomeMetrosPlusSomeMilimetrosAddsRight
	
	| someMetros someMilimetros milCientoUnMilimetros |
	someMetros := Metro initializeWith: 1.
	someMilimetros := Milimetros initializeWith: 101.
	milCientoUnMilimetros _ Milimetros initializeWith: 1101.
	
	self assert: someMetros + someMilimetros = milCientoUnMilimetros ! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/25/2017 19:04:19'!
test10_SomeCentimetrosPlusSomeMetrosAddsRight
	
	| someMetros someCentimetros fourHundredTwentyThreeCentimetros |
	someMetros := Metro initializeWith: 4.
	someCentimetros := Centimetro initializeWith: 23.
	fourHundredTwentyThreeCentimetros _ Centimetro initializeWith: 423.
	
	self assert: someCentimetros + someMetros = fourHundredTwentyThreeCentimetros .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/25/2017 19:09:02'!
test11_SomeCentimetrosPlusSomeCentimetrosAddsRight
	
	|  someCentimetros anotherSomeCentimetros thirtyCentimetros |
	anotherSomeCentimetros := Centimetro initializeWith: 7.
	someCentimetros := Centimetro initializeWith: 23.
	thirtyCentimetros _ Centimetro initializeWith: 30.
	
	self assert: someCentimetros + anotherSomeCentimetros = thirtyCentimetros .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/25/2017 19:13:56'!
test12_SomeCentimetrosPlusSomeMilimetrosAddsRight
	
	|  someCentimetros someMilimetros sixHundredSixtySixMilimetros |
	someCentimetros := Centimetro initializeWith: 60.
	someMilimetros := Milimetros initializeWith: 66.
	sixHundredSixtySixMilimetros _ Milimetros initializeWith: 666.
	
	self assert: someCentimetros + someMilimetros = sixHundredSixtySixMilimetros .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/25/2017 19:16:35'!
test13_SomeMilimetrosPlusSomeMetrosAddsRight
	
	|  someMilimetros someMetros fourThousandsTwentyMilimetros |
	someMilimetros := Milimetros initializeWith: 1020.
	someMetros := Metro initializeWith: 3.
	fourThousandsTwentyMilimetros _ Milimetros initializeWith: 4020.
	
	self assert: someMilimetros + someMetros = fourThousandsTwentyMilimetros .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/25/2017 19:23:46'!
test14_SomeMilimetrosPlusSomeCentimetrosAddsRight
	
	|  someMilimetros someCentimetros fourThousandsThirtyMilimetros |
	someMilimetros := Milimetros initializeWith: 1020.
	someCentimetros := Centimetro initializeWith: 301.
	fourThousandsThirtyMilimetros _ Milimetros initializeWith: 4030.
	
	self assert: someMilimetros + someCentimetros = fourThousandsThirtyMilimetros .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/25/2017 19:26:14'!
test15_SomeMilimetrosPlusSomeMilimetrosAddsRight
	
	|  someMilimetros anotherSomeMilimetros a11122Milimetros |
	someMilimetros := Milimetros initializeWith: 11111.
	anotherSomeMilimetros := Milimetros initializeWith: 11.
	a11122Milimetros _ Milimetros initializeWith: 11122.
	
	self assert: someMilimetros + anotherSomeMilimetros = a11122Milimetros .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/27/2017 15:01:26'!
test16_SomeMetrosMinusSomeMetrosSubstractRight
	
	|  someMetros anotherSomeMetros theResult |
	
	someMetros := Metro initializeWith: 1.
	anotherSomeMetros := Metro initializeWith: 1.
	theResult _ Metro initializeWith: 0.
	
	self assert: someMetros - anotherSomeMetros = theResult .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/27/2017 15:08:49'!
test17_SomeMetrosMinusSomeCentimetrosSubstractRight
	
	|  someMetros anotherSomeCentimetros theResult |
	
	someMetros := Metro initializeWith: 40.
	anotherSomeCentimetros := Centimetro initializeWith: 15.
	theResult _ Centimetro initializeWith: 3985.
	
	self assert: someMetros - anotherSomeCentimetros = theResult .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/27/2017 15:11:01'!
test18_SomeMetrosMinusSomeMilimetrosSubstractRight
	
	|  someMetros anotherSomeMilimetros theResult |
	
	someMetros := Metro initializeWith: 23.
	anotherSomeMilimetros := Milimetros initializeWith: 431.
	theResult _ Milimetros initializeWith: 22569.
	
	self assert: someMetros - anotherSomeMilimetros = theResult .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/27/2017 15:19:59'!
test19_SomeCentimetrosMinusSomeMetrosSubstractRight
	
	|  someCentimetros someMetros theResult |
	
	someCentimetros := Centimetro initializeWith: 41.
	someMetros := Metro initializeWith: 23.
	theResult _ Centimetro initializeWith: -2259.
	
	self assert: someCentimetros - someMetros = theResult .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/27/2017 15:21:00'!
test20_SomeCentimetrosMinusSomeCentimetrosSubstractRight
	
	|  someCentimetros anotherSomeCentimetros theResult |
	
	someCentimetros := Centimetro initializeWith: 41.
	anotherSomeCentimetros := Centimetro initializeWith: 23.
	theResult _ Centimetro initializeWith: 18.
	
	self assert: someCentimetros - anotherSomeCentimetros = theResult .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/27/2017 15:21:32'!
test21_SomeCentimetrosMinusSomeMilimetrosSubstractRight
	
	|  someCentimetros someMilimetros theResult |
	
	someCentimetros := Centimetro initializeWith: 100000.
		someMilimetros := Milimetros initializeWith: 4231.

	theResult _ Milimetros initializeWith: 995769.
	
	self assert: someCentimetros - someMilimetros = theResult .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/27/2017 15:24:14'!
test22_SomeMilimetrosMinusSomeMetrosSubstractRight
	
	|  someMilimetros someMetros theResult |
	
	someMilimetros := Milimetros initializeWith: 100001.
	someMetros := Metro initializeWith: 10.

	theResult _ Milimetros initializeWith: 90001.
	
	self assert: someMilimetros - someMetros = theResult .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/27/2017 15:26:11'!
test23_SomeMilimetrosMinusSomeCentimetrosSubstractRight
	
	|  someMilimetros someCentimetros theResult |
	
	someMilimetros := Milimetros initializeWith: 10510.
	someCentimetros := Centimetro initializeWith: 51.

	theResult _ Milimetros initializeWith: 10000.
	
	self assert: someMilimetros - someCentimetros = theResult .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/27/2017 15:27:12'!
test24_SomeMilimetrosMinusSomeMilimetrosSubstractRight
	
	|  someMilimetros anotherSomeMilimetros theResult |
	
	someMilimetros := Milimetros initializeWith: 10510.
	anotherSomeMilimetros := Milimetros initializeWith: 51.

	theResult _ Milimetros initializeWith: 10459.
	
	self assert: someMilimetros - anotherSomeMilimetros = theResult .! !


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


!DistanceUnits methodsFor: 'operating' stamp: 'JI 5/25/2017 19:21:11'!
+ anotherDistance
	^ self subclassResponsibility ! !


!DistanceUnits methodsFor: 'as yet unclassified' stamp: 'JI 5/27/2017 15:01:56'!
- aMetro 
	^self subclassResponsibility ! !

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


!Centimetro methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 19:22:04'!
+ someDistance
	^ someDistance addCentimetros: quantity ! !

!Centimetro methodsFor: 'as yet unclassified' stamp: 'JI 5/27/2017 15:13:47'!
- someDistance
	^ someDistance substractSomeCentimetros: quantity ! !

!Centimetro methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 03:32:01'!
= anotherDistance
	^ anotherDistance isEqualToCentimetros: quantity .! !

!Centimetro methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 19:10:31'!
addCentimetros: someCentimetros 
	^ Centimetro initializeWith: quantity + someCentimetros ! !

!Centimetro methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 18:59:51'!
addMetros: someMetros
	^ Centimetro initializeWith: someMetros *100 + quantity 
	! !

!Centimetro methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 19:24:19'!
addMilimetros: someMilimetros 
	^ Milimetros initializeWith: quantity * 10 + someMilimetros ! !

!Centimetro methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 04:05:04'!
isEqualToCentimetros: someCentimetros
	^ quantity = someCentimetros! !

!Centimetro methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 03:31:48'!
isEqualToMetros: someMetros
	^someMetros  * 100 = quantity ! !

!Centimetro methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 03:43:14'!
isEqualToMilimetros: someMilimetros 
	^ someMilimetros  = (quantity * 10)! !

!Centimetro methodsFor: 'as yet unclassified' stamp: 'JI 5/27/2017 15:16:08'!
substractSomeCentimetros: someCentimetros
	^ Centimetro initializeWith: someCentimetros - quantity ! !

!Centimetro methodsFor: 'as yet unclassified' stamp: 'JI 5/27/2017 15:08:07'!
substractSomeMetros: someMetros
	^ Centimetro initializeWith: someMetros*100 - quantity ! !

!Centimetro methodsFor: 'as yet unclassified' stamp: 'JI 5/27/2017 15:26:34'!
substractSomeMilimetros: someMilimetros 
	^ Milimetros initializeWith: someMilimetros - (quantity *10)! !

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


!Metro methodsFor: 'as yet unclassified' stamp: 'JI 5/27/2017 15:04:08'!
- someDistance 
	^ someDistance substractSomeMetros: quantity .! !

!Metro methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 19:07:58'!
addCentimetros: someCentimetros
	
	^ Centimetro initializeWith: quantity *100 + someCentimetros ! !

!Metro methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 18:57:39'!
addMetros: someMetros
	^ Metro initializeWith: someMetros + quantity ! !

!Metro methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 19:19:28'!
addMilimetros: someMilimetros
	^ Milimetros initializeWith: quantity *1000 + someMilimetros ! !

!Metro methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 03:35:13'!
isEqualToCentimetros: someCentimetros 
	^ someCentimetros = (quantity * 100)! !

!Metro methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 03:58:51'!
isEqualToMilimetros: someMilimetros
	^ quantity * 1000 = someMilimetros ! !

!Metro methodsFor: 'as yet unclassified' stamp: 'JI 5/27/2017 15:20:33'!
substractSomeCentimetros: someCentimetros
	^ Centimetro initializeWith: someCentimetros - (quantity * 100 )! !

!Metro methodsFor: 'as yet unclassified' stamp: 'JI 5/27/2017 15:05:11'!
substractSomeMetros: someMetros
	^ Metro initializeWith: someMetros - quantity ! !

!Metro methodsFor: 'as yet unclassified' stamp: 'JI 5/27/2017 15:25:19'!
substractSomeMilimetros: someMilimetros
	^Milimetros initializeWith: someMilimetros - (quantity *1000)! !


!Metro methodsFor: 'operating' stamp: 'JI 5/25/2017 18:56:15'!
+ someDistance
	
	^someDistance addMetros: quantity ! !

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


!Milimetros methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 19:22:38'!
+ someDistance 
	^ someDistance addMilimetros: quantity ! !

!Milimetros methodsFor: 'as yet unclassified' stamp: 'JI 5/27/2017 15:24:53'!
- someDistance 
	^ someDistance substractSomeMilimetros: quantity ! !

!Milimetros methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 03:44:08'!
= anotherDistance 
	^anotherDistance isEqualToMilimetros: quantity ! !

!Milimetros methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 19:12:34'!
addCentimetros: someCentimetros 
	^ Milimetros initializeWith: someCentimetros *10 + quantity ! !

!Milimetros methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 19:01:54'!
addMetros: someMetros 
	^ Milimetros initializeWith: someMetros *1000 + quantity ! !

!Milimetros methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 19:26:42'!
addMilimetros: someMilimetros
	^ Milimetros initializeWith: quantity + someMilimetros ! !

!Milimetros methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 03:32:09'!
isEqualToCentimetros: someCentimetros
	^ someCentimetros * 10 = quantity ! !

!Milimetros methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 03:59:46'!
isEqualToMetros: someMetros
	^ someMetros * 1000 = quantity ! !

!Milimetros methodsFor: 'as yet unclassified' stamp: 'JI 5/25/2017 04:08:31'!
isEqualToMilimetros: someMilimetros
	^ someMilimetros = quantity ! !

!Milimetros methodsFor: 'as yet unclassified' stamp: 'JI 5/27/2017 15:17:32'!
substractSomeCentimetros: someCentimetros 
	^ Milimetros initializeWith: someCentimetros * 10 - quantity ! !

!Milimetros methodsFor: 'as yet unclassified' stamp: 'JI 5/27/2017 15:10:16'!
substractSomeMetros: someMetros
	^ Milimetros initializeWith: someMetros *1000 - quantity ! !

!Milimetros methodsFor: 'as yet unclassified' stamp: 'JI 5/27/2017 15:27:34'!
substractSomeMilimetros: someMilimetros
	^ Milimetros initializeWith: someMilimetros - quantity ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Milimetros class' category: #'Distance-Solution'!
Milimetros class
	instanceVariableNames: ''!

!Milimetros class methodsFor: 'class initialization' stamp: 'jak 5/20/2017 18:25:03'!
initializeWith: anInteger 
	^self new initializeWith: anInteger.! !
