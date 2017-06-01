!classDefinition: #DistanceTest category: #'Distance-Solution'!
TestCase subclass: #DistanceTest
	instanceVariableNames: 'unMetro distanceFactory milMilimetros unCentimetro oneMilimetro threeMetros fourMetros fiveMetros threeHundredOneCentimetros fiveHundredOneCentimetros threeThousandMilimetros fourThousandMilimetros fiveThousandMilimetros threeHundredCentimetros twoThousandMilimetros cienCentimetros unKilometro fourHundredOneCentimetros'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!DistanceTest methodsFor: 'equality between distances' stamp: 'JI 5/30/2017 00:59:00'!
test01_MeterIsEqualToAnotherDistance
	self assert: unMetro = distanceFactory oneMeter.
	self assert: unMetro = cienCentimetros .
	self assert: unMetro = milMilimetros.
	self assert: unMetro = (Kilometro initializeWith: 0.001)! !

!DistanceTest methodsFor: 'equality between distances' stamp: 'JI 5/30/2017 13:26:54'!
test02_MilimitersIsEquealToAnotherDistance
	self assert: milMilimetros = (Milimetros initializeWith: 1000).
	self assert: milMilimetros = cienCentimetros.
	self assert: milMilimetros = unMetro .
	self assert: milMilimetros =  (Kilometro initializeWith: 0.001)! !

!DistanceTest methodsFor: 'equality between distances' stamp: 'JI 5/30/2017 00:59:32'!
test03_CentimetroIsEqualToAnotherDistance
	self assert: unCentimetro = distanceFactory oneCentimeter .
	self assert: unCentimetro = (Milimetros initializeWith: 10).
	self assert: unCentimetro = (Metro initializeWith: 0.01).
	self assert: unCentimetro =  (Kilometro initializeWith: 0.00001)! !

!DistanceTest methodsFor: 'equality between distances' stamp: 'JI 5/30/2017 00:57:35'!
test04_KilometroIsEqualToAnotherDistance
	self assert: unKilometro = (Kilometro initializeWith: 1).
	self assert: unKilometro = (Metro initializeWith: 1000).
	self assert: unKilometro = (Centimetro initializeWith: 100000).
	self assert: unKilometro = (Milimetros initializeWith: 1000000).! !


!DistanceTest methodsFor: 'comparing between distances' stamp: 'JI 5/30/2017 13:44:32'!
test01_MetroLessThanDistanceWorksRight
	
	|  fourThousandOneMilimetros  |
	
	fourThousandOneMilimetros _ Milimetros initializeWith: 4001.
	
	self assert: fourMetros < (Kilometro initializeWith: 1).
	self deny: fourMetros < (Kilometro initializeWith: 0.001).
	
	self assert: fourMetros < fiveMetros. 
	self deny: fiveMetros < fourMetros .
	
	self assert: fourMetros < fourHundredOneCentimetros. 
	self deny: fiveMetros < fourHundredOneCentimetros .
	
	self assert: fourMetros < fourThousandOneMilimetros. 
	self deny: fiveMetros < fourThousandOneMilimetros .! !

!DistanceTest methodsFor: 'comparing between distances' stamp: 'JI 5/30/2017 13:44:14'!
test02_CentimetroLessThanDistanceWorksRight
	

	self assert: fourHundredOneCentimetros < (Kilometro initializeWith: 1).
	self deny: fourHundredOneCentimetros < (Kilometro initializeWith: 0.001).
	
	self deny: fourHundredOneCentimetros < fourMetros. 
	self assert: fourHundredOneCentimetros < fiveMetros .
	
	self deny: fourHundredOneCentimetros < threeHundredOneCentimetros. 
	self assert: fourHundredOneCentimetros < fiveHundredOneCentimetros .
	
	self assert: fourHundredOneCentimetros < fiveThousandMilimetros . 
	self deny:  fiveHundredOneCentimetros < fourThousandMilimetros .! !

!DistanceTest methodsFor: 'comparing between distances' stamp: 'JI 5/30/2017 01:02:29'!
test03_MilimetroLessThanDistance
	
	self assert: fourThousandMilimetros <  fiveMetros . 
	self deny:  fourThousandMilimetros < threeMetros .
	
	self assert: fourThousandMilimetros <  fiveHundredOneCentimetros . 
	self deny:  fiveThousandMilimetros < threeHundredOneCentimetros .
	
	self assert: fourThousandMilimetros <  fiveThousandMilimetros . 
	self deny:  fiveThousandMilimetros < fourThousandMilimetros .
	
	self assert: fourThousandMilimetros < (Kilometro initializeWith: 1).
	self deny: fourThousandMilimetros < (Kilometro initializeWith: 0.001).! !

