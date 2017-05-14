!classDefinition: #GOLTest category: #GOL!
TestCase subclass: #GOLTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!

!GOLTest methodsFor: 'as yet unclassified' stamp: 'JI 5/14/2017 16:23:28'!
test01AliveCellWithLessThanTwoAliveNeighboursDies

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCells: { 1@1 }  withSize: 3@3.
	gameOfLife nextGeneration.
	
	self assert: (gameOfLife isDeadAt: 1@1) ! !

!GOLTest methodsFor: 'as yet unclassified' stamp: 'JI 5/14/2017 16:23:24'!
test02AliveCellWithTwoAliveNeighboursStaysAlive

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCells: { 1@1. 2@0. 1@0. }  withSize: 3@3.
	gameOfLife nextGeneration.
	
	self deny: (gameOfLife isDeadAt: 1@1) ! !

!GOLTest methodsFor: 'as yet unclassified' stamp: 'JI 5/14/2017 16:23:20'!
test03AliveCellWithThreeAliveNeighboursStaysAlive

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCells: { 1@1. 2@0. 1@0. 1@2. }  withSize: 3@3.
	gameOfLife nextGeneration.
	
	self deny: (gameOfLife isDeadAt: 1@1) ! !

!GOLTest methodsFor: 'as yet unclassified' stamp: 'JI 5/14/2017 16:23:13'!
test04AliveCellWithMoreThanThreeAliveNeighboursDies

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCells: { 1@1. 2@0. 1@0. 1@2. 0@1 } withSize: 3@3.
	gameOfLife nextGeneration.
	
	self assert: (gameOfLife isDeadAt: 1@1) ! !

!GOLTest methodsFor: 'as yet unclassified' stamp: 'JI 5/14/2017 16:22:51'!
test05DeadCellWithThreeAliveNeighboursResurrects

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCells: { 2@0. 1@0. 0@0 } withSize: 3@3.
	gameOfLife nextGeneration.
	
	self deny: (gameOfLife isDeadAt: 1@1) ! !

!GOLTest methodsFor: 'as yet unclassified' stamp: 'JI 5/14/2017 16:22:26'!
test06CreateCellOutsideBoundsRaisesError

	self 
		should: [ GameOfLife withLiveCells: { 2@0. 1@0. 1@4 } withSize: 3@3 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'celda fuera de rango' ]! !


!classDefinition: #GameOfLife category: #GOL!
Object subclass: #GameOfLife
	instanceVariableNames: 'aliveCells size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!

!GameOfLife methodsFor: 'as yet unclassified' stamp: 'HAW 5/12/2017 09:10:31'!
deadCells
	
	| deadCells |
	
	deadCells _ OrderedCollection new.
	0 to: size x do: [ :x |
		0 to: size y do: [ :y |
			(aliveCells includes: x@y) not ifTrue: [ deadCells add: x@y]]].
	^deadCells ! !

!GameOfLife methodsFor: 'as yet unclassified' stamp: 'HAW 5/11/2017 21:11:17'!
hasToResurrect: aCell

	^(self numberOfAliveNeighboursOf: aCell) = 3! !

!GameOfLife methodsFor: 'as yet unclassified' stamp: 'HAW 5/11/2017 19:57:05'!
hasToSurvive: aCell
	
	| numberOfAliveNeighbours|
	
	numberOfAliveNeighbours := self numberOfAliveNeighboursOf: aCell.
	
	^numberOfAliveNeighbours = 2 or:  [numberOfAliveNeighbours = 3]! !

!GameOfLife methodsFor: 'as yet unclassified' stamp: 'JI 5/14/2017 16:46:01'!
initializeWith: aCollectionOfAliveCells withSize: aPointAsUpperRightCorner

	size := aPointAsUpperRightCorner .
	aliveCells := aCollectionOfAliveCells.
	! !

!GameOfLife methodsFor: 'as yet unclassified' stamp: 'HAW 5/10/2017 10:28:24'!
isDeadAt: aCell

	^(aliveCells includes: aCell) not! !

!GameOfLife methodsFor: 'as yet unclassified' stamp: 'HAW 5/11/2017 21:05:39'!
nextGeneration
	
	aliveCells := (aliveCells select: [ :aCell | self hasToSurvive: aCell ]) union:
		(self deadCells select: [ :aDeadCell | self hasToResurrect: aDeadCell ])! !

!GameOfLife methodsFor: 'as yet unclassified' stamp: 'HAW 5/10/2017 10:29:35'!
numberOfAliveNeighboursOf: aCell

	^(aCell eightNeighbors intersection: aliveCells) size! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GameOfLife class' category: #GOL!
GameOfLife class
	instanceVariableNames: ''!

!GameOfLife class methodsFor: 'as yet unclassified' stamp: 'JI 5/14/2017 16:47:04'!
cells: aCollectionOfAliveCells areInRange: aPointAsUpperRightCorner
	
	(aCollectionOfAliveCells allSatisfy: [:aCell |
			(aCell x between: 0 and: aPointAsUpperRightCorner x) 
				and: [ aCell y between: 0 and: aPointAsUpperRightCorner y]]) 
		ifFalse: [ self error: 'celda fuera de rango' ].! !

!GameOfLife class methodsFor: 'as yet unclassified' stamp: 'JI 5/14/2017 16:46:12'!
withLiveCells: aCollectionOfAliveCells withSize: aPointAsUpperRightCorner 
	
	self cells: aCollectionOfAliveCells areInRange: aPointAsUpperRightCorner   .
	
	
	^self new initializeWith: aCollectionOfAliveCells withSize: aPointAsUpperRightCorner ! !
