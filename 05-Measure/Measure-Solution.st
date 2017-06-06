!classDefinition: #TimeMeasure category: #'Measure-Solution'!
Duration subclass: #TimeMeasure
	instanceVariableNames: 'time'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!TimeMeasure methodsFor: 'initialization' stamp: 'JAK 6/5/2017 23:21:03'!
initializeWithTime: aTime

	time := aTime
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TimeMeasure class' category: #'Measure-Solution'!
TimeMeasure class
	instanceVariableNames: ''!

!TimeMeasure class methodsFor: 'instance creation' stamp: 'JAK 6/5/2017 23:38:17'!
initializeHoursWith: quantity

	^self new initializeWithTime: (Time hour: quantity minute: 0 second: 0).! !

!TimeMeasure class methodsFor: 'instance creation' stamp: 'JAK 6/5/2017 23:33:24'!
initializeMinutesWith: quantity

	^self new initializeWithTime: (Time hour: 0 minute: quantity second: 0).! !

!TimeMeasure class methodsFor: 'instance creation' stamp: 'JAK 6/5/2017 23:22:37'!
initializeSecondsWith: quantity

	^self new initializeWithTime: (Time seconds: quantity).! !


!classDefinition: #DistanceMeasure category: #'Measure-Solution'!
Magnitude subclass: #DistanceMeasure
	instanceVariableNames: 'quantity unitType'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!DistanceMeasure methodsFor: 'comparing' stamp: 'JI 6/1/2017 17:05:51'!
< someDistance
	^ self factorValue < (someDistance factorValue )! !

!DistanceMeasure methodsFor: 'comparing' stamp: 'jak 6/1/2017 20:46:35'!
= anotherDistance

	^ self class = anotherDistance class and: [self factorValue = anotherDistance factorValue].! !

!DistanceMeasure methodsFor: 'comparing' stamp: 'jak 6/1/2017 20:50:36'!
hash
	^ self factorValue  ! !


!DistanceMeasure methodsFor: 'operating' stamp: 'JI 6/4/2017 15:52:37'!
* aSmallInteger 
	^ self class initializeWith: ( self factorValue * aSmallInteger ) asUnit: DistanceUnit initializeMetro ! !

!DistanceMeasure methodsFor: 'operating' stamp: 'JI 6/4/2017 15:52:50'!
+ someDistance

	^ self class initializeWith: (( self factorValue + someDistance factorValue )) asUnit: DistanceUnit initializeMetro ! !

!DistanceMeasure methodsFor: 'operating' stamp: 'JI 6/4/2017 15:51:05'!
- someDistance
	^ self class initializeWith: (( self factorValue - someDistance factorValue )) asUnit: DistanceUnit initializeMetro ! !

!DistanceMeasure methodsFor: 'operating' stamp: 'JI 6/4/2017 15:52:55'!
/ aSmallInteger 
	^ self class initializeWith: ( self factorValue / aSmallInteger ) asUnit: DistanceUnit initializeMetro ! !

!DistanceMeasure methodsFor: 'operating' stamp: 'jak 5/28/2017 19:29:51'!
adaptToNumber: aNumber andSend: selector 
	^self perform: selector with: aNumber.! !

!DistanceMeasure methodsFor: 'operating' stamp: 'JI 6/4/2017 15:52:59'!
negated
	^ self class initializeWith: ((0 - self factorValue)) asUnit: DistanceUnit initializeMetro ! !


!DistanceMeasure methodsFor: 'interval' stamp: 'JI 6/2/2017 03:46:41'!
to: aDistance
	
	^ IntervalOfDistances from: self to: aDistance ! !

!DistanceMeasure methodsFor: 'interval' stamp: 'JI 6/2/2017 03:47:01'!
to: aDistance by: stepDistance 
	
	^ IntervalOfDistances from: self to: aDistance  by: stepDistance ! !

!DistanceMeasure methodsFor: 'interval' stamp: 'JI 6/2/2017 03:47:21'!
to: aDistance by: steps do: aBlockClosure
	
		^ IntervalOfDistances from: self to: aDistance  by: steps do: aBlockClosure ! !


!DistanceMeasure methodsFor: 'initialization' stamp: 'Ji 5/30/2017 21:30:19'!
initializeWith: aSmallInteger asUnit: anUnitType 
	unitType _ anUnitType.
	quantity _ aSmallInteger .! !


!DistanceMeasure methodsFor: 'inspecting' stamp: 'Ji 6/1/2017 19:27:48'!
amount
	^ quantity ! !

!DistanceMeasure methodsFor: 'inspecting' stamp: 'Ji 5/30/2017 21:37:50'!
factorValue
	^ quantity * (unitType convertionFactor)! !

!DistanceMeasure methodsFor: 'inspecting' stamp: 'jak 6/1/2017 19:46:38'!
unit
	^ unitType! !


!DistanceMeasure methodsFor: 'conversion' stamp: 'JI 6/4/2017 15:53:24'!
convertTo: aUnit
	^DistanceMeasure initializeWith: (self unit convert: quantity to: aUnit ) asUnit: aUnit! !


!DistanceMeasure methodsFor: 'printing' stamp: 'jak 6/1/2017 19:57:38'!
printString
	|extraS|
	extraS := String new.
	quantity > 1 ifTrue: [extraS := 's'].
	^ quantity printString, ' ' , unitType printString, extraS ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DistanceMeasure class' category: #'Measure-Solution'!
DistanceMeasure class
	instanceVariableNames: 'quantity'!

!DistanceMeasure class methodsFor: 'class initialization' stamp: 'Ji 5/30/2017 21:30:07'!
initializeWith: aSmallInteger asUnit: anUnitType
	
	^self new initializeWith: aSmallInteger asUnit: anUnitType .! !


!classDefinition: #TemperatureMeasure category: #'Measure-Solution'!
Magnitude subclass: #TemperatureMeasure
	instanceVariableNames: 'quantity unitType'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!TemperatureMeasure methodsFor: 'initialization' stamp: 'JI 6/4/2017 16:14:57'!
initializeWith: aNumber asUnit: aTemperatureUnits 
	quantity _ aNumber .
	unitType _ aTemperatureUnits .! !


!TemperatureMeasure methodsFor: 'conversion' stamp: 'JI 6/5/2017 12:21:11'!
transformarGradosAUnidad: aTemperatureUnits 
	^ aTemperatureUnits transformarCelsiusAMi: self obtenerGradosEnCelsius ! !


!TemperatureMeasure methodsFor: 'comparing' stamp: 'JI 6/5/2017 01:27:58'!
< aTemperatureMeasure 
	^ self obtenerGradosEnCelsius  < aTemperatureMeasure obtenerGradosEnCelsius 
	! !

!TemperatureMeasure methodsFor: 'comparing' stamp: 'JI 6/4/2017 16:17:11'!
= anotherTemperatureMeasure
	^ self obtenerGradosEnCelsius = anotherTemperatureMeasure obtenerGradosEnCelsius! !

!TemperatureMeasure methodsFor: 'comparing' stamp: 'JAK 6/5/2017 20:14:11'!
hash
	^self obtenerGradosEnCelsius ! !

!TemperatureMeasure methodsFor: 'comparing' stamp: 'JI 6/4/2017 16:18:06'!
obtenerGradosEnCelsius
	^ unitType convertirACelsiusLaCantidad: quantity ! !


!TemperatureMeasure methodsFor: 'operating' stamp: 'JI 6/5/2017 00:38:42'!
* aNumber 
	
	^ TemperatureMeasure initializeWith: quantity * aNumber  asUnit:  unitType .! !

!TemperatureMeasure methodsFor: 'operating' stamp: 'JI 6/5/2017 12:48:21'!
+ aTemperatureMeasure 
	| aTemperatureMeasureInMyScaleAmount |
	aTemperatureMeasureInMyScaleAmount _	aTemperatureMeasure transformarGradosAUnidad: unitType .
	^ TemperatureMeasure initializeWith: aTemperatureMeasureInMyScaleAmount+quantity asUnit: unitType ! !

!TemperatureMeasure methodsFor: 'operating' stamp: 'JI 6/5/2017 00:07:47'!
- aTemperatureMeasure 
	| restaEnCelsius |
	restaEnCelsius _	self obtenerGradosEnCelsius - aTemperatureMeasure obtenerGradosEnCelsius .
	^ TemperatureMeasure initializeWith: restaEnCelsius asUnit: TemperatureUnits initializeCelsius ! !

!TemperatureMeasure methodsFor: 'operating' stamp: 'JI 6/5/2017 00:40:49'!
/ aNumber 
	^ TemperatureMeasure initializeWith: quantity / aNumber asUnit: unitType ! !

