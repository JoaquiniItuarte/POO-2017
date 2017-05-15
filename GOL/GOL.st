!classDefinition: #GOLTest category: #GOL!
TestCase subclass: #GOLTest
	instanceVariableNames: 'cellAtOneOne cellAtThreeThree cellAtTwoZero cellAtOneZero cellAtOneTwo cellAtZeroOne cellAtZeroZero cellAtOneFour pointAtThreeThree pointAtOneOne boardFromZeroZeroToThreeThree'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!

!GOLTest methodsFor: 'tests' stamp: 'JAK 5/15/2017 12:22:06'!
test01AliveCellWithLessThanTwoAliveNeighboursDies

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCells: { cellAtOneOne }  withBoard: boardFromZeroZeroToThreeThree .
	gameOfLife nextGeneration.
	
	self assert: (gameOfLife isDeadAt: pointAtOneOne ) ! !

!GOLTest methodsFor: 'tests' stamp: 'JAK 5/15/2017 12:44:24'!
test02AliveCellWithTwoAliveNeighboursStaysAlive

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCells: { cellAtOneOne . cellAtTwoZero . cellAtOneZero . }  
	withBoard: boardFromZeroZeroToThreeThree .
	gameOfLife nextGeneration.
	
	self deny: (gameOfLife isDeadAt: pointAtOneOne ) ! !

!GOLTest methodsFor: 'tests' stamp: 'JAK 5/15/2017 12:44:20'!
test03AliveCellWithThreeAliveNeighboursStaysAlive

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCells: { cellAtOneOne . cellAtTwoZero . cellAtOneZero . cellAtOneTwo . }  
	withBoard: boardFromZeroZeroToThreeThree .
	gameOfLife nextGeneration.
	
	self deny: (gameOfLife isDeadAt: pointAtOneOne ) ! !

!GOLTest methodsFor: 'tests' stamp: 'JAK 5/15/2017 12:44:17'!
test04AliveCellWithMoreThanThreeAliveNeighboursDies

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCells: { cellAtOneOne . cellAtTwoZero . cellAtOneZero . cellAtOneTwo . cellAtZeroOne } 
	withBoard: boardFromZeroZeroToThreeThree .
	gameOfLife nextGeneration.
	
	self assert: (gameOfLife isDeadAt: pointAtOneOne ) ! !

!GOLTest methodsFor: 'tests' stamp: 'JAK 5/15/2017 12:39:04'!
test05DeadCellWithThreeAliveNeighboursResurrects

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCells: { cellAtTwoZero . cellAtOneZero . cellAtZeroZero } withBoard: boardFromZeroZeroToThreeThree .
	gameOfLife nextGeneration.
	
	self deny: (gameOfLife isDeadAt: pointAtOneOne ) ! !

!GOLTest methodsFor: 'tests' stamp: 'JAK 5/15/2017 12:38:54'!
test06CreateCellOutsideBoundsRaisesError

	self 
		should: [ GameOfLife withLiveCells: { cellAtTwoZero . cellAtOneZero . cellAtOneFour } withBoard: boardFromZeroZeroToThreeThree ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'celda fuera de rango' ]! !


!GOLTest methodsFor: 'setUp' stamp: 'JAK 5/15/2017 12:38:24'!
setUp
	cellAtOneOne := 1@1.
	cellAtThreeThree := 3@3.
	cellAtTwoZero := 2@0.
	cellAtOneZero := 1@0.
	cellAtOneTwo := 1@2.
	cellAtZeroOne := 0@1.
	cellAtTwoZero := 2@0.
	cellAtZeroZero := 0@0.
	cellAtOneFour := 1@4.
	pointAtThreeThree := 3@3.
	pointAtOneOne := 1@1.
	boardFromZeroZeroToThreeThree := Rectangle left: 0 right: 3 top: 0 bottom: 3! !


!classDefinition: #GameOfLife category: #GOL!
Object subclass: #GameOfLife
	instanceVariableNames: 'aliveCells size theBoard'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!

!GameOfLife methodsFor: 'initialization' stamp: 'JAK 5/15/2017 12:23:19'!
initializeWith: aCollectionOfAliveCells withBoard: aBoard

	theBoard := aBoard .
	aliveCells := aCollectionOfAliveCells.
	! !


!GameOfLife methodsFor: 'private' stamp: 'JAK 5/15/2017 12:44:31'!
deadCells
	
	| deadCells |
	
	deadCells _ OrderedCollection new.
	0 to: theBoard right do: [ :x |
		0 to: theBoard bottom do: [ :y |
			(self isDeadAt: x@y ) ifTrue: [ deadCells add: x@y]]].
	^deadCells ! !

!GameOfLife methodsFor: 'private' stamp: 'HAW 5/11/2017 21:11:17'!
hasToResurrect: aCell

	^(self numberOfAliveNeighboursOf: aCell) = 3! !

!GameOfLife methodsFor: 'private' stamp: 'HAW 5/11/2017 19:57:05'!
hasToSurvive: aCell
	
	| numberOfAliveNeighbours|
	
	numberOfAliveNeighbours := self numberOfAliveNeighboursOf: aCell.
	
	^numberOfAliveNeighbours = 2 or:  [numberOfAliveNeighbours = 3]! !

!GameOfLife methodsFor: 'private' stamp: 'HAW 5/10/2017 10:29:35'!
numberOfAliveNeighboursOf: aCell

	^(aCell eightNeighbors intersection: aliveCells) size! !


!GameOfLife methodsFor: 'inspecting' stamp: 'HAW 5/10/2017 10:28:24'!
isDeadAt: aCell

	^(aliveCells includes: aCell) not! !


!GameOfLife methodsFor: 'evaluating' stamp: 'HAW 5/11/2017 21:05:39'!
nextGeneration
	
	aliveCells := (aliveCells select: [ :aCell | self hasToSurvive: aCell ]) union:
		(self deadCells select: [ :aDeadCell | self hasToResurrect: aDeadCell ])! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GameOfLife class' category: #GOL!
GameOfLife class
	instanceVariableNames: ''!

!GameOfLife class methodsFor: 'initialization' stamp: 'JAK 5/15/2017 12:32:46'!
withLiveCells: aCollectionOfAliveCells withBoard: aBoard 

	(aCollectionOfAliveCells allSatisfy: [:aCell | aBoard containsPoint: aCell]) ifFalse: [ self error: 'celda fuera de rango' ].
	^self new initializeWith: aCollectionOfAliveCells withBoard: aBoard ! !