!DistanceTest methodsFor: 'comparing between distances' stamp: 'JI 5/30/2017 02:34:17'!
test04_LessOrEqualWorksRightForAllDistances

	self assert: threeMetros <= (Kilometro initializeWith: 0.003) .
	self assert: threeMetros <= (Kilometro initializeWith: 0.004) .
	self deny: fourMetros <= (Kilometro initializeWith: 0.002) .
	self assert: threeMetros <= (Metro initializeWith: 3) .
	self assert: threeMetros <= fourMetros .
	self deny: fourMetros <= threeMetros .
	self assert: threeMetros <= fourHundredOneCentimetros.
	self assert: threeMetros <= threeHundredCentimetros.
	self deny: fourMetros <= threeHundredOneCentimetros .
	self assert: threeMetros <= fourThousandMilimetros .
	self assert: threeMetros <= (Milimetros initializeWith: 3000) .
	self deny: fourMetros <= threeThousandMilimetros .
	
	self assert: threeHundredCentimetros <= (Kilometro initializeWith: 0.003) .
	self assert: threeHundredCentimetros <= (Kilometro initializeWith: 0.004) .
	self deny: fourHundredOneCentimetros <= (Kilometro initializeWith: 0.002) .
	self assert: threeHundredCentimetros <= (Metro initializeWith: 3) .
	self assert: threeHundredCentimetros <= fourMetros .
	self deny: fourHundredOneCentimetros <= threeMetros .
	self assert: threeHundredCentimetros <= fourHundredOneCentimetros.
	self assert: threeHundredCentimetros <= (Centimetro initializeWith: 300) .
	self deny: fourHundredOneCentimetros <= threeHundredOneCentimetros .
	self assert: threeHundredCentimetros <= fourThousandMilimetros .
	self assert: threeHundredCentimetros <=  threeThousandMilimetros .
	self deny: threeHundredCentimetros <= twoThousandMilimetros .
	
	self assert: threeThousandMilimetros <= (Kilometro initializeWith: 0.003) .
	self assert: threeThousandMilimetros <= (Kilometro initializeWith: 0.004) .
	self deny: threeThousandMilimetros <= (Kilometro initializeWith: 0.002) .
	self assert: threeThousandMilimetros <= (Metro initializeWith: 3) .
	self assert: threeThousandMilimetros <= fourMetros .
	self deny: fourThousandMilimetros <= threeMetros .
	self assert: threeThousandMilimetros <= fourHundredOneCentimetros.
	self assert: threeThousandMilimetros <= (Centimetro initializeWith: 300) .
	self deny: fourThousandMilimetros <= threeHundredOneCentimetros .
	self assert: threeThousandMilimetros <= fourThousandMilimetros .
	self assert: threeThousandMilimetros <= threeThousandMilimetros .
	self deny: fourThousandMilimetros <= threeThousandMilimetros .
	
	self assert: (Kilometro initializeWith: 0.003) <= (Kilometro initializeWith: 0.003) .
	self assert: (Kilometro initializeWith: 0.003) <= (Kilometro initializeWith: 0.004) .
	self deny: (Kilometro initializeWith: 0.003) <= (Kilometro initializeWith: 0.002) .
	self assert: (Kilometro initializeWith: 0.003) <= (Metro initializeWith: 3) .
	self assert: (Kilometro initializeWith: 0.003) <= fourMetros .
	self deny: (Kilometro initializeWith: 0.004) <= threeMetros .
	self assert: (Kilometro initializeWith: 0.003) <= fourHundredOneCentimetros.
	self assert: (Kilometro initializeWith: 0.003) <= (Centimetro initializeWith: 300) .
	self deny: (Kilometro initializeWith: 0.004) <= threeHundredOneCentimetros .
	self assert: (Kilometro initializeWith: 0.003) <= fourThousandMilimetros .
	self assert: (Kilometro initializeWith: 0.003) <= threeThousandMilimetros .
	self deny: (Kilometro initializeWith: 0.004) <= threeThousandMilimetros .
	
	! !

!DistanceTest methodsFor: 'comparing between distances' stamp: 'JI 5/30/2017 02:45:15'!
test05_GreaterWorksRightForAllDistances
	
	self deny: threeMetros > (Kilometro initializeWith: 0.003).
	self deny: threeMetros > (Kilometro initializeWith: 0.004).
	self assert: fourMetros >  (Kilometro initializeWith: 0.002).
	self deny: threeMetros > (Metro initializeWith: 3) .
	self deny: threeMetros > fourMetros .
	self assert: fourMetros > threeMetros .
	self deny: threeMetros > fourHundredOneCentimetros.
	self deny: threeMetros > threeHundredCentimetros.
	self assert: fourMetros > threeHundredOneCentimetros .
	self deny: threeMetros > fourThousandMilimetros .
	self deny: threeMetros > (Milimetros initializeWith: 3000) .
	self assert: fourMetros > threeThousandMilimetros .
	
	self deny: threeHundredCentimetros > (Kilometro initializeWith: 0.003).
	self deny: threeHundredCentimetros > (Kilometro initializeWith: 0.004).
	self assert: threeHundredCentimetros >  (Kilometro initializeWith: 0.002).
	self deny: threeHundredCentimetros > (Metro initializeWith: 3) .
	self deny: threeHundredCentimetros > fourMetros .
	self assert: fourHundredOneCentimetros > threeMetros .
	self deny: threeHundredCentimetros > fourHundredOneCentimetros.
	self deny: threeHundredCentimetros > (Centimetro initializeWith: 300) .
	self assert: fourHundredOneCentimetros > threeHundredOneCentimetros .
	self deny: threeHundredCentimetros > fourThousandMilimetros .
	self deny: threeHundredCentimetros >  threeThousandMilimetros .
	self assert: threeHundredCentimetros > twoThousandMilimetros .
	
	self deny: threeThousandMilimetros > (Kilometro initializeWith: 0.003).
	self deny: threeThousandMilimetros > (Kilometro initializeWith: 0.004).
	self assert: threeThousandMilimetros >  (Kilometro initializeWith: 0.002).
	self deny: threeThousandMilimetros > (Metro initializeWith: 3) .
	self deny: threeThousandMilimetros > fourMetros .
	self assert: fourThousandMilimetros > threeMetros .
	self deny: threeThousandMilimetros > fourHundredOneCentimetros.
	self deny: threeThousandMilimetros > (Centimetro initializeWith: 300) .
	self assert: fourThousandMilimetros > threeHundredOneCentimetros .
	self deny: threeThousandMilimetros > fourThousandMilimetros .
	self deny: threeThousandMilimetros > threeThousandMilimetros .
	self assert: fourThousandMilimetros > threeThousandMilimetros .
	
	self deny: (Kilometro initializeWith: 0.003) > (Kilometro initializeWith: 0.003) .
	self deny: (Kilometro initializeWith: 0.003) > (Kilometro initializeWith: 0.004) .
	self assert: (Kilometro initializeWith: 0.003) > (Kilometro initializeWith: 0.002) .
	self deny: (Kilometro initializeWith: 0.003) > (Metro initializeWith: 3) .
	self deny: (Kilometro initializeWith: 0.003) > fourMetros .
	self assert: (Kilometro initializeWith: 0.004) > threeMetros .
	self deny: (Kilometro initializeWith: 0.003) > fourHundredOneCentimetros.
	self deny: (Kilometro initializeWith: 0.003) > (Centimetro initializeWith: 300) .
	self assert: (Kilometro initializeWith: 0.004) > threeHundredOneCentimetros .
	self deny: (Kilometro initializeWith: 0.003) > fourThousandMilimetros .
	self deny: (Kilometro initializeWith: 0.003) > threeThousandMilimetros .
	self assert: (Kilometro initializeWith: 0.004) > threeThousandMilimetros .
	
	! !

