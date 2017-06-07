!classDefinition: #Measure category: #'Measure-Solution'!
Magnitude subclass: #Measure
	instanceVariableNames: 'quantity unitType'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!Measure methodsFor: 'comparing' stamp: 'JI 6/6/2017 15:30:03'!
< aMeasure
	^ quantity <  ( aMeasure amountAsUnit: unitType )! !

!Measure methodsFor: 'comparing' stamp: 'JI 6/6/2017 14:01:22'!
= aMeasure

	^ quantity = (aMeasure amountAsUnit: unitType )! !

!Measure methodsFor: 'comparing' stamp: 'JI 6/6/2017 12:52:09'!
hash
	^ self amount  ! !


!Measure methodsFor: 'operating' stamp: 'JI 6/6/2017 12:46:41'!
* aSmallInteger 

	^ self class initializeWith: ( quantity * aSmallInteger ) asUnit: unitType ! !

!Measure methodsFor: 'operating' stamp: 'JI 6/6/2017 12:57:30'!
+ aMeasure

	^  self class initializeWith: (quantity + (aMeasure amountAsUnit: unitType) )  asUnit: unitType .! !

!Measure methodsFor: 'operating' stamp: 'JI 6/6/2017 15:41:38'!
- aMeasure
	^ self + ( aMeasure convertTo: unitType) negated! !

!Measure methodsFor: 'operating' stamp: 'JI 6/6/2017 12:44:42'!
/ aSmallInteger 
	^ self * (1/aSmallInteger )! !

!Measure methodsFor: 'operating' stamp: 'JI 6/6/2017 12:31:36'!
adaptToNumber: aNumber andSend: selector 
	^self perform: selector with: aNumber.! !

!Measure methodsFor: 'operating' stamp: 'JI 6/6/2017 12:47:15'!
negated
	^ self class initializeWith:  0 - quantity asUnit: unitType ! !


!Measure methodsFor: 'interval' stamp: 'JI 6/6/2017 17:47:52'!
to: aDistance
	
	^ IntervalOfMeasure from: self to: aDistance ! !

!Measure methodsFor: 'interval' stamp: 'JI 6/6/2017 17:49:31'!
to: aDistance by: stepDistance 
	
	^ IntervalOfMeasure from: self to: aDistance  by: stepDistance ! !

!Measure methodsFor: 'interval' stamp: 'JI 6/6/2017 17:50:13'!
to: aDistance by: steps do: aBlockClosure
	
		^ IntervalOfMeasure from: self to: aDistance  by: steps do: aBlockClosure ! !


!Measure methodsFor: 'initialization' stamp: 'JI 6/6/2017 12:31:36'!
initializeWith: aSmallInteger asUnit: anUnitType 
	unitType _ anUnitType.
	quantity _ aSmallInteger .! !


!Measure methodsFor: 'inspecting' stamp: 'JI 6/6/2017 15:29:30'!
amount


	^ quantity ! !

!Measure methodsFor: 'inspecting' stamp: 'JI 6/6/2017 12:31:36'!
unit
	^ unitType! !


!Measure methodsFor: 'conversion' stamp: 'JI 6/6/2017 15:30:27'!
amountAsUnit: unitType
	^  (self convertTo: unitType) amount ! !

!Measure methodsFor: 'conversion' stamp: 'JI 6/6/2017 15:32:28'!
convertTo: aUnit
	^ Measure initializeWith: ( unitType convert: quantity to: aUnit)  asUnit: aUnit ! !


!Measure methodsFor: 'printing' stamp: 'JI 6/6/2017 12:31:36'!
printString
	|extraS|
	extraS := String new.
	quantity > 1 ifTrue: [extraS := 's'].
	^ quantity printString, ' ' , unitType printString, extraS ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Measure class' category: #'Measure-Solution'!
Measure class
	instanceVariableNames: 'quantity'!

!Measure class methodsFor: 'class initialization' stamp: 'JI 6/6/2017 12:31:36'!
initializeWith: aSmallInteger asUnit: anUnitType
	
	^self new initializeWith: aSmallInteger asUnit: anUnitType .! !


!classDefinition: #TestsCurrency category: #'Measure-Solution'!
TestCase subclass: #TestsCurrency
	instanceVariableNames: 'onePeso zeroPeso oneDolar twoDolars threeDolars twoPesos minusOneDolar oneAndHalfDolars'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!TestsCurrency methodsFor: 'Tests +' stamp: 'JAK 6/6/2017 20:35:36'!
test001CurrencyPlusAnotherCurrency

	self assert: onePeso + zeroPeso = onePeso.
	self assert: oneDolar + twoDolars = threeDolars.! !


!TestsCurrency methodsFor: 'Tests -' stamp: 'JAK 6/6/2017 20:40:20'!
test001CurrencyMinusAnotherCurrency
	
	self assert: twoPesos - onePeso = onePeso.
	self assert: oneDolar - twoDolars = minusOneDolar.
! !


!TestsCurrency methodsFor: 'Test * y /' stamp: 'JAK 6/6/2017 20:42:12'!
test001ACurrencyMultiplyByNumber
	self assert: twoPesos * 1 = (1*twoPesos ).
	self assert: twoDolars * 1.5 = threeDolars .
! !

!TestsCurrency methodsFor: 'Test * y /' stamp: 'JAK 6/6/2017 20:43:34'!
test002ACurrencyDivideByNumber
	self assert: threeDolars / 2 = oneAndHalfDolars.
	self assert: twoPesos / 2 = onePeso .
! !


!TestsCurrency methodsFor: 'setUp' stamp: 'JAK 6/6/2017 20:43:50'!
setUp
	onePeso := Measure initializeWith: 1 asUnit: UnitCurrency initializePeso.
	zeroPeso := Measure initializeWith: 0 asUnit: UnitCurrency initializePeso.
	oneDolar := Measure initializeWith: 1 asUnit: UnitCurrency initializeDolar.
	twoDolars := Measure initializeWith: 2 asUnit: UnitCurrency initializeDolar.
	threeDolars := Measure initializeWith: 3 asUnit: UnitCurrency initializeDolar.
	twoPesos := Measure initializeWith: 2 asUnit: UnitCurrency initializePeso.
	minusOneDolar := Measure initializeWith: -1 asUnit: UnitCurrency initializeDolar.
	oneAndHalfDolars := Measure initializeWith: 1.5 asUnit: UnitCurrency initializeDolar.! !


!TestsCurrency methodsFor: 'Operating Between Cross Currency' stamp: 'JAK 6/6/2017 21:01:01'!
test001SumOrMinusBetweenCrossCurrencyRaiseError
	self should: [onePeso + oneDolar ]
	raise: Error
	withExceptionDo: [:anError | self assert: anError messageText equals: UnitCurrency canNotOperateBetweenCrossCurrencyinitializePeso ]! !


!classDefinition: #TestsDistance category: #'Measure-Solution'!
TestCase subclass: #TestsDistance
	instanceVariableNames: 'centimetros100 centimetros200 metros1 metros2 metrosOtro1 milimetros1000 milimetros2000 centimetrosOtro100 milimetrosOtro1000 kilometros1Over1000 kilometrosOtro1Over1000 kilometros2Over1000 metros3 metros4 kilometros3Over1000 centimetros300 milimetros3000 kilometros1 kilometrosOtro1 kilometros2 kilometros3 metrosMinus1 metros0 metros30 intervaloVacio intervaloDeKilometros1To2 intervaloDeKilometros2To1 intervaloDeKilometros1To2By100Metros metros100 intervaloDeKilometros2To1By100Metros intervaloDeMetros1To30 intervaloDeMetros30To1 intervaloDeMetros1To30By200Centimetros intervaloDeMetros30To1By200Centimetros intervaloDeCentimetros100To1000 centimetros1000 intervaloDeCentimetros1000To100 intervaloDeCentimetros100To1000By500Milimetros milimetros500 intervaloDeCentimetros1000To100By500Milimetros intervaloDeMilimetros1000To10000 milimetros10000 intervaloDeMilimetros10000To1000 intervaloDeMilimetros1000To10000By1Over1000Kilometro intervaloDeMilimetros10000To1000By1Over1000Kilometro centimetros1 milimetros1 celsius1 celsiusOtro1 celsius2 kekelvin274con15 celsius0 kelvin273con15 celsiusMinus273con15 kelvin0 kelvin274con15 fahrenheit33With8 fahrenheit32 fahrenheitMinus459With67'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!TestsDistance methodsFor: 'DistanceUnits * y /' stamp: 'JI 6/6/2017 12:54:18'!
test001_DistanceMultipliedByANumber
	
	self assert: metros1 * 1 = metrosOtro1 .
	self assert: metros3 * 0 = metros0.
	self assert: centimetros300 * 10 = metros30.! !

!TestsDistance methodsFor: 'DistanceUnits * y /' stamp: 'JI 6/6/2017 12:54:18'!
test002_ANumberMultipliedByADistance
	
	self assert: 1 * metros1 = metrosOtro1 .
	self assert: 0 *metros3 = metros0.
	self assert: 10 * centimetros300  = metros30.! !

!TestsDistance methodsFor: 'DistanceUnits * y /' stamp: 'JI 6/6/2017 12:54:18'!
test003_DistanceDividedByANumber
	
	self assert: metros1 / 1 = metrosOtro1 .
	self assert: centimetros300 * 10 = metros30.
	[metros3 / 0 = metros0]
		on: Error
		do: [ :anError | self assert: (anError class = ZeroDivide)] .
	
	! !


!TestsDistance methodsFor: 'DistanceUnits +' stamp: 'JI 6/6/2017 12:54:18'!
test001_MetroMasKilometro

	self assert: metros1 + kilometros2Over1000 = metros3 . 
	self deny: metros1 + kilometros2Over1000 = metros1 . 
	! !

!TestsDistance methodsFor: 'DistanceUnits +' stamp: 'JI 6/6/2017 12:54:18'!
test002_MetroMasMetro

	self assert: metros1 + metros2 = metros3. 
	self deny: metros1 + metros2 = metros4. 
	! !

!TestsDistance methodsFor: 'DistanceUnits +' stamp: 'JI 6/6/2017 12:54:18'!
test003_MetroMasCentimetro

	self assert: metros1 + centimetros200 = centimetros300 . 
	self deny: metros1 + centimetros200 = centimetros200 . 
	! !

!TestsDistance methodsFor: 'DistanceUnits +' stamp: 'JI 6/6/2017 12:54:18'!
test004_MetroMasMilimetro

	self assert: metros1 + milimetros2000 = milimetros3000 . 
	self deny: metros1 + milimetros2000 = milimetros2000 . 
	! !

!TestsDistance methodsFor: 'DistanceUnits +' stamp: 'JI 6/6/2017 12:54:18'!
test005_CentimetroMasKilometro

	self assert: centimetros100 + kilometros1Over1000 = metros2 . 
	self deny: centimetros200 + kilometros3Over1000 = metros2 . 
	! !

!TestsDistance methodsFor: 'DistanceUnits +' stamp: 'JI 6/6/2017 12:54:18'!
test006_CentimetroMasMetro

	self assert: centimetros100 + metros1 = metros2 . 
	self deny: centimetros200 + metros3 = metros2 . 
	! !

!TestsDistance methodsFor: 'DistanceUnits +' stamp: 'JI 6/6/2017 12:54:18'!
test007_CentimetroMasCentimetro

	self assert: centimetros100 + centimetrosOtro100 = metros2 . 
	self deny: centimetros200 + centimetros300 = metros2 . 
	! !

!TestsDistance methodsFor: 'DistanceUnits +' stamp: 'JI 6/6/2017 12:54:18'!
test008_CentimetroMasMilimetro

	self assert: centimetros100 + milimetros1000 = metros2 . 
	self deny: centimetros200 + milimetros2000 = metros2 . 
	! !

!TestsDistance methodsFor: 'DistanceUnits +' stamp: 'JI 6/6/2017 12:54:18'!
test009_MilimetroMasKilometro

	self assert: milimetros1000 + kilometros1Over1000 = metros2 . 
	self deny: milimetros2000 + kilometros3Over1000 = metros2 . 
	! !

!TestsDistance methodsFor: 'DistanceUnits +' stamp: 'JI 6/6/2017 12:54:18'!
test010_MilimetroMasMetro

	self assert: milimetros1000 + metros1 = metros2 . 
	self deny: milimetros2000 + metros3 = metros2 . 
	! !

!TestsDistance methodsFor: 'DistanceUnits +' stamp: 'JI 6/6/2017 12:54:18'!
test011_MilimetroMasCentimetro

	self assert: milimetros1000 + centimetros100 = metros2 . 
	self deny: milimetros2000 + centimetros300 = metros2 . 
	! !

!TestsDistance methodsFor: 'DistanceUnits +' stamp: 'JI 6/6/2017 12:54:18'!
test012_MilimetroMasMilimetro

	self assert: milimetros1000 + milimetrosOtro1000 = metros2 . 
	self deny: milimetros2000 + milimetros3000 = metros2 . 
	! !

!TestsDistance methodsFor: 'DistanceUnits +' stamp: 'JI 6/6/2017 12:54:18'!
test013_KilometroMasKilometro

	self assert: kilometros1 + kilometrosOtro1 = kilometros2 . 
	self deny: kilometros1 + kilometros3 = kilometrosOtro1Over1000 . 
	! !

!TestsDistance methodsFor: 'DistanceUnits +' stamp: 'JI 6/6/2017 12:54:18'!
test014_KilometroMasMetro

	self assert: kilometros1Over1000 + metros2 = metros3. 
	self deny: kilometros1Over1000 + metros2 = metros1 . 
	! !

