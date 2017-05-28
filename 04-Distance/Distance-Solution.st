!classDefinition: #DistanceTest category: #'Distance-Solution'!
TestCase subclass: #DistanceTest
	instanceVariableNames: 'unMetro distanceFactory milMilimetros unCentimetro oneMilimetro threeMetros fourMetros fiveMetros threeHundredOneCentimetros fourHundredOneCentimetros fiveHundredOneCentimetros threeThousandMilimetros fourThousandMilimetros fiveThousandMilimetros'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!DistanceTest methodsFor: 'tests' stamp: 'jak 5/27/2017 19:39:44'!
test01_AMeterIsEqualToAnotherMeter
	self assert: unMetro = distanceFactory oneMeter.! !

!DistanceTest methodsFor: 'tests' stamp: 'jak 5/27/2017 19:40:13'!
test02_100CentimetersIsEqualToAMetro
	self assert: distanceFactory oneHundredCentimeters = unMetro .! !

!DistanceTest methodsFor: 'tests' stamp: 'jak 5/27/2017 19:40:34'!
test02_AMeterIsEqualTo100Centimeters
	self assert: unMetro = distanceFactory oneHundredCentimeters .
! !

!DistanceTest methodsFor: 'tests' stamp: 'jak 5/27/2017 19:41:34'!
test03_1000MilimitersIsEquealTo100Centimiter
	self assert: milMilimetros = distanceFactory oneHundredCentimeters .! !

!DistanceTest methodsFor: 'tests' stamp: 'jak 5/27/2017 19:43:18'!
test03_100CentimiterIsEquealTo1000Milimiters
	self assert: distanceFactory oneHundredCentimeters = milMilimetros.
! !

!DistanceTest methodsFor: 'tests' stamp: 'jak 5/27/2017 19:43:32'!
test04_1000MilimetrosIsEqualToAMetro
	self assert: milMilimetros = unMetro .! !

!DistanceTest methodsFor: 'tests' stamp: 'jak 5/27/2017 19:43:42'!
test04_AMetroIsEqualTo1000Milimetros
	self assert: unMetro = milMilimetros .! !

!DistanceTest methodsFor: 'tests' stamp: 'jak 5/27/2017 19:44:35'!
test05_ACentimetroIsEqualToAnotherCentimetro
	self assert: unCentimetro = distanceFactory oneCentimeter .! !

!DistanceTest methodsFor: 'tests' stamp: 'jak 5/27/2017 19:47:36'!
test06_AMilimetroIsEqualToAnotherMilimetro
	self assert: oneMilimetro = distanceFactory oneMilimeter .! !

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

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/28/2017 15:43:26'!
test25_SomeMetrosDividedByANumber
	
	|  someMetros theResult |
	
	someMetros := Metro initializeWith: 1.

	theResult _ Metro initializeWith: 1/2.
	
	self assert: someMetros / 2 = theResult .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/28/2017 15:44:12'!
test26_SomeCentimetrosDividedByANumber
	
	|  someCentimetros theResult |
	
	someCentimetros := Centimetro initializeWith: 66.

	theResult _ Centimetro initializeWith: 22.
	
	self assert: someCentimetros / 3 = theResult .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/28/2017 15:44:38'!
test27_SomeMilimetrosDividedByANumber
	
	|  someMilimetros theResult |
	
	someMilimetros := Milimetros initializeWith: 15.

	theResult _ Milimetros initializeWith: 3.
	
	self assert: someMilimetros / 5 = theResult .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/28/2017 15:51:40'!
test28_SomeMetrosMultipliedByANumber
	
	|  someMetros theResult |
	
	someMetros := Metro initializeWith: 1.

	theResult _ Metro initializeWith: 2.
	
	self assert: someMetros * 2 = theResult .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/28/2017 15:52:08'!
