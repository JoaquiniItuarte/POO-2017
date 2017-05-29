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

!DistanceTest methodsFor: 'tests' stamp: 'jak 5/28/2017 18:03:50'!
test07_SomeMetrosPlusSomeDistanceAddsRight
	
	| aMeterAndAHalf twoMeters threeAndAHalf twentyCentimeters aHundredAndSeventyCentimeters thousandMilimeters aHundredOne |
	aMeterAndAHalf := Metro initializeWith: 1.5.
	twoMeters := Metro initializeWith: 2.
	threeAndAHalf _ Metro initializeWith: 3.5.
	twentyCentimeters := Centimetro initializeWith: 20.
	aHundredAndSeventyCentimeters _ Centimetro initializeWith: 170.
	aHundredOne := Milimetros initializeWith: 101.
	thousandMilimeters _ Milimetros initializeWith: 1601.
	
	self assert: aMeterAndAHalf + twoMeters = threeAndAHalf .
	self assert: aMeterAndAHalf + twentyCentimeters = aHundredAndSeventyCentimeters .
	self assert: aMeterAndAHalf + aHundredOne = thousandMilimeters ! !

!DistanceTest methodsFor: 'tests' stamp: 'jak 5/28/2017 18:03:59'!
test08_SomeCentimetrosPlusSomeDistanceAddsRight
	
	| fourMeters twentyThreeCentimeterAndHalf fourHundredTwentyThreeCentimetrosAndHalf thirtyCentimetros sixAndHalfCentimeter sixHundredSixtySixMilimetros fourHundredThirtyOneMilimeters |
	fourMeters := Metro initializeWith: 4.
	twentyThreeCentimeterAndHalf := Centimetro initializeWith: 23.5.
	fourHundredTwentyThreeCentimetrosAndHalf _ Centimetro initializeWith: 423.5.
	thirtyCentimetros _ Centimetro initializeWith: 30.
	sixAndHalfCentimeter _ Centimetro initializeWith: 6.5.
	sixHundredSixtySixMilimetros _ Milimetros initializeWith: 666.
	fourHundredThirtyOneMilimeters := Milimetros initializeWith: 431.
	
	self assert: twentyThreeCentimeterAndHalf + fourMeters = fourHundredTwentyThreeCentimetrosAndHalf .
	self assert: twentyThreeCentimeterAndHalf + sixAndHalfCentimeter = thirtyCentimetros .
	self assert: twentyThreeCentimeterAndHalf + fourHundredThirtyOneMilimeters = sixHundredSixtySixMilimetros ! !

!DistanceTest methodsFor: 'tests' stamp: 'jak 5/28/2017 18:04:07'!
test09_SomeMilimetrosPlusSomeDistanceAddsRight
	
	|  someMilimetros someMetros fourThousandsTwentyMilimetros a11122Milimetros anotherSomeMilimetros fourThousandsThirtyMilimetros someCentimetros |
	someMilimetros := Milimetros initializeWith: 1020.
	someMetros := Metro initializeWith: 3.
	fourThousandsTwentyMilimetros _ Milimetros initializeWith: 4020.
	
	someCentimetros := Centimetro initializeWith: 301.
	fourThousandsThirtyMilimetros _ Milimetros initializeWith: 4030.
	
	anotherSomeMilimetros := Milimetros initializeWith: 10102.
	a11122Milimetros _ Milimetros initializeWith: 11122.
	
	self assert: someMilimetros + someMetros = fourThousandsTwentyMilimetros .
	self assert: someMilimetros + someCentimetros = fourThousandsThirtyMilimetros .
	self assert: someMilimetros + anotherSomeMilimetros = a11122Milimetros! !

!DistanceTest methodsFor: 'tests' stamp: 'jak 5/28/2017 18:04:15'!
test10_SomeMetrosMinusSomeDistanceSubstractRight
	
	|  someMetros anotherSomeMetros zeroMeters anotherSomeCentimetros centimeters3985 anotherSomeMilimetros milimeters569 |
	
	someMetros := Metro initializeWith: 1.
	anotherSomeMetros := Metro initializeWith: 1.
	zeroMeters _ Metro initializeWith: 0.
	
	anotherSomeCentimetros := Centimetro initializeWith: 15.
	centimeters3985 := Centimetro initializeWith: 85.
	
	anotherSomeMilimetros := Milimetros initializeWith: 431.
	milimeters569 _ Milimetros initializeWith: 569.
	
	self assert: someMetros - anotherSomeMetros = zeroMeters .
	self assert: someMetros - anotherSomeCentimetros = centimeters3985 .
	self assert: someMetros - anotherSomeMilimetros = milimeters569! !