!TestsDistance methodsFor: 'DistanceUnits +' stamp: 'JI 6/6/2017 12:54:18'!
test015_KilometroMasCentimetro

	self assert: kilometros1Over1000 + centimetros200 = metros3. 
	self deny: kilometros1Over1000 + centimetros200 = metros1 . 
	! !

!TestsDistance methodsFor: 'DistanceUnits +' stamp: 'JI 6/6/2017 12:54:18'!
test016_KilometroMasMilimetro

	self assert: kilometros1Over1000 + milimetros2000 = metros3. 
	self deny: kilometros1Over1000 + milimetros2000 = metros1 . 
	! !


!TestsDistance methodsFor: 'DistanceUnits -' stamp: 'JI 6/6/2017 12:54:18'!
test001_MetroMenosKilometro

	self assert: metros1 - kilometros2Over1000 = metrosMinus1 . 
	self deny: metros1 - kilometros2Over1000 = metros0 . 
	! !

!TestsDistance methodsFor: 'DistanceUnits -' stamp: 'JI 6/6/2017 12:54:18'!
test002_MetroMenosMetro

	self assert: metros1 - metrosOtro1 = metros0 . 
	self deny: metros3 - metros1 = metros3. 
	! !

!TestsDistance methodsFor: 'DistanceUnits -' stamp: 'JI 6/6/2017 12:54:18'!
test003_MetroMenosCentimetro

	self assert: metros1 - centimetros100 = metros0 . 
	self deny: metros3 - centimetros100 = metros3. 
	! !

!TestsDistance methodsFor: 'DistanceUnits -' stamp: 'JI 6/6/2017 12:54:18'!
test004_MetroMenosMilimetro

	self assert: metros1 - milimetros1000 = metros0 . 
	self deny: metros3 - milimetros1000 = metros3. 
	! !

!TestsDistance methodsFor: 'DistanceUnits -' stamp: 'JI 6/6/2017 12:54:18'!
test005_CentimetroMenosKilometro

	self assert: centimetros100 - kilometros1Over1000 = metros0 . 
	self deny: centimetros300 - kilometros1Over1000 = milimetros3000 . 
	! !

!TestsDistance methodsFor: 'DistanceUnits -' stamp: 'JI 6/6/2017 12:54:18'!
test006_CentimetroMenosMetro

	self assert: centimetros100 - metros1 = metros0 . 
	self deny: centimetros300 - metros1 = milimetros3000 . 
	! !

!TestsDistance methodsFor: 'DistanceUnits -' stamp: 'JI 6/6/2017 12:54:18'!
test007_CentimetroMenosCentimetro

	self assert: centimetros100 - centimetros100 = metros0 . 
	self deny: centimetros300 - centimetros100 = milimetros3000 . 
	! !

!TestsDistance methodsFor: 'DistanceUnits -' stamp: 'JI 6/6/2017 12:54:18'!
test008_CentimetroMenosMilimetro

	self assert: centimetros100 - milimetros1000 = metros0 . 
	self deny: centimetros300 - milimetros1000 = milimetros3000 . 
	! !

!TestsDistance methodsFor: 'DistanceUnits -' stamp: 'JI 6/6/2017 12:54:18'!
test009_MilimetroMenosKilometro

	self assert: milimetros1000 - kilometros1Over1000 = metros0 . 
	self deny: milimetros3000 - kilometros1Over1000 = milimetros3000 . 
	! !

!TestsDistance methodsFor: 'DistanceUnits -' stamp: 'JI 6/6/2017 12:54:18'!
test010_MilimetroMenosMetro

	self assert: milimetros1000 - metros1 = metros0 . 
	self deny: milimetros3000 - metros1 = milimetros3000 . 
	! !

!TestsDistance methodsFor: 'DistanceUnits -' stamp: 'JI 6/6/2017 12:54:18'!
test011_MilimetroMenosCentimetro

	self assert: milimetros1000 - centimetros100 = metros0 . 
	self deny: milimetros3000 - centimetros100 = milimetros3000 . 
	! !

!TestsDistance methodsFor: 'DistanceUnits -' stamp: 'JI 6/6/2017 12:54:18'!
test012_MilimetroMenosMilimetro

	self assert: milimetros1000 - milimetrosOtro1000 = metros0 . 
	self deny: milimetros3000 - milimetrosOtro1000 = milimetros3000 . 
	! !

!TestsDistance methodsFor: 'DistanceUnits -' stamp: 'JI 6/6/2017 12:54:18'!
test013_KilometroMenosKilometro

	self assert: kilometros1Over1000 - kilometrosOtro1Over1000 = metros0 . 
	self deny: kilometros3Over1000 - kilometros1Over1000 = milimetros3000 . 
	! !

!TestsDistance methodsFor: 'DistanceUnits -' stamp: 'JI 6/6/2017 12:54:18'!
test014_KilometroMenosMetro

	self assert: kilometros1Over1000 - metros1 = metros0 . 
	self deny: kilometros3Over1000 - metros1 = milimetros3000 . 
	! !

!TestsDistance methodsFor: 'DistanceUnits -' stamp: 'JI 6/6/2017 12:54:18'!
test015_KilometroMenosCentimetro

	self assert: kilometros1Over1000 - centimetros100 = metros0 . 
	self deny: kilometros3Over1000 - centimetros100 = milimetros3000 . 
	! !

!TestsDistance methodsFor: 'DistanceUnits -' stamp: 'JI 6/6/2017 12:54:18'!
test016_KilometroMenosMilimetro

	self assert: kilometros1Over1000 - milimetros1000 = metros0 . 
	self deny: kilometros3Over1000 - milimetros1000 = milimetros3000 . 
	! !


!TestsDistance methodsFor: 'DistanceUnits =' stamp: 'JI 6/6/2017 12:54:18'!
test001_MetroIgualAMetro
	
	self assert: metros1 = metrosOtro1 .
	self deny: metros1 = metros2.! !

!TestsDistance methodsFor: 'DistanceUnits =' stamp: 'JI 6/6/2017 12:54:18'!
test002_MetroIgualACentimetro
	
	self assert: metros1 = centimetros100 .
	self deny: metros1 = centimetros200 .! !

!TestsDistance methodsFor: 'DistanceUnits =' stamp: 'JI 6/6/2017 12:54:18'!
test003_MetroIgualAMilimetro
	
	self assert: metros1 = milimetros1000 .
	self deny: metros1 = milimetros2000 .! !

!TestsDistance methodsFor: 'DistanceUnits =' stamp: 'JI 6/6/2017 12:54:18'!
test004_MetroIgualAKilometro
	
	self assert: metros1 = kilometros1Over1000 .
	self deny: metros1 = kilometros2Over1000 .! !

!TestsDistance methodsFor: 'DistanceUnits =' stamp: 'JI 6/6/2017 12:54:18'!
test005_CentimetroIgualAMetro
	
	self assert: centimetros100 = metros1 .
	self deny: centimetros100 = metros2.! !

!TestsDistance methodsFor: 'DistanceUnits =' stamp: 'JI 6/6/2017 12:54:18'!
test006_CentimetroIgualACentimetro
	
	self assert: centimetros100 = centimetrosOtro100 .
	self deny: centimetros100 = centimetros200.! !

!TestsDistance methodsFor: 'DistanceUnits =' stamp: 'JI 6/6/2017 12:54:18'!
test007_CentimetroIgualAMilimetro
	
	self assert: centimetros100 = milimetros1000 .
	self deny: centimetros100 = milimetros2000 .! !

!TestsDistance methodsFor: 'DistanceUnits =' stamp: 'JI 6/6/2017 12:54:18'!
test008_CentimetroIgualAKilometro
	
	self assert: centimetros100 = kilometros1Over1000 .
	self deny: centimetros100 = kilometros2Over1000 .! !

!TestsDistance methodsFor: 'DistanceUnits =' stamp: 'JI 6/6/2017 12:54:18'!
test009_MilimetroIgualAKilometro
	
	self assert: milimetros1000 = kilometros1Over1000 .
	self deny: milimetros2000 = kilometros1Over1000 .! !

!TestsDistance methodsFor: 'DistanceUnits =' stamp: 'JI 6/6/2017 12:54:18'!
test010_MilimetroIgualAMetro
	
	self assert: milimetros1000 = metros1 .
	self deny: milimetros1000 = metros2 .! !

!TestsDistance methodsFor: 'DistanceUnits =' stamp: 'JI 6/6/2017 12:54:18'!
test011_MilimetroIgualACentimetro
	
	self assert: milimetros1000 = centimetros100 .
	self deny: milimetros1000 = centimetros200 .! !

!TestsDistance methodsFor: 'DistanceUnits =' stamp: 'JI 6/6/2017 12:54:18'!
test012_MilimetroIgualAMilimetro
	
	self assert: milimetros1000 = milimetrosOtro1000 .
	self deny: milimetros1000 = milimetros2000 .! !

!TestsDistance methodsFor: 'DistanceUnits =' stamp: 'JI 6/6/2017 12:54:18'!
test013_KilometroIgualAKilometro
	
	self assert: kilometros1Over1000 = kilometrosOtro1Over1000 .
	self deny: kilometros1Over1000 = kilometros2Over1000 .! !

!TestsDistance methodsFor: 'DistanceUnits =' stamp: 'JI 6/6/2017 12:54:18'!
test014_KilometroIgualAMetro
	
	self assert: kilometros1Over1000 = metros1 .
	self deny: kilometros1Over1000 = metros2 .! !

!TestsDistance methodsFor: 'DistanceUnits =' stamp: 'JI 6/6/2017 12:54:18'!
test015_KilometroIgualACentimetro
	
	self assert: kilometros1Over1000 = centimetros100 .
	self deny: kilometros1Over1000 = centimetros200 .! !

!TestsDistance methodsFor: 'DistanceUnits =' stamp: 'JI 6/6/2017 12:54:18'!
test016_KilometroIgualAMilimetro
	
	self assert: kilometros1Over1000 = milimetros1000 .
	self deny: kilometros1Over1000 = milimetros2000 .! !


!TestsDistance methodsFor: 'DistanceUnits Comparison' stamp: 'JI 6/6/2017 12:54:18'!
test001_DistanceLessDistance
	
	self deny: metros1 < centimetros100 .
	self assert: milimetros1000 < kilometros2Over1000 .
	self deny: kilometros1Over1000 < metros0.! !

!TestsDistance methodsFor: 'DistanceUnits Comparison' stamp: 'JI 6/6/2017 12:54:18'!
test002_DistanceLessOrEqualDistance
	
	self assert: metros1 <= centimetros100 .
	self assert: milimetros1000 <= kilometros2Over1000 .
	self deny: kilometros1Over1000 <= metros0.! !

!TestsDistance methodsFor: 'DistanceUnits Comparison' stamp: 'JI 6/6/2017 12:54:18'!
test003_DistanceGreaterThanDistance
	
	self deny: metros1 > centimetros100 .
	self deny: milimetros1000 > kilometros2Over1000 .
	self assert: kilometros1Over1000 > metros0.! !

!TestsDistance methodsFor: 'DistanceUnits Comparison' stamp: 'JI 6/6/2017 12:54:18'!
test004_DistanceGreaterOrEqualThanDistance
	
	self assert: metros1 >= centimetros100 .
	self deny: milimetros1000 >= kilometros2Over1000 .
	self assert: kilometros1Over1000 >= metros0.! !


!TestsDistance methodsFor: 'Interval' stamp: 'JI 6/6/2017 17:55:00'!
test001_IntervaloVacio
	
	intervaloVacio _ IntervalOfMeasure intervaloVacio .
 	self assert: intervaloVacio size = 0.! !

!TestsDistance methodsFor: 'Interval' stamp: 'JI 6/6/2017 17:55:19'!
test002_IntervaloFromToDeDistanciasPositivas
	
	| i |
	
	i _ kilometros1 .
	intervaloDeKilometros1To2 do: [ :aDistance | 
		self assert: aDistance = i.
		i _ i+ kilometros1 .].
	self assert: intervaloDeKilometros1To2 size = 2.
	
	i _ metros1.
	intervaloDeMetros1To30 do: [ :aDistance | 
		self assert: aDistance = i.
		i _ i+metros1.].
	self assert: intervaloDeMetros1To30 size =30.
	
	i _ centimetros100 .
	intervaloDeCentimetros100To1000 do: [ :aDistance | 
		self assert: aDistance  = i.
		i _ i+centimetros1.].
	self assert: intervaloDeCentimetros100To1000 size = 901.
	
	i _ milimetros1000 .
	intervaloDeMilimetros1000To10000 do: [ :aDistance  | 
		self assert: aDistance  = i.
		i _ i+ milimetros1 .].
	self assert: intervaloDeMilimetros1000To10000 size =9001.
	! !

!TestsDistance methodsFor: 'Interval' stamp: 'JI 6/6/2017 17:55:25'!
test003_IntervaloFromToDeDistanciasNegativas
	
	| i |
	
	i _ kilometros2 .
	intervaloDeKilometros2To1 do: [ :aDistance | 
		self assert: aDistance = i.
		i _ i-kilometros1 .].
	self assert: intervaloDeKilometros2To1 size =2.
	
	i _ metros30.
	intervaloDeMetros30To1 do: [ :aDistance  | 
		self assert: aDistance  = i.
		i _ i-metros1.].
	self assert: intervaloDeMetros30To1 size =30.
	
	i _ centimetros1000 .
	intervaloDeCentimetros1000To100 do: [ :aDistance | 
		self assert: aDistance  = i.
		i _ i-centimetros1 .].
	self assert: intervaloDeCentimetros1000To100 size =901.
	
	i _ milimetros10000 .
	intervaloDeMilimetros10000To1000 do: [ :aDistance  | 
		self assert: aDistance  = i.
		i _ i-milimetros1 .].
	self assert: intervaloDeMilimetros10000To1000 size =9001.
	! !