!DistanceTest methodsFor: 'comparing between distances' stamp: 'JI 5/30/2017 02:39:15'!
test06_GreaterOrEqualWorksRightForAllDistances
	
	self assert: threeMetros >= (Kilometro initializeWith: 0.003).
	self deny: threeMetros >= (Kilometro initializeWith: 0.004). .
	self assert: fourMetros >= (Kilometro initializeWith: 0.003).
	self assert: threeMetros >= (Metro initializeWith: 3) .
	self deny: threeMetros >= fourMetros .
	self assert: fourMetros >= threeMetros .
	self deny: threeMetros >= fourHundredOneCentimetros.
	self assert: threeMetros >= threeHundredCentimetros.
	self assert: fourMetros >= threeHundredOneCentimetros .
	self deny: threeMetros >= fourThousandMilimetros .
	self assert: threeMetros >= (Milimetros initializeWith: 3000) .
	self assert: fourMetros >= threeThousandMilimetros .
	
	self assert: threeHundredCentimetros >= (Kilometro initializeWith: 0.003).
	self deny: threeHundredCentimetros >= (Kilometro initializeWith: 0.004). .
	self assert: fourHundredOneCentimetros >= (Kilometro initializeWith: 0.003).
	self assert: threeHundredCentimetros >= (Metro initializeWith: 3) .
	self deny: threeHundredCentimetros >= fourMetros .
	self assert: fourHundredOneCentimetros >= threeMetros .
	self deny: threeHundredCentimetros >= fourHundredOneCentimetros.
	self assert: threeHundredCentimetros >= (Centimetro initializeWith: 300) .
	self assert: fourHundredOneCentimetros >= threeHundredOneCentimetros .
	self deny: threeHundredCentimetros >= fourThousandMilimetros .
	self assert: threeHundredCentimetros >=  threeThousandMilimetros .
	self assert: threeHundredCentimetros >= twoThousandMilimetros .
	
	self assert: threeThousandMilimetros >= (Kilometro initializeWith: 0.003).
	self deny: threeThousandMilimetros >= (Kilometro initializeWith: 0.004). .
	self assert: fourThousandMilimetros >= (Kilometro initializeWith: 0.003).
	self assert: threeThousandMilimetros >= (Metro initializeWith: 3) .
	self deny: threeThousandMilimetros >= fourMetros .
	self assert: fourThousandMilimetros >= threeMetros .
	self deny: threeThousandMilimetros >= fourHundredOneCentimetros.
	self assert: threeThousandMilimetros >= (Centimetro initializeWith: 300) .
	self assert: fourThousandMilimetros >= threeHundredOneCentimetros .
	self deny: threeThousandMilimetros >= fourThousandMilimetros .
	self assert: threeThousandMilimetros >= threeThousandMilimetros .
	self assert: fourThousandMilimetros >= threeThousandMilimetros .
	
	self assert: (Kilometro initializeWith: 0.003) >= (Kilometro initializeWith: 0.003) .
	self deny: (Kilometro initializeWith: 0.003) >= (Kilometro initializeWith: 0.004) .
	self assert: (Kilometro initializeWith: 0.003) >= (Kilometro initializeWith: 0.002) .
	self assert: (Kilometro initializeWith: 0.003) >= (Metro initializeWith: 3) .
	self deny: (Kilometro initializeWith: 0.003) >= fourMetros .
	self assert: (Kilometro initializeWith: 0.004) >= threeMetros .
	self deny: (Kilometro initializeWith: 0.003) >= fourHundredOneCentimetros.
	self assert: (Kilometro initializeWith: 0.003) >= (Centimetro initializeWith: 300) .
	self assert: (Kilometro initializeWith: 0.004) >= threeHundredOneCentimetros .
	self deny: (Kilometro initializeWith: 0.003) >= fourThousandMilimetros .
	self assert: (Kilometro initializeWith: 0.003) >= threeThousandMilimetros .
	self assert: (Kilometro initializeWith: 0.004) >= threeThousandMilimetros .
	
	! !

!DistanceTest methodsFor: 'comparing between distances' stamp: 'JI 5/30/2017 02:43:34'!
test07_KilometroLessThanDistance

	self deny: (Kilometro initializeWith: 0.003) < (Kilometro initializeWith: 0.003) .
	self assert: (Kilometro initializeWith: 0.003) < (Kilometro initializeWith: 0.004) .
	self deny: (Kilometro initializeWith: 0.003) < (Kilometro initializeWith: 0.002) .
	self deny: (Kilometro initializeWith: 0.003) < (Metro initializeWith: 3) .
	self assert: (Kilometro initializeWith: 0.003) < fourMetros .
	self deny: (Kilometro initializeWith: 0.004) < threeMetros .
	self assert: (Kilometro initializeWith: 0.003) < fourHundredOneCentimetros.
	self deny: (Kilometro initializeWith: 0.003) < (Centimetro initializeWith: 300) .
	self deny: (Kilometro initializeWith: 0.004) < threeHundredOneCentimetros .
	self assert: (Kilometro initializeWith: 0.003) < fourThousandMilimetros .
	self deny: (Kilometro initializeWith: 0.003) < threeThousandMilimetros .
	self deny: (Kilometro initializeWith: 0.004) < threeThousandMilimetros .! !


!DistanceTest methodsFor: 'operating with distances' stamp: 'JI 5/30/2017 02:53:30'!
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
	self assert: aMeterAndAHalf + aHundredOne = thousandMilimeters.
	self assert: aMeterAndAHalf + (Kilometro initializeWith: 1) = (Metro initializeWith: 1001.5)! !

!DistanceTest methodsFor: 'operating with distances' stamp: 'JI 5/30/2017 02:47:45'!
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
	self assert: twentyThreeCentimeterAndHalf + fourHundredThirtyOneMilimeters = sixHundredSixtySixMilimetros.
	self assert: twentyThreeCentimeterAndHalf + (Kilometro initializeWith: 1) = (Centimetro initializeWith: 100023.5)! !

!DistanceTest methodsFor: 'operating with distances' stamp: 'JI 5/30/2017 02:48:38'!
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
	self assert: someMilimetros + anotherSomeMilimetros = a11122Milimetros.
	self assert: someMilimetros + (Kilometro initializeWith: 1) = (Milimetros initializeWith: 1001020)! !

!DistanceTest methodsFor: 'operating with distances' stamp: 'JI 5/30/2017 02:49:39'!
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
	self assert: someMetros - anotherSomeMilimetros = milimeters569.
	self assert: (Metro initializeWith: 1001) - (Kilometro initializeWith: 1) = (Metro initializeWith: 1)! !

!DistanceTest methodsFor: 'operating with distances' stamp: 'JI 5/30/2017 02:50:10'!
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
	self assert: someCentimetros - someMilimetros = milimeters500.
	self assert: (Centimetro initializeWith: 100001) - (Kilometro initializeWith: 1) = (Centimetro initializeWith: 1)! !

!DistanceTest methodsFor: 'operating with distances' stamp: 'JI 5/30/2017 02:50:46'!
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
	self assert: someMilimetros - anotherSomeMilimetros = milimeters949.
	self assert: (Milimetros initializeWith: 1000001) - (Kilometro initializeWith: 1) = (Milimetros initializeWith: 1)! !

