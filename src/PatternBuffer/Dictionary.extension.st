Extension { #name : 'Dictionary' }

{ #category : '*PatternBuffer' }
Dictionary >> inspectionTreeTable: aBuilder [

	<inspectorPresentationOrder: -1 title: 'Tree'>
	^ aBuilder newTreeTable
		  addColumn: (SpStringTableColumn new
				   title: 'Key';
				   evaluated: [ :each |
					   StObjectPrinter asTruncatedTextFrom: each key ];
				   width: 150;
				   beSortable);
		  addColumn: (SpStringTableColumn
				   title: 'Value'
				   evaluated: [ :each |
				   StObjectPrinter asTruncatedTextFrom: each value ]) beSortable;
		  items: (self associations collect: [ :e |
				   PBDictionaryInspectorAssociationNode hostObject: e ]);
		  children: [ :each | each children ];
		  yourself
]

{ #category : '*PatternBuffer' }
Dictionary >> inspectorDictionaryNodes [

	^ (PBDictionaryNodeCollector for: self) collectNodes
]