test29_SomeCentimetrosMultipliedByANumber
	
	|  someCentimetros theResult |
	
	someCentimetros := Centimetro initializeWith: 66.

	theResult _ Centimetro initializeWith: 198.
	
	self assert: someCentimetros * 3 = theResult .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/28/2017 15:52:39'!
test30_SomeMilimetrosMultipliedByANumber
	
	|  someMilimetros theResult |
	
	someMilimetros := Milimetros initializeWith: 15.

	theResult _ Milimetros initializeWith: 60.
	
	self assert: someMilimetros * 4 = theResult .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/28/2017 16:14:02'!
test31_ANumberMultipliedBySomeMetros
	
	|  someMetros theResult |
	
	someMetros := Metro initializeWith: 1.

	theResult _ Metro initializeWith: 2.
	
	'self assert: 2 * someMetros  = theResult .'.! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/28/2017 16:15:08'!
test32_ANumberMultipliedBySomeCentimetros
	
	|  someCentimetros theResult |
	
	someCentimetros := Centimetro initializeWith: 66.

	theResult _ Centimetro initializeWith: 198.
	
	'self assert:  3 * someCentimetros  = theResult .'! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/28/2017 16:15:43'!
test33_ANumberMultipliedBySomeMilimetros
	
	|  someMilimetros theResult |
	
	someMilimetros := Milimetros initializeWith: 15.

	theResult _ Milimetros initializeWith: 60.
	
	'self assert: 4 * someMilimetros = theResult .'! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/28/2017 16:30:20'!
test34_MetroLessMetroWorks
	
	|  fourMetros fiveMetros |
	
	fourMetros := Metro initializeWith: 4.

	fiveMetros _ Metro initializeWith: 5.
	
	self assert: fourMetros < fiveMetros. 
	self deny: fiveMetros < fourMetros .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/28/2017 16:32:23'!
test35_MetroLessCentimetroWorks
	
	|  fourMetros fourHundredOneCentimetros fiveMetros  |
	
	fourMetros := Metro initializeWith: 4.
	fiveMetros _ Metro initializeWith: 5.

	fourHundredOneCentimetros _ Centimetro initializeWith: 401.
	
	self assert: fourMetros < fourHundredOneCentimetros. 
	self deny: fiveMetros < fourHundredOneCentimetros .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/28/2017 16:33:08'!
test36_MetroLessMilimetroWorks
	
	|  fourMetros fourThousandOneMilimetros fiveMetros  |
	
	fourMetros := Metro initializeWith: 4.
	fiveMetros _ Metro initializeWith: 5.

	fourThousandOneMilimetros _ Milimetros initializeWith: 4001.
	
	self assert: fourMetros < fourThousandOneMilimetros. 
	self deny: fiveMetros < fourThousandOneMilimetros .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/28/2017 16:34:15'!
test37_CentimetroLessMetroWorks
	
	|  fourMetros fourHundredOneCentimetros fiveMetros  |
	
	fourMetros := Metro initializeWith: 4.
	fiveMetros _ Metro initializeWith: 5.

	fourHundredOneCentimetros _ Centimetro initializeWith: 401.
	
	self deny: fourHundredOneCentimetros < fourMetros. 
	self assert: fourHundredOneCentimetros < fiveMetros .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/28/2017 16:36:46'!
test38_CentimetroLessCentimetroWorks
	
	|  threeHundredOneCentimetros fourHundredOneCentimetros fiveHundredOneCentimetros  |
	
	threeHundredOneCentimetros _ Centimetro initializeWith: 301.
	fourHundredOneCentimetros _ Centimetro initializeWith: 401.
	fiveHundredOneCentimetros _ Centimetro initializeWith: 501.
	
	self deny: fourHundredOneCentimetros < threeHundredOneCentimetros. 
	self assert: fourHundredOneCentimetros < fiveHundredOneCentimetros .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/28/2017 17:16:11'!
