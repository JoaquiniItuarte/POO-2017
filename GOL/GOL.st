!classDefinition: #GOLTest category: #GOL!
TestCase subclass: #GOLTest
	instanceVariableNames: 'point1x1 point1x2 point1x3 point1x4 point1x5 point2x1 point2x2 point2x3 point2x4 point2x5 point3x1 point3x2 point3x3 point3x4 point3x5 point4x1 point4x2 point4x3 point4x4 point4x5 point5x1 point5x2 point5x3 point5x4 point5x5'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!

!GOLTest methodsFor: 'tests' stamp: 'JI 5/15/2017 19:07:07'!
test000CreateGameWithNoAliveCells
	
	| aGameOfLife tmp |
	
	aGameOfLife _ GameOfLife withLiveCellsAt: { } withBoardWithUpperRightCornerAt: point3x3 .
	
	tmp _ (aGameOfLife aliveCellsPoints) .
	self assert: tmp isEmpty .! !

!GOLTest methodsFor: 'tests' stamp: 'JI 5/15/2017 19:07:31'!
test001CreateGameWithSomeAliveCells
	
	| aGameOfLife |
	
	aGameOfLife _ GameOfLife withLiveCellsAt: { point1x1 . point1x2 } withBoardWithUpperRightCornerAt: point3x3 .
	
	self assert: (aGameOfLife aliveCellsPoints size = 2) .! !

!GOLTest methodsFor: 'tests' stamp: 'JI 5/15/2017 19:07:51'!
test01AliveCellWithLessThanTwoAliveNeighboursDies

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCellsAt:   { point1x1 } withBoardWithUpperRightCornerAt: point3x3 .
	gameOfLife nextGeneration.
	
	self assert: (gameOfLife isDeadAt: point1x1 ) ! !

!GOLTest methodsFor: 'tests' stamp: 'JI 5/15/2017 19:09:18'!
test02AliveCellWithTwoAliveNeighboursStaysAlive

	|gameOfLife |
	
	gameOfLife := GameOfLife withLiveCellsAt: { point1x2 . point2x1 . point2x3 . }    withBoardWithUpperRightCornerAt: point3x3 .
	gameOfLife nextGeneration.
	
	self deny: (gameOfLife isDeadAt: point2x2) ! !

!GOLTest methodsFor: 'tests' stamp: 'JI 5/15/2017 19:10:48'!
test03AliveCellWithThreeAliveNeighboursStaysAlive

	|gameOfLife |
	
	gameOfLife _ GameOfLife withLiveCellsAt: {point1x2 . point2x1 .point1x3. point2x2} withBoardWithUpperRightCornerAt: point3x3.
	gameOfLife nextGeneration.
	
	self deny: (gameOfLife isDeadAt: point2x2 ) ! !

!GOLTest methodsFor: 'tests' stamp: 'JI 5/15/2017 19:15:50'!
test04AliveCellWithMoreThanThreeAliveNeighboursDies

	|gameOfLife |
	
	gameOfLife _ GameOfLife withLiveCellsAt: {point1x2 . point2x1 .point1x3. point2x2. point1x1} withBoardWithUpperRightCornerAt: point3x3.
	gameOfLife nextGeneration.
	
	self assert: (gameOfLife isDeadAt: point2x2 ) ! !

!GOLTest methodsFor: 'tests' stamp: 'JI 5/15/2017 19:16:15'!
test05DeadCellWithThreeAliveNeighboursResurrects

	|gameOfLife |
	
	gameOfLife _ GameOfLife withLiveCellsAt: {point1x2 . point2x1 .point1x3. } withBoardWithUpperRightCornerAt: point3x3.
	gameOfLife nextGeneration.
	
	self deny: (gameOfLife isDeadAt: point2x2 ) ! !

!GOLTest methodsFor: 'tests' stamp: 'JI 5/15/2017 19:17:05'!
test06CreateCellOutsideBoundsRaisesError

	self 
		should: [ GameOfLife withLiveCellsAt: {point1x2 . point2x1 .point1x3. } withBoardWithUpperRightCornerAt: point2x2. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'celda fuera de rango' ]! !

!GOLTest methodsFor: 'tests' stamp: 'JI 5/15/2017 19:37:21'!
test07AskForACellOutsideBoundsRaisesError

	| gameOfLife |
	
	gameOfLife := GameOfLife withLiveCellsAt: {point3x1. point2x1} withBoardWithUpperRightCornerAt: point3x3.
	
	self 
		should: [ gameOfLife isDeadAt: point4x1]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: 'posicion fuera de rango' ]! !


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

