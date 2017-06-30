!classDefinition: #TestsMetaprogramacion category: #Metaprogramacion!
TestCase subclass: #TestsMetaprogramacion
	instanceVariableNames: 'emptyName spacedName symboledName aSuperClassWithInstance aIntermediateClassWithInstance aSubClassWithInstance aIntermediateClassWithoutInstance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Metaprogramacion'!

!TestsMetaprogramacion methodsFor: 'SetUp' stamp: 'Ji 6/29/2017 21:26:55'!
setUp

	emptyName _ ''.
	spacedName _ 'a b'.
	symboledName _ 'a+'.
	
	
	aSuperClassWithInstance _ Object subclass: #SuperClaseTestWithInstance
	instanceVariableNames: 'var'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Metaprogramacion'.
	
	aIntermediateClassWithInstance  _ aSuperClassWithInstance subclass: #IntermediateClaseTestWithInstance
	instanceVariableNames: 'var'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Metaprogramacion'.
	
	aSubClassWithInstance _ aIntermediateClassWithInstance subclass: #SubClaseTestWithInstance
	instanceVariableNames: 'var'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Metaprogramacion'.! !


!TestsMetaprogramacion methodsFor: 'Adding a variable' stamp: 'Ji 6/29/2017 21:39:16'!
test01LaVariableAAgregarNoPuedeTenerNombreVacio

	self
	 	should: [AddInstVariable named: emptyName in: aIntermediateClassWithoutInstance.]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'La variable tiene nombre invalido'].! !

!TestsMetaprogramacion methodsFor: 'Adding a variable' stamp: 'Ji 6/29/2017 21:24:33'!
test02LaVariableAAgregarNoPuedeTenerNombreConEspacios

	
	self
	 	should: [AddInstVariable named: spacedName in: self class.]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'La variable tiene nombre invalido'].! !

!TestsMetaprogramacion methodsFor: 'Adding a variable' stamp: 'Ji 6/29/2017 21:24:50'!
test03LaVariableAAgregarNoPuedeTenerSimbolosRaros

	
	self
	 	should: [AddInstVariable named: symboledName in: self class.]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'La variable tiene nombre invalido'].! !

!TestsMetaprogramacion methodsFor: 'Adding a variable' stamp: 'Ji 6/29/2017 21:28:55'!
test05LaVariableAAgregarExisteEnLaSuperclase

	

	self
	 	should: [AddInstVariable named: 'var' in: aSubClassWithInstance .]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'La variable ya existe en la clase o superclase'].
		
	self
	 	should: [AddInstVariable named: 'varSub' in: aIntermediateClassWithInstance .]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'La variable ya existe en la clase o superclase'].
		
	self
		should: [AddInstVariable named: 'varSuper' in: aSuperClassWithInstance .]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'La variable ya existe en la clase o superclase'].
		
	aSubClassWithInstance removeFromSystem .
	aIntermediateClassWithInstance removeFromSystem .
	aSuperClassWithInstance removeFromSystem .! !

!TestsMetaprogramacion methodsFor: 'Adding a variable' stamp: 'Ji 6/29/2017 21:10:13'!
test06LaVariableAAgregarNoExisteEnAlgunTemporalDeMiClase

	| aIntermediateClass aSubClass aSuperClass |
	aSuperClass _ Object subclass: #SuperClaseTest
	instanceVariableNames: 'varSuper'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Metaprogramacion'.
	
	aIntermediateClass  _ aSuperClass subclass: #IntermediateClaseTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Metaprogramacion'.
	
	aSubClass _ aIntermediateClass subclass: #SubClaseTest
	instanceVariableNames: 'varSub'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Metaprogramacion'.
	
	aIntermediateClass compile: 'met1 |var| var _ 1.' classified: 'as'.
	self
	 	should: [ AddInstVariable named: 'var' in: aIntermediateClass .]
		raise: Warning
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'Variable local con el mismo nombre'].
	
	
	aSubClass removeFromSystem.
	aSuperClass removeFromSystem .
	aIntermediateClass removeFromSystem .! !

!TestsMetaprogramacion methodsFor: 'Adding a variable' stamp: 'Ji 6/29/2017 21:13:59'!
test07LaVariableAAgregarNoExisteEnAlgunTemporalDeMiSubclase

	| aIntermediateClass aSubClass aSuperClass |
	aSuperClass _ Object subclass: #SuperClaseTest
	instanceVariableNames: 'varSuper'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Metaprogramacion'.
	
	aIntermediateClass  _ aSuperClass subclass: #IntermediateClaseTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Metaprogramacion'.
	
	aSubClass _ aIntermediateClass subclass: #SubClaseTest
	instanceVariableNames: 's'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Metaprogramacion'.
	
	aSubClass compile: 'met1 |var| var _ 1.' classified: 'as'.
	self
	 	should: [ AddInstVariable named: 'var' in: aIntermediateClass .]
		raise: Warning
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'Variable local con el mismo nombre'].
	
	
	aSubClass removeFromSystem.
	aSuperClass removeFromSystem .
	aIntermediateClass removeFromSystem .! !

!TestsMetaprogramacion methodsFor: 'Adding a variable' stamp: 'Ji 6/29/2017 21:19:33'!
test08LaVariableAdecuadaSeAgregaALaClase

	| aIntermediateClass aSubClass aSuperClass aNewSomething |
	aSuperClass _ Object subclass: #SuperClaseTest
	instanceVariableNames: 'varSuper'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Metaprogramacion'.
	
	aIntermediateClass  _ aSuperClass subclass: #IntermediateClaseTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Metaprogramacion'.
	
	aSubClass _ aIntermediateClass subclass: #SubClaseTest
	instanceVariableNames: 's'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Metaprogramacion'.
	
	
	aNewSomething _ AddInstVariable named: 'var' in: aIntermediateClass .
	
	aNewSomething applyChanges.
	
	self assert: (aIntermediateClass instVarNames includes: 'var').
	
	
	aSubClass removeFromSystem.
	aSuperClass removeFromSystem .
	aIntermediateClass removeFromSystem .! !


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


!classDefinition: #SuperClaseTest category: #Metaprogramacion!
Object subclass: #SuperClaseTest
	instanceVariableNames: 'varSuper'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Metaprogramacion'!


!classDefinition: #IntermediateClaseTest category: #Metaprogramacion!
SuperClaseTest subclass: #IntermediateClaseTest
	instanceVariableNames: 'var'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Metaprogramacion'!


!classDefinition: #SubClaseTest category: #Metaprogramacion!
IntermediateClaseTest subclass: #SubClaseTest
	instanceVariableNames: 's'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Metaprogramacion'!


!classDefinition: #SuperClaseTestWithInstance category: #Metaprogramacion!
Object subclass: #SuperClaseTestWithInstance
	instanceVariableNames: 'var'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Metaprogramacion'!
