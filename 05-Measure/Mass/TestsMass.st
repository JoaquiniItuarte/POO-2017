'From Cuis 5.0 of 7 November 2016 [latest update: #3081] on 6 June 2017 at 8:20:36 pm'!
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