!TemperatureMeasure methodsFor: 'operating' stamp: 'JI 6/5/2017 00:44:04'!
adaptToNumber: aNumber andSend: selector 
	^self perform: selector with: aNumber.! !


!TemperatureMeasure methodsFor: 'inspecting' stamp: 'JI 6/5/2017 11:59:30'!
amount
	^quantity ! !

!TemperatureMeasure methodsFor: 'inspecting' stamp: 'JI 6/5/2017 11:59:42'!
unit
	^ unitType ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TemperatureMeasure class' category: #'Measure-Solution'!
TemperatureMeasure class
	instanceVariableNames: ''!

!TemperatureMeasure class methodsFor: 'initialization' stamp: 'JI 6/4/2017 16:14:22'!
initializeWith: aNumber asUnit: aTemperatureUnits 
	^self new initializeWith: aNumber asUnit: aTemperatureUnits .! !


!classDefinition: #DistanceTests category: #'Measure-Solution'!
TestCase subclass: #DistanceTests
	instanceVariableNames: 'centimetros100 centimetros200 metros1 metros2 metrosOtro1 milimetros1000 milimetros2000 centimetrosOtro100 milimetrosOtro1000 kilometros1Over1000 kilometrosOtro1Over1000 kilometros2Over1000 metros3 metros4 kilometros3Over1000 centimetros300 milimetros3000 kilometros1 kilometrosOtro1 kilometros2 kilometros3 metrosMinus1 metros0 metros30 intervaloVacio intervaloDeKilometros1To2 intervaloDeKilometros2To1 intervaloDeKilometros1To2By100Metros metros100 intervaloDeKilometros2To1By100Metros intervaloDeMetros1To30 intervaloDeMetros30To1 intervaloDeMetros1To30By200Centimetros intervaloDeMetros30To1By200Centimetros intervaloDeCentimetros100To1000 centimetros1000 intervaloDeCentimetros1000To100 intervaloDeCentimetros100To1000By500Milimetros milimetros500 intervaloDeCentimetros1000To100By500Milimetros intervaloDeMilimetros1000To10000 milimetros10000 intervaloDeMilimetros10000To1000 intervaloDeMilimetros1000To10000By1Over1000Kilometro intervaloDeMilimetros10000To1000By1Over1000Kilometro centimetros1 milimetros1 celsius1 celsiusOtro1 celsius2 kekelvin274con15 celsius0 kelvin273con15 celsiusMinus273con15 kelvin0 kelvin274con15 fahrenheit33With8 fahrenheit32 fahrenheitMinus459With67'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!DistanceTests methodsFor: 'DistanceUnits * y /' stamp: 'JI 6/1/2017 16:46:07'!
test001_DistanceMultipliedByANumber
	
	self assert: metros1 * 1 = metrosOtro1 .
	self assert: metros3 * 0 = metros0.
	self assert: centimetros300 * 10 = metros30.! !

!DistanceTests methodsFor: 'DistanceUnits * y /' stamp: 'JI 6/1/2017 16:49:14'!
test002_ANumberMultipliedByADistance
	
	self assert: 1 * metros1 = metrosOtro1 .
	self assert: 0 *metros3 = metros0.
	self assert: 10 * centimetros300  = metros30.! !

!DistanceTests methodsFor: 'DistanceUnits * y /' stamp: 'JI 6/1/2017 17:01:23'!
test003_DistanceDividedByANumber
	
	self assert: metros1 / 1 = metrosOtro1 .
	self assert: centimetros300 * 10 = metros30.
	[metros3 / 0 = metros0]
		on: Error
		do: [ :anError | self assert: (anError class = ZeroDivide)] .
	
	! !


!DistanceTests methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 19:56:11'!
test001_MetroMasKilometro

	self assert: metros1 + kilometros2Over1000 = metros3 . 
	self deny: metros1 + kilometros2Over1000 = metros1 . 
	! !

!DistanceTests methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 19:50:12'!
test002_MetroMasMetro

	self assert: metros1 + metros2 = metros3. 
	self deny: metros1 + metros2 = metros4. 
	! !

!DistanceTests methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 19:56:34'!
test003_MetroMasCentimetro

	self assert: metros1 + centimetros200 = centimetros300 . 
	self deny: metros1 + centimetros200 = centimetros200 . 
	! !

!DistanceTests methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 19:56:48'!
test004_MetroMasMilimetro

	self assert: metros1 + milimetros2000 = milimetros3000 . 
	self deny: metros1 + milimetros2000 = milimetros2000 . 
	! !

!DistanceTests methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 19:57:10'!
test005_CentimetroMasKilometro

	self assert: centimetros100 + kilometros1Over1000 = metros2 . 
	self deny: centimetros200 + kilometros3Over1000 = metros2 . 
	! !

!DistanceTests methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 19:59:20'!
test006_CentimetroMasMetro

	self assert: centimetros100 + metros1 = metros2 . 
	self deny: centimetros200 + metros3 = metros2 . 
	! !

!DistanceTests methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 19:59:39'!
test007_CentimetroMasCentimetro

	self assert: centimetros100 + centimetrosOtro100 = metros2 . 
	self deny: centimetros200 + centimetros300 = metros2 . 
	! !

!DistanceTests methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 19:59:56'!
test008_CentimetroMasMilimetro

	self assert: centimetros100 + milimetros1000 = metros2 . 
	self deny: centimetros200 + milimetros2000 = metros2 . 
	! !

!DistanceTests methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 20:03:38'!
test009_MilimetroMasKilometro

	self assert: milimetros1000 + kilometros1Over1000 = metros2 . 
	self deny: milimetros2000 + kilometros3Over1000 = metros2 . 
	! !

!DistanceTests methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 20:04:02'!
test010_MilimetroMasMetro

	self assert: milimetros1000 + metros1 = metros2 . 
	self deny: milimetros2000 + metros3 = metros2 . 
	! !

!DistanceTests methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 20:04:16'!
test011_MilimetroMasCentimetro

	self assert: milimetros1000 + centimetros100 = metros2 . 
	self deny: milimetros2000 + centimetros300 = metros2 . 
	! !

!DistanceTests methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 20:04:46'!
test012_MilimetroMasMilimetro

	self assert: milimetros1000 + milimetrosOtro1000 = metros2 . 
	self deny: milimetros2000 + milimetros3000 = metros2 . 
	! !

!DistanceTests methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 20:06:45'!
test013_KilometroMasKilometro

	self assert: kilometros1 + kilometrosOtro1 = kilometros2 . 
	self deny: kilometros1 + kilometros3 = kilometrosOtro1Over1000 . 
	! !

!DistanceTests methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 20:08:47'!
test014_KilometroMasMetro

	self assert: kilometros1Over1000 + metros2 = metros3. 
	self deny: kilometros1Over1000 + metros2 = metros1 . 
	! !

!DistanceTests methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 20:09:10'!
test015_KilometroMasCentimetro

	self assert: kilometros1Over1000 + centimetros200 = metros3. 
	self deny: kilometros1Over1000 + centimetros200 = metros1 . 
	! !

!DistanceTests methodsFor: 'DistanceUnits +' stamp: 'JI 5/31/2017 20:09:26'!
test016_KilometroMasMilimetro

	self assert: kilometros1Over1000 + milimetros2000 = metros3. 
	self deny: kilometros1Over1000 + milimetros2000 = metros1 . 
	! !


!DistanceTests methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:32:21'!
test001_MetroMenosKilometro

	self assert: metros1 - kilometros2Over1000 = metrosMinus1 . 
	self deny: metros1 - kilometros2Over1000 = metros0 . 
	! !

!DistanceTests methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:34:11'!
test002_MetroMenosMetro

	self assert: metros1 - metrosOtro1 = metros0 . 
	self deny: metros3 - metros1 = metros3. 
	! !

!DistanceTests methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:34:31'!
test003_MetroMenosCentimetro

	self assert: metros1 - centimetros100 = metros0 . 
	self deny: metros3 - centimetros100 = metros3. 
	! !

!DistanceTests methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:34:48'!
test004_MetroMenosMilimetro

	self assert: metros1 - milimetros1000 = metros0 . 
	self deny: metros3 - milimetros1000 = metros3. 
	! !

!DistanceTests methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:35:29'!
test005_CentimetroMenosKilometro

	self assert: centimetros100 - kilometros1Over1000 = metros0 . 
	self deny: centimetros300 - kilometros1Over1000 = milimetros3000 . 
	! !

!DistanceTests methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:35:45'!
test006_CentimetroMenosMetro

	self assert: centimetros100 - metros1 = metros0 . 
	self deny: centimetros300 - metros1 = milimetros3000 . 
	! !