test39_CentimetroLessMilimetroWorks
	
	
	self assert: fourHundredOneCentimetros < fiveThousandMilimetros . 
	self deny:  fiveHundredOneCentimetros < fourThousandMilimetros .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/28/2017 17:17:04'!
test40_MilimetroLessMetroWorks
	
	
	self assert: fourThousandMilimetros <  fiveMetros . 
	self deny:  fourThousandMilimetros < threeMetros .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/28/2017 17:16:53'!
test41_MilimetroLessCentimetroWorks
	
	
	self assert: fourThousandMilimetros <  fiveHundredOneCentimetros . 
	self deny:  fiveThousandMilimetros < threeHundredOneCentimetros .! !

!DistanceTest methodsFor: 'tests' stamp: 'JI 5/28/2017 17:17:22'!
test42_MilimetroLessMilimetroWorks
	
	
	self assert: fourThousandMilimetros <  fiveThousandMilimetros . 
	self deny:  fiveThousandMilimetros < fourThousandMilimetros .! !


!DistanceTest methodsFor: 'Dependencies' stamp: 'JI 5/28/2017 17:13:05'!
setUp
	distanceFactory := DistanceFactory new.
	unMetro := distanceFactory oneMeter.
	unCentimetro := distanceFactory oneCentimeter.
	oneMilimetro := distanceFactory oneMilimeter.
	milMilimetros := Milimetros initializeWith: 1000.
	
	
	threeMetros _ Metro initializeWith: 3.
	fourMetros _ Metro initializeWith: 4.
	fiveMetros _ Metro initializeWith: 5.
	
	threeHundredOneCentimetros _ Centimetro initializeWith: 301.
	fourHundredOneCentimetros _ Centimetro initializeWith: 401.
	fiveHundredOneCentimetros _ Centimetro initializeWith: 501.
	
	threeThousandMilimetros _ Milimetros initializeWith: 3000.
	fourThousandMilimetros _ Milimetros initializeWith: 4000.
	fiveThousandMilimetros _ Milimetros initializeWith: 5000.! !


!classDefinition: #DistanceFactory category: #'Distance-Solution'!
Object subclass: #DistanceFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!DistanceFactory methodsFor: 'newInstances' stamp: 'jak 5/27/2017 17:56:28'!
minusOneMeter: aDistance
	^aDistance - self oneMeter
! !

!DistanceFactory methodsFor: 'newInstances' stamp: 'jak 5/27/2017 18:00:18'!
oneCentimeter
	^Centimetro initializeWith: 1
! !

!DistanceFactory methodsFor: 'newInstances' stamp: 'jak 5/27/2017 18:01:02'!
oneHundredCentimeters
	^Centimetro initializeWith: 100
! !

!DistanceFactory methodsFor: 'newInstances' stamp: 'jak 5/27/2017 17:59:43'!
oneMeter
	^Metro initializeWith: 1
! !

!DistanceFactory methodsFor: 'newInstances' stamp: 'jak 5/27/2017 19:46:40'!
oneMilimeter
	^Milimetros initializeWith: 1
! !

!DistanceFactory methodsFor: 'newInstances' stamp: 'jak 5/27/2017 18:01:15'!
twoHundredCentimeters
	^Centimetro initializeWith: 200
! !

!DistanceFactory methodsFor: 'newInstances' stamp: 'jak 5/27/2017 18:01:30'!
twoMeters
	^Metro initializeWith: 2
! !

!DistanceFactory methodsFor: 'newInstances' stamp: 'jak 5/27/2017 18:01:40'!
zeroMeters
	^Metro initializeWith: 0
! !


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

!DistanceUnits methodsFor: 'operating' stamp: 'JI 5/27/2017 15:01:56'!
- aMetro 
	^self subclassResponsibility ! !


!DistanceUnits methodsFor: 'as yet unclassified' stamp: 'JI 5/28/2017 15:53:03'!
* aSmallInteger 
	^ self subclassResponsibility ! !