!DistanceTest methodsFor: 'tests' stamp: 'jak 5/28/2017 18:04:23'!
test11_SomeCentimetrosMinusSomeDistanceSubstractRight
	
	|  someCentimetros someMetros theResult anotherSomeCentimetros centimeter67 milimeters500 someMilimetros |
	
	someCentimetros := Centimetro initializeWith: 90.
	someMetros := Metro initializeWith: 0.5.
	theResult _ Centimetro initializeWith: 40.
	
	anotherSomeCentimetros := Centimetro initializeWith: 23.
	centimeter67 _ Centimetro initializeWith: 67.
	
	someMilimetros := Milimetros initializeWith: 400.

	milimeters500 _ Milimetros initializeWith: 500.
	
	self assert: someCentimetros - someMetros = theResult .
	self assert: someCentimetros - anotherSomeCentimetros = centimeter67 .
	self assert: someCentimetros - someMilimetros = milimeters500 ! !

!DistanceTest methodsFor: 'tests' stamp: 'jak 5/28/2017 18:04:32'!
test12_SomeMilimetrosMinusSomeDistanceSubstractRight
	
	|  someMilimetros someMetros milimeters900 milimeters490 someCentimetros anotherSomeMilimetros milimeters949 |
	
	someMilimetros := Milimetros initializeWith: 1000.
	someMetros := Metro initializeWith: 0.1.
	milimeters900 _ Milimetros initializeWith: 900.
	
	someCentimetros := Centimetro initializeWith: 51.
	milimeters490 _ Milimetros initializeWith: 490.
	
	anotherSomeMilimetros := Milimetros initializeWith: 51.
	milimeters949 _ Milimetros initializeWith: 949.
	
	self assert: someMilimetros - someMetros = milimeters900 .
	self assert: someMilimetros - someCentimetros = milimeters490 .
	self assert: someMilimetros - anotherSomeMilimetros = milimeters949! !

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

!DistanceTest methodsFor: 'tests' stamp: 'jak 5/28/2017 19:30:15'!
test43_Multiply
		
	self assert: (oneMilimetro * 1) =  (1 * oneMilimetro) . ! !


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

!DistanceUnits methodsFor: 'comparing' stamp: 'JI 5/28/2017 16:19:58'!
< someDistance 
	^ self subclassResponsibility ! !

!DistanceUnits methodsFor: 'comparing' stamp: 'JI 5/25/2017 03:20:42'!
= anotherDistance
	^self subclassResponsibility.
	! !


!DistanceUnits methodsFor: 'conversion' stamp: 'jak 5/28/2017 20:23:31'!
asCentimetros
	self subclassResponsibility ! !

!DistanceUnits methodsFor: 'conversion' stamp: 'jak 5/28/2017 20:23:21'!
asMetros
	self subclassResponsibility ! !

!DistanceUnits methodsFor: 'conversion' stamp: 'jak 5/28/2017 20:23:39'!
asMilimetros
	self subclassResponsibility ! !


!DistanceUnits methodsFor: 'operating' stamp: 'JI 5/28/2017 15:53:03'!
* aSmallInteger 
	^ self subclassResponsibility ! !

!DistanceUnits methodsFor: 'operating' stamp: 'JI 5/25/2017 19:21:11'!
+ anotherDistance
	^ self subclassResponsibility ! !

!DistanceUnits methodsFor: 'operating' stamp: 'JI 5/27/2017 15:01:56'!
- aMetro 
	^self subclassResponsibility ! !

!DistanceUnits methodsFor: 'operating' stamp: 'JI 5/28/2017 15:45:06'!
/ aSmallInteger 
	^ self subclassResponsibility ! !

!DistanceUnits methodsFor: 'operating' stamp: 'jak 5/28/2017 19:29:51'!
adaptToNumber: aNumber andSend: selector 
	^self perform: selector with: aNumber.! !

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


!Centimetro methodsFor: 'operating' stamp: 'jak 5/28/2017 20:27:42'!
* aSmallInteger 
	^ self class initializeWith: quantity * aSmallInteger ! !

!Centimetro methodsFor: 'operating' stamp: 'jak 5/28/2017 20:49:14'!
+ someDistance

	^ self class initializeWith: (quantity + someDistance asCentimetros )! !

!Centimetro methodsFor: 'operating' stamp: 'jak 5/28/2017 20:28:02'!
- someDistance
	^ self class initializeWith: (quantity - someDistance asCentimetros )! !