!DistanceTests methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:35:58'!
test007_CentimetroMenosCentimetro

	self assert: centimetros100 - centimetros100 = metros0 . 
	self deny: centimetros300 - centimetros100 = milimetros3000 . 
	! !

!DistanceTests methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:36:17'!
test008_CentimetroMenosMilimetro

	self assert: centimetros100 - milimetros1000 = metros0 . 
	self deny: centimetros300 - milimetros1000 = milimetros3000 . 
	! !

!DistanceTests methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:36:40'!
test009_MilimetroMenosKilometro

	self assert: milimetros1000 - kilometros1Over1000 = metros0 . 
	self deny: milimetros3000 - kilometros1Over1000 = milimetros3000 . 
	! !

!DistanceTests methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:36:55'!
test010_MilimetroMenosMetro

	self assert: milimetros1000 - metros1 = metros0 . 
	self deny: milimetros3000 - metros1 = milimetros3000 . 
	! !

!DistanceTests methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:38:02'!
test011_MilimetroMenosCentimetro

	self assert: milimetros1000 - centimetros100 = metros0 . 
	self deny: milimetros3000 - centimetros100 = milimetros3000 . 
	! !

!DistanceTests methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:38:14'!
test012_MilimetroMenosMilimetro

	self assert: milimetros1000 - milimetrosOtro1000 = metros0 . 
	self deny: milimetros3000 - milimetrosOtro1000 = milimetros3000 . 
	! !

!DistanceTests methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:38:41'!
test013_KilometroMenosKilometro

	self assert: kilometros1Over1000 - kilometrosOtro1Over1000 = metros0 . 
	self deny: kilometros3Over1000 - kilometros1Over1000 = milimetros3000 . 
	! !

!DistanceTests methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:38:55'!
test014_KilometroMenosMetro

	self assert: kilometros1Over1000 - metros1 = metros0 . 
	self deny: kilometros3Over1000 - metros1 = milimetros3000 . 
	! !

!DistanceTests methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:39:21'!
test015_KilometroMenosCentimetro

	self assert: kilometros1Over1000 - centimetros100 = metros0 . 
	self deny: kilometros3Over1000 - centimetros100 = milimetros3000 . 
	! !

!DistanceTests methodsFor: 'DistanceUnits -' stamp: 'JI 6/1/2017 16:39:33'!
test016_KilometroMenosMilimetro

	self assert: kilometros1Over1000 - milimetros1000 = metros0 . 
	self deny: kilometros3Over1000 - milimetros1000 = milimetros3000 . 
	! !


!DistanceTests methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:06:21'!
test001_MetroIgualAMetro
	
	self assert: metros1 = metrosOtro1 .
	self deny: metros1 = metros2.! !

!DistanceTests methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:06:46'!
test002_MetroIgualACentimetro
	
	self assert: metros1 = centimetros100 .
	self deny: metros1 = centimetros200 .! !

!DistanceTests methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:11:02'!
test003_MetroIgualAMilimetro
	
	self assert: metros1 = milimetros1000 .
	self deny: metros1 = milimetros2000 .! !

!DistanceTests methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:31:44'!
test004_MetroIgualAKilometro
	
	self assert: metros1 = kilometros1Over1000 .
	self deny: metros1 = kilometros2Over1000 .! !

!DistanceTests methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:15:04'!
test005_CentimetroIgualAMetro
	
	self assert: centimetros100 = metros1 .
	self deny: centimetros100 = metros2.! !

!DistanceTests methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:16:44'!
test006_CentimetroIgualACentimetro
	
	self assert: centimetros100 = centimetrosOtro100 .
	self deny: centimetros100 = centimetros200.! !

!DistanceTests methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:17:44'!
test007_CentimetroIgualAMilimetro
	
	self assert: centimetros100 = milimetros1000 .
	self deny: centimetros100 = milimetros2000 .! !

!DistanceTests methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:32:07'!
test008_CentimetroIgualAKilometro
	
	self assert: centimetros100 = kilometros1Over1000 .
	self deny: centimetros100 = kilometros2Over1000 .! !

!DistanceTests methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:34:28'!
test009_MilimetroIgualAKilometro
	
	self assert: milimetros1000 = kilometros1Over1000 .
	self deny: milimetros2000 = kilometros1Over1000 .! !

!DistanceTests methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:20:51'!
test010_MilimetroIgualAMetro
	
	self assert: milimetros1000 = metros1 .
	self deny: milimetros1000 = metros2 .! !

!DistanceTests methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:20:56'!
test011_MilimetroIgualACentimetro
	
	self assert: milimetros1000 = centimetros100 .
	self deny: milimetros1000 = centimetros200 .! !

!DistanceTests methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:21:10'!
test012_MilimetroIgualAMilimetro
	
	self assert: milimetros1000 = milimetrosOtro1000 .
	self deny: milimetros1000 = milimetros2000 .! !

!DistanceTests methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:28:04'!
test013_KilometroIgualAKilometro
	
	self assert: kilometros1Over1000 = kilometrosOtro1Over1000 .
	self deny: kilometros1Over1000 = kilometros2Over1000 .! !

!DistanceTests methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:32:42'!
test014_KilometroIgualAMetro
	
	self assert: kilometros1Over1000 = metros1 .
	self deny: kilometros1Over1000 = metros2 .! !

!DistanceTests methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:29:47'!
test015_KilometroIgualACentimetro
	
	self assert: kilometros1Over1000 = centimetros100 .
	self deny: kilometros1Over1000 = centimetros200 .! !

!DistanceTests methodsFor: 'DistanceUnits =' stamp: 'JI 5/31/2017 19:30:01'!
test016_KilometroIgualAMilimetro
	
	self assert: kilometros1Over1000 = milimetros1000 .
	self deny: kilometros1Over1000 = milimetros2000 .! !


!DistanceTests methodsFor: 'DistanceUnits Comparison' stamp: 'JI 6/1/2017 17:05:19'!
test001_DistanceLessDistance
	
	self deny: metros1 < centimetros100 .
	self assert: milimetros1000 < kilometros2Over1000 .
	self deny: kilometros1Over1000 < metros0.! !

!DistanceTests methodsFor: 'DistanceUnits Comparison' stamp: 'JI 6/1/2017 17:06:17'!
test002_DistanceLessOrEqualDistance
	
	self assert: metros1 <= centimetros100 .
	self assert: milimetros1000 <= kilometros2Over1000 .
	self deny: kilometros1Over1000 <= metros0.! !

!DistanceTests methodsFor: 'DistanceUnits Comparison' stamp: 'JI 6/1/2017 17:08:39'!
test003_DistanceGreaterThanDistance
	
	self deny: metros1 > centimetros100 .
	self deny: milimetros1000 > kilometros2Over1000 .
	self assert: kilometros1Over1000 > metros0.! !

!DistanceTests methodsFor: 'DistanceUnits Comparison' stamp: 'JI 6/1/2017 17:08:32'!
test004_DistanceGreaterOrEqualThanDistance
	
	self assert: metros1 >= centimetros100 .
	self deny: milimetros1000 >= kilometros2Over1000 .
	self assert: kilometros1Over1000 >= metros0.! !


!DistanceTests methodsFor: 'Interval' stamp: 'JI 6/2/2017 02:41:05'!
hacerQueElIntervaloDevuelvaDistanciasYNoNumeros
	
	! !

!DistanceTests methodsFor: 'Interval' stamp: 'JI 6/2/2017 03:03:52'!
test001_IntervaloVacio
	
	intervaloVacio _ IntervalOfDistances intervaloVacio .
	self assert: intervaloVacio size = 0.! !

!DistanceTests methodsFor: 'Interval' stamp: 'JI 6/3/2017 14:21:45'!
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

!DistanceTests methodsFor: 'Interval' stamp: 'JI 6/3/2017 14:23:00'!
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
	self assert: intervaloDeMilimetros10000To1000 size =9001.! !

!DistanceTests methodsFor: 'Interval' stamp: 'JI 6/2/2017 02:57:44'!
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
	self assert: intervaloDeMilimetros1000To10000By1Over1000Kilometro size =10.! !

!DistanceTests methodsFor: 'Interval' stamp: 'JI 6/2/2017 03:04:06'!
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
	self assert: intervaloDeMilimetros10000To1000By1Over1000Kilometro size =10.! !

