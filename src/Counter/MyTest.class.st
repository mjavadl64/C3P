Class {
	#name : #MyTest,
	#superclass : #TestCase,
	#category : #Counter
}

{ #category : #tests }
MyTest >> testSimple [ 

	|c|
	c := Counter new count: 7.
	self assert: c count equals: 7 
]
