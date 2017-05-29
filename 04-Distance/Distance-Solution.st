!classDefinition: #DistanceTest category: #'Distance-Solution'!
TestCase subclass: #DistanceTest
	instanceVariableNames: 'unMetro distanceFactory milMilimetros unCentimetro oneMilimetro threeMetros fourMetros fiveMetros threeHundredOneCentimetros fourHundredOneCentimetros fiveHundredOneCentimetros threeThousandMilimetros fourThousandMilimetros fiveThousandMilimetros threeHundredCentimetros twoThousandMilimetros cienCentimetros'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!DistanceTest methodsFor: 'equality between distances' stamp: 'JAK 5/29/2017 09:26:47'!
test01_MeterIsEqualToAnotherDistance
	self assert: unMetro = distanceFactory oneMeter.
	self assert: unMetro = cienCentimetros .
	self assert: unMetro = milMilimetros.! !

!DistanceTest methodsFor: 'equality between distances' stamp: 'JAK 5/29/2017 09:25:25'!
test02_MilimitersIsEquealToAnotherDistance
	self assert: milMilimetros = (Milimetros initializeWith: 1000).
	self assert: milMilimetros = cienCentimetros.
	self assert: milMilimetros = unMetro .! !

!DistanceTest methodsFor: 'equality between distances' stamp: 'JAK 5/29/2017 09:28:03'!
test03_CentimetroIsEqualToAnotherDistance
	self assert: unCentimetro = distanceFactory oneCentimeter .
	self assert: unCentimetro = (Milimetros initializeWith: 10).
	self assert: unCentimetro = (Metro initializeWith: 0.01).! !


!DistanceTest methodsFor: 'comparing between distances' stamp: 'JAK 5/29/2017 09:55:55'!
test01_MetroLessThanDistance
	
	|  fourMetros fiveMetros fourThousandOneMilimetros |
	
	fourMetros := Metro initializeWith: 4.

	fiveMetros _ Metro initializeWith: 5.
	
	fourHundredOneCentimetros _ Centimetro initializeWith: 401.
	fourThousandOneMilimetros _ Milimetros initializeWith: 4001.
	
	self assert: fourMetros < fiveMetros. 
	self deny: fiveMetros < fourMetros .
	
	self assert: fourMetros < fourHundredOneCentimetros. 
	self deny: fiveMetros < fourHundredOneCentimetros .
	
	self assert: fourMetros < fourThousandOneMilimetros. 
	self deny: fiveMetros < fourThousandOneMilimetros .! !

!DistanceTest methodsFor: 'comparing between distances' stamp: 'JAK 5/29/2017 09:57:26'!
test02_CentimetroLessThanDistance
	
	|  fourMetros fourHundredOneCentimetros fiveMetros  |
	
	fourMetros := Metro initializeWith: 4.
	fiveMetros _ Metro initializeWith: 5.

	fourHundredOneCentimetros _ Centimetro initializeWith: 401.
	threeHundredOneCentimetros _ Centimetro initializeWith: 301.
	fiveHundredOneCentimetros _ Centimetro initializeWith: 501.
	
	self deny: fourHundredOneCentimetros < fourMetros. 
	self assert: fourHundredOneCentimetros < fiveMetros .
	
	self deny: fourHundredOneCentimetros < threeHundredOneCentimetros. 
	self assert: fourHundredOneCentimetros < fiveHundredOneCentimetros .
	
	self assert: fourHundredOneCentimetros < fiveThousandMilimetros . 
	self deny:  fiveHundredOneCentimetros < fourThousandMilimetros .! !

!DistanceTest methodsFor: 'comparing between distances' stamp: 'JAK 5/29/2017 09:58:10'!
test03_MilimetroLessThanDistance
	
	self assert: fourThousandMilimetros <  fiveMetros . 
	self deny:  fourThousandMilimetros < threeMetros .
	
	self assert: fourThousandMilimetros <  fiveHundredOneCentimetros . 
	self deny:  fiveThousandMilimetros < threeHundredOneCentimetros .
	
	self assert: fourThousandMilimetros <  fiveThousandMilimetros . 
	self deny:  fiveThousandMilimetros < fourThousandMilimetros .! !

