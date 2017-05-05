'From Cuis 5.0 of 7 November 2016 [latest update: #3076] on 5 May 2017 at 9:20:57 am'!
!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'lastElement'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'JAK 5/5/2017 09:20:07'!
isEmpty
	^ lastElement isNil ! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'JAK 5/5/2017 09:19:06'!
push: anElement 
	lastElement := anElement.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !
