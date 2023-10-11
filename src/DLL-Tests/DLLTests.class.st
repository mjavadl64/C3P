Class {
	#name : #DLLTests,
	#superclass : #TestCase,
	#instVars : [
		'dll'
	],
	#category : #'DLL-Tests'
}

{ #category : #running }
DLLTests >> setUp [

	super setUp.
	dll := DLL new
]

{ #category : #running }
DLLTests >> testAddAfter [

dll add: 6.
dll add: 43 after: 6.
self assert: dll elements equals: #(6 43)
]

{ #category : #running }
DLLTests >> testAddBefor [

dll add: 9.
dll add: 28 befor: 9.
self assert: dll elements equals: #(28 9)
]

{ #category : #running }
DLLTests >> testAddonElement [

dll add: 5.
self assert: (dll include:5)
]

{ #category : #running }
DLLTests >> testSiz [

dll add: 10.
dll add: 8.
dll add: 39.
self assert: dll sizOfDll equals: 3.
]

{ #category : #running }
DLLTests >> testTwoElements [

dll add: 5.
dll add: 43.
self assert: (dll include:5).
self assert: (dll include:43)
]