!TestsDistance methodsFor: 'Interval' stamp: 'JI 6/6/2017 17:55:31'!
test004_IntervaloFromToByDeDistanciasPositivas
	
	| i |
	
	i _ kilometros1 .
	intervaloDeKilometros1To2By100Metros do: [ :aDistance | 
		self assert: aDistance = i.
		i _ i+metros100 .].
	self assert: intervaloDeKilometros1To2By100Metros size =11.
	
	i _ metros1.
	intervaloDeMetros1To30By200Centimetros do: [ :aDistance  | 
		self assert: aDistance  = i.
		i _ i+centimetros200 .].
	self assert: intervaloDeMetros1To30By200Centimetros size =15.
	
	i _ centimetros100 .
	intervaloDeCentimetros100To1000By500Milimetros do: [ :aDistance  | 
		self assert: aDistance  = i.
		i _ i+milimetros500 .].
	self assert: intervaloDeCentimetros100To1000By500Milimetros size =19.
	
	i _ milimetros1000 .
	intervaloDeMilimetros1000To10000By1Over1000Kilometro do: [ :aDistance  | 
		self assert: aDistance  = i.
		i _ i+kilometros1Over1000 .].
	self assert: intervaloDeMilimetros1000To10000By1Over1000Kilometro size =10.
	
	! !

!TestsDistance methodsFor: 'Interval' stamp: 'JI 6/6/2017 17:55:38'!
test005_IntervaloFromToByDeDistanciasNegativas
	
	| i |
	
	i _ kilometros2 .
	intervaloDeKilometros2To1By100Metros do: [ :aDistance | 
		self assert: aDistance = i.
		i _ i-metros100.].
	self assert: intervaloDeKilometros2To1By100Metros size =11.
	
	i _ metros30.
	intervaloDeMetros30To1By200Centimetros do: [ :aDistance   | 
		self assert: aDistance   = i.
		i _ i-centimetros200 .].
	self assert: intervaloDeMetros30To1By200Centimetros size =15.
	
	i _ centimetros1000 .
	intervaloDeCentimetros1000To100By500Milimetros do: [ :aDistance   | 
		self assert: aDistance   = i.
		i _ i-milimetros500 .].
	self assert: intervaloDeCentimetros1000To100By500Milimetros size =19.
	
	i _ milimetros10000 .
	intervaloDeMilimetros10000To1000By1Over1000Kilometro do: [ :aDistance | 
		self assert: aDistance  = i.
		i _ i-kilometros1Over1000 .].
	self assert: intervaloDeMilimetros10000To1000By1Over1000Kilometro size =10.
	
	! !

!TestsDistance methodsFor: 'Interval' stamp: 'JI 6/6/2017 17:56:02'!
test006_IntervaloFromToByDoDeDistancias
	
	| i |
	
	i _ kilometros1 .
	kilometros1  to:  kilometros2 by: metros100 do: [ :aDistance | 
		self assert: aDistance = i.
		i _ i+metros100 .].
	
	i _ metros1 .
	metros1  to: metros30 by: centimetros200 do: [ :aDistance | 
		self assert: aDistance = i.
		i _ i+centimetros200 .].
	
	i _ centimetros100 .
	centimetros100  to: centimetros1000 by: milimetros500 do: [ :aDistance | 
		self assert: aDistance = i.
		i _ i+milimetros500 .].
	
	i _ milimetros1000 .
	milimetros1000  to: milimetros10000 by: kilometros1Over1000 do: [ :aDistance | 
		self assert: aDistance = i.
		i _ i+kilometros1Over1000 .].
	
	! !


!TestsDistance methodsFor: 'SetUp' stamp: 'JI 6/6/2017 13:50:40'!
centimetrosSetUp

	centimetros1 _ Measure initializeWith: 1 asUnit: UnitDistance initializeCentimetro  .	
	centimetros100 _ Measure initializeWith: 100 asUnit: UnitDistance initializeCentimetro .	
	centimetrosOtro100 _ Measure initializeWith: 100 asUnit: UnitDistance initializeCentimetro .	
	centimetros200 _ Measure initializeWith: 200 asUnit:  UnitDistance initializeCentimetro .	
	centimetros300 _ Measure initializeWith: 300 asUnit: UnitDistance initializeCentimetro .	
	centimetros1000 _ Measure initializeWith: 1000 asUnit:  UnitDistance initializeCentimetro .		! !

!TestsDistance methodsFor: 'SetUp' stamp: 'JI 6/6/2017 17:54:45'!
intervalosSetUp
	
	intervaloVacio _ IntervalOfMeasure intervaloVacio.
	
	intervaloDeKilometros1To2 _ kilometros1 to: kilometros2 .
	intervaloDeKilometros2To1 _ kilometros2 to: kilometros1 .
	intervaloDeKilometros1To2By100Metros _ kilometros1 to: kilometros2 by: metros100.
	intervaloDeKilometros2To1By100Metros _ kilometros2 to: kilometros1 by: metros100 negated .
	
	intervaloDeMetros1To30 _ metros1  to: metros30  .
	intervaloDeMetros30To1 _ metros30 to:  metros1 .
	intervaloDeMetros1To30By200Centimetros _ metros1  to: metros30 by: centimetros200 .
	intervaloDeMetros30To1By200Centimetros _ metros30  to: metros1 by: centimetros200  negated.

	
	intervaloDeCentimetros100To1000 _ centimetros100  to: centimetros1000  .
	intervaloDeCentimetros1000To100 _ centimetros1000 to: centimetros100 .
	intervaloDeCentimetros100To1000By500Milimetros _ centimetros100 to: centimetros1000 by: milimetros500.
	intervaloDeCentimetros1000To100By500Milimetros _ centimetros1000 to: centimetros100 by: milimetros500  negated.
	
	
	intervaloDeMilimetros1000To10000 _ milimetros1000  to: milimetros10000.
	intervaloDeMilimetros10000To1000 _ milimetros10000 to: milimetros1000 .
	intervaloDeMilimetros1000To10000By1Over1000Kilometro  _ milimetros1000 to: milimetros10000 by: kilometros1Over1000 .
	intervaloDeMilimetros10000To1000By1Over1000Kilometro  _ milimetros10000 to: milimetros1000 by: kilometros1Over1000  negated.


	
	! !

!TestsDistance methodsFor: 'SetUp' stamp: 'JI 6/6/2017 13:50:22'!
kilometrosSetUp

	kilometros1Over1000 _ Measure initializeWith: 1/1000 asUnit: UnitDistance initializeKilometro .
	kilometrosOtro1Over1000 _ Measure initializeWith: 1/1000 asUnit: UnitDistance initializeKilometro .
	kilometros2Over1000 _  Measure initializeWith: 2/1000 asUnit: UnitDistance initializeKilometro .
	kilometros3Over1000 _  Measure initializeWith: 3/1000 asUnit: UnitDistance initializeKilometro .
	kilometros1 _ Measure initializeWith: 1 asUnit: UnitDistance initializeKilometro .
	kilometrosOtro1 _ Measure initializeWith: 1 asUnit: UnitDistance initializeKilometro .
	kilometros2 _ Measure initializeWith: 2 asUnit: UnitDistance initializeKilometro .
	kilometros3 _ Measure initializeWith: 3 asUnit: UnitDistance initializeKilometro .
	! !

!TestsDistance methodsFor: 'SetUp' stamp: 'JI 6/6/2017 13:50:32'!
metrosSetUp
	
	metrosMinus1 _ Measure initializeWith: -1 asUnit: UnitDistance initializeMetro .
	metros0 _ Measure initializeWith: 0 asUnit: UnitDistance initializeMetro .
	metros1 _ Measure initializeWith: 1 asUnit:  UnitDistance initializeMetro .
	metrosOtro1 _ Measure initializeWith: 1 asUnit:  UnitDistance initializeMetro .
	metros2 _ Measure initializeWith: 2 asUnit: UnitDistance initializeMetro .
	metros3 _ Measure initializeWith: 3 asUnit: UnitDistance initializeMetro .
	metros4 _ Measure initializeWith: 4 asUnit:  UnitDistance initializeMetro .
	metros30 _ Measure initializeWith: 30 asUnit: UnitDistance initializeMetro .
	metros100 _ Measure initializeWith: 100 asUnit: UnitDistance initializeMetro .! !

!TestsDistance methodsFor: 'SetUp' stamp: 'JI 6/6/2017 13:50:59'!
milimetrosSetUp
	
	milimetros1 _ Measure initializeWith: 1 asUnit: UnitDistance initializeMilimetro .
	milimetros500 _ Measure initializeWith: 500 asUnit: UnitDistance initializeMilimetro .	
	milimetros1000 _ Measure initializeWith: 1000 asUnit: UnitDistance initializeMilimetro .
	milimetrosOtro1000 _ Measure initializeWith: 1000 asUnit: UnitDistance initializeMilimetro .
	milimetros2000 _  Measure initializeWith: 2000 asUnit:  UnitDistance initializeMilimetro .
	milimetros3000 _  Measure initializeWith: 3000 asUnit:  UnitDistance initializeMilimetro .
	milimetros10000 _  Measure initializeWith: 10000 asUnit:  UnitDistance initializeMilimetro .
	! !

!TestsDistance methodsFor: 'SetUp' stamp: 'JI 6/6/2017 17:52:48'!
setUp
	self kilometrosSetUp .
	self metrosSetUp.
	self centimetrosSetUp .
	self milimetrosSetUp .
	self intervalosSetUp .
	! !


!classDefinition: #TestsLiquid category: #'Measure-Solution'!
TestCase subclass: #TestsLiquid
	instanceVariableNames: 'gramo1 otroGramo1 gramo1000 otroGramo1000 kilogramo1Over1000 kilogramo1 hectogramo1Over100 decagramo1Over10 miligramo1000 centigramo100 decigramo10 gramo2 gramo2000 gramo0 kilogramo3Over1000 gramo30 decigramo3 centilitro100 decalitro1Over10 decilitro3 decilitro10 litro0 litro1 otroLitro1 litro2 litro30 litro1000 otroLitro1000 litro2000 hectolitro1Over100 kilolitro1 kilolitro1Over1000 kilolitro3Over1000 mililitro1000'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!TestsLiquid methodsFor: 'Tests -' stamp: 'Ji 6/6/2017 20:33:39'!
test001CualquierLiquidoRestaCualquierLiquido

	self assert: mililitro1000 - otroLitro1 = litro0.
	self assert: centilitro100 - mililitro1000 = litro0.
	self assert: decilitro10 - litro1 = litro0.
	self assert: litro1000 - kilolitro1 = litro0.
	self assert: decalitro1Over10 - hectolitro1Over100 = litro0.
	self assert: hectolitro1Over100 - kilolitro1Over1000 = litro0.
	self assert: kilolitro3Over1000 - litro1 = litro2.
	! !


!TestsLiquid methodsFor: 'Tests +' stamp: 'Ji 6/6/2017 20:36:02'!
test001CualquierLiquidoSumaCualquierLiquido

	self assert: mililitro1000 + otroLitro1 = litro2.
	self assert: centilitro100 + mililitro1000 = litro2.
	self assert: decilitro10 + litro1 = litro2.
	self assert: litro1000 + kilolitro1 = litro2000.
	self assert: decalitro1Over10 + hectolitro1Over100 = litro2.
	self assert: hectolitro1Over100 + kilolitro1Over1000 = litro2.
	self assert: kilolitro1Over1000 + litro1 = litro2.
	! !


!TestsLiquid methodsFor: 'Tests =' stamp: 'Ji 6/6/2017 20:36:29'!
test001IgualdadEntreLitros

	self assert: litro1 = otroLitro1 .
	self assert: litro1000 = otroLitro1000 .
	self deny: litro1 = litro1000 .! !

!TestsLiquid methodsFor: 'Tests =' stamp: 'Ji 6/6/2017 20:37:38'!
test002IgualdadCualquierMagnitudDeLiquidoConCualquierMagnitudDeLiquido

	self assert: mililitro1000 = otroLitro1 .
	self assert: centilitro100 = mililitro1000 .
	self assert: decilitro10 = litro1 .
	self assert: litro1000 = kilolitro1 .
	self assert: decalitro1Over10 = hectolitro1Over100 .
	self assert: hectolitro1Over100 = kilolitro1Over1000 .
	self assert: kilolitro1Over1000 = litro1.
	! !


!TestsLiquid methodsFor: 'Tests * y /' stamp: 'Ji 6/6/2017 20:38:05'!
test001_ALiquidMultipliedByANumberWorks
	
	self assert: litro1 * 1 = litro1 .
	self assert: litro2 * 0 = litro0.
	self assert: kilolitro3Over1000 * 10 = litro30.! !

!TestsLiquid methodsFor: 'Tests * y /' stamp: 'Ji 6/6/2017 20:38:31'!
test002_ANumberMultipliedByALiquidWorks
	
	self assert: 1 * litro1  = litro1 .
	self assert: 0 * litro2  = litro0.
	self assert: 10 *kilolitro3Over1000  = litro30.! !

!TestsLiquid methodsFor: 'Tests * y /' stamp: 'Ji 6/6/2017 20:38:52'!
test003_ALiquidDividedByANumberWorks
	
	self assert: litro1 / 1 = litro1 .
	self assert: litro2 / 2 = litro1.
	self assert: kilolitro3Over1000 / 10 = decilitro3.! !


!TestsLiquid methodsFor: 'Tests comparison' stamp: 'Ji 6/6/2017 20:39:13'!
test001LesserThanInLiquidWorks
	
	self assert: litro1  < litro1000 .
	self deny: litro1 < litro1.
	self deny: kilolitro1 < litro1! !

