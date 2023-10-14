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

|tailtemp seconobject temp|
seconobject := Nodes new.
seconobject data: otherObject .
(head = tail) | (tail data = seconobject data ) 
  ifTrue: [^self add: anObject].
tailtemp := tail.
[tailtemp isNotNil] whileTrue: [ 
	temp := tailtemp .
	tailtemp := tailtemp pre.
	tailtemp data = seconobject data
	ifTrue: [ 
		tailtemp next: seconobject.
		seconobject pre: tailtemp.
		seconobject next: tailtemp next.
		temp pre: seconobject  ].
	 ].
^ seconobject 

]

{ #category : #adding }
DLL >> add: anObject befor: secondObject [

|head2 first second temp|
first := Nodes new.
second := Nodes new.
temp := Nodes new.
first data: anObject.
second data: secondObject.
(head = tail) | (head data = second data) 
 ifTrue: [ ^self addFirst: anObject  ].
head2 := head.
[ head2 isNotNil ] whileTrue: [ 
	(head2 data = second data) ifTrue: [ 
		 first next: head2.
		 first pre: head2 pre.
		 head2 pre: first. 
		 temp next: first. 
		 ^first ].
		 temp := head2.
		 head2 := head2 next. ]. 
				
^ first 
]

{ #category : #adding }
DLL >> addFirst: anObject [

|temp|
temp:= Nodes new.
temp data: anObject .
temp next: head.
head ifNotNil: [ head pre: temp ]. 
tail := head. 
head := temp. 
^ temp
]

{ #category : #adding }
DLL >> addLast: anObject [

|temp|
temp:= Nodes new.
temp data: anObject .
tail ifNotNil: [ tail next: temp ].
head ifNil: [ head := temp  ].
tail := temp.

^ temp 
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
^ counter
]
