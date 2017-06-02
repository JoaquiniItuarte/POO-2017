!classDefinition: #DistanceUnits category: #'Distance-Solution'!
Magnitude subclass: #DistanceUnits
	instanceVariableNames: 'quantity unitType'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!DistanceUnits methodsFor: 'comparing' stamp: 'JI 6/1/2017 17:05:51'!
< someDistance
	^ self factorValue < (someDistance factorValue )! !

!DistanceUnits methodsFor: 'comparing' stamp: 'jak 6/1/2017 20:46:35'!
= anotherDistance

	^ self class = anotherDistance class and: [self factorValue = anotherDistance factorValue].! !

!DistanceUnits methodsFor: 'comparing' stamp: 'jak 6/1/2017 20:50:36'!
hash
	^ self factorValue  ! !


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

!DistanceUnits methodsFor: 'operating' stamp: 'jak 6/1/2017 20:53:49'!
negated
	^ self class initializeWith: ((0 - self factorValue)) asUnit: (Metro initialize )! !


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


!DistanceUnits methodsFor: 'initialization' stamp: 'Ji 5/30/2017 21:30:19'!
initializeWith: aSmallInteger asUnit: anUnitType 
	unitType _ anUnitType.
	quantity _ aSmallInteger .! !


!DistanceUnits methodsFor: 'inspecting' stamp: 'Ji 6/1/2017 19:27:48'!
amount
	^ quantity ! !

!DistanceUnits methodsFor: 'inspecting' stamp: 'Ji 5/30/2017 21:37:50'!
factorValue
	^ quantity * (unitType convertionFactor)! !

!DistanceUnits methodsFor: 'inspecting' stamp: 'jak 6/1/2017 19:46:38'!
unit
	^ unitType! !


!DistanceUnits methodsFor: 'conversion' stamp: 'jak 6/1/2017 20:36:18'!
convertTo: aUnit
	^DistanceUnits initializeWith: (self unit convert: quantity to: aUnit ) asUnit: (aUnit class initialize) .! !


!DistanceUnits methodsFor: 'printing' stamp: 'jak 6/1/2017 19:57:38'!
printString
	|extraS|
	extraS := String new.
	quantity > 1 ifTrue: [extraS := 's'].
	^ quantity printString, ' ' , unitType printString, extraS ! !

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


!classDefinition: #IntervalOfDistances category: #'Distance-Solution'!
DistanceUnits subclass: #IntervalOfDistances
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!


!classDefinition: #UnitTest category: #'Distance-Solution'!
TestCase subclass: #UnitTest
	instanceVariableNames: 'centimetros100 centimetros200 metros1 metros2 metrosOtro1 milimetros1000 milimetros2000 centimetrosOtro100 milimetrosOtro1000 kilometros1Over1000 kilometrosOtro1Over1000 kilometros2Over1000 metros3 metros4 kilometros3Over1000 centimetros300 milimetros3000 kilometros1 kilometrosOtro1 kilometros2 kilometros3 metrosMinus1 metros0 metros30 intervaloVacio'
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


!UnitTest methodsFor: 'Interval' stamp: 'Ji 6/1/2017 19:19:51'!
test001_IntervaloVacio
	
	intervaloVacio _ Interval ! !


!classDefinition: #DistanceFactory category: #'Distance-Solution'!
Object subclass: #DistanceFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!DistanceFactory methodsFor: 'newInstances' stamp: 'Ji 6/1/2017 19:31:31'!
minusOneMeter
	^ DistanceUnits initializeWith: -1 asUnit: Metro initialize
! !

!DistanceFactory methodsFor: 'newInstances' stamp: 'Ji 6/1/2017 19:31:42'!
oneCentimeter
	^ DistanceUnits initializeWith: 1 asUnit: Centimetro initialize! !

!DistanceFactory methodsFor: 'newInstances' stamp: 'Ji 6/1/2017 19:31:52'!
oneHundredCentimeters
	^ DistanceUnits initializeWith: 100 asUnit: Centimetro initialize! !

!DistanceFactory methodsFor: 'newInstances' stamp: 'Ji 6/1/2017 19:32:02'!
oneMeter
	^ DistanceUnits initializeWith: 1 asUnit: Metro initialize! !

