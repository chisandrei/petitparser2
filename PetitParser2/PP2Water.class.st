"
Default strategy for PP2WaterNode.
"
Class {
	#name : #PP2Water,
	#superclass : #PP2Strategy,
	#category : #'PetitParser2-Strategies'
}

{ #category : #initialization }
PP2Water >> initializeFor: aPP2Node [
	super initializeFor: aPP2Node
]

{ #category : #parsing }
PP2Water >> parseOn: context [
	| result contents memento startWaterPosition |
	memento := self remember: context.
	startWaterPosition := context waterPosition.
	contents := OrderedCollection new.
	
	"Recursive Water case"
	(context waterPosition = context position) ifTrue: [  ^ '' ].
	
	[
		context waterPosition: context position.
		(node boundary parseOn: context) isPetit2Failure 
	] whileTrue: [  
		(result := node waterToken parseOn: context) isPetit2Failure ifTrue: [  
			self restore: context from: memento.
			context waterPosition: startWaterPosition.
			^ PP2Failure message: 'water boundary not found' context: context.
		].
		contents add: result.
	].
	context waterPosition: startWaterPosition.
	^ contents
]
