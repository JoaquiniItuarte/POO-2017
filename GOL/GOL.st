!classDefinition: #GOLTest category: #GOL!
TestCase subclass: #GOLTest
	instanceVariableNames: 'cellAtOneOne cellAtThreeThree cellAtTwoZero cellAtOneZero cellAtOneTwo cellAtZeroOne cellAtZeroZero cellAtOneFour pointAtThreeThree pointAtOneOne'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!

!GOLTest methodsFor: 'tests' stamp: 'JAK 5/15/2017 08:58:36'!
test01AliveCellWithLessThanTwoAliveNeighboursDies

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCells: { cellAtOneOne }  withSize: pointAtThreeThree.
	gameOfLife nextGeneration.
	
	self assert: (gameOfLife isDeadAt: pointAtOneOne ) ! !

!GOLTest methodsFor: 'tests' stamp: 'JAK 5/15/2017 08:59:55'!
test02AliveCellWithTwoAliveNeighboursStaysAlive

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCells: { cellAtOneOne . cellAtTwoZero . cellAtOneZero . }  
	withSize: pointAtThreeThree .
	gameOfLife nextGeneration.
	
	self deny: (gameOfLife isDeadAt: pointAtOneOne ) ! !

!GOLTest methodsFor: 'tests' stamp: 'JAK 5/15/2017 09:01:15'!
test03AliveCellWithThreeAliveNeighboursStaysAlive

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCells: { cellAtOneOne . cellAtTwoZero . cellAtOneZero . cellAtOneTwo . }  
	withSize: pointAtThreeThree .
	gameOfLife nextGeneration.
	
	self deny: (gameOfLife isDeadAt: pointAtOneOne ) ! !

!GOLTest methodsFor: 'tests' stamp: 'JAK 5/15/2017 09:01:49'!
test04AliveCellWithMoreThanThreeAliveNeighboursDies

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCells: { cellAtOneOne . cellAtTwoZero . cellAtOneZero . cellAtOneTwo . cellAtZeroOne } 
	withSize: pointAtThreeThree .
	gameOfLife nextGeneration.
	
	self assert: (gameOfLife isDeadAt: pointAtOneOne ) ! !

!GOLTest methodsFor: 'tests' stamp: 'JAK 5/15/2017 09:02:18'!
test05DeadCellWithThreeAliveNeighboursResurrects

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCells: { cellAtTwoZero . cellAtOneZero . cellAtZeroZero } withSize: pointAtThreeThree .
	gameOfLife nextGeneration.
	
	self deny: (gameOfLife isDeadAt: pointAtOneOne ) ! !

!GOLTest methodsFor: 'tests' stamp: 'JAK 5/15/2017 09:02:44'!
test06CreateCellOutsideBoundsRaisesError

	self 
		should: [ GameOfLife withLiveCells: { cellAtTwoZero . cellAtOneZero . cellAtOneFour } withSize: pointAtThreeThree ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'celda fuera de rango' ]! !


!GOLTest methodsFor: 'setUp' stamp: 'JAK 5/15/2017 08:58:01'!
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
	pointAtOneOne := 1@1.! !


!classDefinition: #GameOfLife category: #GOL!
Object subclass: #GameOfLife
	instanceVariableNames: 'aliveCells size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!

!GameOfLife methodsFor: 'initialization' stamp: 'JI 5/14/2017 16:46:01'!
initializeWith: aCollectionOfAliveCells withSize: aPointAsUpperRightCorner

	size := aPointAsUpperRightCorner .
	aliveCells := aCollectionOfAliveCells.
	! !


!GameOfLife methodsFor: 'private' stamp: 'JI 5/14/2017 17:16:53'!
deadCells
	
	| deadCells |
	
	deadCells _ OrderedCollection new.
	0 to: size x do: [ :x |
		0 to: size y do: [ :y |
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

!GameOfLife class methodsFor: 'initialization' stamp: 'JI 5/14/2017 16:46:12'!
withLiveCells: aCollectionOfAliveCells withSize: aPointAsUpperRightCorner 
	
	self cells: aCollectionOfAliveCells areInRange: aPointAsUpperRightCorner   .
	
	
	^self new initializeWith: aCollectionOfAliveCells withSize: aPointAsUpperRightCorner ! !


!GameOfLife class methodsFor: 'private' stamp: 'JI 5/14/2017 16:47:04'!
cells: aCollectionOfAliveCells areInRange: aPointAsUpperRightCorner
	
	(aCollectionOfAliveCells allSatisfy: [:aCell |
			(aCell x between: 0 and: aPointAsUpperRightCorner x) 
				and: [ aCell y between: 0 and: aPointAsUpperRightCorner y]]) 
		ifFalse: [ self error: 'celda fuera de rango' ].! !