!TestsLiquid methodsFor: 'Tests comparison' stamp: 'Ji 6/6/2017 20:39:33'!
test002LesserOrEqualsThanInLiquidWorks
	
	self assert: litro1  <= litro1000 .
	self assert: litro1 <= litro1.
	self deny: kilolitro1 <= litro1! !

!TestsLiquid methodsFor: 'Tests comparison' stamp: 'Ji 6/6/2017 20:39:57'!
test003GreaterThanInLiquidWorks
	
	self deny: litro1  > litro1000 .
	self deny: litro1 > litro1.
	self assert: kilolitro1 > litro1! !

!TestsLiquid methodsFor: 'Tests comparison' stamp: 'Ji 6/6/2017 20:40:23'!
test004GreaterOrEqualsThanInLiquidWorks
	
	self deny: litro1  >= litro1000 .
	self assert: litro1 >= litro1.
	self assert: kilolitro1 >= litro1! !


!TestsLiquid methodsFor: 'setUp' stamp: 'Ji 6/6/2017 20:26:33'!
centilitrosSetUp
	
	centilitro100 _ Measure initializeWith: 100 asUnit: UnitLiquid initializeCentilitro.! !

!TestsLiquid methodsFor: 'setUp' stamp: 'Ji 6/6/2017 20:27:01'!
decalitrosSetUp
	
	decalitro1Over10 _ Measure initializeWith: 1/10 asUnit: UnitLiquid initializeDecalitro.! !

!TestsLiquid methodsFor: 'setUp' stamp: 'Ji 6/6/2017 20:27:43'!
decilitrosSetUp
	
	decilitro3 _ Measure initializeWith: 3 asUnit: UnitLiquid initializeDecilitro.
	decilitro10 _ Measure initializeWith: 10 asUnit: UnitLiquid initializeDecilitro.! !

!TestsLiquid methodsFor: 'setUp' stamp: 'Ji 6/6/2017 20:30:18'!
hectolitrosSetUp
	
	hectolitro1Over100 _ Measure initializeWith: 1/100 asUnit: UnitLiquid initializeHectolitro.! !

!TestsLiquid methodsFor: 'setUp' stamp: 'Ji 6/6/2017 20:45:26'!
kilolitrosSetUp
	
	kilolitro1 _ Measure initializeWith: 1 asUnit: UnitLiquid initializeKilolitro.
	kilolitro1Over1000 _ Measure initializeWith: 1/1000 asUnit: UnitLiquid initializeKilolitro.
	kilolitro3Over1000 _ Measure initializeWith: 3/1000 asUnit: UnitLiquid initializeKilolitro.
	
! !

!TestsLiquid methodsFor: 'setUp' stamp: 'Ji 6/6/2017 20:29:09'!
litrosSetUp
	
	litro0 _ Measure initializeWith: 0 asUnit: UnitLiquid initializeLitro.
	litro1 _ Measure initializeWith: 1 asUnit: UnitLiquid initializeLitro.
	otroLitro1 _ Measure initializeWith: 1 asUnit: UnitLiquid initializeLitro.
	litro2 _ Measure initializeWith: 2 asUnit: UnitLiquid initializeLitro.
	litro30 _ Measure initializeWith: 30 asUnit: UnitLiquid initializeLitro.
	litro1000 _ Measure initializeWith: 1000 asUnit: UnitLiquid initializeLitro.
	otroLitro1000 _ Measure initializeWith: 1000 asUnit: UnitLiquid initializeLitro.
	litro2000 _ Measure initializeWith: 2000 asUnit: UnitLiquid initializeLitro.! !

!TestsLiquid methodsFor: 'setUp' stamp: 'Ji 6/6/2017 20:24:31'!
miligramosSetUp
	
	miligramo1000 _ Measure initializeWith: 1000 asUnit: UnitMass initializeMiligramo.! !

!TestsLiquid methodsFor: 'setUp' stamp: 'Ji 6/6/2017 20:45:13'!
mililitrosSetUp
	
	mililitro1000 _ Measure initializeWith: 1000 asUnit: UnitLiquid initializeMililitro.! !

!TestsLiquid methodsFor: 'setUp' stamp: 'Ji 6/6/2017 20:31:43'!
setUp
	self mililitrosSetUp.
	self centilitrosSetUp .
	self decilitrosSetUp .
	self litrosSetUp .
	self decalitrosSetUp .
	self hectolitrosSetUp .
	self kilolitrosSetUp .
	! !


!classDefinition: #TestsMass category: #'Measure-Solution'!
TestCase subclass: #TestsMass
	instanceVariableNames: 'gramo1 otroGramo1 gramo1000 otroGramo1000 kilogramo1Over1000 kilogramo1 hectogramo1Over100 decagramo1Over10 miligramo1000 centigramo100 decigramo10 gramo2 gramo2000 gramo0 kilogramo3Over1000 gramo30 decigramo3'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!TestsMass methodsFor: 'Tests -' stamp: 'Ji 6/6/2017 20:08:22'!
test001CualquierMasaRestaCualquierMasa

	self assert: miligramo1000 - otroGramo1 = gramo0.
	self assert: centigramo100 - miligramo1000 = gramo0.
	self assert: decigramo10 - gramo1 = gramo0.
	self assert: gramo1000 - kilogramo1 = gramo0.
	self assert: decagramo1Over10 - hectogramo1Over100 = gramo0.
	self assert: hectogramo1Over100 - kilogramo1Over1000 =gramo0.
	self assert: kilogramo3Over1000 - gramo1 =gramo2.
	! !


!TestsMass methodsFor: 'Tests +' stamp: 'Ji 6/6/2017 20:05:22'!
test001CualquierMasaSumaCualquierMasa

	self assert: miligramo1000 + otroGramo1 = gramo2.
	self assert: centigramo100 + miligramo1000 =gramo2.
	self assert: decigramo10 + gramo1 =gramo2.
	self assert: gramo1000 + kilogramo1 =gramo2000.
	self assert: decagramo1Over10 + hectogramo1Over100 =gramo2.
	self assert: hectogramo1Over100 + kilogramo1Over1000 =gramo2.
	self assert: kilogramo1Over1000 + gramo1 =gramo2.
	! !


!TestsMass methodsFor: 'Tests =' stamp: 'Ji 6/6/2017 19:27:21'!
test001IgualdadEntreGramos

	self assert: gramo1 = otroGramo1 .
	self assert: gramo1000 = otroGramo1000 .
	self deny: gramo1 = gramo1000 .! !

!TestsMass methodsFor: 'Tests =' stamp: 'Ji 6/6/2017 19:27:17'!
test002IgualdadDeGramoConKilogramo

	self assert: gramo1 = kilogramo1Over1000 .
	self assert: gramo1000 = kilogramo1 .
	self deny: gramo1 = kilogramo1 .! !

!TestsMass methodsFor: 'Tests =' stamp: 'Ji 6/6/2017 19:48:20'!
test003IgualdadGramoConCualquierMagnitudDeMasa

	self assert: gramo1 = otroGramo1 .
	self deny: gramo1 = gramo1000 .
	self assert: gramo1000 = kilogramo1 .
	self deny: gramo1 = kilogramo1 .
	self assert: gramo1 = hectogramo1Over100.
	self deny: gramo1000 = hectogramo1Over100.
	self assert: gramo1 = decagramo1Over10.
	self deny: gramo1000 = decagramo1Over10.
	self assert: gramo1 = miligramo1000.
	self deny: gramo1000 = miligramo1000.
	self assert: gramo1 = centigramo100.
	self deny: gramo1000 = centigramo100.
	self assert: gramo1 = decigramo10.
	self deny: gramo1000 = decigramo10.! !

!TestsMass methodsFor: 'Tests =' stamp: 'Ji 6/6/2017 20:03:25'!
test004IgualdadCualquierMagnitudDeMasaConCualquierMagnitudDeMasa

	self assert: miligramo1000 = otroGramo1 .
	self assert: centigramo100 = miligramo1000 .
	self assert: decigramo10 = gramo1 .
	self assert: gramo1000 = kilogramo1 .
	self assert: decagramo1Over10 = hectogramo1Over100 .
	self assert: hectogramo1Over100 = kilogramo1Over1000 .
	self assert: kilogramo1Over1000 = gramo1.
	! !


!TestsMass methodsFor: 'Tests * y /' stamp: 'Ji 6/6/2017 20:10:36'!
test001_AMassMultipliedByANumberWorks
	
	self assert: gramo1 * 1 = gramo1 .
	self assert: gramo2 * 0 = gramo0.
	self assert: kilogramo3Over1000 * 10 = gramo30.! !

!TestsMass methodsFor: 'Tests * y /' stamp: 'Ji 6/6/2017 20:11:37'!
test002_ANumberMultipliedByAMassWorks
	
	self assert: 1 * gramo1  = gramo1 .
	self assert: 0 * gramo2  = gramo0.
	self assert: 10 *kilogramo3Over1000  = gramo30.! !

!TestsMass methodsFor: 'Tests * y /' stamp: 'Ji 6/6/2017 20:13:08'!
test003_AMassDividedByANumberWorks
	
	self assert: gramo1 / 1 = gramo1 .
	self assert: gramo2 / 2 = gramo1.
	self assert: kilogramo3Over1000 / 10 = decigramo3.! !


!TestsMass methodsFor: 'Tests comparison' stamp: 'Ji 6/6/2017 20:16:43'!
test001LesserThanInMassWorks
	
	self assert: gramo1  < gramo1000 .
	self deny: gramo1 < gramo1.
	self deny: kilogramo1 < gramo1! !

!TestsMass methodsFor: 'Tests comparison' stamp: 'Ji 6/6/2017 20:16:38'!
test002LesserOrEqualsThanInMassWorks
	
	self assert: gramo1  <= gramo1000 .
	self assert: gramo1 <= gramo1.
	self deny: kilogramo1 <= gramo1! !

!TestsMass methodsFor: 'Tests comparison' stamp: 'Ji 6/6/2017 20:17:20'!
test003GreaterThanInMassWorks
	
	self deny: gramo1  > gramo1000 .
	self deny: gramo1 > gramo1.
	self assert: kilogramo1 > gramo1! !

!TestsMass methodsFor: 'Tests comparison' stamp: 'Ji 6/6/2017 20:17:49'!
test004GreaterOrEqualsThanInMassWorks
	
	self deny: gramo1  >= gramo1000 .
	self assert: gramo1 >= gramo1.
	self assert: kilogramo1 >= gramo1! !


!TestsMass methodsFor: 'setUp' stamp: 'Ji 6/6/2017 19:46:54'!
centigramosSetUp
	
	centigramo100 _ Measure initializeWith: 100 asUnit: UnitMass initializeCentigramo.! !

!TestsMass methodsFor: 'setUp' stamp: 'Ji 6/6/2017 19:54:51'!
decagramosSetUp
	
	decagramo1Over10 _ Measure initializeWith: 1/10 asUnit: UnitMass initializeDecagramo.! !

!TestsMass methodsFor: 'setUp' stamp: 'Ji 6/6/2017 20:12:57'!
decigramosSetUp
	
	decigramo3 _ Measure initializeWith: 3 asUnit: UnitMass initializeDecigramo.
	decigramo10 _ Measure initializeWith: 10 asUnit: UnitMass initializeDecigramo.! !

!TestsMass methodsFor: 'setUp' stamp: 'Ji 6/6/2017 20:10:52'!
gramosSetUp
	
	gramo0 _ Measure initializeWith: 0 asUnit: UnitMass initializeGramo.
	gramo1 _ Measure initializeWith: 1 asUnit: UnitMass initializeGramo.
	otroGramo1 _ Measure initializeWith: 1 asUnit: UnitMass initializeGramo.
	gramo2 _ Measure initializeWith: 2 asUnit: UnitMass initializeGramo.
	gramo30 _ Measure initializeWith: 30 asUnit: UnitMass initializeGramo.
	gramo1000 _ Measure initializeWith: 1000 asUnit: UnitMass initializeGramo.
	otroGramo1000 _ Measure initializeWith: 1000 asUnit: UnitMass initializeGramo.
	gramo2000 _ Measure initializeWith: 2000 asUnit: UnitMass initializeGramo.! !

!TestsMass methodsFor: 'setUp' stamp: 'Ji 6/6/2017 19:47:38'!
hectogramosSetUp
	
	hectogramo1Over100 _ Measure initializeWith: 1/100 asUnit: UnitMass initializeHectogramo.! !

!TestsMass methodsFor: 'setUp' stamp: 'Ji 6/6/2017 20:08:51'!
kilogramosSetUp
	
	kilogramo1 _ Measure initializeWith: 1 asUnit: UnitMass initializeKilogramo.
	kilogramo1Over1000 _ Measure initializeWith: 1/1000 asUnit: UnitMass initializeKilogramo.
	kilogramo3Over1000 _ Measure initializeWith: 3/1000 asUnit: UnitMass initializeKilogramo.
	
! !

!TestsMass methodsFor: 'setUp' stamp: 'Ji 6/6/2017 19:46:32'!
miligramosSetUp
	
	miligramo1000 _ Measure initializeWith: 1000 asUnit: UnitMass initializeMiligramo.! !

!TestsMass methodsFor: 'setUp' stamp: 'Ji 6/6/2017 19:54:21'!
setUp
	self miligramosSetUp.
	self centigramosSetUp.
	self decigramosSetUp.
	self gramosSetUp .
	self decagramosSetUp.
	self hectogramosSetUp.
	self kilogramosSetUp.
	! !


