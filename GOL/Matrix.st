!classDefinition: #Matrix category: #Matrix!
Object subclass: #Matrix
	instanceVariableNames: 'elements theCorner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Matrix'!

!Matrix methodsFor: 'initialization' stamp: 'jak 5/15/2017 20:56:48'!
initializeWith: aCorner

	theCorner := aCorner .
	elements := OrderedCollection new.
	1 to: aCorner x do: [ :i | | aRow | 
				aRow := OrderedCollection new.
				1 to: aCorner y do: [ :j | | aPosition |
					aPosition := nil.
					aRow add: aPosition .
					].
				elements add: aRow.
				].! !


!Matrix methodsFor: 'accessing' stamp: 'jak 5/15/2017 21:06:26'!
elementAt: aPoint

	(self checkPointInBoundaries: aPoint) ifFalse: [self error: 'Posicion inexistente'].
	^(elements at: (aPoint x)) at: (aPoint y).! !

!Matrix methodsFor: 'accessing' stamp: 'jak 5/15/2017 21:06:31'!
setElement: anElement at: aPoint

	(self checkPointInBoundaries: aPoint) ifFalse: [self error: 'Posicion inexistente'].
	((elements at: (aPoint x)) at: (aPoint y)) put: anElement .! !


!Matrix methodsFor: 'evaluating' stamp: 'jak 5/15/2017 21:03:07'!
checkPointInBoundaries: aPoint

	^1@1 <= aPoint and: [aPoint <= theCorner]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Matrix class' category: #Matrix!
Matrix class
	instanceVariableNames: ''!

!Matrix class methodsFor: 'initialization' stamp: 'jak 5/15/2017 21:06:05'!
initialize: dimension
	
	(1@1 <= dimension ) ifFalse: ['La dimension debe ser al menos de 1x1'].
	^self new initializeWith: dimension! !