!DistanceTest methodsFor: 'operating with distances' stamp: 'JI 5/30/2017 02:51:14'!
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
	self assert: someMilimetros / 5 = theResultMilimetros.
	self assert: (Kilometro initializeWith: 5) / 5 = (Kilometro initializeWith: 1)! !

!DistanceTest methodsFor: 'operating with distances' stamp: 'JI 5/30/2017 02:51:36'!
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
	self assert: someMilimetros * 4 = theResultMilimetros.
	self assert: (Kilometro initializeWith: 5) * 5 = (Kilometro initializeWith: 25)! !

!DistanceTest methodsFor: 'operating with distances' stamp: 'JI 5/30/2017 02:52:54'!
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
	self assert: 4 * someMilimetros = theResultMilimetros.
	self assert: 5 * (Kilometro initializeWith: 5)  = (Kilometro initializeWith: 25)! !

!DistanceTest methodsFor: 'operating with distances' stamp: 'JI 5/30/2017 02:57:26'!
test10_SomeKilometrosPlusSomeDistanceAddsRight
	
	| twoMeters twentyCentimeters aHundredOne |
	
	twoMeters := Metro initializeWith: 2.
	twentyCentimeters := Centimetro initializeWith: 20.
	aHundredOne := Milimetros initializeWith: 101.
	
	self assert: (Kilometro initializeWith: 1) + twoMeters = (Metro initializeWith: 1002) .
	self assert: (Kilometro initializeWith: 1) + twentyCentimeters = (Centimetro initializeWith: 100020).
	self assert: (Kilometro initializeWith: 1) + aHundredOne = (Milimetros initializeWith: 1000101).
	self assert: (Kilometro initializeWith: 1) + (Kilometro initializeWith: 1) = (Kilometro initializeWith: 2)! !

!DistanceTest methodsFor: 'operating with distances' stamp: 'JI 5/30/2017 03:01:26'!
test11_SomeKilometrosMinusSomeDistanceSubstractsRight
	
	| twoMeters twentyCentimeters aHundredOne |
	
	twoMeters := Metro initializeWith: 2.
	twentyCentimeters := Centimetro initializeWith: 20.
	aHundredOne := Milimetros initializeWith: 101.
	
	self assert: (Kilometro initializeWith: 1) - twoMeters = (Metro initializeWith: 998) .
	self assert: (Kilometro initializeWith: 1) - twentyCentimeters = (Centimetro initializeWith: 99980).
	self assert: (Kilometro initializeWith: 1) - aHundredOne = (Milimetros initializeWith: 999899).
	self assert: (Kilometro initializeWith: 2) - (Kilometro initializeWith: 1) = (Kilometro initializeWith: 1)! !


!DistanceTest methodsFor: 'initial' stamp: 'JI 5/30/2017 00:50:35'!
setUp
	distanceFactory := DistanceFactory new.
	unMetro := distanceFactory oneMeter.
	unCentimetro := distanceFactory oneCentimeter.
	oneMilimetro := distanceFactory oneMilimeter.
	cienCentimetros := Centimetro initializeWith: 100.
	milMilimetros := Milimetros initializeWith: 1000.
	
	unKilometro _ Kilometro initializeWith: 1.
	
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


!DistanceTest methodsFor: 'intervals between distances' stamp: 'JI 5/30/2017 03:03:22'!
test01_AnIntervalWithOneMetroStepsWorksRightForAllDistances
	
	| initialDistanceMetro initialDistanceCentimetro initialDistanceMilimetro
	  finalDistanceMetro finalDistanceCentimetro finalDistanceMilimetro
	  intervaloParaMetro intervaloParaCentimetro intervaloParaMilimetro
	finalDistanceKilometro initialDistanceKilometro intervaloParaKilometro |
	
	initialDistanceKilometro _ Kilometro initializeWith: 1.
	initialDistanceMetro _ Metro initializeWith: 1.
	initialDistanceCentimetro _ Centimetro initializeWith: 1.
	initialDistanceMilimetro _ Milimetros initializeWith: 1.
	
	finalDistanceKilometro _ Kilometro initializeWith: 5.
	finalDistanceMetro _ Metro initializeWith: 5.
	finalDistanceCentimetro _ Centimetro initializeWith: 5.
	finalDistanceMilimetro _ Milimetros initializeWith: 5.
	
	intervaloParaKilometro _ { Kilometro initializeWith: 1 . 
							Kilometro initializeWith: 2 . 
							Kilometro initializeWith: 3. 
							Kilometro initializeWith: 4. 
							Kilometro initializeWith: 5} asOrderedCollection.
	
	intervaloParaMetro _ { Metro initializeWith: 1 . 
							Metro initializeWith: 2 . 
							Metro initializeWith: 3. 
							Metro initializeWith: 4. 
							Metro initializeWith: 5} asOrderedCollection.
							
	intervaloParaCentimetro _ { Centimetro initializeWith: 1 .
									Centimetro initializeWith: 2 .
									Centimetro initializeWith: 3 .
									Centimetro initializeWith: 4 .
									Centimetro initializeWith: 5 } asOrderedCollection .
									
	intervaloParaMilimetro _ { Milimetros initializeWith: 1.
								Milimetros initializeWith: 2.
								Milimetros initializeWith: 3.
								Milimetros initializeWith: 4.
								Milimetros initializeWith: 5} asOrderedCollection.
								
	
	self assert: ( (initialDistanceMetro to: finalDistanceMetro) = intervaloParaMetro ).
	self assert: ( (initialDistanceCentimetro to: finalDistanceCentimetro) = intervaloParaCentimetro ).
	self assert: ( (initialDistanceMilimetro  to: finalDistanceMilimetro) = intervaloParaMilimetro  ).
	self assert: ( (initialDistanceKilometro to: finalDistanceKilometro) = intervaloParaKilometro ).
	! !