!classDefinition: #TestsTemperature category: #'Measure-Solution'!
TestCase subclass: #TestsTemperature
	instanceVariableNames: 'grados unidad celsiusMinus273con15 celsius0 celsius1 celsiusOtro1 celsius2 fahrenheitMinus459With67 fahrenheit32 fahrenheit33With8 kelvin0 kelvin273con15 kelvin274con15 kelvinOtro273con15 fahrenheitOtro32 celsius75 celsiusMinus80 celsiusMinus5 celsius77 kelvin275con15 celsius3 fahrenheit35With6 celsius155 celsiusMinus20 celsiusMinus5Over4 fahrenheit17With8 intervaloVacio intervaloDeCelsius1To10 intervaloDeKelvin1To30 kelvin1 intervaloDefahrenheit32to40 fahrenheit1 celsius10 kelvin30 fahrenheit40 kelvin546Point3 kelvin547Point3 kelvin549Point3 kelvin548Point3 fahrenheit64 fahrenheit65Point8 fahrenheit69Point4 intervaloDeCelsius1To10By2 intervaloDeKelvin1To30By2 kelvin2 intervaloDefahrenheit32to40By2 fahrenheit2 intervaloDeCelsius1To10ByKelvin275Point15 intervaloDeKelvin1To30By2Fahrenheit456Point07 intervaloDefahrenheit32to40ByCelsius1Point8 intervaloDeKelvin1To30By2FahrenheitMinus456Point07 celsius1Point8 fahrenheitMinus456With67 fahrenheitMinus456With07 intervaloDefahrenheit32to40ByCelsiusMinus31Multiplied5Over9 celsiusMinus31Multiplied5Over9 fahrenheit459Point67 celsiusMinus272con15 fahrenheit0 celsiusMinus151Over9 fahrenheit3Point6'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!TestsTemperature methodsFor: 'Tests -' stamp: 'JI 6/6/2017 15:16:23'!
test001_celsiusMenosCelsius

	self assert: celsius0 - celsius0 = celsius0 .
	self assert: celsius1 - celsius0 = celsius1 .
	self assert: celsius3 - celsius1 = celsius2 .
	self assert: celsius75 - celsiusMinus80 = celsius155.! !

!TestsTemperature methodsFor: 'Tests -' stamp: 'JI 6/6/2017 15:16:23'!
test002_celsiusMenosKelvin

	self assert: celsius0 - kelvin273con15 = celsius0 .
	self assert: celsius1 - kelvin273con15 = celsius1 .
	self assert: celsius3 - kelvin274con15 = celsius2 .
	self deny: celsius75 - kelvin275con15 = celsius77.! !

!TestsTemperature methodsFor: 'Tests -' stamp: 'JI 6/6/2017 15:16:23'!
test003_celsiusMenosFahrenheit

	self assert: celsius0 - fahrenheit32 = fahrenheit32 .
	self assert: celsius1 - fahrenheit32 = celsius1 .
	self assert: celsius3 - fahrenheit33With8 = celsius2 .
	self deny: celsius75 - fahrenheit32 = celsius77.! !

!TestsTemperature methodsFor: 'Tests -' stamp: 'JI 6/6/2017 15:46:35'!
test004_kelvinMenosUnaTemperatura

	self assert: kelvin273con15 - fahrenheit32 = fahrenheitMinus459With67 .
	self assert: kelvin274con15 - celsius0 = celsiusMinus272con15 .
	self assert: kelvin275con15 - kelvin274con15 = kelvin1 .
	self deny: kelvin275con15 - fahrenheit32 = celsius77.! !

!TestsTemperature methodsFor: 'Tests -' stamp: 'JI 6/6/2017 15:54:27'!
test005_FahrenheitMenosUnaTemperatura

	self assert: fahrenheit32 - fahrenheit32 = fahrenheit0 .
	self assert: fahrenheit33With8 - celsius0 = celsiusMinus151Over9 .
	self assert: fahrenheit35With6 - kelvin273con15 = fahrenheit3Point6.
	self deny: fahrenheit35With6 - fahrenheit32 = celsius77.! !


!TestsTemperature methodsFor: 'Tests +' stamp: 'JI 6/6/2017 15:16:23'!
test001_celsiusMasCelsius

	self assert: celsius0 + celsius0 = celsius0 .
	self assert: celsius1 + celsius0 = celsius1 .
	self assert: celsius1 + celsiusOtro1 = celsius2 .
	self assert: celsius75 + celsiusMinus80 = celsiusMinus5.! !

!TestsTemperature methodsFor: 'Tests +' stamp: 'JI 6/6/2017 15:16:23'!
test002_celsiusMasKelvin

	self assert: celsius0 + kelvin273con15 = celsius0 .
	self assert: celsius1 + kelvin273con15 = celsius1 .
	self assert: celsius1 + kelvin274con15 = celsius2 .
	self assert: celsius75 + kelvin275con15 = celsius77.! !

!TestsTemperature methodsFor: 'Tests +' stamp: 'JI 6/6/2017 15:16:23'!
test003_celsiusMasFahrenheit

	self assert: celsius0 + fahrenheit32 = fahrenheit32 .
	self assert: celsius1 + fahrenheit32 = celsius1 .
	self assert: celsius1 + fahrenheit33With8 = celsius2 .
	self deny: celsius75 + fahrenheit32 = celsius77.! !

!TestsTemperature methodsFor: 'Tests +' stamp: 'JI 6/6/2017 15:16:23'!
test004_kelvinMasUnaTemperatura

	self assert: kelvin273con15 + fahrenheit32 = kelvin546Point3 .
	self assert: kelvin274con15 + celsius0 = kelvin547Point3 .
	self assert: kelvin275con15 + kelvin274con15 = kelvin549Point3 .
	self deny: kelvin275con15 + fahrenheit32 = kelvin549Point3.! !

!TestsTemperature methodsFor: 'Tests +' stamp: 'JI 6/6/2017 15:16:23'!
test005_FahrenheitMasUnaTemperatura

	self assert: fahrenheit32 + fahrenheit32 = fahrenheit64 .
	self assert: fahrenheit33With8 + celsius0 = fahrenheit65Point8 .
	self assert: fahrenheit35With6 + kelvin274con15 = fahrenheit69Point4.
	self deny: fahrenheit35With6 + fahrenheit32 = fahrenheit64.! !


!TestsTemperature methodsFor: 'Tests =' stamp: 'JI 6/6/2017 15:16:23'!
test001_unGradoCelsiusIgualaOtroGradoCelsius

	self assert: celsius1 = celsiusOtro1.! !

!TestsTemperature methodsFor: 'Tests =' stamp: 'JI 6/6/2017 15:16:23'!
test002_unGradoCelsiusNoEsIgualaDosGradosCelsius

	self deny: celsius1 = celsius2.! !

!TestsTemperature methodsFor: 'Tests =' stamp: 'JI 6/6/2017 15:16:23'!
test003_CelsiusIgualACelsius

	self assert: celsius1 = celsius1.
	self deny: celsius1 = celsius2.! !

!TestsTemperature methodsFor: 'Tests =' stamp: 'JI 6/6/2017 15:16:23'!
test004_CelsiusIgualAKelvin

	self assert: celsius1 = kelvin274con15.
	self assert: celsius0 = kelvin273con15.
	self assert: celsiusMinus273con15 = kelvin0
	
	! !

!TestsTemperature methodsFor: 'Tests =' stamp: 'JI 6/6/2017 15:16:23'!
test005_CelsiusIgualAFahrenheit

	self assert: celsius1 = fahrenheit33With8.
	self assert: celsius0 = fahrenheit32.
	self assert: celsiusMinus273con15 = fahrenheitMinus459With67.
	
	! !

!TestsTemperature methodsFor: 'Tests =' stamp: 'JI 6/6/2017 15:16:23'!
test006_KelvinIgualACelsius

	self assert: kelvin274con15 = celsius1.
	self deny: kelvin274con15 = celsius2.! !

!TestsTemperature methodsFor: 'Tests =' stamp: 'JI 6/6/2017 15:16:23'!
test007_KelvinIgualAKelvin

	self assert: kelvin273con15 = kelvinOtro273con15 .
	self deny: kelvin274con15 = kelvin273con15.! !

!TestsTemperature methodsFor: 'Tests =' stamp: 'JI 6/6/2017 15:16:23'!
test008_KelvinIgualAFahrenheit

	self assert: kelvin273con15 = fahrenheit32 .
	self deny: kelvin274con15 = fahrenheit32.! !

!TestsTemperature methodsFor: 'Tests =' stamp: 'JI 6/6/2017 15:16:23'!
test009_FahrenheitIgualACelsius

	self assert: fahrenheit32 = celsius0 .
	self deny: fahrenheit32 = celsius1 .! !

!TestsTemperature methodsFor: 'Tests =' stamp: 'JI 6/6/2017 15:16:23'!
test010_FahrenheitIgualAKelvin

	self assert: fahrenheit32 = kelvin273con15 .
	self deny: fahrenheit32 = kelvin274con15 .! !

!TestsTemperature methodsFor: 'Tests =' stamp: 'JI 6/6/2017 15:16:23'!
test011_FahrenheitIgualAFahrenheit

	self assert: fahrenheit32 = fahrenheitOtro32 .
	self deny: fahrenheit32 = fahrenheit33With8 .! !


!TestsTemperature methodsFor: 'Tests * y /' stamp: 'JI 6/6/2017 15:16:23'!
test001_UnaTemperaturaPorUnNumero
	
	self assert: kelvin0 * 5 = kelvin0 .
	self assert: fahrenheit32 * 1 = fahrenheit32 .
	self assert: celsiusMinus5 * 4 = celsiusMinus20.	
! !

!TestsTemperature methodsFor: 'Tests * y /' stamp: 'JI 6/6/2017 15:16:23'!
test002_UnaTemperaturaDivididoUnNumero
	
	self assert: kelvin0 / 5 = kelvin0 .
	self assert: celsius1 / 1 = celsius1 .
	self assert: fahrenheit35With6 / 2 = fahrenheit17With8 .	
! !

!TestsTemperature methodsFor: 'Tests * y /' stamp: 'JI 6/6/2017 15:16:23'!
test003_UnNumeroPorUnaTemperatura
	
	self assert:  5 * kelvin0 = kelvin0 .
	self assert: 1 * fahrenheit32 = fahrenheit32 .
	self assert: 4 * celsiusMinus5 = celsiusMinus20.	
! !


!TestsTemperature methodsFor: 'Tests comparison' stamp: 'JI 6/6/2017 15:16:23'!
test001_TemperaturaLess

	self assert:  celsiusMinus273con15 < celsius0 .
	self assert: celsius75 < celsius77 .
	self deny:  celsius0 < celsius0 .
	self deny: celsius75 < celsius1 .! !

!TestsTemperature methodsFor: 'Tests comparison' stamp: 'JI 6/6/2017 15:16:23'!
test002_TemperaturaLessOrEqual

	self assert:  celsiusMinus273con15 <= celsius0 .
	self assert: celsius75 <= celsius77 .
	self assert:  celsius0 <= celsius0 .
	self deny: celsius75 <= celsius1 .! !

!TestsTemperature methodsFor: 'Tests comparison' stamp: 'JI 6/6/2017 15:16:23'!
test003_TemperaturaGreater

	self deny:  celsiusMinus273con15 > celsius0 .
	self assert: celsius77 > celsius75 .
	self deny:  celsius0 > celsius0 .
	self assert: celsius75 > celsius1 .! !

!TestsTemperature methodsFor: 'Tests comparison' stamp: 'JI 6/6/2017 15:16:23'!
test004_TemperaturaGreaterorEqual

	self deny:  celsiusMinus273con15 >= celsius0 .
	self assert: celsius77 >= celsius75 .
	self assert:  celsius0 >= celsius0 .
	self assert: celsius75 >= celsius1 .! !


!TestsTemperature methodsFor: 'Test Intervalos' stamp: 'JI 6/6/2017 17:44:54'!
test001_IntervaloVacio
	
	self assert: intervaloVacio size = 0.! !

!TestsTemperature methodsFor: 'Test Intervalos' stamp: 'JI 6/6/2017 17:45:00'!
test002_IntervaloFromToAscendenteDeTemperaturas
	
	| i |
	
	i _ celsius1 .
	intervaloDeCelsius1To10 do: [ :aTemperature | 
		self assert: aTemperature = i.
		i _ i+ celsius1 .].
	self assert: intervaloDeCelsius1To10 size = 10.
	
	i _ kelvin1.
	intervaloDeKelvin1To30 do: [ :aTemperature | 
		self assert: aTemperature = i.
		i _ i+kelvin1.].
	self assert: intervaloDeKelvin1To30 size =30.
	
	i _ fahrenheit32 .
	intervaloDefahrenheit32to40 do: [ :aTemperature | 
		self assert: aTemperature  = i.
		i _ i+fahrenheit1.].
	self assert: intervaloDefahrenheit32to40 size = 9.
	
	! !

!TestsTemperature methodsFor: 'Test Intervalos' stamp: 'JI 6/6/2017 17:45:07'!
test003_IntervaloFromToByAscendenteDeTemperaturas
	
	| i |
	
	i _ celsius1 .
	intervaloDeCelsius1To10ByKelvin275Point15 do: [ :aTemperature | 
		self assert: aTemperature = i.
		i _ i+ celsius2 .].
	self assert: intervaloDeCelsius1To10ByKelvin275Point15 size = 5.
	
	i _ kelvin1.
	intervaloDeKelvin1To30By2FahrenheitMinus456Point07 do: [ :aTemperature | 
		self assert: aTemperature = i.
		i _ i+kelvin2.].
	self assert: intervaloDeKelvin1To30By2FahrenheitMinus456Point07 size =15.
	
	i _ fahrenheit32 .
	intervaloDefahrenheit32to40ByCelsiusMinus31Multiplied5Over9 do: [ :aTemperature | 
		self assert: aTemperature  = i.
		i _ i+fahrenheit1.].
	self assert: intervaloDefahrenheit32to40ByCelsiusMinus31Multiplied5Over9 size = 9.
	! !

