test - parsing (deprecated)
testFlatten2
	| parser |
	parser := ($a asParser2, $b asParser2) flatten.
	
	self assert: parser parse: 'ab' to: 'ab'.
	
	self assert: parser fail: 'ac' end: 1.
	self assert: parser fail: 'bc'