!DistanceTest methodsFor: 'intervals between distances' stamp: 'JI 5/30/2017 03:06:26'!
test02_AnIntervalWithArbitraryStepsWorksRightForAllDistances
	
	| initialDistanceMetro initialDistanceCentimetro initialDistanceMilimetro
	  finalDistanceMetro finalDistanceCentimetro finalDistanceMilimetro
	  stepsForMetro stepsForCentimetro stepsForMilimetro
	  intervaloParaMetro intervaloParaCentimetro intervaloParaMilimetro
	finalDistanceKilometro initialDistanceKilometro intervaloParaKilometro stepsForKilometro |
	
	initialDistanceMetro _ Metro initializeWith: 1.
	stepsForMetro _ Milimetros initializeWith: 16.
	finalDistanceMetro _ Centimetro initializeWith: 105.
	
	intervaloParaMetro _ { Milimetros initializeWith: 1000 . 
							Milimetros initializeWith: 1016 . 
							Milimetros initializeWith: 1032. 
							Milimetros initializeWith: 1048. } asOrderedCollection.
	self assert: ( (initialDistanceMetro to: finalDistanceMetro by: stepsForMetro ) = intervaloParaMetro ).
	
	
	initialDistanceCentimetro _ Centimetro initializeWith: 10.
	stepsForCentimetro _ Metro initializeWith: 2.
	finalDistanceCentimetro _ Milimetros initializeWith: 9100.
						
	intervaloParaCentimetro _ { Centimetro initializeWith: 10 .
									Centimetro initializeWith: 210 .
									Centimetro initializeWith: 410 .
									Centimetro initializeWith: 610 .
									Centimetro initializeWith: 810 . } asOrderedCollection .
	self assert: ( (initialDistanceCentimetro to: finalDistanceCentimetro by: stepsForCentimetro ) = intervaloParaCentimetro ).
	
	
	initialDistanceMilimetro _ Milimetros initializeWith: 1.	
	stepsForMilimetro _ Centimetro initializeWith: 500.
	finalDistanceMilimetro _ Metro initializeWith: 21.
	
	intervaloParaMilimetro _ { Milimetros initializeWith: 1.
								Milimetros initializeWith: 5001.
								Milimetros initializeWith: 10001.
								Milimetros initializeWith: 15001.
								Milimetros initializeWith: 20001} asOrderedCollection.
	self assert: ( (initialDistanceMilimetro  to: finalDistanceMilimetro by: stepsForMilimetro ) = intervaloParaMilimetro  ).
	
	
	initialDistanceKilometro _ Kilometro initializeWith: 1.	
	stepsForKilometro _ Metro initializeWith: 500.
	finalDistanceKilometro _ Metro initializeWith: 3002.
	
	intervaloParaKilometro _ { Metro initializeWith: 1000.
								Metro initializeWith: 1500.
								Metro initializeWith: 2000.
								Metro initializeWith: 2500.
								Metro initializeWith: 3000.} asOrderedCollection.
	self assert: ( (initialDistanceKilometro  to: finalDistanceKilometro by: stepsForKilometro ) = intervaloParaKilometro  ).
	! !

!DistanceTest methodsFor: 'intervals between distances' stamp: 'JI 5/30/2017 03:06:50'!
test03_ExecutingSumIntoBlock
	
	| initialDistance finalDistance steps anExecutionBlock intervalForAssert intervalResult|
	
	initialDistance _ Metro initializeWith: 1.	
	steps _ Metro initializeWith: 1.
	finalDistance _ Metro initializeWith: 3.
	anExecutionBlock _ [ :aDistance | ^aDistance + unMetro ] .
	
	intervalForAssert _ { 	Metro initializeWith: 2 . 
							Metro initializeWith: 3. 
							Metro initializeWith: 4} asOrderedCollection.
							
	intervalResult := initialDistance to: finalDistance by: steps do: anExecutionBlock.
	
	self assert: intervalResult = intervalForAssert
! !


!classDefinition: #UnitTest category: #'Distance-Solution'!
TestCase subclass: #UnitTest
	instanceVariableNames: 'centimetros100 centimetros200 metros1 metros2 metrosOtro1 milimetros1000 milimetros2000 centimetrosOtro100 milimetrosOtro1000 kilometros1Over1000 kilometrosOtro1Over1000 kilometros2Over1000 metros3 metros4 kilometros3Over1000 centimetros300 milimetros3000 kilometros1 kilometrosOtro1 kilometros2 kilometros3 metrosMinus1 metros0 metros30'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!UnitTest methodsFor: 'DistanceUnits * y /' stamp: 'JI 6/1/2017 16:46:07'!
test001_DistanceMultipliedByANumber
	
	self assert: metros1 * 1 = metrosOtro1 .
	self assert: metros3 * 0 = metros0.
	self assert: centimetros300 * 10 = metros30.! !

!UnitTest methodsFor: 'DistanceUnits * y /' stamp: 'JI 6/1/2017 16:49:14'!
test002_ANumberMultipliedByADistance
	
	self assert: 1 * metros1 = metrosOtro1 .
	self assert: 0 *metros3 = metros0.
	self assert: 10 * centimetros300  = metros30.! !

!UnitTest methodsFor: 'DistanceUnits * y /' stamp: 'JI 6/1/2017 17:01:23'!
test003_DistanceDividedByANumber
	
	self assert: metros1 / 1 = metrosOtro1 .
	self assert: centimetros300 * 10 = metros30.
	[metros3 / 0 = metros0]
		on: Error
		do: [ :anError | self assert: (anError class = ZeroDivide)] .
	
	! !


!UnitTest methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 19:56:11'!
test001_MetroMasKilometro

	self assert: metros1 + kilometros2Over1000 = metros3 . 
	self deny: metros1 + kilometros2Over1000 = metros1 . 
	! !

!UnitTest methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 19:50:12'!
test002_MetroMasMetro

	self assert: metros1 + metros2 = metros3. 
	self deny: metros1 + metros2 = metros4. 
	! !

!UnitTest methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 19:56:34'!
test003_MetroMasCentimetro

	self assert: metros1 + centimetros200 = centimetros300 . 
	self deny: metros1 + centimetros200 = centimetros200 . 
	! !

!UnitTest methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 19:56:48'!
test004_MetroMasMilimetro

	self assert: metros1 + milimetros2000 = milimetros3000 . 
	self deny: metros1 + milimetros2000 = milimetros2000 . 
	! !

!UnitTest methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 19:57:10'!
test005_CentimetroMasKilometro

	self assert: centimetros100 + kilometros1Over1000 = metros2 . 
	self deny: centimetros200 + kilometros3Over1000 = metros2 . 
	! !

!UnitTest methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 19:59:20'!
test006_CentimetroMasMetro

	self assert: centimetros100 + metros1 = metros2 . 
	self deny: centimetros200 + metros3 = metros2 . 
	! !

!UnitTest methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 19:59:39'!
test007_CentimetroMasCentimetro

	self assert: centimetros100 + centimetrosOtro100 = metros2 . 
	self deny: centimetros200 + centimetros300 = metros2 . 
	! !

!UnitTest methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 19:59:56'!
test008_CentimetroMasMilimetro

	self assert: centimetros100 + milimetros1000 = metros2 . 
	self deny: centimetros200 + milimetros2000 = metros2 . 
	! !