!TestsTemperature methodsFor: 'Test Intervalos' stamp: 'JI 6/6/2017 17:47:29'!
test004_IntervaloFromToByDoAscendenteDeTemperaturas
	
	| i |
	
	i _ celsius1 .
	celsius1 to: celsius10 by: kelvin275con15 do: [ :aTemperature | 
		self assert: aTemperature = i.
		i _ i+ celsius2 .].
	self assert: intervaloDeCelsius1To10ByKelvin275Point15 size = 5.
	
	i _ kelvin1 .
	kelvin1 to: kelvin30 by: fahrenheitMinus456With07 do: [ :aTemperature | 
		self assert: aTemperature = i.
		i _ i+kelvin2.].
	self assert: intervaloDeKelvin1To30By2FahrenheitMinus456Point07 size =15.
	
	i _ fahrenheit32 .
	
	fahrenheit32 to: fahrenheit40 by: celsiusMinus31Multiplied5Over9 do: [ :aTemperature | 
		self assert: aTemperature  = i.
		i _ i+fahrenheit1.].
	self assert: intervaloDefahrenheit32to40ByCelsiusMinus31Multiplied5Over9 size = 9.
	
! !


!TestsTemperature methodsFor: 'setUp' stamp: 'JI 6/6/2017 15:53:05'!
celsiusSetUp
	
	celsiusMinus273con15 _ Measure initializeWith: -273-(15/100) asUnit: UnitTemperature initializeCelsius .
	celsiusMinus272con15 _ Measure initializeWith: -272-(15/100) asUnit: UnitTemperature initializeCelsius .
	celsiusMinus151Over9 _  Measure initializeWith: -151/9 asUnit: UnitTemperature initializeCelsius .
	celsiusMinus80  _ Measure initializeWith: -80  asUnit:  UnitTemperature initializeCelsius .
	celsiusMinus20  _ Measure initializeWith: -20  asUnit:  UnitTemperature initializeCelsius .
	celsiusMinus31Multiplied5Over9 _ Measure initializeWith: -31*5/9  asUnit:  UnitTemperature initializeCelsius .
	celsiusMinus5  _ Measure initializeWith: -5  asUnit:  UnitTemperature initializeCelsius .
	celsiusMinus5Over4  _ Measure initializeWith: -5/4  asUnit:  UnitTemperature initializeCelsius .
	celsius0  _ Measure initializeWith: 0  asUnit: UnitTemperature initializeCelsius .
	celsius1  _ Measure initializeWith: 1  asUnit:  UnitTemperature initializeCelsius .
	celsius1Point8  _ Measure initializeWith: 1 + (8/10)  asUnit:  UnitTemperature initializeCelsius .
	celsiusOtro1  _ Measure initializeWith: 1  asUnit:  UnitTemperature initializeCelsius .
	celsius2  _ Measure initializeWith: 2  asUnit:  UnitTemperature initializeCelsius .
	celsius3  _ Measure initializeWith: 3  asUnit:  UnitTemperature initializeCelsius .
	celsius10  _ Measure initializeWith: 10  asUnit:  UnitTemperature initializeCelsius .
	celsius75  _ Measure initializeWith: 75  asUnit:  UnitTemperature initializeCelsius .
	celsius77  _ Measure initializeWith: 77  asUnit:  UnitTemperature initializeCelsius .
	celsius155  _ Measure initializeWith: 155  asUnit:  UnitTemperature initializeCelsius .

	
	! !

!TestsTemperature methodsFor: 'setUp' stamp: 'JI 6/6/2017 15:54:16'!
fahrenheitSetUp
	
	fahrenheitMinus459With67 _ Measure initializeWith: -459-(67/100) asUnit: UnitTemperature initializeFahrenheit .
	fahrenheitMinus456With07 _ Measure initializeWith: -456-(7/100) asUnit: UnitTemperature initializeFahrenheit .
	fahrenheit0  _ Measure initializeWith: 0 asUnit:UnitTemperature initializeFahrenheit  .
	fahrenheit1  _ Measure initializeWith: 1 asUnit:UnitTemperature initializeFahrenheit  .
	fahrenheit2  _ Measure initializeWith: 2 asUnit:UnitTemperature initializeFahrenheit  .
	fahrenheit3Point6 _ Measure initializeWith: 3+(6/10) asUnit:UnitTemperature initializeFahrenheit  .
	fahrenheit17With8 _ Measure initializeWith: 17 + (8/10) asUnit:UnitTemperature initializeFahrenheit .
	fahrenheit32  _ Measure initializeWith: 32 asUnit:UnitTemperature initializeFahrenheit .
	fahrenheitOtro32  _ Measure initializeWith: 32 asUnit:UnitTemperature initializeFahrenheit .
	fahrenheit33With8  _ Measure initializeWith: 33+(8/10) asUnit:UnitTemperature initializeFahrenheit  .
	fahrenheit35With6  _ Measure initializeWith: 35+(6/10) asUnit:UnitTemperature initializeFahrenheit  .
	fahrenheit40  _ Measure initializeWith: 40 asUnit:UnitTemperature initializeFahrenheit  .
	fahrenheit64  _ Measure initializeWith: 64 asUnit:UnitTemperature initializeFahrenheit  .
	fahrenheit65Point8  _ Measure initializeWith: 65 +(80/100) asUnit:UnitTemperature initializeFahrenheit  .
	fahrenheit69Point4  _ Measure initializeWith: 69 + (40/100) asUnit: UnitTemperature initializeFahrenheit  .! !

!TestsTemperature methodsFor: 'setUp' stamp: 'JI 6/6/2017 17:46:36'!
intervalosSetUp
	
	intervaloVacio _ IntervalOfMeasure intervaloVacio .
	
	intervaloDeCelsius1To10 _ celsius1 to: celsius10 .
	intervaloDeCelsius1To10ByKelvin275Point15 _ celsius1 to: celsius10 by: kelvin275con15 .
	
	intervaloDeKelvin1To30 _ kelvin1 to: kelvin30.
	intervaloDeKelvin1To30By2FahrenheitMinus456Point07 _ kelvin1 to: kelvin30 by: fahrenheitMinus456With07 .
	
	intervaloDefahrenheit32to40 _ fahrenheit32 to: fahrenheit40.
	intervaloDefahrenheit32to40ByCelsiusMinus31Multiplied5Over9 _ fahrenheit32 to: fahrenheit40 by: celsiusMinus31Multiplied5Over9.! !

!TestsTemperature methodsFor: 'setUp' stamp: 'JI 6/6/2017 15:18:09'!
kelvinSetUp
	
	kelvin0 _ Measure initializeWith: 0 asUnit: UnitTemperature initializeKelvin .
	kelvin1 _ Measure initializeWith: 1 asUnit: UnitTemperature initializeKelvin .
	kelvin2 _ Measure initializeWith: 2 asUnit: UnitTemperature initializeKelvin .
	kelvin30 _ Measure initializeWith: 30 asUnit: UnitTemperature initializeKelvin .
	kelvin273con15  _ Measure initializeWith: (273+(15/100)) asUnit: UnitTemperature initializeKelvin .
	kelvinOtro273con15 _ Measure initializeWith: (273+(15/100)) asUnit: UnitTemperature initializeKelvin .
	kelvin274con15  _ Measure initializeWith: (274+(15/100)) asUnit: UnitTemperature initializeKelvin .
	kelvin275con15  _ Measure initializeWith: (275+(15/100)) asUnit: UnitTemperature initializeKelvin .
	kelvin546Point3 _  Measure initializeWith: (546+(30/100)) asUnit: UnitTemperature initializeKelvin .
	kelvin547Point3 _  Measure initializeWith: (547+(30/100)) asUnit: UnitTemperature initializeKelvin .
	kelvin548Point3 _  Measure initializeWith: (548+(30/100)) asUnit: UnitTemperature initializeKelvin .
	kelvin549Point3 _  Measure initializeWith: (549+(30/100)) asUnit: UnitTemperature initializeKelvin .! !

!TestsTemperature methodsFor: 'setUp' stamp: 'JI 6/6/2017 17:44:33'!
setUp
	self celsiusSetUp .
	self fahrenheitSetUp .
	self kelvinSetUp .
	
	self intervalosSetUp.! !


!classDefinition: #TestsTime category: #'Measure-Solution'!
TestCase subclass: #TestsTime
	instanceVariableNames: 'zeroSecond oneHoundreadSeconds tenSeconds nintySeconds oneMinute fortySeconds seconds3500 fiftyNineMinutes twoHours oneHour seconds110 seconds70 seconds3670 seconds3610 oneDay seconds86410 minute1With10Seconds'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!TestsTime methodsFor: 'Tests +' stamp: 'JAK 6/6/2017 20:05:44'!
test001TimePlusAnotherTime

	self assert: zeroSecond + zeroSecond = zeroSecond.
	self assert: oneHoundreadSeconds + tenSeconds = seconds110.
	self assert: tenSeconds + oneMinute = seconds70.
	self assert: tenSeconds + oneHour = seconds3610.
	self assert: tenSeconds  + oneDay = seconds86410.
	self assert: oneMinute + tenSeconds = minute1With10Seconds.! !


!TestsTime methodsFor: 'Tests -' stamp: 'JAK 6/6/2017 20:13:50'!
test001TimeMinusAnotherTime

	self assert: zeroSecond - zeroSecond = zeroSecond.
	self assert: oneHoundreadSeconds - tenSeconds = nintySeconds.
	self assert: oneMinute - zeroSecond = oneMinute.
	self assert: oneHoundreadSeconds - oneMinute = fortySeconds.
	self assert: oneHour - oneHoundreadSeconds = seconds3500.
	self assert: oneHour - oneMinute = fiftyNineMinutes.
	self assert: twoHours - oneHour = oneHour.! !


!TestsTime methodsFor: 'Test * y /' stamp: 'JAK 6/6/2017 20:16:28'!
test001ATimeMultiplyByNumber
	self assert: oneDay * 1 = (1 * oneDay) .
	self assert: oneMinute * 120 = twoHours .! !

!TestsTime methodsFor: 'Test * y /' stamp: 'JAK 6/6/2017 20:17:34'!
test002ATimeDivideByNumber
	self assert: oneDay / 24 = oneHour .
	self assert: twoHours /2 = oneHour .! !


!TestsTime methodsFor: 'setUp' stamp: 'JAK 6/6/2017 20:12:30'!
setUp
	zeroSecond := Measure initializeWith: 0 asUnit: UnitTime initializeSeconds .
	oneHoundreadSeconds:= Measure initializeWith: 100 asUnit: UnitTime initializeSeconds.
	tenSeconds := Measure initializeWith: 10 asUnit: UnitTime initializeSeconds.
	nintySeconds := Measure initializeWith: 90 asUnit: UnitTime initializeSeconds.
	fortySeconds := Measure initializeWith: 40 asUnit: UnitTime initializeSeconds.
	oneMinute := Measure initializeWith: 1 asUnit: UnitTime initializeMinutes .
	seconds3500 := Measure initializeWith: 3500 asUnit: UnitTime initializeSeconds.
	fiftyNineMinutes := Measure initializeWith: 59 asUnit: UnitTime initializeMinutes .
	twoHours := Measure initializeWith: 2 asUnit: UnitTime initializeHours .
	oneHour := Measure initializeWith: 1 asUnit: UnitTime initializeHours .
	seconds110 := Measure initializeWith: 110 asUnit: UnitTime initializeSeconds .
	seconds70 := Measure initializeWith: 70 asUnit: UnitTime initializeSeconds .
	seconds3610 := Measure initializeWith: 3610 asUnit: UnitTime initializeSeconds .
	oneDay := Measure initializeWith: 1 asUnit: UnitTime initializeDay .
	seconds86410 := Measure initializeWith: 86410 asUnit: UnitTime initializeSeconds .
	minute1With10Seconds := Measure initializeWith: 1 + (1/6) asUnit: UnitTime initializeMinutes .! !


!classDefinition: #IntervalOfMeasure category: #'Measure-Solution'!
Object subclass: #IntervalOfMeasure
	instanceVariableNames: 'intervalo unitType byDistance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!IntervalOfMeasure methodsFor: 'initialization' stamp: 'JI 6/6/2017 12:30:50'!
intervaloVacio
	intervalo _ nil
	! !

!IntervalOfMeasure methodsFor: 'initialization' stamp: 'JI 6/6/2017 12:30:50'!
size
	intervalo = nil ifTrue: [^0] ifFalse: [^ intervalo size] ! !


!IntervalOfMeasure methodsFor: 'enumerating' stamp: 'JI 6/6/2017 12:30:50'!
by

	^  byDistance ! !

!IntervalOfMeasure methodsFor: 'enumerating' stamp: 'JI 6/6/2017 17:39:04'!
do: aBlockClosure 
	intervalo do: [ :aNumber | aBlockClosure value: (self generateMeasureWithValue: aNumber ) ]! !

!IntervalOfMeasure methodsFor: 'enumerating' stamp: 'JI 6/6/2017 17:37:40'!
from

	^ self generateMeasureWithValue: intervalo first! !

!IntervalOfMeasure methodsFor: 'enumerating' stamp: 'JI 6/6/2017 17:48:14'!
from: aDistanceUnits to: aDistanceUnits2 
	| unidad |
	
	unidad _ Measure  initializeWith: 1 asUnit: aDistanceUnits unit.
	aDistanceUnits > aDistanceUnits2 ifTrue: [unidad _ unidad negated].
	
	^ IntervalOfMeasure from: aDistanceUnits  to: aDistanceUnits2  by: unidad.
	! !