!DistanceUnits methodsFor: 'as yet unclassified' stamp: 'JI 5/28/2017 15:45:06'!
/ aSmallInteger 
	^ self subclassResponsibility ! !

!DistanceUnits methodsFor: 'as yet unclassified' stamp: 'JI 5/28/2017 16:19:58'!
< someDistance 
	^ self subclassResponsibility ! !

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


!Centimetro methodsFor: 'private' stamp: 'JI 5/25/2017 19:10:31'!
addCentimetros: someCentimetros 
	^ Centimetro initializeWith: quantity + someCentimetros ! !

!Centimetro methodsFor: 'private' stamp: 'JI 5/25/2017 18:59:51'!
addMetros: someMetros
	^ Centimetro initializeWith: someMetros *100 + quantity 
	! !

!Centimetro methodsFor: 'private' stamp: 'JI 5/25/2017 19:24:19'!
addMilimetros: someMilimetros 
	^ Milimetros initializeWith: quantity * 10 + someMilimetros ! !

!Centimetro methodsFor: 'private' stamp: 'JI 5/25/2017 04:05:04'!
isEqualToCentimetros: someCentimetros
	^ quantity = someCentimetros! !

!Centimetro methodsFor: 'private' stamp: 'JI 5/25/2017 03:31:48'!
isEqualToMetros: someMetros
	^someMetros  * 100 = quantity ! !

!Centimetro methodsFor: 'private' stamp: 'JI 5/25/2017 03:43:14'!
isEqualToMilimetros: someMilimetros 
	^ someMilimetros  = (quantity * 10)! !

!Centimetro methodsFor: 'private' stamp: 'JI 5/27/2017 15:16:08'!
substractSomeCentimetros: someCentimetros
	^ Centimetro initializeWith: someCentimetros - quantity ! !

!Centimetro methodsFor: 'private' stamp: 'JI 5/27/2017 15:08:07'!
substractSomeMetros: someMetros
	^ Centimetro initializeWith: someMetros*100 - quantity ! !

!Centimetro methodsFor: 'private' stamp: 'JI 5/27/2017 15:26:34'!
substractSomeMilimetros: someMilimetros 
	^ Milimetros initializeWith: someMilimetros - (quantity *10)! !


!Centimetro methodsFor: 'operating' stamp: 'JI 5/25/2017 19:22:04'!
+ someDistance
	^ someDistance addCentimetros: quantity ! !

!Centimetro methodsFor: 'operating' stamp: 'JI 5/27/2017 15:13:47'!
- someDistance
	^ someDistance substractSomeCentimetros: quantity ! !


!Centimetro methodsFor: 'comparing' stamp: 'JI 5/25/2017 03:32:01'!
= anotherDistance
	^ anotherDistance isEqualToCentimetros: quantity .! !


!Centimetro methodsFor: 'as yet unclassified' stamp: 'JI 5/28/2017 15:54:26'!
* aSmallInteger 
	^ Centimetro initializeWith: quantity * aSmallInteger ! !

!Centimetro methodsFor: 'as yet unclassified' stamp: 'JI 5/28/2017 15:45:56'!
/ aSmallInteger 
	^ Centimetro initializeWith: quantity / aSmallInteger ! !

!Centimetro methodsFor: 'as yet unclassified' stamp: 'JI 5/28/2017 17:21:01'!
< someDistance
	^ someDistance isNotLessThanCentimetros: quantity ! !

!Centimetro methodsFor: 'as yet unclassified' stamp: 'JI 5/28/2017 17:27:22'!
isNotLessThanCentimetros: aSmallInteger 
	^ (quantity  < aSmallInteger ) not! !

!Centimetro methodsFor: 'as yet unclassified' stamp: 'JI 5/28/2017 17:19:16'!
isNotLessThanMetros: someMetros
	^ (quantity < (someMetros*100) ) not! !

