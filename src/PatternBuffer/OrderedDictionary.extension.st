Extension { #name : 'OrderedDictionary' }

{ #category : '*PatternBuffer' }
OrderedDictionary >> inspectionItems: aBuilder [

	<inspectorPresentationOrder: -1 title: 'Items'>
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