!UnitTest methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 20:03:38'!
test009_MilimetroMasKilometro

	self assert: milimetros1000 + kilometros1Over1000 = metros2 . 
	self deny: milimetros2000 + kilometros3Over1000 = metros2 . 
	! !

!UnitTest methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 20:04:02'!
test010_MilimetroMasMetro

	self assert: milimetros1000 + metros1 = metros2 . 
	self deny: milimetros2000 + metros3 = metros2 . 
	! !

!UnitTest methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 20:04:16'!
test011_MilimetroMasCentimetro

	self assert: milimetros1000 + centimetros100 = metros2 . 
	self deny: milimetros2000 + centimetros300 = metros2 . 
	! !

!UnitTest methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 20:04:46'!
test012_MilimetroMasMilimetro

	self assert: milimetros1000 + milimetrosOtro1000 = metros2 . 
	self deny: milimetros2000 + milimetros3000 = metros2 . 
	! !

!UnitTest methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 20:06:45'!
test013_KilometroMasKilometro

	self assert: kilometros1 + kilometrosOtro1 = kilometros2 . 
	self deny: kilometros1 + kilometros3 = kilometrosOtro1Over1000 . 
	! !

!UnitTest methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 20:08:47'!
test014_KilometroMasMetro

	self assert: kilometros1Over1000 + metros2 = metros3. 
	self deny: kilometros1Over1000 + metros2 = metros1 . 
	! !

!UnitTest methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 20:09:10'!
test015_KilometroMasCentimetro

	self assert: kilometros1Over1000 + centimetros200 = metros3. 
	self deny: kilometros1Over1000 + centimetros200 = metros1 . 
	! !

!UnitTest methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 20:09:26'!
test016_KilometroMasMilimetro

	self assert: kilometros1Over1000 + milimetros2000 = metros3. 
	self deny: kilometros1Over1000 + milimetros2000 = metros1 . 
	! !


!UnitTest methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:32:21'!
test001_MetroMenosKilometro

	self assert: metros1 - kilometros2Over1000 = metrosMinus1 . 
	self deny: metros1 - kilometros2Over1000 = metros0 . 
	! !

!UnitTest methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:34:11'!
test002_MetroMenosMetro

	self assert: metros1 - metrosOtro1 = metros0 . 
	self deny: metros3 - metros1 = metros3. 
	! !

!UnitTest methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:34:31'!
test003_MetroMenosCentimetro

	self assert: metros1 - centimetros100 = metros0 . 
	self deny: metros3 - centimetros100 = metros3. 
	! !

!UnitTest methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:34:48'!
test004_MetroMenosMilimetro

	self assert: metros1 - milimetros1000 = metros0 . 
	self deny: metros3 - milimetros1000 = metros3. 
	! !

!UnitTest methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:35:29'!
test005_CentimetroMenosKilometro

	self assert: centimetros100 - kilometros1Over1000 = metros0 . 
	self deny: centimetros300 - kilometros1Over1000 = milimetros3000 . 
	! !

!UnitTest methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:35:45'!
test006_CentimetroMenosMetro

	self assert: centimetros100 - metros1 = metros0 . 
	self deny: centimetros300 - metros1 = milimetros3000 . 
	! !

!UnitTest methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:35:58'!
test007_CentimetroMenosCentimetro

	self assert: centimetros100 - centimetros100 = metros0 . 
	self deny: centimetros300 - centimetros100 = milimetros3000 . 
	! !

!UnitTest methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:36:17'!
test008_CentimetroMenosMilimetro

	self assert: centimetros100 - milimetros1000 = metros0 . 
	self deny: centimetros300 - milimetros1000 = milimetros3000 . 
	! !

!UnitTest methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:36:40'!
test009_MilimetroMenosKilometro

	self assert: milimetros1000 - kilometros1Over1000 = metros0 . 
	self deny: milimetros3000 - kilometros1Over1000 = milimetros3000 . 
	! !

!UnitTest methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:36:55'!
test010_MilimetroMenosMetro

	self assert: milimetros1000 - metros1 = metros0 . 
	self deny: milimetros3000 - metros1 = milimetros3000 . 
	! !

!UnitTest methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:38:02'!
test011_MilimetroMenosCentimetro

	self assert: milimetros1000 - centimetros100 = metros0 . 
	self deny: milimetros3000 - centimetros100 = milimetros3000 . 
	! !

!UnitTest methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:38:14'!
test012_MilimetroMenosMilimetro

	self assert: milimetros1000 - milimetrosOtro1000 = metros0 . 
	self deny: milimetros3000 - milimetrosOtro1000 = milimetros3000 . 
	! !

!UnitTest methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:38:41'!
test013_KilometroMenosKilometro

	self assert: kilometros1Over1000 - kilometrosOtro1Over1000 = metros0 . 
	self deny: kilometros3Over1000 - kilometros1Over1000 = milimetros3000 . 
	! !

!UnitTest methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:38:55'!
test014_KilometroMenosMetro

	self assert: kilometros1Over1000 - metros1 = metros0 . 
	self deny: kilometros3Over1000 - metros1 = milimetros3000 . 
	! !

!UnitTest methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:39:21'!
test015_KilometroMenosCentimetro

	self assert: kilometros1Over1000 - centimetros100 = metros0 . 
	self deny: kilometros3Over1000 - centimetros100 = milimetros3000 . 
	! !

!UnitTest methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:39:33'!
test016_KilometroMenosMilimetro

	self assert: kilometros1Over1000 - milimetros1000 = metros0 . 
	self deny: kilometros3Over1000 - milimetros1000 = milimetros3000 . 
	! !


!UnitTest methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:06:21'!
test001_MetroIgualAMetro
	
	self assert: metros1 = metrosOtro1 .
	self deny: metros1 = metros2.! !

!UnitTest methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:06:46'!
test002_MetroIgualACentimetro
	
	self assert: metros1 = centimetros100 .
	self deny: metros1 = centimetros200 .! !

!UnitTest methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:11:02'!
test003_MetroIgualAMilimetro
	
	self assert: metros1 = milimetros1000 .
	self deny: metros1 = milimetros2000 .! !

!UnitTest methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:31:44'!
test004_MetroIgualAKilometro
	
	self assert: metros1 = kilometros1Over1000 .
	self deny: metros1 = kilometros2Over1000 .! !

!UnitTest methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:15:04'!
test005_CentimetroIgualAMetro
	
	self assert: centimetros100 = metros1 .
	self deny: centimetros100 = metros2.! !