!Centimetro methodsFor: 'as yet unclassified' stamp: 'JI 5/28/2017 17:29:24'!
isNotLessThanMilimetros: aSmallInteger 
	^ ((quantity*10)  < aSmallInteger ) not! !

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


!Metro methodsFor: 'private' stamp: 'JI 5/25/2017 19:07:58'!
addCentimetros: someCentimetros
	
	^ Centimetro initializeWith: quantity *100 + someCentimetros ! !

!Metro methodsFor: 'private' stamp: 'JI 5/25/2017 18:57:39'!
addMetros: someMetros
	^ Metro initializeWith: someMetros + quantity ! !

!Metro methodsFor: 'private' stamp: 'JI 5/25/2017 19:19:28'!
addMilimetros: someMilimetros
	^ Milimetros initializeWith: quantity *1000 + someMilimetros ! !

!Metro methodsFor: 'private' stamp: 'JI 5/25/2017 03:35:13'!
isEqualToCentimetros: someCentimetros 
	^ someCentimetros = (quantity * 100)! !

!Metro methodsFor: 'private' stamp: 'JI 5/25/2017 03:31:22'!
isEqualToMetros: someMetros
	^ someMetros = quantity ! !

!Metro methodsFor: 'private' stamp: 'JI 5/25/2017 03:58:51'!
isEqualToMilimetros: someMilimetros
	^ quantity * 1000 = someMilimetros ! !

!Metro methodsFor: 'private' stamp: 'JI 5/27/2017 15:20:33'!
substractSomeCentimetros: someCentimetros
	^ Centimetro initializeWith: someCentimetros - (quantity * 100 )! !

!Metro methodsFor: 'private' stamp: 'JI 5/27/2017 15:05:11'!
substractSomeMetros: someMetros
	^ Metro initializeWith: someMetros - quantity ! !

!Metro methodsFor: 'private' stamp: 'JI 5/27/2017 15:25:19'!
substractSomeMilimetros: someMilimetros
	^Milimetros initializeWith: someMilimetros - (quantity *1000)! !


!Metro methodsFor: 'operating' stamp: 'JI 5/25/2017 18:56:15'!
+ someDistance
	
	^someDistance addMetros: quantity ! !

!Metro methodsFor: 'operating' stamp: 'JI 5/27/2017 15:04:08'!
- someDistance 
	^ someDistance substractSomeMetros: quantity .! !


!Metro methodsFor: 'comparing' stamp: 'JI 5/25/2017 03:31:35'!
= anotherDistance
	^ anotherDistance isEqualToMetros: quantity .! !


!Metro methodsFor: 'as yet unclassified' stamp: 'JI 5/28/2017 15:54:09'!
* aSmallInteger 
	^ Metro initializeWith: quantity * aSmallInteger ! !

!Metro methodsFor: 'as yet unclassified' stamp: 'JI 5/28/2017 15:45:31'!
/ aSmallInteger 
	^ Metro initializeWith: quantity / aSmallInteger ! !

!Metro methodsFor: 'as yet unclassified' stamp: 'JI 5/28/2017 16:20:41'!
< someDistance
	 ^ someDistance isNotLessThanMetros: quantity ! !

!Metro methodsFor: 'as yet unclassified' stamp: 'JI 5/28/2017 17:23:23'!
isNotLessThanCentimetros: aSmallInteger 
	^ (quantity*100 < aSmallInteger ) not! !

!Metro methodsFor: 'as yet unclassified' stamp: 'JI 5/28/2017 16:24:38'!
isNotLessThanMetros: someMetros
	^ (quantity < someMetros) not! !

!Metro methodsFor: 'as yet unclassified' stamp: 'JI 5/28/2017 17:28:46'!
isNotLessThanMilimetros: aSmallInteger 
	^ (quantity*1000  < aSmallInteger ) not! !

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


!Milimetros methodsFor: 'private' stamp: 'JI 5/25/2017 19:12:34'!
addCentimetros: someCentimetros 
	^ Milimetros initializeWith: someCentimetros *10 + quantity ! !