!BoardOfCells methodsFor: 'as yet unclassified' stamp: 'JI 5/15/2017 17:55:40'!
aliveCells
	self shouldBeImplemented! !

!BoardOfCells methodsFor: 'as yet unclassified' stamp: 'JI 5/15/2017 18:18:24'!
aliveCellsPoints
	
	| somePoints |
	
	somePoints _ OrderedCollection new.
	
	1 to: matrix size do: [ :i | | row |
		row _ matrix at: i.
		1 to: row size do: [ :j | | aPoint |
			aPoint _ i@j.
			(self cellIsAliveAt: aPoint )
			ifTrue: [
				somePoints add: aPoint.
				].
			].		
		].
	
	^somePoints ! !

!BoardOfCells methodsFor: 'as yet unclassified' stamp: 'JI 5/15/2017 18:55:40'!
cellIsAliveAt: aPoint 
	^ ( (matrix at: aPoint x) at: aPoint y) isAlive .! !

!BoardOfCells methodsFor: 'as yet unclassified' stamp: 'JI 5/15/2017 18:37:43'!
cellIsDeadAt: aPoint 
	
	^ (self cellIsAliveAt: aPoint) not! !

!BoardOfCells methodsFor: 'as yet unclassified' stamp: 'JI 5/15/2017 19:40:01'!
createBoardWithAliveCellsAt: somePoints withBoardWithUpperRightCornerAt: aPoint 
	
	upperRightCorner _ aPoint .
	matrix _ OrderedCollection new .
	
	1 to: aPoint x do: [ :i | | row |
		row _ OrderedCollection new.
		1 to: aPoint y do: [ :j | | cell |
			cell _ Cell createDeadCell.
			row add: cell.
			].
		matrix add: row.
		].
	
	self reviveCellsAt: somePoints .
	! !

!BoardOfCells methodsFor: 'as yet unclassified' stamp: 'JI 5/15/2017 18:36:33'!
deadCellPoints

	| somePoints |
	
	somePoints _ OrderedCollection new.
	
	1 to: matrix size do: [ :i | | row |
		row _ matrix at: i.
		1 to: row size do: [ :j | | aPoint |
			aPoint _ i@j.
			(self cellIsDeadAt: aPoint )
			ifTrue: [
				somePoints add: aPoint.
				].
			].		
		].
	
	^somePoints ! !

!BoardOfCells methodsFor: 'as yet unclassified' stamp: 'JI 5/15/2017 19:45:44'!
pointIsInBoundaries: aPoint 

	^ 1@1 <= aPoint and: (aPoint <= upperRightCorner )! !

!BoardOfCells methodsFor: 'as yet unclassified' stamp: 'JI 5/15/2017 18:45:11'!
reviveCellAt: aPoint 
	
	| aCell |
	
	aCell _ (matrix at: (aPoint x) ) at: (aPoint y) .
	
	aCell revive.! !

!BoardOfCells methodsFor: 'as yet unclassified' stamp: 'JI 5/15/2017 17:48:32'!
reviveCellsAt: somePoints
	
	somePoints do: [ :aPoint | self reviveCellAt: aPoint ].! !

!BoardOfCells methodsFor: 'as yet unclassified' stamp: 'JI 5/15/2017 18:43:08'!
upperRightCorner
	^upperRightCorner! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BoardOfCells class' category: #GOL!
BoardOfCells class
	instanceVariableNames: 'matrix'!

!BoardOfCells class methodsFor: 'as yet unclassified' stamp: 'JI 5/15/2017 17:48:15'!
createBoardWithAliveCellsAt: somePoints withBoardWithUpperRightCornerAt: aPoint 
	
	^ self new createBoardWithAliveCellsAt: somePoints withBoardWithUpperRightCornerAt: aPoint .! !


!classDefinition: #Cell category: #GOL!
Object subclass: #Cell
	instanceVariableNames: 'alive'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!

!Cell methodsFor: 'as yet unclassified' stamp: 'JI 5/15/2017 18:16:43'!
createDeadCell

	alive _ false! !

!Cell methodsFor: 'as yet unclassified' stamp: 'JI 5/15/2017 18:17:22'!
isAlive
	^ alive ! !