!UnitTest methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:16:44'!
test006_CentimetroIgualACentimetro
	
	self assert: centimetros100 = centimetrosOtro100 .
	self deny: centimetros100 = centimetros200.! !

!UnitTest methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:17:44'!
test007_CentimetroIgualAMilimetro
	
	self assert: centimetros100 = milimetros1000 .
	self deny: centimetros100 = milimetros2000 .! !

!UnitTest methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:32:07'!
test008_CentimetroIgualAKilometro
	
	self assert: centimetros100 = kilometros1Over1000 .
	self deny: centimetros100 = kilometros2Over1000 .! !

!UnitTest methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:34:28'!
test009_MilimetroIgualAKilometro
	
	self assert: milimetros1000 = kilometros1Over1000 .
	self deny: milimetros2000 = kilometros1Over1000 .! !

!UnitTest methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:20:51'!
test010_MilimetroIgualAMetro
	
	self assert: milimetros1000 = metros1 .
	self deny: milimetros1000 = metros2 .! !

!UnitTest methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:20:56'!
test011_MilimetroIgualACentimetro
	
	self assert: milimetros1000 = centimetros100 .
	self deny: milimetros1000 = centimetros200 .! !

!UnitTest methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:21:10'!
test012_MilimetroIgualAMilimetro
	
	self assert: milimetros1000 = milimetrosOtro1000 .
	self deny: milimetros1000 = milimetros2000 .! !

!UnitTest methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:28:04'!
test013_KilometroIgualAKilometro
	
	self assert: kilometros1Over1000 = kilometrosOtro1Over1000 .
	self deny: kilometros1Over1000 = kilometros2Over1000 .! !

!UnitTest methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:32:42'!
test014_KilometroIgualAMetro
	
	self assert: kilometros1Over1000 = metros1 .
	self deny: kilometros1Over1000 = metros2 .! !

!UnitTest methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:29:47'!
test015_KilometroIgualACentimetro
	
	self assert: kilometros1Over1000 = centimetros100 .
	self deny: kilometros1Over1000 = centimetros200 .! !

!UnitTest methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:30:01'!
test016_KilometroIgualAMilimetro
	
	self assert: kilometros1Over1000 = milimetros1000 .
	self deny: kilometros1Over1000 = milimetros2000 .! !


!UnitTest methodsFor: 'DistanceUnits Comparison' stamp: 'JI 6/1/2017 17:05:19'!
test001_DistanceLessDistance
	
	self deny: metros1 < centimetros100 .
	self assert: milimetros1000 < kilometros2Over1000 .
	self deny: kilometros1Over1000 < metros0.! !

!UnitTest methodsFor: 'DistanceUnits Comparison' stamp: 'JI 6/1/2017 17:06:17'!
test002_DistanceLessOrEqualDistance
	
	self assert: metros1 <= centimetros100 .
	self assert: milimetros1000 <= kilometros2Over1000 .
	self deny: kilometros1Over1000 <= metros0.! !

!UnitTest methodsFor: 'DistanceUnits Comparison' stamp: 'JI 6/1/2017 17:08:39'!
test003_DistanceGreaterThanDistance
	
	self deny: metros1 > centimetros100 .
	self deny: milimetros1000 > kilometros2Over1000 .
	self assert: kilometros1Over1000 > metros0.! !

!UnitTest methodsFor: 'DistanceUnits Comparison' stamp: 'JI 6/1/2017 17:08:32'!
test004_DistanceGreaterOrEqualThanDistance
	
	self assert: metros1 >= centimetros100 .
	self deny: milimetros1000 >= kilometros2Over1000 .
	self assert: kilometros1Over1000 >= metros0.! !


!UnitTest methodsFor: 'SetUp' stamp: 'JI 5/31/2017 19:53:33'!
centimetrosSetUp

	centimetros100 _ DistanceUnits initializeWith: 100 asUnit: (Centimetro initialize) .	
	centimetrosOtro100 _ DistanceUnits initializeWith: 100 asUnit: (Centimetro initialize) .	
	centimetros200 _ DistanceUnits initializeWith: 200 asUnit: (Centimetro initialize) .
	centimetros300 _ DistanceUnits initializeWith: 300 asUnit: (Centimetro initialize)  ! !

!UnitTest methodsFor: 'SetUp' stamp: 'JI 5/31/2017 20:06:36'!
kilometrosSetUp

	kilometros1Over1000 _ DistanceUnits initializeWith: 1/1000 asUnit: (Kilometro initialize) .	
	kilometrosOtro1Over1000 _ DistanceUnits initializeWith: 1/1000 asUnit: (Kilometro initialize) .	
	kilometros2Over1000 _  DistanceUnits initializeWith: 2/1000 asUnit: (Kilometro initialize) . 
	kilometros3Over1000 _  DistanceUnits initializeWith: 3/1000 asUnit: (Kilometro initialize) . 
	
	kilometros1 _ DistanceUnits initializeWith: 1 asUnit: (Kilometro initialize ).
	kilometrosOtro1 _ DistanceUnits initializeWith: 1 asUnit: (Kilometro initialize ).
	kilometros2 _ DistanceUnits initializeWith: 2 asUnit: (Kilometro initialize ).
	kilometros3 _ DistanceUnits initializeWith: 3 asUnit: (Kilometro initialize ).
	! !

!UnitTest methodsFor: 'SetUp' stamp: 'JI 6/1/2017 16:46:41'!
metrosSetUp
	
	metrosMinus1 _ DistanceUnits initializeWith: -1 asUnit: (Metro initialize ).
	metros0 _ DistanceUnits initializeWith: 0 asUnit: (Metro initialize ).
	metros1 _ DistanceUnits initializeWith: 1 asUnit: (Metro initialize) .
	metrosOtro1 _ DistanceUnits initializeWith: 1 asUnit: (Metro initialize) .	
	metros2 _ DistanceUnits initializeWith: 2 asUnit: (Metro initialize )  .
	metros3 _ DistanceUnits initializeWith: 3 asUnit: (Metro initialize )  .
	metros4 _ DistanceUnits initializeWith: 4 asUnit: (Metro initialize )  .
	metros30 _ DistanceUnits initializeWith: 30 asUnit: (Metro initialize )  .! !

!UnitTest methodsFor: 'SetUp' stamp: 'JI 5/31/2017 19:54:36'!
milimetrosSetUp

	milimetros1000 _ DistanceUnits initializeWith: 1000 asUnit: (Milimetro initialize) .	
	milimetrosOtro1000 _ DistanceUnits initializeWith: 1000 asUnit: (Milimetro initialize) .	
	milimetros2000 _  DistanceUnits initializeWith: 2000 asUnit: (Milimetro initialize) . 
	milimetros3000 _  DistanceUnits initializeWith: 3000 asUnit: (Milimetro initialize) . 
	! !

