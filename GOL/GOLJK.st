!classDefinition: #GOLTest category: #GOL!
TestCase subclass: #GOLTest
	instanceVariableNames: 'cellAtOneOne cellAtThreeThree cellAtTwoZero cellAtOneZero cellAtOneTwo cellAtZeroOne cellAtZeroZero cellAtOneFour pointAtThreeThree pointAtOneOne boardFromZeroZeroToThreeThree pointAtOneFour newBoadrOf3x3'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!

!GOLTest methodsFor: 'tests' stamp: 'jak 5/15/2017 22:02:21'!
test01AliveCellWithLessThanTwoAliveNeighboursDies

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCells: { cellAtOneOne }  withBoard: newBoadrOf3x3 .
	gameOfLife nextGeneration.
	
	self assert: (gameOfLife isDeadAt: pointAtOneOne ) ! !

!GOLTest methodsFor: 'tests' stamp: 'jak 5/15/2017 22:11:04'!
test02AliveCellWithTwoAliveNeighboursStaysAlive

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCells: { cellAtOneOne . cellAtTwoZero . cellAtOneZero . }  
	withBoard: newBoadrOf3x3 .
	gameOfLife nextGeneration.
	
	self deny: (gameOfLife isDeadAt: pointAtOneOne ) ! !

!GOLTest methodsFor: 'tests' stamp: 'jak 5/15/2017 22:11:13'!
test03AliveCellWithThreeAliveNeighboursStaysAlive

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCells: { cellAtOneOne . cellAtTwoZero . cellAtOneZero . cellAtOneTwo . }  
	withBoard: newBoadrOf3x3 .
	gameOfLife nextGeneration.
	
	self deny: (gameOfLife isDeadAt: pointAtOneOne ) ! !

!GOLTest methodsFor: 'tests' stamp: 'jak 5/15/2017 22:11:20'!
test04AliveCellWithMoreThanThreeAliveNeighboursDies

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCells: { cellAtOneOne . cellAtTwoZero . cellAtOneZero . cellAtOneTwo . cellAtZeroOne } 
	withBoard: newBoadrOf3x3 .
	gameOfLife nextGeneration.
	
	self assert: (gameOfLife isDeadAt: pointAtOneOne ) ! !

!GOLTest methodsFor: 'tests' stamp: 'jak 5/15/2017 22:11:27'!
test05DeadCellWithThreeAliveNeighboursResurrects

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCells: { cellAtTwoZero . cellAtOneZero . cellAtZeroZero } withBoard: newBoadrOf3x3 .
	gameOfLife nextGeneration.
	
	self deny: (gameOfLife isDeadAt: pointAtOneOne ) ! !

!GOLTest methodsFor: 'tests' stamp: 'jak 5/15/2017 22:12:03'!
test06CreateCellOutsideBoundsRaisesError

	self 
		should: [ GameOfLife withLiveCells: { cellAtTwoZero . cellAtOneZero . cellAtOneFour } withBoard: newBoadrOf3x3 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'celda fuera de rango' ]! !

!GOLTest methodsFor: 'tests' stamp: 'jak 5/15/2017 22:12:10'!
test07AskForACellOutsideBoundsRaisesError

	| gameOfLife |
	gameOfLife := GameOfLife withLiveCells: { cellAtTwoZero . cellAtOneZero } withBoard: newBoadrOf3x3.
	self 
		should: [ gameOfLife isDeadAt: pointAtOneFour]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'posicion fuera de rango' ]! !

!GOLTest methodsFor: 'tests' stamp: 'jak 5/16/2017 01:10:08'!
test08DeadCellWithLessThanThreeAliveNeighboursResurrects

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCells: { cellAtOneZero . cellAtZeroZero } withBoard: newBoadrOf3x3 .
	gameOfLife nextGeneration.
	
	self assert: (gameOfLife isDeadAt: pointAtOneOne ) ! !


!GOLTest methodsFor: 'setUp' stamp: 'jak 5/15/2017 22:39:18'!
setUp
	cellAtOneOne := Cell initialize: 1@1.
	cellAtThreeThree := Cell initialize: 3@3.
	cellAtTwoZero := Cell initialize: 2@0.
	cellAtOneZero := Cell initialize: 1@0.
	cellAtOneTwo := Cell initialize: 1@2.
	cellAtZeroOne := Cell initialize: 0@1.
	cellAtTwoZero := Cell initialize: 2@0.
	cellAtZeroZero := Cell initialize: 0@0.
	cellAtOneFour := Cell initialize: 1@4.
	pointAtThreeThree := 3@3.
	pointAtOneOne := 1@1.
	pointAtOneFour := 1@4.
	newBoadrOf3x3 := Board initialize: pointAtThreeThree .! !


!classDefinition: #Board category: #GOL!
Object subclass: #Board
	instanceVariableNames: 'theRectangle'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!

!Board methodsFor: 'initialization' stamp: 'jak 5/16/2017 00:08:31'!
initializeWithCornerPoint: aPoint
	
	theRectangle := Rectangle left: 0 right: aPoint x top: 0 bottom: aPoint y! !


!Board methodsFor: 'inspecting' stamp: 'jak 5/16/2017 01:05:43'!
containsPoint: aPoint 

	^theRectangle containsPoint: aPoint! !


!Board methodsFor: 'evaluating' stamp: 'jak 5/16/2017 00:07:19'!
endPosition
	
	^theRectangle corner ! !

!Board methodsFor: 'evaluating' stamp: 'jak 5/16/2017 00:07:03'!
initialPosition
	
	^theRectangle origin ! !