!IntervalOfMeasure methodsFor: 'enumerating' stamp: 'JI 6/6/2017 17:49:08'!
from: aDistanceUnits to: aDistanceUnits2 by: aDistanceUnits3 
	
	intervalo _ Interval from: aDistanceUnits amount  to: (aDistanceUnits2 convertTo: aDistanceUnits unit) amount by: (aDistanceUnits3 convertTo: aDistanceUnits unit ) amount.
	unitType _ aDistanceUnits unit.
	
	byDistance _ aDistanceUnits3 ! !

!IntervalOfMeasure methodsFor: 'enumerating' stamp: 'JI 6/6/2017 17:38:21'!
generateMeasureWithValue: aNumber

	^ Measure initializeWith: aNumber asUnit: unitType
! !

!IntervalOfMeasure methodsFor: 'enumerating' stamp: 'JI 6/6/2017 17:38:36'!
to

	^  self generateMeasureWithValue: intervalo last! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IntervalOfMeasure class' category: #'Measure-Solution'!
IntervalOfMeasure class
	instanceVariableNames: ''!

!IntervalOfMeasure class methodsFor: 'initialization' stamp: 'JI 6/6/2017 12:30:50'!
from: aDistanceUnits to: aDistanceUnits2 
	^ self new from: aDistanceUnits to: aDistanceUnits2 ! !

!IntervalOfMeasure class methodsFor: 'initialization' stamp: 'JI 6/6/2017 12:30:50'!
intervaloVacio
	^ self new intervaloVacio! !


!IntervalOfMeasure class methodsFor: 'as yet unclassified' stamp: 'JI 6/6/2017 12:30:50'!
from: aDistanceUnits to: aDistanceUnits2 by: aDistanceUnits3 
	^self new from: aDistanceUnits to: aDistanceUnits2  by: aDistanceUnits3 ! !

!IntervalOfMeasure class methodsFor: 'as yet unclassified' stamp: 'JI 6/6/2017 12:30:50'!
from: aDistanceUnits to: aDistanceUnits2 by: aDistanceUnits3 do: aBlockClosure 
	(self from: aDistanceUnits to: aDistanceUnits2 by: aDistanceUnits3) do: aBlockClosure ! !


!classDefinition: #MeasureFactory category: #'Measure-Solution'!
Object subclass: #MeasureFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!MeasureFactory methodsFor: 'distance instances' stamp: 'JI 6/4/2017 15:43:38'!
minusOneMeter
	^ DistanceMeasure initializeWith: -1 asUnit: DistanceUnit initializeMetro 
! !

!MeasureFactory methodsFor: 'distance instances' stamp: 'JI 6/4/2017 15:44:12'!
oneCentimeter
	^ DistanceMeasure initializeWith: 1 asUnit: DistanceUnit initializeCentimetro ! !

!MeasureFactory methodsFor: 'distance instances' stamp: 'JI 6/4/2017 15:44:00'!
oneHundredCentimeters
	^ DistanceMeasure initializeWith: 100 asUnit: DistanceUnit initializeCentimetro ! !

!MeasureFactory methodsFor: 'distance instances' stamp: 'JI 6/4/2017 15:44:23'!
oneMeter
	^ DistanceMeasure initializeWith: 1 asUnit: DistanceUnit initializeMetro ! !

!MeasureFactory methodsFor: 'distance instances' stamp: 'JI 6/4/2017 15:44:50'!
oneMilimeter
	^ DistanceMeasure initializeWith: 1 asUnit: DistanceUnit initializeMilimetro ! !

!MeasureFactory methodsFor: 'distance instances' stamp: 'JI 6/4/2017 15:43:20'!
twoHundredCentimeters
	^ DistanceMeasure initializeWith: 200 asUnit: DistanceUnit initializeCentimetro ! !

!MeasureFactory methodsFor: 'distance instances' stamp: 'JI 6/4/2017 15:44:35'!
twoMeters
	^ DistanceMeasure initializeWith: 2 asUnit: DistanceUnit initializeMetro 
! !

!MeasureFactory methodsFor: 'distance instances' stamp: 'JI 6/4/2017 15:43:08'!
zeroMeters
	^ DistanceMeasure initializeWith: 0 asUnit: DistanceUnit initializeMetro .! !


!MeasureFactory methodsFor: 'finalVelocity' stamp: 'JAK 6/5/2017 20:01:18'!
finalSpeedStartingAt: initialVelocity accelerating: aceleration during: aPeriodOfTime
	^ initialVelocity + (aceleration * aPeriodOfTime )! !


!MeasureFactory methodsFor: 'compound measures' stamp: 'JAK 6/5/2017 19:58:09'!
eightCubicMeters
	^nil! !

!MeasureFactory methodsFor: 'compound measures' stamp: 'JAK 6/5/2017 19:58:19'!
fourSquaredMeters
	^nil! !

!MeasureFactory methodsFor: 'compound measures' stamp: 'JAK 6/5/2017 19:58:23'!
oneHundredTwentyOneMetersPerSecond
	^nil! !

!MeasureFactory methodsFor: 'compound measures' stamp: 'JAK 6/5/2017 19:58:27'!
oneMeterPerSecond 
	^nil! !

!MeasureFactory methodsFor: 'compound measures' stamp: 'JAK 6/5/2017 19:58:31'!
oneSquaredMeter 
	^nil! !

!MeasureFactory methodsFor: 'compound measures' stamp: 'JAK 6/5/2017 19:58:35'!
oneSquaredSecond 
	^nil! !

!MeasureFactory methodsFor: 'compound measures' stamp: 'JAK 6/5/2017 19:58:40'!
twoMetersBySecond 
	^nil! !

!MeasureFactory methodsFor: 'compound measures' stamp: 'JAK 6/5/2017 19:58:45'!
twoMetersPerSquaredSecond 
	^nil! !

!MeasureFactory methodsFor: 'compound measures' stamp: 'JAK 6/5/2017 19:58:50'!
twoMetersTimesSecond 
	^nil! !


!MeasureFactory methodsFor: 'time instances' stamp: 'JAK 6/5/2017 19:56:59'!
oneDay
	^nil! !

!MeasureFactory methodsFor: 'time instances' stamp: 'JAK 6/5/2017 19:57:04'!
oneHour
	^nil! !

!MeasureFactory methodsFor: 'time instances' stamp: 'JAK 6/5/2017 19:57:08'!
oneMinute
	^nil! !

!MeasureFactory methodsFor: 'time instances' stamp: 'JAK 6/5/2017 19:57:13'!
oneSecond
	^nil! !

!MeasureFactory methodsFor: 'time instances' stamp: 'JAK 6/5/2017 19:57:17'!
sixtyMinutes
	^nil! !

!MeasureFactory methodsFor: 'time instances' stamp: 'JAK 6/5/2017 19:57:22'!
sixtyOneSeconds
	^nil! !

!MeasureFactory methodsFor: 'time instances' stamp: 'JAK 6/5/2017 19:57:27'!
sixtySeconds
	^nil! !

!MeasureFactory methodsFor: 'time instances' stamp: 'JAK 6/5/2017 19:57:31'!
twentyFourHours
	^nil! !

!MeasureFactory methodsFor: 'time instances' stamp: 'JAK 6/5/2017 19:57:36'!
twoSeconds 
	^nil! !

!MeasureFactory methodsFor: 'time instances' stamp: 'JAK 6/5/2017 19:57:41'!
zeroSeconds 
	^nil! !


!MeasureFactory methodsFor: 'time units' stamp: 'JAK 6/5/2017 19:56:19'!
day
	^nil! !

!MeasureFactory methodsFor: 'time units' stamp: 'JAK 6/5/2017 19:56:25'!
hour
	^nil! !

!MeasureFactory methodsFor: 'time units' stamp: 'JAK 6/5/2017 19:56:31'!
minute
	^nil! !

!MeasureFactory methodsFor: 'time units' stamp: 'JAK 6/5/2017 19:56:35'!
second
	^nil! !


!MeasureFactory methodsFor: 'temperature instances' stamp: 'JAK 6/5/2017 19:55:04'!
oneCelsius
	^TemperatureMeasure initializeWith: 1 asUnit: TemperatureUnits initializeCelsius ! !

!MeasureFactory methodsFor: 'temperature instances' stamp: 'JAK 6/5/2017 19:55:23'!
thirtyTwoFahrenheits
	^TemperatureMeasure initializeWith: 32 asUnit: TemperatureUnits initializeFahrenheit ! !

!MeasureFactory methodsFor: 'temperature instances' stamp: 'JAK 6/5/2017 19:55:32'!
twoCelsius
	^TemperatureMeasure initializeWith: 2 asUnit: TemperatureUnits initializeCelsius ! !

!MeasureFactory methodsFor: 'temperature instances' stamp: 'JAK 6/5/2017 19:55:40'!
zeroCelsius
	^TemperatureMeasure initializeWith: 0 asUnit: TemperatureUnits initializeCelsius ! !

!MeasureFactory methodsFor: 'temperature instances' stamp: 'JAK 6/5/2017 19:55:49'!
zeroKelvin
	^TemperatureMeasure initializeWith: 0 asUnit: TemperatureUnits initializeKelvin ! !


!MeasureFactory methodsFor: 'temperature units' stamp: 'JAK 6/5/2017 19:54:02'!
celsius
	^TemperatureUnits  initializeCelsius ! !

!MeasureFactory methodsFor: 'temperature units' stamp: 'JAK 6/5/2017 19:54:10'!
fahrenheit
	^TemperatureUnits  initializeFahrenheit ! !

!MeasureFactory methodsFor: 'temperature units' stamp: 'JAK 6/5/2017 19:54:19'!
kelvin
	^TemperatureUnits  initializeKelvin ! !


!MeasureFactory methodsFor: 'distance units' stamp: 'JAK 6/5/2017 19:51:45'!
centimeter
	^DistanceUnit initializeCentimetro ! !

!MeasureFactory methodsFor: 'distance units' stamp: 'JAK 6/5/2017 19:52:21'!
decameter
	^DistanceUnit initializeDecametro ! !

!MeasureFactory methodsFor: 'distance units' stamp: 'JAK 6/5/2017 19:51:59'!
decimeter
	^DistanceUnit initializeDecimetro ! !

!MeasureFactory methodsFor: 'distance units' stamp: 'JAK 6/5/2017 19:52:31'!
hectometer
	^DistanceUnit initializeHectometro ! !

!MeasureFactory methodsFor: 'distance units' stamp: 'JAK 6/5/2017 19:52:39'!
kilometer
	^DistanceUnit initializeKilometro ! !

!MeasureFactory methodsFor: 'distance units' stamp: 'JAK 6/5/2017 19:52:10'!
meter
	^DistanceUnit initializeMetro ! !

!MeasureFactory methodsFor: 'distance units' stamp: 'JAK 6/5/2017 19:51:27'!
millimeter
	^DistanceUnit initializeMilimetro ! !


!classDefinition: #Unit category: #'Measure-Solution'!
Object subclass: #Unit
	instanceVariableNames: 'unitType'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!Unit methodsFor: 'printing' stamp: 'JAK 6/6/2017 19:47:07'!
printString
	^ unitType! !


!Unit methodsFor: 'comparing' stamp: 'JI 6/6/2017 13:54:10'!
= anotherUnit
	^ self subclassResponsibility ! !

!Unit methodsFor: 'comparing' stamp: 'JAK 6/6/2017 19:48:32'!
hash
	^ self subclassResponsibility ! !


!Unit methodsFor: 'conversion' stamp: 'JI 6/6/2017 14:06:23'!
convert: aQuantity to: aUnit
	^ self subclassResponsibility ! !


!classDefinition: #UnitCurrency category: #'Measure-Solution'!
Unit subclass: #UnitCurrency
	instanceVariableNames: 'isDollar'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!UnitCurrency methodsFor: 'initialization' stamp: 'JAK 6/6/2017 21:02:45'!
initializeDolar
	isDollar := true.
	unitType := 'dollar'! !

!UnitCurrency methodsFor: 'initialization' stamp: 'JAK 6/6/2017 21:03:03'!
initializePeso
	isDollar := false.
	unitType = 'peso'.! !


!UnitCurrency methodsFor: 'conversion' stamp: 'JAK 6/6/2017 21:04:21'!
convert: aQuantity to: aUnit
	"self class = aUnit class ifFalse: [self error: self class canNotOperateBetweenCrossCurrencyinitializePeso ]."
	self isDollar = aUnit isDollar ifFalse:[self error: self class canNotOperateBetweenCrossCurrencyinitializePeso ].
	^aQuantity .! !


!UnitCurrency methodsFor: 'inspecting' stamp: 'JAK 6/6/2017 21:04:10'!
isDollar
	^isDollar ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnitCurrency class' category: #'Measure-Solution'!
UnitCurrency class
	instanceVariableNames: ''!

!UnitCurrency class methodsFor: 'initialization' stamp: 'JAK 6/6/2017 20:36:55'!
initializeDolar
	^self new initializeDolar .! !

!UnitCurrency class methodsFor: 'initialization' stamp: 'JAK 6/6/2017 20:30:35'!
initializePeso
	^self new initializePeso.! !


!UnitCurrency class methodsFor: 'error' stamp: 'JAK 6/6/2017 20:51:32'!
canNotOperateBetweenCrossCurrencyinitializePeso
	^'No existe mercado cambiario, larga vida al cepo'! !


!classDefinition: #UnitDistance category: #'Measure-Solution'!
Unit subclass: #UnitDistance
	instanceVariableNames: 'convertionFactor amount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!UnitDistance methodsFor: 'comparing' stamp: 'JI 6/6/2017 13:55:41'!
= anotherUnit
	^(self class isKindOf: anotherUnit class) and: [convertionFactor = anotherUnit convertionFactor]! !

