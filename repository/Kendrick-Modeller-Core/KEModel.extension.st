Extension { #name : #KEModel }

{ #category : #'*Kendrick-Modeller-Core' }
KEModel >> name [
	population ifNil: [ ^ 'no compartments' ].
	^ String
		streamContents: [ :stream | 
			(STON writer on: stream)
				prettyPrint: false;
				jsonMode: true;
				referencePolicy: #error;
				nextPut: population compartments ]
]
