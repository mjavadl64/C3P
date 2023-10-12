"
This class create an Double linked list whit two instant variables: Head and Tail , those keep information of begin and end of the list.
"
Class {
	#name : #DLL,
	#superclass : #Object,
	#instVars : [
		'head',
		'tail'
	],
	#category : #DLL
}

{ #category : #adding }
DLL >> add: anObject [
	^ self addLast: anObject 
]

{ #category : #adding }
DLL >> add: anObject after: otherObject [

(self include: otherObject )
  ifTrue: [self add: anObject].

^ anObject 
  
]

{ #category : #adding }
DLL >> add: anObject befor: secondObject [

|first second|
first := Nodes new.
second := Nodes new.
first data: anObject.
second data: secondObject.
 (self include: secondObject)
		ifTrue: [ first next: second .
					  second pre: first.
					head := first.
					tail:= second ].
				
^ anObject 
]

{ #category : #adding }
DLL >> addLast: anObject [

|temp|
temp:= Nodes new.
temp data: anObject .
head ifNil: [ tail:= temp.
	head:= temp.
	head next: temp.
	tail pre: head.
	^ temp ].
head next: temp.
tail pre: temp.
tail := temp.

^ anObject 
]

{ #category : #calcul }
DLL >> elements [

|head2 element|
element := OrderedCollection new.
head2 := head.
head2  ifNil: [ ^0 ].
[head2 isNotNil] whileTrue: [
	  element add: head2 data.
	  head2 := head2 next ].
^ element 
]

{ #category : #adding }
DLL >> include: anObjet [

|temp headTemp|
temp := Nodes new.
temp data: anObjet.
headTemp := head.
[headTemp isNotNil] whileTrue: [ 
	headTemp data = temp data ifTrue: [ ^true ].
	headTemp := headTemp next ].
^false
]

{ #category : #calcul }
DLL >> sizOfDll [

|temp counter|
counter := 0.
head ifNil: [^0].
temp := head.
[temp isNotNil] whileTrue: [ 
	 counter := counter + 1.
	 temp := temp next].
^ counter+1
]