!DistanceTest methodsFor: 'comparing between distances' stamp: 'JAK 5/29/2017 09:58:32'!
test04_LessOrEqualWorksRightForAllDistances
	
	self assert: threeMetros <= (Metro initializeWith: 3) .
	self assert: threeMetros <= fourMetros .
	self deny: fourMetros <= threeMetros .
	self assert: threeMetros <= fourHundredOneCentimetros.
	self assert: threeMetros <= threeHundredCentimetros.
	self deny: fourMetros <= threeHundredOneCentimetros .
	self assert: threeMetros <= fourThousandMilimetros .
	self assert: threeMetros <= (Milimetros initializeWith: 3000) .
	self deny: fourMetros <= threeThousandMilimetros .
	
	self assert: threeHundredCentimetros <= (Metro initializeWith: 3) .
	self assert: threeHundredCentimetros <= fourMetros .
	self deny: fourHundredOneCentimetros <= threeMetros .
	self assert: threeHundredCentimetros <= fourHundredOneCentimetros.
	self assert: threeHundredCentimetros <= (Centimetro initializeWith: 300) .
	self deny: fourHundredOneCentimetros <= threeHundredOneCentimetros .
	self assert: threeHundredCentimetros <= fourThousandMilimetros .
	self assert: threeHundredCentimetros <=  threeThousandMilimetros .
	self deny: threeHundredCentimetros <= twoThousandMilimetros .
	
	self assert: threeThousandMilimetros <= (Metro initializeWith: 3) .
	self assert: threeThousandMilimetros <= fourMetros .
	self deny: fourThousandMilimetros <= threeMetros .
	self assert: threeThousandMilimetros <= fourHundredOneCentimetros.
	self assert: threeThousandMilimetros <= (Centimetro initializeWith: 300) .
	self deny: fourThousandMilimetros <= threeHundredOneCentimetros .
	self assert: threeThousandMilimetros <= fourThousandMilimetros .
	self assert: threeThousandMilimetros <= threeThousandMilimetros .
	self deny: fourThousandMilimetros <= threeThousandMilimetros .
	
	! !

!DistanceTest methodsFor: 'comparing between distances' stamp: 'JAK 5/29/2017 09:58:39'!
test05_GreaterWorksRightForAllDistances
	
	self deny: threeMetros > (Metro initializeWith: 3) .
	self deny: threeMetros > fourMetros .
	self assert: fourMetros > threeMetros .
	self deny: threeMetros > fourHundredOneCentimetros.
	self deny: threeMetros > threeHundredCentimetros.
	self assert: fourMetros > threeHundredOneCentimetros .
	self deny: threeMetros > fourThousandMilimetros .
	self deny: threeMetros > (Milimetros initializeWith: 3000) .
	self assert: fourMetros > threeThousandMilimetros .
	
	self deny: threeHundredCentimetros > (Metro initializeWith: 3) .
	self deny: threeHundredCentimetros > fourMetros .
	self assert: fourHundredOneCentimetros > threeMetros .
	self deny: threeHundredCentimetros > fourHundredOneCentimetros.
	self deny: threeHundredCentimetros > (Centimetro initializeWith: 300) .
	self assert: fourHundredOneCentimetros > threeHundredOneCentimetros .
	self deny: threeHundredCentimetros > fourThousandMilimetros .
	self deny: threeHundredCentimetros >  threeThousandMilimetros .
	self assert: threeHundredCentimetros > twoThousandMilimetros .
	
	self deny: threeThousandMilimetros > (Metro initializeWith: 3) .
	self deny: threeThousandMilimetros > fourMetros .
	self assert: fourThousandMilimetros > threeMetros .
	self deny: threeThousandMilimetros > fourHundredOneCentimetros.
	self deny: threeThousandMilimetros > (Centimetro initializeWith: 300) .
	self assert: fourThousandMilimetros > threeHundredOneCentimetros .
	self deny: threeThousandMilimetros > fourThousandMilimetros .
	self deny: threeThousandMilimetros > threeThousandMilimetros .
	self assert: fourThousandMilimetros > threeThousandMilimetros .
	
	! !

!DistanceTest methodsFor: 'comparing between distances' stamp: 'JAK 5/29/2017 09:58:45'!
test06_GreaterOrEqualWorksRightForAllDistances
	
	self assert: threeMetros >= (Metro initializeWith: 3) .
	self deny: threeMetros >= fourMetros .
	self assert: fourMetros >= threeMetros .
	self deny: threeMetros >= fourHundredOneCentimetros.
	self assert: threeMetros >= threeHundredCentimetros.
	self assert: fourMetros >= threeHundredOneCentimetros .
	self deny: threeMetros >= fourThousandMilimetros .
	self assert: threeMetros >= (Milimetros initializeWith: 3000) .
	self assert: fourMetros >= threeThousandMilimetros .
	
	self assert: threeHundredCentimetros >= (Metro initializeWith: 3) .
	self deny: threeHundredCentimetros >= fourMetros .
	self assert: fourHundredOneCentimetros >= threeMetros .
	self deny: threeHundredCentimetros >= fourHundredOneCentimetros.
	self assert: threeHundredCentimetros >= (Centimetro initializeWith: 300) .
	self assert: fourHundredOneCentimetros >= threeHundredOneCentimetros .
	self deny: threeHundredCentimetros >= fourThousandMilimetros .
	self assert: threeHundredCentimetros >=  threeThousandMilimetros .
	self assert: threeHundredCentimetros >= twoThousandMilimetros .
	
	self assert: threeThousandMilimetros >= (Metro initializeWith: 3) .
	self deny: threeThousandMilimetros >= fourMetros .
	self assert: fourThousandMilimetros >= threeMetros .
	self deny: threeThousandMilimetros >= fourHundredOneCentimetros.
	self assert: threeThousandMilimetros >= (Centimetro initializeWith: 300) .
	self assert: fourThousandMilimetros >= threeHundredOneCentimetros .
	self deny: threeThousandMilimetros >= fourThousandMilimetros .
	self assert: threeThousandMilimetros >= threeThousandMilimetros .
	self assert: fourThousandMilimetros >= threeThousandMilimetros .
	
	! !


