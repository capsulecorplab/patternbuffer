Extension { #name : #PBArray2D }

{ #category : #'*PatternBuffer' }
PBArray2D >> inspectorExtension [

	<inspectorPresentationOrder: 0 title: 'Matrix'>
	| specTable |
	specTable := SpTablePresenter new.
	specTable addColumn: (SpIndexTableColumn new
			 title: '#';
			 width: 30;
			 yourself).

	1 to: numberOfColumns do: [ :index | 
		specTable addColumn: (SpStringTableColumn new
				 title: (self columnNames at: index);
				 evaluated: [ :each | each at: index ];
				 beNotExpandable) ].

	specTable items:
		((1 to: numberOfRows) collect: [ :index | self atRow: index ]).
	^ specTable
]
