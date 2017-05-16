!classDefinition: #GOLTest category: #GOL!
TestCase subclass: #GOLTest
	instanceVariableNames: 'point1x1 point1x2 point1x3 point1x4 point1x5 point2x1 point2x2 point2x3 point2x4 point2x5 point3x1 point3x2 point3x3 point3x4 point3x5 point4x1 point4x2 point4x3 point4x4 point4x5 point5x1 point5x2 point5x3 point5x4 point5x5'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!

!GOLTest methodsFor: 'tests' stamp: 'JI 5/16/2017 01:08:14'!
test01CreateGameWithNoAliveCells
	
	| aGameOfLife tmp |
	
	aGameOfLife _ GameOfLife withLiveCellsAt: { } withBoardWithUpperRightCornerAt: point3x3 .
	
	tmp _ (aGameOfLife aliveCellsPoints) .
	self assert: tmp isEmpty .! !

!GOLTest methodsFor: 'tests' stamp: 'JI 5/16/2017 01:08:08'!
test02CreateGameWithSomeAliveCells
	
	| aGameOfLife |
	
	aGameOfLife _ GameOfLife withLiveCellsAt: { point1x1 . point1x2 } withBoardWithUpperRightCornerAt: point3x3 .
	
	self assert: (aGameOfLife aliveCellsPoints size = 2) .! !

!GOLTest methodsFor: 'tests' stamp: 'JI 5/16/2017 01:08:02'!
test03AliveCellWithLessThanTwoAliveNeighboursDies

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCellsAt:   { point1x1 } withBoardWithUpperRightCornerAt: point3x3 .
	gameOfLife nextGeneration.
	
	self assert: (gameOfLife isDeadAt: point1x1 ) ! !

!GOLTest methodsFor: 'tests' stamp: 'JI 5/16/2017 01:07:56'!
test04AliveCellWithTwoAliveNeighboursStaysAlive

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCellsAt: { point1x2 . point2x1 . point2x3 . }    withBoardWithUpperRightCornerAt: point3x3 .
	gameOfLife nextGeneration.
	
	self deny: (gameOfLife isDeadAt: point2x2) ! !

!GOLTest methodsFor: 'tests' stamp: 'JI 5/16/2017 01:07:34'!
test05AliveCellWithThreeAliveNeighboursStaysAlive

	|gameOfLife |
	
	gameOfLife _ GameOfLife withLiveCellsAt: {point1x2 . point2x1 .point1x3. point2x2} withBoardWithUpperRightCornerAt: point3x3.
	gameOfLife nextGeneration.
	
	self deny: (gameOfLife isDeadAt: point2x2 ) ! !

!GOLTest methodsFor: 'tests' stamp: 'JI 5/16/2017 01:07:26'!
test06AliveCellWithMoreThanThreeAliveNeighboursDies

	|gameOfLife |
	
	gameOfLife _ GameOfLife withLiveCellsAt: {point1x2 . point2x1 .point1x3. point2x2. point1x1} withBoardWithUpperRightCornerAt: point3x3.
	gameOfLife nextGeneration.
	
	self assert: (gameOfLife isDeadAt: point2x2 ) ! !

!GOLTest methodsFor: 'tests' stamp: 'JI 5/16/2017 01:07:20'!
test07DeadCellWithThreeAliveNeighboursResurrects

	|gameOfLife |
	
	gameOfLife _ GameOfLife withLiveCellsAt: {point1x2 . point2x1 .point1x3. } withBoardWithUpperRightCornerAt: point3x3.
	gameOfLife nextGeneration.
	
	self deny: (gameOfLife isDeadAt: point2x2 ) ! !

!GOLTest methodsFor: 'tests' stamp: 'JI 5/16/2017 01:07:13'!
test08CreateCellOutsideBoundsRaisesError

	self 
		should: [ GameOfLife withLiveCellsAt: {point1x2 . point2x1 .point1x3. } withBoardWithUpperRightCornerAt: point2x2. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'celda fuera de rango' ]! !

!GOLTest methodsFor: 'tests' stamp: 'JI 5/16/2017 01:07:02'!
test09AskForACellOutsideBoundsRaisesError

	| gameOfLife |
	
	gameOfLife := GameOfLife withLiveCellsAt: {point3x1. point2x1} withBoardWithUpperRightCornerAt: point3x3.
	
	self 
		should: [ gameOfLife isDeadAt: point4x1]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'posicion fuera de rango' ]! !

