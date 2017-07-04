!classDefinition: #TestsMetaprogramacion category: #Metaprogramacion!
TestCase subclass: #TestsMetaprogramacion
	instanceVariableNames: 'emptyName spacedName symboledName aSuperClassWithInstance aIntermediateClassWithInstance aSubClassWithInstance aIntermediateClassWithoutInstance variableNameForSuperClass variableNameForIntermediateClass variableNameForSubClass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Metaprogramacion'!

!TestsMetaprogramacion methodsFor: 'SetUp' stamp: 'JI 7/4/2017 14:32:06'!
classesSetUp

	aSuperClassWithInstance _ Object subclass: #SuperClaseTestWithInstance
	instanceVariableNames: variableNameForSuperClass
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Metaprogramacion'.
	
	aIntermediateClassWithInstance  _ aSuperClassWithInstance subclass: #IntermediateClaseTestWithInstance
	instanceVariableNames: variableNameForIntermediateClass
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Metaprogramacion'.
	
	aSubClassWithInstance _ aIntermediateClassWithInstance subclass: #SubClaseTestWithInstance
	instanceVariableNames: variableNameForSubClass
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Metaprogramacion'.! !

!TestsMetaprogramacion methodsFor: 'SetUp' stamp: 'JI 7/4/2017 14:32:31'!
setUp

	self variableNames.
	
	
	self classesSetUp .! !

!TestsMetaprogramacion methodsFor: 'SetUp' stamp: 'JI 7/4/2017 14:32:38'!
variableNames

	emptyName _ ''.
	spacedName _ 'a b'.
	symboledName _ 'a+'.
	
	variableNameForSuperClass _ 'superVariable'.
	variableNameForIntermediateClass _ 'intermediateVariable'.
	variableNameForSubClass _ 'subVariable'.! !


!TestsMetaprogramacion methodsFor: 'Adding a variable' stamp: 'JI 7/4/2017 14:34:50'!
test01LaVariableAAgregarNoPuedeTenerNombreVacio

	self
	 	should: [AddInstVariable named: emptyName in: aIntermediateClassWithoutInstance.]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'La variable tiene nombre invalido'].
		
		
	self deleteClases .! !

!TestsMetaprogramacion methodsFor: 'Adding a variable' stamp: 'JI 7/4/2017 14:34:57'!
test02LaVariableAAgregarNoPuedeTenerNombreConEspacios

	
	self
	 	should: [AddInstVariable named: spacedName in: self class.]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'La variable tiene nombre invalido'].
		
	self deleteClases .! !

!TestsMetaprogramacion methodsFor: 'Adding a variable' stamp: 'Ji 6/29/2017 21:24:50'!
test03LaVariableAAgregarNoPuedeTenerSimbolosRaros

	
	self
	 	should: [AddInstVariable named: symboledName in: self class.]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'La variable tiene nombre invalido'].! !

!TestsMetaprogramacion methodsFor: 'Adding a variable' stamp: 'JI 7/4/2017 14:35:08'!
test05LaVariableAAgregarExisteEnLaSuperclase

	

	self
	 	should: [AddInstVariable named: variableNameForIntermediateClass in: aSubClassWithInstance .]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'La variable ya existe en la clase o superclase'].
		
	self
	 	should: [AddInstVariable named: variableNameForSuperClass in: aIntermediateClassWithInstance .]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'La variable ya existe en la clase o superclase'].
		
	self
		should: [AddInstVariable named: variableNameForSuperClass in: aSuperClassWithInstance .]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'La variable ya existe en la clase o superclase'].
		
	
	self deleteClases .! !

!TestsMetaprogramacion methodsFor: 'Adding a variable' stamp: 'JI 7/4/2017 14:37:59'!
test06LaVariableAAgregarNoExisteEnAlgunTemporalDeMiClase

	
	
	aIntermediateClassWithInstance compile: 'met1 |var| var _ 1.' classified: 'as'.
	self
	 	should: [ AddInstVariable named: 'var' in: aIntermediateClassWithInstance .]
		raise: Warning
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'Variable local con el mismo nombre'].
	
	
	self deleteClases .! !

!TestsMetaprogramacion methodsFor: 'Adding a variable' stamp: 'JI 7/4/2017 14:38:44'!
test07LaVariableAAgregarNoExisteEnAlgunTemporalDeMiSubclase

	aSubClassWithInstance compile: 'met1 |var| var _ 1.' classified: 'as'.
	self
	 	should: [ AddInstVariable named: 'var' in: aSuperClassWithInstance .]
		raise: Warning
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'Variable local con el mismo nombre'].
	
	
	self deleteClases .! !

!TestsMetaprogramacion methodsFor: 'Adding a variable' stamp: 'JI 7/4/2017 14:41:30'!
test08LaVariableAdecuadaSeAgregaALaClase
	
	| aNewClassModifier |
	
	aNewClassModifier _ AddInstVariable named: 'var' in: aIntermediateClassWithInstance .
	
	aNewClassModifier applyChanges.
	
	self assert: (aIntermediateClassWithInstance instVarNames includes: 'var').
	
	
	self deleteClases .! !


!TestsMetaprogramacion methodsFor: 'class modification messages' stamp: 'JI 7/4/2017 14:34:15'!
deleteClases

	aSubClassWithInstance removeFromSystem .
	aIntermediateClassWithInstance removeFromSystem .
	aSuperClassWithInstance removeFromSystem .! !


!classDefinition: #AddInstVariable category: #Metaprogramacion!
Object subclass: #AddInstVariable
	instanceVariableNames: 'variableNueva claseModificada'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Metaprogramacion'!

!AddInstVariable methodsFor: 'as yet unclassified' stamp: 'Ji 6/29/2017 21:22:18'!
applyChanges
	
	claseModificada addInstVarName: variableNueva .! !

!AddInstVariable methodsFor: 'as yet unclassified' stamp: 'Ji 6/29/2017 21:21:29'!
named: aVariableName in: aClass

	| aScanner anArray |
	aScanner _ Scanner new.
	anArray _ aScanner scanFieldNames: aVariableName .
	anArray size ~= 1 ifTrue: [self error: 'La variable tiene nombre invalido'].
	((anArray at:1) = aVariableName) ifFalse: [ self error: 'La variable tiene nombre invalido'].
	(aClass allInstVarNamesEverywhere includes: aVariableName ) ifTrue: [self error: 'La variable ya existe en la clase o superclase'].
	
	aClass methodDictionary do: [ :aCompiledMethod |
		(aCompiledMethod methodNode tempNames includes: aVariableName)
		ifTrue: [ Warning signal: 'Variable local con el mismo nombre' ] ].
	
	aClass allSubclasses do: [ :aSubClass | 
		aSubClass methodDictionary do: [ :aCompiledMethod |
		(aCompiledMethod methodNode tempNames includes: aVariableName)
		ifTrue: [ Warning signal: 'Variable local con el mismo nombre' ] ].
	].


	variableNueva _ aVariableName .
	claseModificada _ aClass .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AddInstVariable class' category: #Metaprogramacion!
AddInstVariable class
	instanceVariableNames: ''!

!AddInstVariable class methodsFor: 'as yet unclassified' stamp: 'Ji 6/29/2017 21:20:33'!
named: aVariableName in: aClass 
	^ self new named: aVariableName in: aClass .
	
	! !