!Cell methodsFor: 'as yet unclassified' stamp: 'JI 5/15/2017 18:37:10'!
isDead
	^ alive not.! !

!Cell methodsFor: 'as yet unclassified' stamp: 'JI 5/15/2017 18:18:56'!
revive
	alive _ true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cell class' category: #GOL!
Cell class
	instanceVariableNames: 'alive'!

!Cell class methodsFor: 'as yet unclassified' stamp: 'JI 5/15/2017 18:16:26'!
createDeadCell
	
	^self new createDeadCell! !

!Cell class methodsFor: 'as yet unclassified' stamp: 'JI 5/15/2017 17:52:48'!
revive
	
	alive _ true! !


!classDefinition: #GameOfLife category: #GOL!
Object subclass: #GameOfLife
	instanceVariableNames: 'board'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'GOL'!


!GameOfLife methodsFor: 'private' stamp: 'JAK 5/15/2017 16:25:28'!
deadCells
	
	| deadCells |
	
	deadCells _ OrderedCollection new.
	0 to: theBoard right - 1 do: [ :x |
		0 to: theBoard bottom -1 do: [ :y |
			(self isDeadAt: x@y ) ifTrue: [ deadCells add: x@y]]].
	^deadCells ! !

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


!GameOfLife methodsFor: 'inspecting' stamp: 'JI 5/15/2017 19:43:57'!
isDeadAt: aCellPoint
	(self pointIsInBoundaries: aCellPoint)
	ifFalse: [ self error: 'posicion fuera de rango'
		].
	^ board cellIsDeadAt: aCellPoint .

! !


!GameOfLife methodsFor: 'evaluating' stamp: 'JI 5/15/2017 18:38:57'!
nextGeneration

	| aliveCellPoints deadCellPoints survivors newborns newGenerationOfAliveCellsAtPoints |

	aliveCellPoints _ board aliveCellsPoints  .
	deadCellPoints _ board deadCellPoints .	
	
	survivors _ aliveCellPoints select: [ :anAliveCellPoint | 	self hasToSurvive: anAliveCellPoint ].
	newborns  _ 	deadCellPoints select: [ :aDeadCellPoint | self hasToResurrect: aDeadCellPoint ] .
	
	newGenerationOfAliveCellsAtPoints _ survivors union: newborns .
	
	board _ BoardOfCells createBoardWithAliveCellsAt: newGenerationOfAliveCellsAtPoints withBoardWithUpperRightCornerAt: board upperRightCorner.
	! !


!GameOfLife methodsFor: 'as yet unclassified' stamp: 'JI 5/15/2017 17:55:33'!
aliveCells
	
	^ board aliveCells! !

!GameOfLife methodsFor: 'as yet unclassified' stamp: 'JI 5/15/2017 18:03:23'!
aliveCellsPoints
	
	^ board aliveCellsPoints! !

!GameOfLife methodsFor: 'as yet unclassified' stamp: 'JI 5/15/2017 19:45:08'!
pointIsInBoundaries: aPoint 
	
	^ board pointIsInBoundaries: aPoint .! !

!GameOfLife methodsFor: 'as yet unclassified' stamp: 'JI 5/15/2017 17:32:57'!
withLiveCellsAt: somePoints withBoardWithUpperRightCornerAt: aPoint 
	
	board _ BoardOfCells createBoardWithAliveCellsAt: somePoints withBoardWithUpperRightCornerAt: aPoint ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GameOfLife class' category: #GOL!
GameOfLife class
	instanceVariableNames: ''!


!GameOfLife class methodsFor: 'as yet unclassified' stamp: 'JI 5/15/2017 19:34:21'!
satisfiesPreconditions: anArray withUpperRightCornerAt: aPoint 
	
	anArray do: [ :aCellPoint | 
		(1@1 <= aCellPoint and: (aCellPoint <= aPoint ) )
			ifFalse: [ self error: 'celda fuera de rango' ].
		].! !

!GameOfLife class methodsFor: 'as yet unclassified' stamp: 'JI 5/15/2017 19:30:34'!
withLiveCellsAt: anArray withBoardWithUpperRightCornerAt: aPoint 
	
	self satisfiesPreconditions: anArray withUpperRightCornerAt: aPoint .
	
	^self new withLiveCellsAt: anArray withBoardWithUpperRightCornerAt: aPoint ! !