!DistanceFactory methodsFor: 'newInstances' stamp: 'Ji 6/1/2017 19:32:10'!
oneMilimeter
	^ DistanceUnits initializeWith: 1 asUnit: Milimetro initialize! !

!DistanceFactory methodsFor: 'newInstances' stamp: 'Ji 6/1/2017 19:32:18'!
twoHundredCentimeters
	^ DistanceUnits initializeWith: 200 asUnit: Centimetro initialize! !

!DistanceFactory methodsFor: 'newInstances' stamp: 'Ji 6/1/2017 19:32:33'!
twoMeters
	^ DistanceUnits initializeWith: 2 asUnit: Metro initialize
! !

!DistanceFactory methodsFor: 'newInstances' stamp: 'Ji 6/1/2017 19:32:41'!
zeroMeters
	^ DistanceUnits initializeWith: 0 asUnit: Metro initialize! !


!classDefinition: #Unit category: #'Distance-Solution'!
Object subclass: #Unit
	instanceVariableNames: 'conversionFactor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Unit methodsFor: 'printing' stamp: 'Ji 6/1/2017 19:22:46'!
printString
	^ self subclassResponsibility ! !


!Unit methodsFor: 'comparing' stamp: 'jak 6/1/2017 19:52:32'!
= anotherUnit
	^(self class = anotherUnit class) and: [self convertionFactor = anotherUnit convertionFactor]! !


!Unit methodsFor: 'conversion' stamp: 'jak 6/1/2017 20:35:16'!
convert: quantity to: aUnit
	^quantity * conversionFactor * (1 / aUnit convertionFactor )! !

!Unit methodsFor: 'conversion' stamp: 'Ji 5/30/2017 21:40:30'!
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

!Centimetro methodsFor: 'initialization' stamp: 'Ji 5/30/2017 21:42:05'!
initialize
	conversionFactor _ 1/100! !


!Centimetro methodsFor: 'printing' stamp: 'Ji 6/1/2017 19:23:38'!
printString
	^ 'centimeter'! !


!classDefinition: #Decametro category: #'Distance-Solution'!
Unit subclass: #Decametro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Decametro methodsFor: 'initialization' stamp: 'Ji 6/1/2017 19:25:11'!
initialize
	conversionFactor  _ 10! !


!Decametro methodsFor: 'printing' stamp: 'Ji 6/1/2017 19:25:17'!
printString
	^ 'decameter'! !


!classDefinition: #Decimetro category: #'Distance-Solution'!
Unit subclass: #Decimetro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Decimetro methodsFor: 'initialization' stamp: 'Ji 6/1/2017 19:24:32'!
initialize
	conversionFactor _ 1/10! !


!Decimetro methodsFor: 'printing' stamp: 'Ji 6/1/2017 19:24:44'!
printString
	^ 'decimeter'! !


!classDefinition: #Hectometro category: #'Distance-Solution'!
Unit subclass: #Hectometro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Hectometro methodsFor: 'initialization' stamp: 'Ji 6/1/2017 19:25:39'!
initialize
	conversionFactor  _ 100! !


!Hectometro methodsFor: 'printing' stamp: 'Ji 6/1/2017 19:25:35'!
printString
	^ 'hectometer'! !


!classDefinition: #Kilometro category: #'Distance-Solution'!
Unit subclass: #Kilometro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Kilometro methodsFor: 'initialization' stamp: 'Ji 5/30/2017 21:47:39'!
initialize
	conversionFactor _ 1000! !


!Kilometro methodsFor: 'printing' stamp: 'Ji 6/1/2017 19:23:30'!
printString
	^ 'kilometer'! !


!classDefinition: #Metro category: #'Distance-Solution'!
Unit subclass: #Metro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Metro methodsFor: 'initialization' stamp: 'Ji 5/30/2017 21:41:33'!
initialize
	conversionFactor  _ 1! !


!Metro methodsFor: 'printing' stamp: 'Ji 6/1/2017 19:23:21'!
printString
	^ 'meter'! !


!classDefinition: #Milimetro category: #'Distance-Solution'!
Unit subclass: #Milimetro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!Milimetro methodsFor: 'initialization' stamp: 'Ji 5/30/2017 21:46:20'!
initialize
	conversionFactor _ 1/1000! !


!Milimetro methodsFor: 'printing' stamp: 'Ji 6/1/2017 19:23:14'!
printString
	^ 'milimeter'! !

Unit initialize!