!Milimetros methodsFor: 'private' stamp: 'JI 5/25/2017 19:01:54'!
addMetros: someMetros 
	^ Milimetros initializeWith: someMetros *1000 + quantity ! !

!Milimetros methodsFor: 'private' stamp: 'JI 5/25/2017 19:26:42'!
addMilimetros: someMilimetros
	^ Milimetros initializeWith: quantity + someMilimetros ! !

!Milimetros methodsFor: 'private' stamp: 'JI 5/25/2017 03:32:09'!
isEqualToCentimetros: someCentimetros
	^ someCentimetros * 10 = quantity ! !

!Milimetros methodsFor: 'private' stamp: 'JI 5/25/2017 03:59:46'!
isEqualToMetros: someMetros
	^ someMetros * 1000 = quantity ! !

!Milimetros methodsFor: 'private' stamp: 'JI 5/25/2017 04:08:31'!
isEqualToMilimetros: someMilimetros
	^ someMilimetros = quantity ! !

!Milimetros methodsFor: 'private' stamp: 'JI 5/27/2017 15:17:32'!
substractSomeCentimetros: someCentimetros 
	^ Milimetros initializeWith: someCentimetros * 10 - quantity ! !

!Milimetros methodsFor: 'private' stamp: 'JI 5/27/2017 15:10:16'!
substractSomeMetros: someMetros
	^ Milimetros initializeWith: someMetros *1000 - quantity ! !

!Milimetros methodsFor: 'private' stamp: 'JI 5/27/2017 15:27:34'!
substractSomeMilimetros: someMilimetros
	^ Milimetros initializeWith: someMilimetros - quantity ! !


!Milimetros methodsFor: 'operating' stamp: 'JI 5/25/2017 19:22:38'!
+ someDistance 
	^ someDistance addMilimetros: quantity ! !

!Milimetros methodsFor: 'operating' stamp: 'JI 5/27/2017 15:24:53'!
- someDistance 
	^ someDistance substractSomeMilimetros: quantity ! !


!Milimetros methodsFor: 'comparing' stamp: 'JI 5/25/2017 03:44:08'!
= anotherDistance 
	^anotherDistance isEqualToMilimetros: quantity ! !


!Milimetros methodsFor: 'as yet unclassified' stamp: 'JI 5/28/2017 15:54:42'!
* aSmallInteger 
	^ Milimetros initializeWith: quantity * aSmallInteger ! !

!Milimetros methodsFor: 'as yet unclassified' stamp: 'JI 5/28/2017 15:46:08'!
/ aSmallInteger 
	^ Milimetros initializeWith: quantity / aSmallInteger ! !

!Milimetros methodsFor: 'as yet unclassified' stamp: 'JI 5/28/2017 17:28:27'!
< someDistance 
	^ someDistance isNotLessThanMilimetros: quantity ! !

!Milimetros methodsFor: 'as yet unclassified' stamp: 'JI 5/28/2017 17:27:56'!
isNotLessThanCentimetros: aSmallInteger 
	^ (quantity   < (aSmallInteger*10) ) not! !

!Milimetros methodsFor: 'as yet unclassified' stamp: 'JI 5/28/2017 17:19:39'!
isNotLessThanMetros: someMetros
	^ (quantity < (someMetros*1000) ) not! !

!Milimetros methodsFor: 'as yet unclassified' stamp: 'JI 5/28/2017 17:29:40'!
isNotLessThanMilimetros: aSmallInteger 
	^ (quantity  < aSmallInteger ) not! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Milimetros class' category: #'Distance-Solution'!
Milimetros class
	instanceVariableNames: ''!

!Milimetros class methodsFor: 'class initialization' stamp: 'jak 5/20/2017 18:25:03'!
initializeWith: anInteger 
	^self new initializeWith: anInteger.! !