!DistanceTests methodsFor: 'Interval' stamp: 'JI 6/2/2017 03:39:07'!
test006_IntervaloFromToByDoDeDistancias
	
	| i |
	
	i _ kilometros1 .
	IntervalOfDistances from: kilometros1  to:  kilometros2 by: metros100 do: [ :aDistance | 
		self assert: aDistance = i.
		i _ i+metros100 .].
	
	i _ metros1 .
	IntervalOfDistances from: metros1  to: metros30 by: centimetros200 do: [ :aDistance | 
		self assert: aDistance = i.
		i _ i+centimetros200 .].
	
	i _ centimetros100 .
	IntervalOfDistances from: centimetros100  to: centimetros1000 by: milimetros500 do: [ :aDistance | 
		self assert: aDistance = i.
		i _ i+milimetros500 .].
	
	i _ milimetros1000 .
	IntervalOfDistances from: milimetros1000  to: milimetros10000 by: kilometros1Over1000 do: [ :aDistance | 
		self assert: aDistance = i.
		i _ i+kilometros1Over1000 .].
	
! !


!DistanceTests methodsFor: 'SetUp' stamp: 'JI 6/4/2017 15:38:12'!
centimetrosSetUp

	centimetros1 _ DistanceMeasure initializeWith: 1 asUnit: DistanceUnit initializeCentimetro  .	
	centimetros100 _ DistanceMeasure initializeWith: 100 asUnit: DistanceUnit initializeCentimetro .	
	centimetrosOtro100 _ DistanceMeasure initializeWith: 100 asUnit: DistanceUnit initializeCentimetro .	
	centimetros200 _ DistanceMeasure initializeWith: 200 asUnit:  DistanceUnit initializeCentimetro .	
	centimetros300 _ DistanceMeasure initializeWith: 300 asUnit: DistanceUnit initializeCentimetro .	
	centimetros1000 _ DistanceMeasure initializeWith: 1000 asUnit:  DistanceUnit initializeCentimetro .		! !

!DistanceTests methodsFor: 'SetUp' stamp: 'JI 6/3/2017 14:27:57'!
intervalosSetUp
	
	intervaloVacio _ IntervalOfDistances intervaloVacio.
	
	intervaloDeKilometros1To2 _ IntervalOfDistances from: kilometros1 to: kilometros2 .
	intervaloDeKilometros2To1 _ IntervalOfDistances from: kilometros2 to: kilometros1 .
	intervaloDeKilometros1To2By100Metros _ IntervalOfDistances from: kilometros1 to: kilometros2 by: metros100.
	intervaloDeKilometros2To1By100Metros _ IntervalOfDistances from: kilometros2 to: kilometros1 by: metros100 negated .
	
	intervaloDeMetros1To30 _ IntervalOfDistances from: metros1  to: metros30  .
	intervaloDeMetros30To1 _ IntervalOfDistances from: metros30 to:  metros1 .
	intervaloDeMetros1To30By200Centimetros _ IntervalOfDistances from: metros1  to: metros30 by: centimetros200 .
	intervaloDeMetros30To1By200Centimetros _ IntervalOfDistances from: metros30  to: metros1 by: centimetros200  negated.

	
	intervaloDeCentimetros100To1000 _ IntervalOfDistances from: centimetros100  to: centimetros1000  .
	intervaloDeCentimetros1000To100 _ IntervalOfDistances from: centimetros1000 to: centimetros100 .
	intervaloDeCentimetros100To1000By500Milimetros _ IntervalOfDistances from: centimetros100 to: centimetros1000 by: milimetros500.
	intervaloDeCentimetros1000To100By500Milimetros _ IntervalOfDistances from: centimetros1000 to: centimetros100 by: milimetros500  negated.
	
	
	intervaloDeMilimetros1000To10000 _ IntervalOfDistances from: milimetros1000  to: milimetros10000.
	intervaloDeMilimetros10000To1000 _ IntervalOfDistances from: milimetros10000 to: milimetros1000 .
	intervaloDeMilimetros1000To10000By1Over1000Kilometro  _ IntervalOfDistances from: milimetros1000 to: milimetros10000 by: kilometros1Over1000 .
	intervaloDeMilimetros10000To1000By1Over1000Kilometro  _ IntervalOfDistances from: milimetros10000 to: milimetros1000 by: kilometros1Over1000  negated.


	
	! !

!DistanceTests methodsFor: 'SetUp' stamp: 'JI 6/4/2017 15:40:57'!
kilometrosSetUp

	kilometros1Over1000 _ DistanceMeasure initializeWith: 1/1000 asUnit: DistanceUnit initializeKilometro .
	kilometrosOtro1Over1000 _ DistanceMeasure initializeWith: 1/1000 asUnit: DistanceUnit initializeKilometro .
	kilometros2Over1000 _  DistanceMeasure initializeWith: 2/1000 asUnit: DistanceUnit initializeKilometro .
	kilometros3Over1000 _  DistanceMeasure initializeWith: 3/1000 asUnit: DistanceUnit initializeKilometro .
	kilometros1 _ DistanceMeasure initializeWith: 1 asUnit: DistanceUnit initializeKilometro .
	kilometrosOtro1 _ DistanceMeasure initializeWith: 1 asUnit: DistanceUnit initializeKilometro .
	kilometros2 _ DistanceMeasure initializeWith: 2 asUnit: DistanceUnit initializeKilometro .
	kilometros3 _ DistanceMeasure initializeWith: 3 asUnit: DistanceUnit initializeKilometro .
	! !

!DistanceTests methodsFor: 'SetUp' stamp: 'JI 6/4/2017 15:40:13'!
metrosSetUp
	
	metrosMinus1 _ DistanceMeasure initializeWith: -1 asUnit: DistanceUnit initializeMetro .
	metros0 _ DistanceMeasure initializeWith: 0 asUnit: DistanceUnit initializeMetro .
	metros1 _ DistanceMeasure initializeWith: 1 asUnit:  DistanceUnit initializeMetro .
	metrosOtro1 _ DistanceMeasure initializeWith: 1 asUnit:  DistanceUnit initializeMetro .
	metros2 _ DistanceMeasure initializeWith: 2 asUnit: DistanceUnit initializeMetro .
	metros3 _ DistanceMeasure initializeWith: 3 asUnit: DistanceUnit initializeMetro .
	metros4 _ DistanceMeasure initializeWith: 4 asUnit:  DistanceUnit initializeMetro .
	metros30 _ DistanceMeasure initializeWith: 30 asUnit: DistanceUnit initializeMetro .
	metros100 _ DistanceMeasure initializeWith: 100 asUnit: DistanceUnit initializeMetro .! !

!DistanceTests methodsFor: 'SetUp' stamp: 'JI 6/4/2017 15:41:40'!
milimetrosSetUp
	
	milimetros1 _ DistanceMeasure initializeWith: 1 asUnit: DistanceUnit initializeMilimetro .
	milimetros500 _ DistanceMeasure initializeWith: 500 asUnit: DistanceUnit initializeMilimetro .	
	milimetros1000 _ DistanceMeasure initializeWith: 1000 asUnit: DistanceUnit initializeMilimetro .
	milimetrosOtro1000 _ DistanceMeasure initializeWith: 1000 asUnit: DistanceUnit initializeMilimetro .
	milimetros2000 _  DistanceMeasure initializeWith: 2000 asUnit:  DistanceUnit initializeMilimetro .
	milimetros3000 _  DistanceMeasure initializeWith: 3000 asUnit:  DistanceUnit initializeMilimetro .
	milimetros10000 _  DistanceMeasure initializeWith: 10000 asUnit:  DistanceUnit initializeMilimetro .
	! !

!DistanceTests methodsFor: 'SetUp' stamp: 'JI 6/4/2017 16:10:37'!
setUp
	self kilometrosSetUp .
	self metrosSetUp.
	self centimetrosSetUp .
	self milimetrosSetUp .
	self intervalosSetUp .
	! !


!classDefinition: #TemperatureTests category: #'Measure-Solution'!
TestCase subclass: #TemperatureTests
	instanceVariableNames: 'grados unidad celsiusMinus273con15 celsius0 celsius1 celsiusOtro1 celsius2 fahrenheitMinus459With67 fahrenheit32 fahrenheit33With8 kelvin0 kelvin273con15 kelvin274con15 kelvinOtro273con15 fahrenheitOtro32 celsius75 celsiusMinus80 celsiusMinus5 celsius77 kelvin275con15 celsius3 fahrenheit35With6 celsius155 celsiusMinus20 celsiusMinus5Over4 fahrenheit17With8 intervaloVacio intervaloDeCelsius1To10 intervaloDeKelvin1To30 kelvin1 intervaloDefahrenheit32to40 fahrenheit1 celsius10 kelvin30 fahrenheit40 kelvin546Point3 kelvin547Point3 kelvin549Point3 kelvin548Point3 fahrenheit64 fahrenheit65Point8 fahrenheit69Point4 intervaloDeCelsius1To10By2 intervaloDeKelvin1To30By2 kelvin2 intervaloDefahrenheit32to40By2 fahrenheit2 intervaloDeCelsius1To10ByKelvin275Point15 intervaloDeKelvin1To30By2Fahrenheit456Point07 intervaloDefahrenheit32to40ByCelsius1Point8 intervaloDeKelvin1To30By2FahrenheitMinus456Point07 celsius1Point8 fahrenheitMinus456With67 fahrenheitMinus456With07 intervaloDefahrenheit32to40ByCelsiusMinus31Multiplied5Over9 celsiusMinus31Multiplied5Over9'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!TemperatureTests methodsFor: 'Tests -' stamp: 'JI 6/5/2017 00:05:56'!
