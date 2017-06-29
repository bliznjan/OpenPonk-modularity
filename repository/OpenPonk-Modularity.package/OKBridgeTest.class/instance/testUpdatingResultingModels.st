tests
testUpdatingResultingModels
	"note that this test wouldn't work if testResultingModelsCreation does not work"

	| definitionModels resultingModels |
	bridge project: OKDummyProject new.
	definitionModels := (bridge definitionModels collect: [ :each | each name -> each ]) as: Dictionary.
	resultingModels := {('X' -> (bridge resultingModelsFrom: (definitionModels at: 'X'))).
	('Y' -> (bridge resultingModelsFrom: (definitionModels at: 'Y')))} asDictionary.
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'X')) size equals: 4.
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'Y')) size equals: 4.
	self assert: ((resultingModels at: 'X') allSatisfy: [ :each | (bridge resultingModelsFrom: (definitionModels at: 'X')) includes: each ]).
	self assert: ((resultingModels at: 'Y') allSatisfy: [ :each | (bridge resultingModelsFrom: (definitionModels at: 'Y')) includes: each ]).
	bridge changed: (definitionModels at: 'Y') in: (definitionModels at: 'Y').
	self assert: (bridge resultingModelsFrom: (definitionModels at: 'Y')) size equals: 4.
	self assert: ((resultingModels at: 'X') allSatisfy: [ :each | (bridge resultingModelsFrom: (definitionModels at: 'X')) includes: each ]).
	self assert: ((resultingModels at: 'Y') noneSatisfy: [ :each | (bridge resultingModelsFrom: (definitionModels at: 'Y')) includes: each ])