!GOLTest methodsFor: 'tests' stamp: 'JI 5/16/2017 15:18:14'!
test10DeadCellWithLessThanThreeAliveNeighboursStaysDead

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCellsAt:   { point1x1 . point1x2 } withBoardWithUpperRightCornerAt: point3x3 .
	gameOfLife nextGeneration.
	
	self assert: (gameOfLife isDeadAt: point2x2 ) ! !

!GOLTest methodsFor: 'tests' stamp: 'JI 5/16/2017 15:18:46'!
test11DeadCellWithMoreThanThreeAliveNeighboursStaysDead

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCellsAt:   { point1x1 . point1x2 .point1x3 . point2x1 } withBoardWithUpperRightCornerAt: point3x3 .
	gameOfLife nextGeneration.
	
	self assert: (gameOfLife isDeadAt: point2x2 ) ! !


!GOLTest methodsFor: 'setUp' stamp: 'JI 5/15/2017 19:06:40'!
setUp
	point1x1 _ 1@1.
	point1x2 _ 1@2.
	point1x3 _ 1@3.
	point1x4 _ 1@4.
	point1x5 _ 1@5.
	point2x1 _ 2@1.
	point2x2 _ 2@2.
	point2x3 _ 2@3.
	point2x4 _ 2@4.
	point2x5 _ 2@5.
	point3x1 _ 3@1.
	point3x2 _ 3@2.
	point3x3 _ 3@3.
	point3x4 _ 3@4.
	point3x5 _ 3@5.
	point4x1 _ 4@1.
	point4x2 _ 4@2.
	point4x3 _ 4@3.
	point4x4 _ 4@4.
	point4x5 _ 4@5.
	point5x1 _ 5@1.
	point5x2 _ 5@2.
	point5x3 _ 5@3.
	point5x4 _ 5@4.
	point5x5 _ 5@5.! !


!classDefinition: #BoardOfCells category: #GOL!
Object subclass: #BoardOfCells
	instanceVariableNames: 'matrix upperRightCorner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!

!BoardOfCells methodsFor: 'accessing' stamp: 'JAK 5/16/2017 16:05:25'!
aliveCellsPoints
	
	^self allPointsOfTheBoard select: [ :aPoint | (self cellAt: aPoint ) isAlive ].
 ! !

!BoardOfCells methodsFor: 'accessing' stamp: 'JI 5/16/2017 15:06:24'!
allPointsOfTheBoard
	^matrix allPoints.! !

!BoardOfCells methodsFor: 'accessing' stamp: 'JI 5/16/2017 15:12:53'!
cellAt: aPoint 
	
	^matrix elementAt: aPoint! !

!BoardOfCells methodsFor: 'accessing' stamp: 'JAK 5/16/2017 16:05:48'!
deadCellPoints

	^self allPointsOfTheBoard difference: (self aliveCellsPoints ).! !

!BoardOfCells methodsFor: 'accessing' stamp: 'JI 5/16/2017 15:04:50'!
upperRightCorner
	^ matrix dimension! !


!BoardOfCells methodsFor: 'cell status' stamp: 'JI 5/16/2017 15:14:43'!
cellIsAliveAt: aPoint 
	^  (matrix elementAt: aPoint) isAlive .! !

!BoardOfCells methodsFor: 'cell status' stamp: 'JI 5/15/2017 18:37:43'!
cellIsDeadAt: aPoint 
	
	^ (self cellIsAliveAt: aPoint) not! !

!BoardOfCells methodsFor: 'cell status' stamp: 'JI 5/16/2017 00:28:32'!
pointIsInBoundaries: aPoint 

	^ 1@1 <= aPoint and: [aPoint <= upperRightCorner ].! !


!BoardOfCells methodsFor: 'initialization' stamp: 'JI 5/16/2017 15:21:02'!
createBoardWithAliveCellsAt: somePoints withBoardWithUpperRightCornerAt: aPoint 
	
	upperRightCorner _ aPoint .
	matrix _ Matrix createMatrixWithSize: aPoint .
	
	self fillBoardWithDeadCells.
	
	self reviveCellsAt: somePoints .
	! !

!BoardOfCells methodsFor: 'initialization' stamp: 'JI 5/16/2017 15:01:51'!
fillBoardWithDeadCells

	
	self allPointsOfTheBoard do: [ :aPoint | matrix putElement: (DeadCell createCell ) at: aPoint ].
	
	

	! !

!BoardOfCells methodsFor: 'initialization' stamp: 'JI 5/16/2017 15:13:50'!
reviveCellAt: aPoint 
	
	matrix putElement: AliveCell createCell at: aPoint 
	
	! !