test001_celsiusMenosCelsius

	self assert: celsius0 - celsius0 = celsius0 .
	self assert: celsius1 - celsius0 = celsius1 .
	self assert: celsius3 - celsius1 = celsius2 .
	self assert: celsius75 - celsiusMinus80 = celsius155.! !

!TemperatureTests methodsFor: 'Tests -' stamp: 'JI 6/5/2017 00:08:55'!
test002_celsiusMenosKelvin

	self assert: celsius0 - kelvin273con15 = celsius0 .
	self assert: celsius1 - kelvin273con15 = celsius1 .
	self assert: celsius3 - kelvin274con15 = celsius2 .
	self deny: celsius75 - kelvin275con15 = celsius77.! !

!TemperatureTests methodsFor: 'Tests -' stamp: 'JI 6/5/2017 00:09:22'!
test003_celsiusMenosFahrenheit

	self assert: celsius0 - fahrenheit32 = fahrenheit32 .
	self assert: celsius1 - fahrenheit32 = celsius1 .
	self assert: celsius3 - fahrenheit33With8 = celsius2 .
	self deny: celsius75 - fahrenheit32 = celsius77.! !

!TemperatureTests methodsFor: 'Tests -' stamp: 'JI 6/5/2017 00:09:44'!
test004_kelvinMenosUnaTemperatura

	self assert: kelvin273con15 - fahrenheit32 = fahrenheit32 .
	self assert: kelvin274con15 - celsius0 = celsius1 .
	self assert: kelvin275con15 - kelvin274con15 = celsius1 .
	self deny: kelvin275con15 - fahrenheit32 = celsius77.! !

!TemperatureTests methodsFor: 'Tests -' stamp: 'JI 6/5/2017 00:10:09'!
test005_FahrenheitMenosUnaTemperatura

	self assert: fahrenheit32 - fahrenheit32 = fahrenheit32 .
	self assert: fahrenheit33With8 - celsius0 = celsius1 .
	self assert: fahrenheit35With6 - kelvin274con15 = celsius1 .
	self deny: fahrenheit35With6 - fahrenheit32 = celsius77.! !


!TemperatureTests methodsFor: 'Tests +' stamp: 'JI 6/4/2017 23:53:40'!
test001_celsiusMasCelsius

	self assert: celsius0 + celsius0 = celsius0 .
	self assert: celsius1 + celsius0 = celsius1 .
	self assert: celsius1 + celsiusOtro1 = celsius2 .
	self assert: celsius75 + celsiusMinus80 = celsiusMinus5.! !

!TemperatureTests methodsFor: 'Tests +' stamp: 'JI 6/4/2017 23:59:22'!
test002_celsiusMasKelvin

	self assert: celsius0 + kelvin273con15 = celsius0 .
	self assert: celsius1 + kelvin273con15 = celsius1 .
	self assert: celsius1 + kelvin274con15 = celsius2 .
	self assert: celsius75 + kelvin275con15 = celsius77.! !

!TemperatureTests methodsFor: 'Tests +' stamp: 'JI 6/5/2017 00:01:28'!
test003_celsiusMasFahrenheit

	self assert: celsius0 + fahrenheit32 = fahrenheit32 .
	self assert: celsius1 + fahrenheit32 = celsius1 .
	self assert: celsius1 + fahrenheit33With8 = celsius2 .
	self deny: celsius75 + fahrenheit32 = celsius77.! !

!TemperatureTests methodsFor: 'Tests +' stamp: 'JI 6/5/2017 12:51:27'!
test004_kelvinMasUnaTemperatura

	self assert: kelvin273con15 + fahrenheit32 = kelvin546Point3 .
	self assert: kelvin274con15 + celsius0 = kelvin547Point3 .
	self assert: kelvin275con15 + kelvin274con15 = kelvin549Point3 .
	self deny: kelvin275con15 + fahrenheit32 = kelvin549Point3.! !

!TemperatureTests methodsFor: 'Tests +' stamp: 'JI 6/5/2017 12:52:51'!
test005_FahrenheitMasUnaTemperatura

	self assert: fahrenheit32 + fahrenheit32 = fahrenheit64 .
	self assert: fahrenheit33With8 + celsius0 = fahrenheit65Point8 .
	self assert: fahrenheit35With6 + kelvin274con15 = fahrenheit69Point4.
	self deny: fahrenheit35With6 + fahrenheit32 = fahrenheit64.! !


!TemperatureTests methodsFor: 'Tests =' stamp: 'JI 6/4/2017 16:11:19'!
test001_unGradoCelsiusIgualaOtroGradoCelsius

	self assert: celsius1 = celsiusOtro1.! !

!TemperatureTests methodsFor: 'Tests =' stamp: 'JI 6/4/2017 16:11:32'!
test002_unGradoCelsiusNoEsIgualaDosGradosCelsius

	self deny: celsius1 = celsius2.! !

!TemperatureTests methodsFor: 'Tests =' stamp: 'JI 6/4/2017 16:11:46'!
test003_CelsiusIgualACelsius

	self assert: celsius1 = celsius1.
	self deny: celsius1 = celsius2.! !

!TemperatureTests methodsFor: 'Tests =' stamp: 'JI 6/5/2017 01:29:56'!
test004_CelsiusIgualAKelvin

	self assert: celsius1 = kelvin274con15.
	self assert: celsius0 = kelvin273con15.
	self assert: celsiusMinus273con15 = kelvin0
	
	! !

!TemperatureTests methodsFor: 'Tests =' stamp: 'JI 6/5/2017 01:31:26'!
test005_CelsiusIgualAFahrenheit

	self assert: celsius1 = fahrenheit33With8.
	self assert: celsius0 = fahrenheit32.
	self assert: celsiusMinus273con15 = fahrenheitMinus459With67.
	
	! !

!TemperatureTests methodsFor: 'Tests =' stamp: 'JI 6/4/2017 23:32:08'!
test006_KelvinIgualACelsius

	self assert: kelvin274con15 = celsius1.
	self deny: kelvin274con15 = celsius2.! !

!TemperatureTests methodsFor: 'Tests =' stamp: 'JI 6/4/2017 23:32:52'!
test007_KelvinIgualAKelvin

	self assert: kelvin273con15 = kelvinOtro273con15 .
	self deny: kelvin274con15 = kelvin273con15.! !

!TemperatureTests methodsFor: 'Tests =' stamp: 'JI 6/4/2017 23:33:44'!
test008_KelvinIgualAFahrenheit

	self assert: kelvin273con15 = fahrenheit32 .
	self deny: kelvin274con15 = fahrenheit32.! !

!TemperatureTests methodsFor: 'Tests =' stamp: 'JI 6/4/2017 23:34:32'!
test009_FahrenheitIgualACelsius

	self assert: fahrenheit32 = celsius0 .
	self deny: fahrenheit32 = celsius1 .! !

!TemperatureTests methodsFor: 'Tests =' stamp: 'JI 6/4/2017 23:34:49'!
test010_FahrenheitIgualAKelvin

	self assert: fahrenheit32 = kelvin273con15 .
	self deny: fahrenheit32 = kelvin274con15 .! !

!TemperatureTests methodsFor: 'Tests =' stamp: 'JI 6/4/2017 23:35:50'!
test011_FahrenheitIgualAFahrenheit

	self assert: fahrenheit32 = fahrenheitOtro32 .
	self deny: fahrenheit32 = fahrenheit33With8 .! !


!TemperatureTests methodsFor: 'Tests * y /' stamp: 'JI 6/5/2017 00:42:55'!
test001_UnaTemperaturaPorUnNumero
	
	self assert: kelvin0 * 5 = kelvin0 .
	self assert: fahrenheit32 * 1 = fahrenheit32 .
	self assert: celsiusMinus5 * 4 = celsiusMinus20.	
! !

!TemperatureTests methodsFor: 'Tests * y /' stamp: 'JI 6/5/2017 00:41:55'!
test002_UnaTemperaturaDivididoUnNumero
	
	self assert: kelvin0 / 5 = kelvin0 .
	self assert: celsius1 / 1 = celsius1 .
	self assert: fahrenheit35With6 / 2 = fahrenheit17With8 .	
! !