!UnitTest methodsFor: 'SetUp' stamp: 'JI 5/31/2017 19:10:34'!
setUp
	self kilometrosSetUp .
	self metrosSetUp.
	self centimetrosSetUp .
	self milimetrosSetUp .! !


!classDefinition: #DistanceFactory category: #'Distance-Solution'!
Object subclass: #DistanceFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!DistanceFactory methodsFor: 'newInstances' stamp: 'JI 5/30/2017 13:37:54'!
minusOneMeter
	^ Metro initializeWith: -1
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
	instanceVariableNames: 'quantity unitType'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!DistanceUnits methodsFor: 'comparing' stamp: 'JI 6/1/2017 17:05:51'!
< someDistance
	^ self factorValue < (someDistance factorValue )! !

!DistanceUnits methodsFor: 'comparing' stamp: 'JI 6/1/2017 17:07:07'!
<= aDistance
	^ self < aDistance or: [ (aDistance < self) not ]! !

!DistanceUnits methodsFor: 'comparing' stamp: 'Ji 5/30/2017 21:34:01'!
= anotherDistance

	^ self factorValue = anotherDistance factorValue.! !

!DistanceUnits methodsFor: 'comparing' stamp: 'JAK 5/30/2017 13:56:09'!
> aDistance
	^ (self <= aDistance ) not! !

!DistanceUnits methodsFor: 'comparing' stamp: 'JAK 5/30/2017 13:56:16'!
>= aDistance
	^ self > aDistance or:[ self = aDistance]! !


!DistanceUnits methodsFor: 'operating' stamp: 'JI 6/1/2017 16:47:50'!
* aSmallInteger 
	^ self class initializeWith: ( self factorValue * aSmallInteger ) asUnit: (Metro initialize )! !

!DistanceUnits methodsFor: 'operating' stamp: 'JI 5/31/2017 19:58:47'!
+ someDistance

	^ self class initializeWith: (( self factorValue + someDistance factorValue )) asUnit: (Metro initialize )! !

!DistanceUnits methodsFor: 'operating' stamp: 'JI 6/1/2017 16:40:39'!
- someDistance
	^ self class initializeWith: (( self factorValue - someDistance factorValue )) asUnit: (Metro initialize )! !

!DistanceUnits methodsFor: 'operating' stamp: 'JI 6/1/2017 16:52:18'!
/ aSmallInteger 
	^ self class initializeWith: ( self factorValue / aSmallInteger ) asUnit: (Metro initialize )! !

!DistanceUnits methodsFor: 'operating' stamp: 'jak 5/28/2017 19:29:51'!
adaptToNumber: aNumber andSend: selector 
	^self perform: selector with: aNumber.! !


!DistanceUnits methodsFor: 'interval' stamp: 'jak 5/29/2017 20:30:22'!
to: aDistance
	
	^ (self to:aDistance by: (self class initializeWith: 1)).! !

!DistanceUnits methodsFor: 'interval' stamp: 'jak 5/29/2017 20:30:36'!
to: aDistance by: stepDistance 
	
	| anInterval currentDistance |
	anInterval _ OrderedCollection new.
	currentDistance _ self.
	[currentDistance <= aDistance ] whileTrue: [ anInterval add: currentDistance.
													currentDistance _ currentDistance + stepDistance ].
												
	^anInterval! !

!DistanceUnits methodsFor: 'interval' stamp: 'jak 5/29/2017 20:30:47'!
to: aDistance by: steps do: aBlockClosure
	
	^ (self to: aDistance by: steps) do: aBlockClosure ! !


!DistanceUnits methodsFor: 'initialization' stamp: 'Ji 5/30/2017 21:17:26'!
initializeWith: aQuantity 
	quantity := aQuantity ! !


!DistanceUnits methodsFor: 'as yet unclassified' stamp: 'Ji 5/30/2017 21:37:50'!
factorValue
	^ quantity * (unitType convertionFactor)! !

!DistanceUnits methodsFor: 'as yet unclassified' stamp: 'Ji 5/30/2017 21:30:19'!
initializeWith: aSmallInteger asUnit: anUnitType 
	unitType _ anUnitType.
	quantity _ aSmallInteger .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DistanceUnits class' category: #'Distance-Solution'!
DistanceUnits class
	instanceVariableNames: 'quantity'!

!DistanceUnits class methodsFor: 'class initialization' stamp: 'JI 5/30/2017 00:54:35'!
initializeWith: aQuantity 
	^self subclassResponsibility ! !


!DistanceUnits class methodsFor: 'as yet unclassified' stamp: 'Ji 5/30/2017 21:30:07'!
initializeWith: aSmallInteger asUnit: anUnitType
	
	^self new initializeWith: aSmallInteger asUnit: anUnitType .! !


!classDefinition: #IntervalClass category: #'Distance-Solution'!
DistanceUnits subclass: #IntervalClass
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!


!classDefinition: #Unit category: #'Distance-Solution'!
Object subclass: #Unit
	instanceVariableNames: 'conversionFactor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Unit methodsFor: 'as yet unclassified' stamp: 'Ji 5/30/2017 21:40:30'!
convertionFactor
	^ conversionFactor! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Unit class' category: #'Distance-Solution'!
Unit class
	instanceVariableNames: ''!

!Unit class methodsFor: 'as yet unclassified' stamp: 'Ji 5/30/2017 21:43:04'!
initialize
	^ self new initialize .! !


!classDefinition: #Centimetro category: #'Distance-Solution'!
Unit subclass: #Centimetro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Centimetro methodsFor: 'as yet unclassified' stamp: 'Ji 5/30/2017 21:42:05'!
initialize
	conversionFactor _ 1/100! !


!classDefinition: #Kilometro category: #'Distance-Solution'!
Unit subclass: #Kilometro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Kilometro methodsFor: 'as yet unclassified' stamp: 'Ji 5/30/2017 21:47:39'!
initialize
	conversionFactor _ 1000! !


!classDefinition: #Metro category: #'Distance-Solution'!
Unit subclass: #Metro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Metro methodsFor: 'as yet unclassified' stamp: 'Ji 5/30/2017 21:41:33'!
initialize
	conversionFactor  _ 1! !


!classDefinition: #Milimetro category: #'Distance-Solution'!
Unit subclass: #Milimetro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Milimetro methodsFor: 'as yet unclassified' stamp: 'Ji 5/30/2017 21:46:20'!
initialize
	conversionFactor _ 1/1000! !

Unit initialize!