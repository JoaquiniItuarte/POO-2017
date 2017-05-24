!classDefinition: #DistanceTest category: #'Distance-Solution'!
TestCase subclass: #DistanceTest
	instanceVariableNames: 'unMetro'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!DistanceTest methodsFor: 'tests' stamp: 'jak 5/24/2017 00:21:40'!
test01AMeterIsEqualToAnotherMeter
	| otroMetro |
	unMetro := Metro initializeWith: 1.
	otroMetro := Metro initializeWith: 1.
	self assert: unMetro = otroMetro.! !

!DistanceTest methodsFor: 'tests' stamp: 'jak 5/24/2017 00:21:59'!
test02AMeterIsEqualTo100Centimeters
	| cienCentimetros |
	unMetro := Metro initializeWith: 1.
	cienCentimetros := Centimetro initializeWith: 100.
	self assert: unMetro = cienCentimetros .! !

!DistanceTest methodsFor: 'tests' stamp: 'jak 5/24/2017 00:22:22'!
test03100CentimiterIsEquealTo1000Milimiters
	| cienCentimetros milMilimetros |
	cienCentimetros := Centimetro initializeWith: 100.
	milMilimetros := Milimetros initializeWith: 1000.
	self assert: cienCentimetros = milMilimetros..! !


!classDefinition: #DistanceUnits category: #'Distance-Solution'!
Object subclass: #DistanceUnits
	instanceVariableNames: 'quantity'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!

!DistanceUnits methodsFor: 'as yet unclassified' stamp: 'jak 5/21/2017 17:19:01'!
unit
	self subclassResponsibility ! !



!DistanceUnits methodsFor: 'comparing' stamp: 'jak 5/24/2017 00:31:13'!
= anotherDistance
	^ self areEquals: anotherDistance ! !

!DistanceUnits methodsFor: 'comparing' stamp: 'jak 5/24/2017 00:46:11'!
areEquals: otherDistance 
	^ (self isDistance and: [ otherDistance isDistance]) and: [ (self normalize) = (otherDistance normalize).]! !

!DistanceUnits methodsFor: 'comparing' stamp: 'jak 5/24/2017 00:46:26'!
isDistance
	^true! !

!DistanceUnits methodsFor: 'comparing' stamp: 'jak 5/24/2017 00:14:50'!
normalize
	self subclassResponsibility ! !

!DistanceUnits methodsFor: 'comparing' stamp: 'jak 5/24/2017 00:11:33'!
normalizeWithQuantity: multiplier
	^(self unit) * multiplier! !


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


!Centimetro methodsFor: 'as yet unclassified' stamp: 'jak 5/24/2017 00:50:09'!
unit
	^quantity! !


!Centimetro methodsFor: 'comparing' stamp: 'jak 5/24/2017 00:15:35'!
normalize
	^self normalizeWithQuantity: 10! !

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


!Metro methodsFor: 'as yet unclassified' stamp: 'jak 5/21/2017 17:25:39'!
unit
	^quantity ! !


!Metro methodsFor: 'operating' stamp: 'jak 5/21/2017 17:25:26'!
+ aMetro 
	^Metro initializeWith: (quantity + aMetro unit)! !


!Metro methodsFor: 'comparing' stamp: 'jak 5/24/2017 00:16:39'!
normalize
	^self normalizeWithQuantity: 1000! !

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


!Milimetros methodsFor: 'as yet unclassified' stamp: 'jak 5/24/2017 00:50:20'!
unit
	^quantity! !


!Milimetros methodsFor: 'comparing' stamp: 'jak 5/24/2017 00:17:52'!
normalize
	^self normalizeWithQuantity: 1! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Milimetros class' category: #'Distance-Solution'!
Milimetros class
	instanceVariableNames: ''!

!Milimetros class methodsFor: 'class initialization' stamp: 'jak 5/20/2017 18:25:03'!
initializeWith: anInteger 
	^self new initializeWith: anInteger.! !