!TemperatureTests methodsFor: 'Tests * y /' stamp: 'JI 6/5/2017 00:43:27'!
test003_UnNumeroPorUnaTemperatura
	
	self assert:  5 * kelvin0 = kelvin0 .
	self assert: 1 * fahrenheit32 = fahrenheit32 .
	self assert: 4 * celsiusMinus5 = celsiusMinus20.	
! !


!TemperatureTests methodsFor: 'Tests comparison' stamp: 'JI 6/5/2017 01:31:37'!
test001_TemperaturaLess

	self assert:  celsiusMinus273con15 < celsius0 .
	self assert: celsius75 < celsius77 .
	self deny:  celsius0 < celsius0 .
	self deny: celsius75 < celsius1 .! !

!TemperatureTests methodsFor: 'Tests comparison' stamp: 'JI 6/5/2017 01:32:54'!
test002_TemperaturaLessOrEqual

	self assert:  celsiusMinus273con15 <= celsius0 .
	self assert: celsius75 <= celsius77 .
	self assert:  celsius0 <= celsius0 .
	self deny: celsius75 <= celsius1 .! !

!TemperatureTests methodsFor: 'Tests comparison' stamp: 'JI 6/5/2017 01:35:13'!
test003_TemperaturaGreater

	self deny:  celsiusMinus273con15 > celsius0 .
	self assert: celsius77 > celsius75 .
	self deny:  celsius0 > celsius0 .
	self assert: celsius75 > celsius1 .! !

!TemperatureTests methodsFor: 'Tests comparison' stamp: 'JI 6/5/2017 01:35:33'!
test004_TemperaturaGreaterorEqual

	self deny:  celsiusMinus273con15 >= celsius0 .
	self assert: celsius77 >= celsius75 .
	self assert:  celsius0 >= celsius0 .
	self assert: celsius75 >= celsius1 .! !


!TemperatureTests methodsFor: 'Test Intervalos' stamp: 'JI 6/5/2017 02:20:50'!
test001_IntervaloVacio
	
	self assert: intervaloVacio size = 0.! !

!TemperatureTests methodsFor: 'Test Intervalos' stamp: 'JI 6/5/2017 12:03:11'!
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

!TemperatureTests methodsFor: 'Test Intervalos' stamp: 'JI 6/5/2017 14:50:38'!
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

!TemperatureTests methodsFor: 'Test Intervalos' stamp: 'JI 6/5/2017 15:13:27'!
test004_IntervaloFromToByDoAscendenteDeTemperaturas
	
	| i |
	i _ celsius1 .
	
	i _ celsius1 .
	TemperatureInterval from: celsius1 to: celsius10 by: kelvin275con15 do: [ :aTemperature | 
		self assert: aTemperature = i.
		i _ i+ celsius2 .].
	self assert: intervaloDeCelsius1To10ByKelvin275Point15 size = 5.
	
	i _ kelvin1 .
	TemperatureInterval from: kelvin1 to: kelvin30 by: fahrenheitMinus456With07 do: [ :aTemperature | 
		self assert: aTemperature = i.
		i _ i+kelvin2.].
	self assert: intervaloDeKelvin1To30By2FahrenheitMinus456Point07 size =15.
	
	i _ fahrenheit32 .
	
	TemperatureInterval from: fahrenheit32 to: fahrenheit40 by: celsiusMinus31Multiplied5Over9 do: [ :aTemperature | 
		self assert: aTemperature  = i.
		i _ i+fahrenheit1.].
	self assert: intervaloDefahrenheit32to40ByCelsiusMinus31Multiplied5Over9 size = 9.
	! !


!TemperatureTests methodsFor: 'setUp' stamp: 'JI 6/5/2017 14:50:22'!
celsiusSetUp
	
	celsiusMinus273con15 _ TemperatureMeasure initializeWith: -273-(15/100) asUnit: TemperatureUnits initializeCelsius .
	celsiusMinus80  _ TemperatureMeasure initializeWith: -80  asUnit:  TemperatureUnits initializeCelsius .
	celsiusMinus20  _ TemperatureMeasure initializeWith: -20  asUnit:  TemperatureUnits initializeCelsius .
	celsiusMinus31Multiplied5Over9 _ TemperatureMeasure initializeWith: -31*5/9  asUnit:  TemperatureUnits initializeCelsius .
	celsiusMinus5  _ TemperatureMeasure initializeWith: -5  asUnit:  TemperatureUnits initializeCelsius .
	celsiusMinus5Over4  _ TemperatureMeasure initializeWith: -5/4  asUnit:  TemperatureUnits initializeCelsius .
	celsius0  _ TemperatureMeasure initializeWith: 0  asUnit: TemperatureUnits initializeCelsius .
	celsius1  _ TemperatureMeasure initializeWith: 1  asUnit:  TemperatureUnits initializeCelsius .
	celsius1Point8  _ TemperatureMeasure initializeWith: 1 + (8/10)  asUnit:  TemperatureUnits initializeCelsius .
	celsiusOtro1  _ TemperatureMeasure initializeWith: 1  asUnit:  TemperatureUnits initializeCelsius .
	celsius2  _ TemperatureMeasure initializeWith: 2  asUnit:  TemperatureUnits initializeCelsius .
	celsius3  _ TemperatureMeasure initializeWith: 3  asUnit:  TemperatureUnits initializeCelsius .
	celsius10  _ TemperatureMeasure initializeWith: 10  asUnit:  TemperatureUnits initializeCelsius .
	celsius75  _ TemperatureMeasure initializeWith: 75  asUnit:  TemperatureUnits initializeCelsius .
	celsius77  _ TemperatureMeasure initializeWith: 77  asUnit:  TemperatureUnits initializeCelsius .
	celsius155  _ TemperatureMeasure initializeWith: 155  asUnit:  TemperatureUnits initializeCelsius .

	
	! !

!TemperatureTests methodsFor: 'setUp' stamp: 'JI 6/5/2017 14:41:36'!
fahrenheitSetUp
	
	fahrenheitMinus459With67 _ TemperatureMeasure initializeWith: -459-(67/100) asUnit: TemperatureUnits initializeFahrenheit .
	fahrenheitMinus456With07 _ TemperatureMeasure initializeWith: -456-(7/100) asUnit: TemperatureUnits initializeFahrenheit .
	fahrenheit1  _ TemperatureMeasure initializeWith: 1 asUnit:TemperatureUnits initializeFahrenheit  .
	fahrenheit2  _ TemperatureMeasure initializeWith: 2 asUnit:TemperatureUnits initializeFahrenheit  .
	fahrenheit17With8 _ TemperatureMeasure initializeWith: 17 + (8/10) asUnit:TemperatureUnits initializeFahrenheit .
	fahrenheit32  _ TemperatureMeasure initializeWith: 32 asUnit:TemperatureUnits initializeFahrenheit .
	fahrenheitOtro32  _ TemperatureMeasure initializeWith: 32 asUnit:TemperatureUnits initializeFahrenheit .
	fahrenheit33With8  _ TemperatureMeasure initializeWith: 33+(8/10) asUnit:TemperatureUnits initializeFahrenheit  .
	fahrenheit35With6  _ TemperatureMeasure initializeWith: 35+(6/10) asUnit:TemperatureUnits initializeFahrenheit  .
	fahrenheit40  _ TemperatureMeasure initializeWith: 40 asUnit:TemperatureUnits initializeFahrenheit  .
	fahrenheit64  _ TemperatureMeasure initializeWith: 64 asUnit:TemperatureUnits initializeFahrenheit  .
	fahrenheit65Point8  _ TemperatureMeasure initializeWith: 65 +(80/100) asUnit:TemperatureUnits initializeFahrenheit  .
	fahrenheit69Point4  _ TemperatureMeasure initializeWith: 69 + (40/100) asUnit:TemperatureUnits initializeFahrenheit  .! !

!TemperatureTests methodsFor: 'setUp' stamp: 'JI 6/5/2017 14:49:59'!
intervalosSetUp
	
	intervaloVacio _ TemperatureInterval intervaloVacio .
	
	intervaloDeCelsius1To10 _ TemperatureInterval from: celsius1 to: celsius10 .
	intervaloDeCelsius1To10ByKelvin275Point15 _ TemperatureInterval from: celsius1 to: celsius10 by: kelvin275con15 .
	
	intervaloDeKelvin1To30 _ TemperatureInterval from: kelvin1 to: kelvin30.
	intervaloDeKelvin1To30By2FahrenheitMinus456Point07 _ TemperatureInterval from: kelvin1 to: kelvin30 by: fahrenheitMinus456With07 .
	
	intervaloDefahrenheit32to40 _ TemperatureInterval from: fahrenheit32 to: fahrenheit40.
	intervaloDefahrenheit32to40ByCelsiusMinus31Multiplied5Over9 _ TemperatureInterval from: fahrenheit32 to: fahrenheit40 by: celsiusMinus31Multiplied5Over9.! !

