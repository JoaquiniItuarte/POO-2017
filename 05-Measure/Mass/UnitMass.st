'From Cuis 5.0 of 7 November 2016 [latest update: #3081] on 6 June 2017 at 8:20:30 pm'!
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
