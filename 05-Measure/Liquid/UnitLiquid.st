'From Cuis 5.0 of 7 November 2016 [latest update: #3081] on 6 June 2017 at 8:48:26 pm'!
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