!TemperatureTests methodsFor: 'setUp' stamp: 'JI 6/5/2017 14:07:26'!
kelvinSetUp
	
	kelvin0 _ TemperatureMeasure initializeWith: 0 asUnit: TemperatureUnits initializeKelvin .
	kelvin1 _ TemperatureMeasure initializeWith: 1 asUnit: TemperatureUnits initializeKelvin .
	kelvin2 _ TemperatureMeasure initializeWith: 2 asUnit: TemperatureUnits initializeKelvin .
	kelvin30 _ TemperatureMeasure initializeWith: 30 asUnit: TemperatureUnits initializeKelvin .
	kelvin273con15  _ TemperatureMeasure initializeWith: (273+(15/100)) asUnit: TemperatureUnits initializeKelvin .
	kelvinOtro273con15 _ TemperatureMeasure initializeWith: (273+(15/100)) asUnit: TemperatureUnits initializeKelvin .
	kelvin274con15  _ TemperatureMeasure initializeWith: (274+(15/100)) asUnit: TemperatureUnits initializeKelvin .
	kelvin275con15  _ TemperatureMeasure initializeWith: (275+(15/100)) asUnit: TemperatureUnits initializeKelvin .
	kelvin546Point3 _  TemperatureMeasure initializeWith: (546+(30/100)) asUnit: TemperatureUnits initializeKelvin .
	kelvin547Point3 _  TemperatureMeasure initializeWith: (547+(30/100)) asUnit: TemperatureUnits initializeKelvin .
	kelvin548Point3 _  TemperatureMeasure initializeWith: (548+(30/100)) asUnit: TemperatureUnits initializeKelvin .
	kelvin549Point3 _  TemperatureMeasure initializeWith: (549+(30/100)) asUnit: TemperatureUnits initializeKelvin .! !

!TemperatureTests methodsFor: 'setUp' stamp: 'JI 6/5/2017 02:23:55'!
setUp
	self celsiusSetUp .
	self fahrenheitSetUp .
	self kelvinSetUp .
	
	self intervalosSetUp.! !


!classDefinition: #TimeTests category: #'Measure-Solution'!
TestCase subclass: #TimeTests
	instanceVariableNames: 'zeroSecond oneHoundreadSeconds tenSeconds nintySeconds oneMinute fortySeconds seconds3500 fiftyNineMinutes twoHours oneHour'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!TimeTests methodsFor: 'Tests -' stamp: 'JAK 6/5/2017 23:26:51'!
test001_secondMinusSecond

	self assert: zeroSecond - zeroSecond = zeroSecond.
	self assert: oneHoundreadSeconds - tenSeconds = nintySeconds.! !

!TimeTests methodsFor: 'Tests -' stamp: 'JAK 6/5/2017 23:29:45'!
test002_secondMinusMinutes

	self assert: oneMinute - zeroSecond = oneMinute.
	self assert: oneHoundreadSeconds - oneMinute = fortySeconds.! !

!TimeTests methodsFor: 'Tests -' stamp: 'JAK 6/5/2017 23:37:59'!
test003_secondMinusHours

	self assert: oneHour - oneHoundreadSeconds = seconds3500.
	self assert: oneHour - oneMinute = fiftyNineMinutes.
	self assert: twoHours - oneHour = oneHour.! !


!TimeTests methodsFor: 'setUp' stamp: 'JAK 6/5/2017 23:37:46'!
setUp
	zeroSecond := TimeMeasure initializeSecondsWith: 0.
	oneHoundreadSeconds:= TimeMeasure initializeSecondsWith: 100.
	tenSeconds := TimeMeasure initializeSecondsWith: 10.
	nintySeconds := TimeMeasure initializeSecondsWith: 90.
	fortySeconds := TimeMeasure initializeSecondsWith: 40.
	oneMinute := TimeMeasure initializeMinutesWith: 1.
	seconds3500 := TimeMeasure initializeSecondsWith: 3500.
	fiftyNineMinutes := TimeMeasure initializeMinutesWith: 59.
	twoHours := TimeMeasure initializeHoursWith: 2.
	oneHour := TimeMeasure initializeHoursWith: 1.! !


!classDefinition: #DistanceUnit category: #'Measure-Solution'!
Object subclass: #DistanceUnit
	instanceVariableNames: 'conversionFactor unitType'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!DistanceUnit methodsFor: 'printing' stamp: 'JI 6/4/2017 15:25:35'!
printString
	^ unitType! !


!DistanceUnit methodsFor: 'comparing' stamp: 'jak 6/1/2017 19:52:32'!
= anotherUnit
	^(self class = anotherUnit class) and: [self convertionFactor = anotherUnit convertionFactor]! !

!DistanceUnit methodsFor: 'comparing' stamp: 'JAK 6/5/2017 20:12:31'!
hash
	^self convertionFactor ! !


!DistanceUnit methodsFor: 'conversion' stamp: 'JI 6/3/2017 14:35:06'!
convert: quantity to: aUnit
	^quantity * conversionFactor * (1 / aUnit convertionFactor)! !

!DistanceUnit methodsFor: 'conversion' stamp: 'Ji 5/30/2017 21:40:30'!
convertionFactor
	^ conversionFactor! !


!DistanceUnit methodsFor: 'initialization' stamp: 'JI 6/4/2017 15:32:28'!
initializeCentimetro
	unitType _ 'centimeter'.
	conversionFactor _ 1/100.! !

!DistanceUnit methodsFor: 'initialization' stamp: 'JI 6/4/2017 15:31:48'!
initializeDecametro
	unitType _ 'decameter'.
	conversionFactor _ 10.! !

!DistanceUnit methodsFor: 'initialization' stamp: 'JI 6/4/2017 15:31:38'!
initializeDecimetro
	unitType _ 'decimeter'.
	conversionFactor _ 1/10.! !

!DistanceUnit methodsFor: 'initialization' stamp: 'JI 6/4/2017 15:30:07'!
initializeHectometro
	unitType _ 'hectometer'.
	conversionFactor _ 100.! !

!DistanceUnit methodsFor: 'initialization' stamp: 'JI 6/4/2017 15:29:16'!
initializeKilometro
	unitType _ 'kilometer'.
	conversionFactor _ 1000.! !

!DistanceUnit methodsFor: 'initialization' stamp: 'JI 6/4/2017 15:28:13'!
initializeMetro
	unitType _ 'meter'.
	conversionFactor _ 1.! !

!DistanceUnit methodsFor: 'initialization' stamp: 'JI 6/4/2017 15:26:50'!
initializeMilimetro
	unitType _ 'milimeter'.
	conversionFactor _ 1/1000.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DistanceUnit class' category: #'Measure-Solution'!
DistanceUnit class
	instanceVariableNames: ''!

!DistanceUnit class methodsFor: 'as yet unclassified' stamp: 'JI 6/4/2017 15:33:03'!
initializeCentimetro
	^ self new initializeCentimetro .! !

!DistanceUnit class methodsFor: 'as yet unclassified' stamp: 'JI 6/4/2017 15:33:14'!
initializeDecametro
	^ self new initializeDecametro .! !

!DistanceUnit class methodsFor: 'as yet unclassified' stamp: 'JI 6/4/2017 15:33:45'!
initializeDecimetro
	^ self new initializeDecimetro .! !

!DistanceUnit class methodsFor: 'as yet unclassified' stamp: 'JI 6/4/2017 15:32:53'!
initializeHectometro
	^ self new initializeHectometro .! !

!DistanceUnit class methodsFor: 'as yet unclassified' stamp: 'JI 6/4/2017 15:29:00'!
initializeKilometro
	^ self new initializeKilometro .! !

!DistanceUnit class methodsFor: 'as yet unclassified' stamp: 'JI 6/4/2017 15:28:26'!
initializeMetro
	^ self new initializeMetro .! !

!DistanceUnit class methodsFor: 'as yet unclassified' stamp: 'JI 6/4/2017 15:25:50'!
initializeMilimetro
	^ self new initializeMilimetro .! !


!classDefinition: #IntervalOfDistances category: #'Measure-Solution'!
Object subclass: #IntervalOfDistances
	instanceVariableNames: 'intervalo unitType fromDistance toDistance byDistance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!IntervalOfDistances methodsFor: 'initialization' stamp: 'Ji 6/1/2017 19:58:39'!
intervaloVacio
	intervalo _ nil
	! !

!IntervalOfDistances methodsFor: 'initialization' stamp: 'Ji 6/1/2017 19:59:12'!
size
	intervalo = nil ifTrue: [^0] ifFalse: [^ intervalo size] ! !