!Board methodsFor: 'evaluating' stamp: 'jak 5/16/2017 01:06:02'!
nextOf: aPosition

	| possiblePoint |
	possiblePoint := aPosition + (1@0).
	(self containsPoint: possiblePoint) ifTrue: [^possiblePoint ].
	possiblePoint := (0@(aPosition y) + 1).
	(self containsPoint: possiblePoint) ifTrue: [^possiblePoint ].
	^self endPosition ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Board class' category: #GOL!
Board class
	instanceVariableNames: ''!

!Board class methodsFor: 'initialization' stamp: 'jak 5/16/2017 00:08:21'!
initialize: aCornerPoint

	( (0@0) < aCornerPoint) ifFalse: [self error: 'el tablero no puede tener una esquina en 0'].
	^self new initializeWithCornerPoint: aCornerPoint ! !


!classDefinition: #Cell category: #GOL!
Object subclass: #Cell
	instanceVariableNames: 'thePosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!

!Cell methodsFor: 'initialization' stamp: 'jak 5/15/2017 22:36:43'!
initializeWithPoint: aPoint 

	thePosition := aPoint ! !


!Cell methodsFor: 'accessing' stamp: 'jak 5/16/2017 01:07:55'!
thePointPosition

	^thePosition! !


!Cell methodsFor: 'evaluating' stamp: 'jak 5/16/2017 01:07:44'!
< aPoint 

	^thePosition < aPoint ! !

!Cell methodsFor: 'evaluating' stamp: 'jak 5/16/2017 01:07:47'!
= aPoint 

	^thePosition = aPoint ! !

!Cell methodsFor: 'evaluating' stamp: 'jak 5/15/2017 23:22:59'!
eightNeighbors

	^thePosition eightNeighbors ! !

!Cell methodsFor: 'evaluating' stamp: 'jak 5/15/2017 23:22:41'!
eightNeighborsAsCells

	| eightCellNeighbors eightPointsNeighbors|
	eightPointsNeighbors :=thePosition eightNeighbors .
	eightCellNeighbors := OrderedCollection new.
	eightPointsNeighbors collect: [ :aPoint | eightCellNeighbors add: (Cell initialize: aPoint)].
	^eightCellNeighbors ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cell class' category: #GOL!
Cell class
	instanceVariableNames: ''!

!Cell class methodsFor: 'initialization' stamp: 'jak 5/15/2017 22:36:07'!
initialize: aPoint 
	
	^self new initializeWithPoint: aPoint! !


!classDefinition: #GameOfLife category: #GOL!
Object subclass: #GameOfLife
	instanceVariableNames: 'aliveCells theBoard'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!

!GameOfLife methodsFor: 'initialization' stamp: 'JAK 5/15/2017 12:23:19'!
initializeWith: aCollectionOfAliveCells withBoard: aBoard

	theBoard := aBoard .
	aliveCells := aCollectionOfAliveCells.
	! !


!GameOfLife methodsFor: 'private' stamp: 'jak 5/16/2017 01:01:31'!
hasToResurrect: aCell

	^(self isDeadAt: aCell thePointPosition) and: [(self numberOfAliveNeighboursOf: aCell) = 3]! !

!GameOfLife methodsFor: 'private' stamp: 'jak 5/16/2017 01:11:58'!
hasToSurvive: aCell
	
	| numberOfAliveNeighbours|
	
	numberOfAliveNeighbours := self numberOfAliveNeighboursOf: aCell.
	
	^(numberOfAliveNeighbours = 2 or:  [numberOfAliveNeighbours = 3]) and: [(self isDeadAt: aCell thePointPosition ) not]! !

!GameOfLife methodsFor: 'private' stamp: 'jak 5/15/2017 23:34:48'!
numberOfAliveNeighboursOf: aCell

	^(aCell eightNeighbors intersection: (aliveCells collect: [ :aliveCell | aliveCell thePointPosition ])) size! !


!GameOfLife methodsFor: 'inspecting' stamp: 'jak 5/15/2017 23:32:55'!
isDeadAt: aPoint

	(theBoard containsPoint: aPoint ) ifFalse: [self error: 'posicion fuera de rango'].

	^(aliveCells allSatisfy: [ :aCell | ( (aCell thePointPosition ) ~= aPoint)])! !


!GameOfLife methodsFor: 'evaluating' stamp: 'jak 5/16/2017 01:02:32'!
nextGeneration
	
	
	| newAliveCells nextPosition |
	
	newAliveCells _ OrderedCollection new.
	
	nextPosition := theBoard initialPosition.
	[nextPosition ~= theBoard endPosition] whileTrue: [
		|aCell|.
		aCell := Cell initialize: nextPosition .
		((self hasToResurrect: aCell) or: [self hasToSurvive: aCell]) ifTrue: [newAliveCells add: (aCell)].
		nextPosition := theBoard nextOf: nextPosition .
		].
	aliveCells := newAliveCells
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GameOfLife class' category: #GOL!
GameOfLife class
	instanceVariableNames: ''!

!GameOfLife class methodsFor: 'initialization' stamp: 'jak 5/15/2017 23:38:53'!
withLiveCells: aCollectionOfAliveCells withBoard: aBoard 

	(aCollectionOfAliveCells allSatisfy: [:aCell | aBoard containsPoint: aCell thePointPosition ]) ifFalse: [ self error: 'celda fuera de rango' ].
	^self new initializeWith: aCollectionOfAliveCells withBoard: aBoard ! !
