tests
testWrapping
	parser := $a asParser2 wrapped.
	children := self visit: parser.
	
	self assert: children isCollection.
	self assert: children size = 2.
	self assert: (children includes: parser child).
	self assert: (children includes: parser).	