!IntervalOfDistances methodsFor: 'enumerating' stamp: 'JI 6/2/2017 03:52:46'!
by

	^  byDistance ! !

!IntervalOfDistances methodsFor: 'enumerating' stamp: 'JI 6/4/2017 15:45:22'!
do: aBlockClosure 
	intervalo do: [ :aNumber | aBlockClosure value: (DistanceMeasure initializeWith: aNumber asUnit: unitType) ]! !

!IntervalOfDistances methodsFor: 'enumerating' stamp: 'JI 6/2/2017 03:52:30'!
from

	^  fromDistance ! !

!IntervalOfDistances methodsFor: 'enumerating' stamp: 'JI 6/4/2017 15:45:14'!
from: aDistanceUnits to: aDistanceUnits2 
	| unidad |
	unidad _ DistanceMeasure  initializeWith: 1 asUnit: aDistanceUnits unit.
	(aDistanceUnits - aDistanceUnits2) factorValue > 0 ifTrue: [unidad _ unidad negated].
	^ IntervalOfDistances from: aDistanceUnits  to: aDistanceUnits2  by: unidad.
	! !

!IntervalOfDistances methodsFor: 'enumerating' stamp: 'JI 6/4/2017 15:51:19'!
from: aDistanceUnits to: aDistanceUnits2 by: aDistanceUnits3 
	
	intervalo _ Interval from: (aDistanceUnits factorValue ) to: (aDistanceUnits2 factorValue ) by: (aDistanceUnits3 factorValue ).
	unitType _ DistanceUnit initializeMetro .
	fromDistance _ aDistanceUnits .
	toDistance _ aDistanceUnits2 .
	byDistance _ aDistanceUnits3 ! !

!IntervalOfDistances methodsFor: 'enumerating' stamp: 'JI 6/2/2017 03:52:41'!
to

	^  toDistance ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IntervalOfDistances class' category: #'Measure-Solution'!
IntervalOfDistances class
	instanceVariableNames: ''!

!IntervalOfDistances class methodsFor: 'initialization' stamp: 'Ji 6/1/2017 19:56:59'!
from: aDistanceUnits to: aDistanceUnits2 
	^ self new from: aDistanceUnits to: aDistanceUnits2 ! !

!IntervalOfDistances class methodsFor: 'initialization' stamp: 'Ji 6/1/2017 19:49:07'!
intervaloVacio
	^ self new intervaloVacio! !


!IntervalOfDistances class methodsFor: 'as yet unclassified' stamp: 'Ji 6/1/2017 20:52:06'!
from: aDistanceUnits to: aDistanceUnits2 by: aDistanceUnits3 
	^self new from: aDistanceUnits to: aDistanceUnits2  by: aDistanceUnits3 ! !

!IntervalOfDistances class methodsFor: 'as yet unclassified' stamp: 'JI 6/2/2017 03:40:18'!
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


!classDefinition: #TemperatureInterval category: #'Measure-Solution'!
Object subclass: #TemperatureInterval
	instanceVariableNames: 'intervalo unitType'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!TemperatureInterval methodsFor: 'as yet unclassified' stamp: 'JI 6/5/2017 12:06:20'!
do: aBlockClosure 
	intervalo do: [ :aNumber | aBlockClosure value: (TemperatureMeasure initializeWith: aNumber asUnit: unitType ) ]! !

!TemperatureInterval methodsFor: 'as yet unclassified' stamp: 'JI 6/5/2017 12:27:54'!
from: aTemperatureMeasure to: aTemperatureMeasure2 

	unitType _ aTemperatureMeasure unit .	
	intervalo _ Interval from: (aTemperatureMeasure amount ) to: ( aTemperatureMeasure2 transformarGradosAUnidad: unitType) by: 1.
! !

!TemperatureInterval methodsFor: 'as yet unclassified' stamp: 'JI 6/5/2017 14:43:06'!
from: aTemperatureMeasure to: aTemperatureMeasure2 by: aTemperatureMeasure3 
	unitType _ aTemperatureMeasure unit .	
	intervalo _ Interval from: (aTemperatureMeasure amount ) to: ( aTemperatureMeasure2 transformarGradosAUnidad: unitType) by: ( aTemperatureMeasure3 transformarGradosAUnidad: unitType).! !

!TemperatureInterval methodsFor: 'as yet unclassified' stamp: 'JI 6/5/2017 02:29:20'!
intervaloVacio
	intervalo _ nil! !

!TemperatureInterval methodsFor: 'as yet unclassified' stamp: 'JI 6/5/2017 02:30:02'!
size
	intervalo = nil ifTrue: [^0] ifFalse: [^ intervalo size] ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TemperatureInterval class' category: #'Measure-Solution'!
TemperatureInterval class
	instanceVariableNames: ''!

!TemperatureInterval class methodsFor: 'as yet unclassified' stamp: 'JI 6/5/2017 11:56:20'!
from: aTemperatureMeasure to: aTemperatureMeasure2 
	^self new from: aTemperatureMeasure to: aTemperatureMeasure2 ! !

!TemperatureInterval class methodsFor: 'as yet unclassified' stamp: 'JI 6/5/2017 14:08:05'!
from: aTemperatureMeasure to: aTemperatureMeasure2 by: aTemperatureMeasure3 
	^ self new from: aTemperatureMeasure to: aTemperatureMeasure2  by:  aTemperatureMeasure3 ! !

!TemperatureInterval class methodsFor: 'as yet unclassified' stamp: 'JI 6/5/2017 15:13:10'!
from: aTemperatureMeasure to: aTemperatureMeasure2 by: aTemperatureMeasure3 do: aBlockClosure 
	(self from: aTemperatureMeasure to: aTemperatureMeasure2  by: aTemperatureMeasure3 ) do: aBlockClosure ! !

!TemperatureInterval class methodsFor: 'as yet unclassified' stamp: 'JI 6/5/2017 02:29:06'!
intervaloVacio
	^self new intervaloVacio ! !


!classDefinition: #TemperatureUnits category: #'Measure-Solution'!
Object subclass: #TemperatureUnits
	instanceVariableNames: 'grados unidad equivalenciaAKelvin equivalenciaACelsius equivalenciaAFahrenheit isFahrenheit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!

!TemperatureUnits methodsFor: 'initialization' stamp: 'JI 6/4/2017 23:23:43'!
initializeCelsius
	equivalenciaAKelvin _ 273 + (15/100).
	equivalenciaACelsius _ 0.
	isFahrenheit _ false.! !

!TemperatureUnits methodsFor: 'initialization' stamp: 'JI 6/4/2017 23:23:58'!
initializeFahrenheit
	equivalenciaAKelvin _ 0.
	equivalenciaACelsius _ 0.
	isFahrenheit _ true.! !

!TemperatureUnits methodsFor: 'initialization' stamp: 'JI 6/4/2017 23:24:18'!
initializeKelvin
	equivalenciaAKelvin _ 0.
	equivalenciaACelsius _ -273 - (15/100).
	isFahrenheit _ false.! !


!TemperatureUnits methodsFor: 'comparing' stamp: 'JAK 6/5/2017 20:16:34'!
= anotherUnit
	"falta comletar"
	^(self class = anotherUnit class)! !

!TemperatureUnits methodsFor: 'comparing' stamp: 'JAK 6/5/2017 20:16:56'!
hash
	"falta completar"
	^equivalenciaAKelvin ! !


!TemperatureUnits methodsFor: 'conversion' stamp: 'JI 6/5/2017 12:35:45'!
convertirACelsiusLaCantidad: aNumber
	
	isFahrenheit ifTrue: [^aNumber -32 * (5/9)]  ifFalse: [^aNumber + equivalenciaACelsius ]! !

!TemperatureUnits methodsFor: 'conversion' stamp: 'JI 6/5/2017 12:32:06'!
transformarCelsiusAMi: aNumber
	isFahrenheit ifTrue: [^9/5*aNumber + 32] ifFalse: [^aNumber - equivalenciaACelsius ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TemperatureUnits class' category: #'Measure-Solution'!
TemperatureUnits class
	instanceVariableNames: ''!

!TemperatureUnits class methodsFor: 'initialization' stamp: 'JI 6/4/2017 16:03:37'!
initializeCelsius
	^ self new initializeCelsius.! !

!TemperatureUnits class methodsFor: 'initialization' stamp: 'JI 6/4/2017 16:03:49'!
initializeFahrenheit
	^ self new initializeFahrenheit.! !

!TemperatureUnits class methodsFor: 'initialization' stamp: 'JI 6/4/2017 16:03:57'!
initializeKelvin
	^ self new initializeKelvin.! !


!classDefinition: #TimeUnit category: #'Measure-Solution'!
Object subclass: #TimeUnit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Measure-Solution'!