!DistanceTest methodsFor: 'operating with distances' stamp: 'JAK 5/29/2017 09:59:10'!
test01_SomeMetrosPlusSomeDistanceAddsRight
	
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
	self assert: aMeterAndAHalf + aHundredOne = thousandMilimeters! !

!DistanceTest methodsFor: 'operating with distances' stamp: 'JAK 5/29/2017 09:59:17'!
test02_SomeCentimetrosPlusSomeDistanceAddsRight
	
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
	self assert: twentyThreeCentimeterAndHalf + fourHundredThirtyOneMilimeters = sixHundredSixtySixMilimetros! !

!DistanceTest methodsFor: 'operating with distances' stamp: 'JAK 5/29/2017 09:59:23'!
test03_SomeMilimetrosPlusSomeDistanceAddsRight
	
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

!DistanceTest methodsFor: 'operating with distances' stamp: 'JAK 5/29/2017 09:59:31'!
test04_SomeMetrosMinusSomeDistanceSubstractRight
	
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

!DistanceTest methodsFor: 'operating with distances' stamp: 'JAK 5/29/2017 09:59:42'!
test05_SomeCentimetrosMinusSomeDistanceSubstractRight
	
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
	self assert: someCentimetros - someMilimetros = milimeters500! !

!DistanceTest methodsFor: 'operating with distances' stamp: 'JAK 5/29/2017 09:59:55'!
test06_SomeMilimetrosMinusSomeDistanceSubstractRight
	
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

!DistanceTest methodsFor: 'operating with distances' stamp: 'JAK 5/29/2017 10:02:52'!
test07_SomeDistanceDividedByANumber
	
	|  someMetros theResultMetros someCentimetros theResultCentimetros someMilimetros theResultMilimetros |
	
	someMetros := Metro initializeWith: 1.
	theResultMetros _ Metro initializeWith: 1/2.
	
	someCentimetros := Centimetro initializeWith: 66.
	theResultCentimetros _ Centimetro initializeWith: 22.
	
	someMilimetros := Milimetros initializeWith: 15.
	theResultMilimetros _ Milimetros initializeWith: 3.
	
	self assert: someMetros / 2 = theResultMetros.
	self assert: someCentimetros / 3 = theResultCentimetros .
	self assert: someMilimetros / 5 = theResultMilimetros.! !

!DistanceTest methodsFor: 'operating with distances' stamp: 'JAK 5/29/2017 10:04:25'!
test08_SomeDistanceMultipliedByANumber
	
	|  someMetros theResultMetros someCentimetros theResultCentimetros someMilimetros theResultMilimetros |
	
	someMetros := Metro initializeWith: 1.
	theResultMetros _ Metro initializeWith: 2.
	
	someCentimetros := Centimetro initializeWith: 66.
	theResultCentimetros _ Centimetro initializeWith: 198.
	
	someMilimetros := Milimetros initializeWith: 15.
	theResultMilimetros _ Milimetros initializeWith: 60.
	
	self assert: someMetros * 2 = theResultMetros.
	self assert: someCentimetros * 3 = theResultCentimetros.
	self assert: someMilimetros * 4 = theResultMilimetros! !

!DistanceTest methodsFor: 'operating with distances' stamp: 'JAK 5/29/2017 10:06:18'!
test09_ANumberMultipliedBySomeDistance
	
	|  someMetros theResultMetros someCentimetros theResultCentimetros someMilimetros theResultMilimetros |
	
	someMetros := Metro initializeWith: 1.
	theResultMetros _ Metro initializeWith: 2.
	
	someCentimetros := Centimetro initializeWith: 66.
	theResultCentimetros _ Centimetro initializeWith: 198.
	
	someMilimetros := Milimetros initializeWith: 15.
	theResultMilimetros _ Milimetros initializeWith: 60.
	
	self assert: 2 * someMetros  = theResultMetros.
	self assert:  3 * someCentimetros  = theResultCentimetros.
	self assert: 4 * someMilimetros = theResultMilimetros! !