!UnitDistance methodsFor: 'comparing' stamp: 'JAK 6/6/2017 19:48:20'!
hash
	"falta completar"! !


!UnitDistance methodsFor: 'conversion' stamp: 'JI 6/6/2017 14:18:05'!
convert: quantity to: aUnit
	^  quantity * convertionFactor * (1 / aUnit convertionFactor) ! !

!UnitDistance methodsFor: 'conversion' stamp: 'JI 6/6/2017 13:56:50'!
convertionFactor
	^ convertionFactor ! !


!UnitDistance methodsFor: 'initialization' stamp: 'JI 6/6/2017 13:57:04'!
initializeCentimetro
	unitType _ 'centimeter'.
	convertionFactor _ 1/100.! !

!UnitDistance methodsFor: 'initialization' stamp: 'JI 6/6/2017 13:57:32'!
initializeDecametro
	unitType _ 'decameter'.
	convertionFactor _ 10.! !

!UnitDistance methodsFor: 'initialization' stamp: 'JI 6/6/2017 14:00:47'!
initializeDecimetro
	unitType _ 'decimeter'.
	convertionFactor _ 1/10.! !

!UnitDistance methodsFor: 'initialization' stamp: 'JI 6/6/2017 14:00:50'!
initializeHectometro
	unitType _ 'hectometer'.
	convertionFactor _ 100.! !

!UnitDistance methodsFor: 'initialization' stamp: 'JI 6/6/2017 14:00:52'!
initializeKilometro
	unitType _ 'kilometer'.
	convertionFactor _ 1000.! !

!UnitDistance methodsFor: 'initialization' stamp: 'JI 6/6/2017 14:00:55'!
initializeMetro
	unitType _ 'meter'.
	convertionFactor _ 1.! !

!UnitDistance methodsFor: 'initialization' stamp: 'JI 6/6/2017 14:00:57'!
initializeMilimetro
	unitType _ 'milimeter'.
	convertionFactor _ 1/1000.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnitDistance class' category: #'Measure-Solution'!
UnitDistance class
	instanceVariableNames: ''!

!UnitDistance class methodsFor: 'as yet unclassified' stamp: 'JI 6/4/2017 15:33:03'!
initializeCentimetro
	^ self new initializeCentimetro .! !

!UnitDistance class methodsFor: 'as yet unclassified' stamp: 'JI 6/4/2017 15:33:14'!
initializeDecametro
	^ self new initializeDecametro .! !

!UnitDistance class methodsFor: 'as yet unclassified' stamp: 'JI 6/4/2017 15:33:45'!
initializeDecimetro
	^ self new initializeDecimetro .! !

!UnitDistance class methodsFor: 'as yet unclassified' stamp: 'JI 6/4/2017 15:32:53'!
initializeHectometro
	^ self new initializeHectometro .! !

!UnitDistance class methodsFor: 'as yet unclassified' stamp: 'JI 6/4/2017 15:29:00'!
initializeKilometro
	^ self new initializeKilometro .! !

!UnitDistance class methodsFor: 'as yet unclassified' stamp: 'JI 6/4/2017 15:28:26'!
initializeMetro
	^ self new initializeMetro .! !

!UnitDistance class methodsFor: 'as yet unclassified' stamp: 'JI 6/4/2017 15:25:50'!
initializeMilimetro
	^ self new initializeMilimetro .! !


!classDefinition: #UnitLiquid category: #'Measure-Solution'!
Unit subclass: #UnitLiquid
	instanceVariableNames: 'proporcionAGramos proporcionALitro'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!UnitLiquid methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 20:45:54'!
convert: aNumber to: anUnitLiquid
	^ anUnitLiquid transformarLitrosAMi: (self transformarALitro: aNumber )! !

!UnitLiquid methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 20:42:58'!
initializeCentilitro
	proporcionALitro _ 1/100.! !

!UnitLiquid methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 20:43:07'!
initializeDecalitro
	proporcionALitro _ 10! !

!UnitLiquid methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 20:43:16'!
initializeDecilitro
	proporcionALitro _ 1/10! !

!UnitLiquid methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 20:43:45'!
initializeHectolitro
	 proporcionALitro _ 100! !

!UnitLiquid methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 20:44:01'!
initializeKilolitro
	
	proporcionALitro _ 1000.! !

!UnitLiquid methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 20:43:37'!
initializeLitro
	proporcionALitro  _ 1! !

!UnitLiquid methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 20:44:14'!
initializeMililitro
	proporcionALitro _ 1/1000! !

!UnitLiquid methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 20:44:24'!
transformarALitro: aNumber 
	^ aNumber * proporcionALitro .! !

!UnitLiquid methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 20:44:33'!
transformarLitrosAMi: aNumber
	^ aNumber / proporcionALitro ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnitLiquid class' category: #'Measure-Solution'!
UnitLiquid class
	instanceVariableNames: ''!

!UnitLiquid class methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 20:40:49'!
initializeCentilitro
	^ self new initializeCentilitro! !

!UnitLiquid class methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 20:40:59'!
initializeDecalitro
	^ self new initializeDecalitro! !

!UnitLiquid class methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 20:41:06'!
initializeDecilitro
	^ self new initializeDecilitro! !

!UnitLiquid class methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 20:41:28'!
initializeHectolitro
	^ self new initializeHectolitro! !

!UnitLiquid class methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 20:41:34'!
initializeKilolitro
	^ self new initializeKilolitro! !

!UnitLiquid class methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 20:41:17'!
initializeLitro	
	^ self new initializeLitro! !

!UnitLiquid class methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 20:41:43'!
initializeMililitro
	^ self new initializeMililitro! !


!classDefinition: #UnitMass category: #'Measure-Solution'!
Unit subclass: #UnitMass
	instanceVariableNames: 'proporcionAGramos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!UnitMass methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 19:30:46'!
convert: aNumber to: anUnitMass 
	^ anUnitMass transformarGramosAMi: (self transformarAGramos: aNumber )! !

!UnitMass methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 19:57:48'!
initializeCentigramo
	proporcionAGramos _ 1/100.! !

!UnitMass methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 20:00:02'!
initializeDecagramo
	proporcionAGramos _ 10! !

!UnitMass methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 19:58:22'!
initializeDecigramo
	proporcionAGramos _ 1/10! !

!UnitMass methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 19:31:59'!
initializeGramo
	proporcionAGramos _ 1! !

!UnitMass methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 19:59:23'!
initializeHectogramo
	 proporcionAGramos _ 100! !

!UnitMass methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 19:32:15'!
initializeKilogramo
	
	proporcionAGramos _ 1000.! !

!UnitMass methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 19:52:44'!
initializeMiligramo
	proporcionAGramos _ 1/1000! !

!UnitMass methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 19:31:28'!
transformarAGramos: aNumber 
	^ aNumber * proporcionAGramos.! !

!UnitMass methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 19:34:06'!
transformarGramosAMi: aNumber
	^ aNumber / proporcionAGramos ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnitMass class' category: #'Measure-Solution'!
UnitMass class
	instanceVariableNames: ''!

!UnitMass class methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 19:57:32'!
initializeCentigramo
	^ self new initializeCentigramo ! !

!UnitMass class methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 19:59:41'!
initializeDecagramo
	^ self new initializeDecagramo ! !

!UnitMass class methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 19:58:01'!
initializeDecigramo
	^ self new initializeDecigramo ! !

!UnitMass class methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 19:21:22'!
initializeGramo
	
	^ self new initializeGramo ! !

!UnitMass class methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 19:59:03'!
initializeHectogramo
	^ self new initializeHectogramo ! !

!UnitMass class methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 19:26:48'!
initializeKilogramo
	^ self new initializeKilogramo ! !

!UnitMass class methodsFor: 'as yet unclassified' stamp: 'Ji 6/6/2017 19:49:07'!
initializeMiligramo
	^ self new initializeMiligramo ! !


!classDefinition: #UnitTemperature category: #'Measure-Solution'!
Unit subclass: #UnitTemperature
	instanceVariableNames: 'equivalenciaAKelvin equivalenciaACelsius isFahrenheit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!UnitTemperature methodsFor: 'initialization' stamp: 'JI 6/6/2017 15:15:27'!
initializeCelsius
	equivalenciaAKelvin _ 273 + (15/100).
	equivalenciaACelsius _ 0.
	isFahrenheit _ false.! !

!UnitTemperature methodsFor: 'initialization' stamp: 'JI 6/6/2017 15:15:27'!
initializeFahrenheit
	equivalenciaAKelvin _ 0.
	equivalenciaACelsius _ 0.
	isFahrenheit _ true.! !

!UnitTemperature methodsFor: 'initialization' stamp: 'JI 6/6/2017 15:15:27'!
initializeKelvin
	equivalenciaAKelvin _ 0.
	equivalenciaACelsius _ -273 - (15/100).
	isFahrenheit _ false.! !


!UnitTemperature methodsFor: 'comparing' stamp: 'JI 6/6/2017 15:15:27'!
= anotherUnit
	"falta comletar"
	^(self class = anotherUnit class)! !

!UnitTemperature methodsFor: 'comparing' stamp: 'JI 6/6/2017 15:15:27'!
hash
	"falta completar"
	^equivalenciaAKelvin ! !


!UnitTemperature methodsFor: 'conversion' stamp: 'JI 6/6/2017 15:33:14'!
convert: aQuantity to: anUnitTemperature 
	
	^ anUnitTemperature transformarCelsiusAMi: (self convertirACelsiusLaCantidad: aQuantity)! !

!UnitTemperature methodsFor: 'conversion' stamp: 'JI 6/6/2017 15:15:27'!
convertirACelsiusLaCantidad: aNumber
	
	isFahrenheit ifTrue: [^aNumber -32 * (5/9)]  ifFalse: [^aNumber + equivalenciaACelsius ]! !

!UnitTemperature methodsFor: 'conversion' stamp: 'JI 6/6/2017 15:15:27'!
transformarCelsiusAMi: aNumber
	isFahrenheit ifTrue: [^9/5*aNumber + 32] ifFalse: [^aNumber - equivalenciaACelsius ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnitTemperature class' category: #'Measure-Solution'!
UnitTemperature class
	instanceVariableNames: ''!

!UnitTemperature class methodsFor: 'initialization' stamp: 'JI 6/6/2017 15:15:27'!
initializeCelsius
	^ self new initializeCelsius.! !

!UnitTemperature class methodsFor: 'initialization' stamp: 'JI 6/6/2017 15:15:27'!
initializeFahrenheit
	^ self new initializeFahrenheit.! !

!UnitTemperature class methodsFor: 'initialization' stamp: 'JI 6/6/2017 15:15:27'!
initializeKelvin
	^ self new initializeKelvin.! !


!classDefinition: #UnitTime category: #'Measure-Solution'!
Unit subclass: #UnitTime
	instanceVariableNames: 'equivalentToDays equivalentToHours equivalentToMinutes equivalentToSeconds'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!UnitTime methodsFor: 'initialization' stamp: 'JAK 6/6/2017 19:32:37'!
initializeDay
	equivalentToDays := 1.
	equivalentToHours := 24.
	equivalentToMinutes := 1440.
	equivalentToSeconds := 86400.
	unitType := 'day'.! !

!UnitTime methodsFor: 'initialization' stamp: 'JAK 6/6/2017 19:34:12'!
initializeHours
	equivalentToDays := 1/24.
	equivalentToHours := 1.
	equivalentToMinutes := 60.
	equivalentToSeconds := 3600.
	unitType := 'hour'.! !

!UnitTime methodsFor: 'initialization' stamp: 'JAK 6/6/2017 19:34:37'!
initializeMinutes
	equivalentToDays := 1/1440.
	equivalentToHours := 1/60.
	equivalentToMinutes := 1.
	equivalentToSeconds := 60.
	unitType := 'minute'.! !

!UnitTime methodsFor: 'initialization' stamp: 'JAK 6/6/2017 19:35:06'!
initializeSeconds
	equivalentToDays := 1/86400.
	equivalentToHours := 1/3600.
	equivalentToMinutes := 1/60.
	equivalentToSeconds := 1.
	unitType := 'second'.! !


!UnitTime methodsFor: 'conversion' stamp: 'JAK 6/6/2017 19:43:50'!
convert: aQuantity to: aUnit
	
	^equivalentToSeconds * aQuantity / (aUnit equivalentToSeconds)  .! !

!UnitTime methodsFor: 'conversion' stamp: 'JAK 6/6/2017 19:43:10'!
equivalentToSeconds
	^equivalentToSeconds ! !


!UnitTime methodsFor: 'comparing' stamp: 'JAK 6/6/2017 19:46:23'!
= anotherUnit
	"falta comletar"
	^(self class = anotherUnit class)! !

!UnitTime methodsFor: 'comparing' stamp: 'JAK 6/6/2017 19:46:44'!
hash
	"falta completar"! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnitTime class' category: #'Measure-Solution'!
UnitTime class
	instanceVariableNames: ''!

!UnitTime class methodsFor: 'initialization' stamp: 'JAK 6/6/2017 19:30:25'!
initializeDay

	^self new initializeDay.! !

!UnitTime class methodsFor: 'initialization' stamp: 'JAK 6/6/2017 19:17:33'!
initializeHours
		^self new initializeHours.! !

!UnitTime class methodsFor: 'initialization' stamp: 'JAK 6/6/2017 19:17:12'!
initializeMinutes

	^self new initializeMinutes.! !

!UnitTime class methodsFor: 'initialization' stamp: 'JAK 6/6/2017 19:17:19'!
initializeSeconds

	^self new initializeSeconds.! !
