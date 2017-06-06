'From Cuis 5.0 of 7 November 2016 [latest update: #3081] on 6 June 2017 at 8:48:20 pm'!
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