!DistanceTest methodsFor: 'operating with distances' stamp: 'JAK 5/29/2017 10:06:41'!
test10_ANumberMultipliesADistanceRight
	
	self assert: threeMetros * 2 = (2* threeMetros) .
	self assert: threeHundredOneCentimetros *4 = (4*threeHundredOneCentimetros) .
	self assert: oneMilimetro * 1 =  (1 * oneMilimetro)! !


!DistanceTest methodsFor: 'initial' stamp: 'JAK 5/29/2017 09:25:34'!
setUp
	distanceFactory := DistanceFactory new.
	unMetro := distanceFactory oneMeter.
	unCentimetro := distanceFactory oneCentimeter.
	oneMilimetro := distanceFactory oneMilimeter.
	cienCentimetros := Centimetro initializeWith: 100.
	milMilimetros := Milimetros initializeWith: 1000.
	
	
	threeMetros _ Metro initializeWith: 3.
	fourMetros _ Metro initializeWith: 4.
	fiveMetros _ Metro initializeWith: 5.
	
	threeHundredCentimetros _ Centimetro initializeWith: 300.
	threeHundredOneCentimetros _ Centimetro initializeWith: 301.
	fourHundredOneCentimetros _ Centimetro initializeWith: 401.
	fiveHundredOneCentimetros _ Centimetro initializeWith: 501.
	
	twoThousandMilimetros _ Milimetros initializeWith: 2000.
	threeThousandMilimetros _ Milimetros initializeWith: 3000.
	fourThousandMilimetros _ Milimetros initializeWith: 4000.
	fiveThousandMilimetros _ Milimetros initializeWith: 5000.
	! !


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

!DistanceUnits methodsFor: 'comparing' stamp: 'JI 5/29/2017 00:42:16'!
<= aDistance
	^self subclassResponsibility ! !

!DistanceUnits methodsFor: 'comparing' stamp: 'JI 5/25/2017 03:20:42'!
= anotherDistance
	^self subclassResponsibility.
	! !

!DistanceUnits methodsFor: 'comparing' stamp: 'JI 5/29/2017 00:50:21'!
> aDistance
	^self subclassResponsibility ! !

!DistanceUnits methodsFor: 'comparing' stamp: 'JI 5/29/2017 01:05:51'!
>= aMetro 
	^self subclassResponsibility ! !


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


!DistanceUnits methodsFor: 'conversion' stamp: 'jak 5/28/2017 20:23:31'!
asCentimetros
	self subclassResponsibility ! !

!DistanceUnits methodsFor: 'conversion' stamp: 'jak 5/28/2017 20:23:21'!
asMetros
	self subclassResponsibility ! !

!DistanceUnits methodsFor: 'conversion' stamp: 'jak 5/28/2017 20:23:39'!
asMilimetros
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

!Centimetro methodsFor: 'comparing' stamp: 'JI 5/29/2017 00:43:40'!
<= aDistance 
	^ self < aDistance or: [self = aDistance]! !

!Centimetro methodsFor: 'comparing' stamp: 'jak 5/28/2017 21:02:19'!
= anotherDistance

	^ quantity closeTo: (anotherDistance asCentimetros )! !

!Centimetro methodsFor: 'comparing' stamp: 'JI 5/29/2017 00:50:59'!
> aDistance
	^ (self <= aDistance) not! !

!Centimetro methodsFor: 'comparing' stamp: 'JI 5/29/2017 01:07:04'!
>= aDistance
	^ (self < aDistance ) not! !


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

!Metro methodsFor: 'comparing' stamp: 'JI 5/29/2017 00:42:53'!
<= aDistance 
	^ self < aDistance or: [self = aDistance]! !

!Metro methodsFor: 'comparing' stamp: 'jak 5/28/2017 21:02:34'!
= anotherDistance
	^quantity closeTo:(anotherDistance asMetros ).! !

!Metro methodsFor: 'comparing' stamp: 'JI 5/29/2017 00:50:53'!
> aDistance
	^ (self <= aDistance) not! !

!Metro methodsFor: 'comparing' stamp: 'JI 5/29/2017 01:06:49'!
>= aMetro 
	^ (self < aMetro ) not! !


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

!Milimetros methodsFor: 'comparing' stamp: 'JI 5/29/2017 00:45:42'!
<= aDistance
	^ self < aDistance or: [self = aDistance ]! !

!Milimetros methodsFor: 'comparing' stamp: 'jak 5/28/2017 21:02:41'!
= anotherDistance 
	^ quantity closeTo: (anotherDistance asMilimetros )! !

!Milimetros methodsFor: 'comparing' stamp: 'JI 5/29/2017 01:02:45'!
> aDistance
	^ (self <= aDistance) not! !

!Milimetros methodsFor: 'comparing' stamp: 'JI 5/29/2017 01:07:12'!
>= aDistance
	^ (self < aDistance ) not! !


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