!Centimetro methodsFor: 'operating' stamp: 'jak 5/28/2017 20:28:31'!
/ aSmallInteger 
	^ self class initializeWith: quantity / aSmallInteger ! !


!Centimetro methodsFor: 'comparing' stamp: 'jak 5/28/2017 20:28:57'!
< someDistance
	^ quantity < (someDistance asCentimetros )! !

!Centimetro methodsFor: 'comparing' stamp: 'jak 5/28/2017 21:02:19'!
= anotherDistance

	^ quantity closeTo: (anotherDistance asCentimetros )! !


!Centimetro methodsFor: 'conversion' stamp: 'jak 5/28/2017 20:35:47'!
asCentimetros
	^quantity! !

!Centimetro methodsFor: 'conversion' stamp: 'jak 5/28/2017 20:34:18'!
asMetros
	^quantity *0.01! !

!Centimetro methodsFor: 'conversion' stamp: 'jak 5/28/2017 20:34:31'!
asMilimetros
	^quantity *10! !

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


!Metro methodsFor: 'operating' stamp: 'jak 5/28/2017 20:29:42'!
* aSmallInteger 
	^ self class initializeWith: quantity * aSmallInteger ! !

!Metro methodsFor: 'operating' stamp: 'jak 5/28/2017 20:29:54'!
+ someDistance
	
	^ self class initializeWith: (quantity + someDistance asMetros )! !

!Metro methodsFor: 'operating' stamp: 'jak 5/28/2017 20:30:07'!
- someDistance 
	
	^ self class initializeWith: (quantity - someDistance asMetros )! !

!Metro methodsFor: 'operating' stamp: 'jak 5/28/2017 20:30:15'!
/ aSmallInteger 
	^ self class initializeWith: quantity / aSmallInteger ! !


!Metro methodsFor: 'comparing' stamp: 'jak 5/28/2017 20:30:29'!
< someDistance
	^ quantity < (someDistance asMetros )! !

!Metro methodsFor: 'comparing' stamp: 'jak 5/28/2017 21:02:34'!
= anotherDistance
	^quantity closeTo:(anotherDistance asMetros ).! !


!Metro methodsFor: 'conversion' stamp: 'jak 5/28/2017 20:35:29'!
asCentimetros
	^quantity * 100! !

!Metro methodsFor: 'conversion' stamp: 'jak 5/28/2017 20:35:39'!
asMetros
	^quantity! !

!Metro methodsFor: 'conversion' stamp: 'jak 5/28/2017 20:36:00'!
asMilimetros
	^quantity*1000! !

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


!Milimetros methodsFor: 'operating' stamp: 'jak 5/28/2017 20:31:27'!
* aMultiplier 
	^ self class initializeWith: quantity * aMultiplier ! !

!Milimetros methodsFor: 'operating' stamp: 'jak 5/28/2017 20:31:46'!
+ someDistance 
	^ self class initializeWith: (quantity + someDistance asMilimetros )! !

!Milimetros methodsFor: 'operating' stamp: 'jak 5/28/2017 20:32:02'!
- someDistance 
	^ self class initializeWith: (quantity - someDistance asMilimetros )! !

!Milimetros methodsFor: 'operating' stamp: 'jak 5/28/2017 20:32:11'!
/ aSmallInteger 
	^ self class initializeWith: quantity / aSmallInteger ! !


!Milimetros methodsFor: 'comparing' stamp: 'jak 5/28/2017 20:32:24'!
< someDistance 
	^ quantity < (someDistance asMilimetros ) ! !

!Milimetros methodsFor: 'comparing' stamp: 'jak 5/28/2017 21:02:41'!
= anotherDistance 
	^ quantity closeTo: (anotherDistance asMilimetros )! !


!Milimetros methodsFor: 'conversion' stamp: 'jak 5/28/2017 20:44:48'!
asCentimetros
	^(quantity * 0.1)! !

!Milimetros methodsFor: 'conversion' stamp: 'jak 5/28/2017 20:36:35'!
asMetros
	^quantity * 0.001! !

!Milimetros methodsFor: 'conversion' stamp: 'jak 5/28/2017 20:36:44'!
asMilimetros
	^quantity! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Milimetros class' category: #'Distance-Solution'!
Milimetros class
	instanceVariableNames: ''!

!Milimetros class methodsFor: 'class initialization' stamp: 'jak 5/20/2017 18:25:03'!
initializeWith: anInteger 
	^self new initializeWith: anInteger.! !