!BoardOfCells methodsFor: 'initialization' stamp: 'JI 5/15/2017 17:48:32'!
reviveCellsAt: somePoints
	
	somePoints do: [ :aPoint | self reviveCellAt: aPoint ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BoardOfCells class' category: #GOL!
BoardOfCells class
	instanceVariableNames: 'matrix'!

!BoardOfCells class methodsFor: 'initialization' stamp: 'JI 5/15/2017 17:48:15'!
createBoardWithAliveCellsAt: somePoints withBoardWithUpperRightCornerAt: aPoint 
	
	^ self new createBoardWithAliveCellsAt: somePoints withBoardWithUpperRightCornerAt: aPoint .! !


!classDefinition: #Cell category: #GOL!
Object subclass: #Cell
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!

!Cell methodsFor: 'cell status' stamp: 'JI 5/16/2017 00:46:28'!
isAlive
	self subclassResponsibility ! !


!Cell methodsFor: 'evaluating' stamp: 'JI 5/16/2017 01:05:20'!
ifAliveGetAddedTo: anOrderedCollection asPoint: aPoint 
	self subclassResponsibility ! !

!Cell methodsFor: 'evaluating' stamp: 'JI 5/16/2017 01:05:23'!
ifDeadGetAddedTo: anOrderedCollection asPoint: aPoint 
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cell class' category: #GOL!
Cell class
	instanceVariableNames: ''!

!Cell class methodsFor: 'initialization' stamp: 'JI 5/16/2017 00:51:12'!
createCell
	
	self subclassResponsibility ! !


!classDefinition: #AliveCell category: #GOL!
Cell subclass: #AliveCell
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!

!AliveCell methodsFor: 'cell status' stamp: 'JI 5/16/2017 00:49:02'!
isAlive
	^ true! !


!AliveCell methodsFor: 'evaluating' stamp: 'JI 5/16/2017 01:05:46'!
ifAliveGetAddedTo: anOrderedCollection asPoint: aPoint 
	
	anOrderedCollection add: aPoint ! !

!AliveCell methodsFor: 'evaluating' stamp: 'JI 5/16/2017 01:05:53'!
ifDeadGetAddedTo: anOrderedCollection asPoint: aPoint 
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AliveCell class' category: #GOL!
AliveCell class
	instanceVariableNames: ''!

!AliveCell class methodsFor: 'initialization' stamp: 'JI 5/16/2017 00:50:33'!
createCell
	
	^self new ! !


!classDefinition: #DeadCell category: #GOL!
Cell subclass: #DeadCell
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!

!DeadCell methodsFor: 'cell status' stamp: 'JI 5/16/2017 00:48:12'!
isAlive
	^false! !


!DeadCell methodsFor: 'evaluating' stamp: 'JI 5/16/2017 01:06:06'!
ifAliveGetAddedTo: anOrderedCollection asPoint: aPoint 
	! !

!DeadCell methodsFor: 'evaluating' stamp: 'JI 5/16/2017 01:06:22'!
ifDeadGetAddedTo: anOrderedCollection asPoint: aPoint 

	anOrderedCollection add: aPoint ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DeadCell class' category: #GOL!
DeadCell class
	instanceVariableNames: ''!

!DeadCell class methodsFor: 'initialization' stamp: 'JI 5/16/2017 00:50:51'!
createCell
	
	^self new ! !


!classDefinition: #GameOfLife category: #GOL!
Object subclass: #GameOfLife
	instanceVariableNames: 'board'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!

!GameOfLife methodsFor: 'private' stamp: 'HAW 5/11/2017 21:11:17'!
hasToResurrect: aCell

	^(self numberOfAliveNeighboursOf: aCell) = 3! !

!GameOfLife methodsFor: 'private' stamp: 'JI 5/15/2017 18:39:16'!
hasToSurvive: aCellPoint
	
	| numberOfAliveNeighbours|
	
	numberOfAliveNeighbours := self numberOfAliveNeighboursOf: aCellPoint.
	
	^numberOfAliveNeighbours = 2 or:  [numberOfAliveNeighbours = 3]! !

!GameOfLife methodsFor: 'private' stamp: 'JI 5/15/2017 18:42:44'!
numberOfAliveNeighboursOf: aCellPoint

	| eightNeighbours  |
	
	eightNeighbours _ aCellPoint eightNeighbors.
	
	^ (eightNeighbours intersection: (self aliveCellsPoints) )  size! !

!GameOfLife methodsFor: 'private' stamp: 'JI 5/15/2017 19:45:08'!
pointIsInBoundaries: aPoint 
	
	^ board pointIsInBoundaries: aPoint .! !


!GameOfLife methodsFor: 'inspecting' stamp: 'JI 5/15/2017 18:03:23'!
aliveCellsPoints
	
	^ board aliveCellsPoints! !

!GameOfLife methodsFor: 'inspecting' stamp: 'JI 5/15/2017 19:43:57'!
isDeadAt: aCellPoint
	(self pointIsInBoundaries: aCellPoint)
	ifFalse: [ self error: 'posicion fuera de rango'
		].
	^ board cellIsDeadAt: aCellPoint .

! !


!GameOfLife methodsFor: 'evaluating' stamp: 'JI 5/16/2017 15:29:57'!
nextGeneration

	| newGenerationOfAliveCellsAtPoints |

	newGenerationOfAliveCellsAtPoints _ (board aliveCellsPoints select: [ :anAliveCellPoint | 	self hasToSurvive: anAliveCellPoint ]) 
												union:
												(board deadCellPoints select: [ :aDeadCellPoint | self hasToResurrect: aDeadCellPoint ] ).
	
	board _ BoardOfCells createBoardWithAliveCellsAt: newGenerationOfAliveCellsAtPoints withBoardWithUpperRightCornerAt: board upperRightCorner.
	! !


!GameOfLife methodsFor: 'initialization' stamp: 'JI 5/16/2017 15:25:32'!
withLiveCellsAt: somePoints withBoardWithUpperRightCornerAt: aDimension
	
	board _ BoardOfCells createBoardWithAliveCellsAt: somePoints withBoardWithUpperRightCornerAt: aDimension ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GameOfLife class' category: #GOL!
GameOfLife class
	instanceVariableNames: ''!

!GameOfLife class methodsFor: 'initialization' stamp: 'JI 5/15/2017 19:30:34'!
withLiveCellsAt: anArray withBoardWithUpperRightCornerAt: aPoint 
	
	self satisfiesPreconditions: anArray withUpperRightCornerAt: aPoint .
	
	^self new withLiveCellsAt: anArray withBoardWithUpperRightCornerAt: aPoint ! !


!GameOfLife class methodsFor: 'preconditions' stamp: 'JI 5/15/2017 19:34:21'!
satisfiesPreconditions: anArray withUpperRightCornerAt: aPoint 
	
	anArray do: [ :aCellPoint | 
		(1@1 <= aCellPoint and: (aCellPoint <= aPoint ) )
			ifFalse: [ self error: 'celda fuera de rango' ].
		].! !


!classDefinition: #Matrix category: #GOL!
Object subclass: #Matrix
	instanceVariableNames: 'elements theCorner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!

!Matrix methodsFor: 'initialization' stamp: 'JI 5/16/2017 15:21:40'!
initializeMatrixWithSize: aCorner

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


!Matrix methodsFor: 'accessing' stamp: 'JI 5/16/2017 15:08:47'!
allPoints
	
	| allThePoints |
	allThePoints _ OrderedCollection new.
	
	1 to: theCorner x do: [ :i | 
		1 to: theCorner y do: [ :j | 
			allThePoints add: i@j .
			].
		].
	
	^allThePoints ! !

!Matrix methodsFor: 'accessing' stamp: 'JI 5/16/2017 15:24:47'!
elementAt: aPoint

	(self checkPointInBoundaries: aPoint) ifFalse: [self error: 'Posicion inexistente'].
	^(elements at: aPoint x) at: aPoint y.! !

!Matrix methodsFor: 'accessing' stamp: 'JI 5/16/2017 15:23:44'!
putElement: anElement at: aPoint

	(self checkPointInBoundaries: aPoint) 
		ifFalse: [self error: 'Posicion inexistente'].
		
	(elements at: aPoint x) at: aPoint y put: anElement .! !


!Matrix methodsFor: 'evaluating' stamp: 'jak 5/15/2017 21:03:07'!
checkPointInBoundaries: aPoint

	^1@1 <= aPoint and: [aPoint <= theCorner]! !

!Matrix methodsFor: 'evaluating' stamp: 'JI 5/16/2017 15:05:07'!
dimension
	^theCorner ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Matrix class' category: #GOL!
Matrix class
	instanceVariableNames: ''!

!Matrix class methodsFor: 'initialization' stamp: 'JI 5/16/2017 15:21:32'!
createMatrixWithSize: dimension
	
	(1@1 <= dimension ) ifFalse: ['La dimension debe ser al menos de 1x1'].
	^self new initializeMatrixWithSize: dimension! !
