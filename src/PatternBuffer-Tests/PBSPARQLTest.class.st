Class {
	#name : #PBSPARQLTest,
	#superclass : #TestCase,
	#instVars : [
		'sparqlClient'
	],
	#category : #'PatternBuffer-Tests'
}

{ #category : #accessing }
PBSPARQLTest >> resultAsJSONString [

	^ '{ "head": {
    "vars": [ "assembly" , "subassembly" ]
  } ,
  "results": {
    "bindings": [
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/systems/spc/assemblies#SpacecraftSystemSegment" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/05/systems/pld/assemblies#PayloadModule" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/05/systems/pld/assemblies#PayloadModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/05/systems/pld/assemblies#Sensor" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#AvionicsStackSection" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/04/subsystems/sam/assemblies#EPSRegulatorsAndConvertersUnit" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#BasePlateModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#AvionicsStackSection" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#BasePlateModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#BasePlate" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/systems/spc/assemblies#SpacecraftSystemSegment" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#BasePlateModule" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#LaunchVehicleInterfaceModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#LaunchVehicleAdapter" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/systems/spc/assemblies#SpacecraftSystemSegment" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#LaunchVehicleInterfaceModule" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/05/systems/pld/assemblies#PayloadModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#PayloadStructuralInterface" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/08/subsystems/prp/assemblies#PropulsionModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#PressurantTankMountingPanel" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#AvionicsStackSection" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#PrimaryFlightComputerUnit" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/08/subsystems/prp/assemblies#PropulsionModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#PropellantTankMountingPanel" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/08/subsystems/prp/assemblies#PropulsionModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#PropulsionStructurePost1" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/08/subsystems/prp/assemblies#PropulsionModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#PropulsionStructurePost2" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/08/subsystems/prp/assemblies#PropulsionModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#PropulsionStructurePost3" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/08/subsystems/prp/assemblies#PropulsionModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#PropulsionStructurePost4" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#LaunchVehicleInterfaceModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#SeparationSystem" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/systems/spc/assemblies#SpacecraftSystemSegment" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#SidePanel1" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/systems/spc/assemblies#SpacecraftSystemSegment" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#SidePanel2" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/systems/spc/assemblies#SpacecraftSystemSegment" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#SidePanel3" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/systems/spc/assemblies#SpacecraftSystemSegment" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#SidePanel4" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/systems/spc/assemblies#SpacecraftSystemSegment" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#SidePanel5" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/systems/spc/assemblies#SpacecraftSystemSegment" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#SidePanel6" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#TopPanelModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#StructurePost1" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#TopPanelModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#StructurePost2" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#TopPanelModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#StructurePost3" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#TopPanelModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#StructurePost4" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#TopPanelModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#StructurePost5" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#TopPanelModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#StructurePost6" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#TopPanelModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#TopPanel" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/systems/spc/assemblies#SpacecraftSystemSegment" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#TopPanelModule" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#TopPanelModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/09/subsystems/cmn/assemblies#ReceiveWhipAntenna" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#AvionicsStackSection" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/09/subsystems/cmn/assemblies#ReceiverUnit" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#TopPanelModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/09/subsystems/cmn/assemblies#TransmitHiGainAntenna" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#TopPanelModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/09/subsystems/cmn/assemblies#TransmitWhipAntenna" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#AvionicsStackSection" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/09/subsystems/cmn/assemblies#TransmitterUnit" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#AvionicsStackSection" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/04/subsystems/sam/assemblies#PowerControlUnit" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/systems/spc/assemblies#SpacecraftSystemSegment" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/04/subsystems/sam/assemblies#SolarArrayWithSADA1" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/systems/spc/assemblies#SpacecraftSystemSegment" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/04/subsystems/sam/assemblies#SolarArrayWithSADA2" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#BasePlateModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/06/subsystems/eps/assemblies#BatteryPack1" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#BasePlateModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/06/subsystems/eps/assemblies#BatteryPack2" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#BasePlateModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/06/subsystems/eps/assemblies#BatteryPack3" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#BasePlateModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/07/subsystems/ang/assemblies#GPSAntenna" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#BasePlateModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/08/subsystems/prp/assemblies#ACSThruster2" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#AvionicsStackSection" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/08/subsystems/prp/assemblies#PropulsionSystemControlUnit" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#BasePlateModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/07/subsystems/ang/assemblies#ReactionWheel1" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#BasePlateModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/08/subsystems/prp/assemblies#ACSThruster1" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/08/subsystems/prp/assemblies#PropulsionModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/08/subsystems/prp/assemblies#PressurantTank" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#AvionicsStackSection" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/07/subsystems/ang/assemblies#Magnetorquer2" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#BasePlateModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/07/subsystems/ang/assemblies#Magnetometer" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#BasePlateModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/07/subsystems/ang/assemblies#ReactionWheel3" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#BasePlateModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/07/subsystems/ang/assemblies#ReactionWheel2" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#AvionicsStackSection" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/07/subsystems/ang/assemblies#ADCSElectronicsUnit" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#BasePlateModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/08/subsystems/prp/assemblies#ACSThruster3" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/08/subsystems/prp/assemblies#PropellantHandlingSection" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/08/subsystems/prp/assemblies#BPPropellantLineUnit" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#BasePlateModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/08/subsystems/prp/assemblies#PropellantHandlingSection" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/08/subsystems/prp/assemblies#PropulsionModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/08/subsystems/prp/assemblies#PropellantTank" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#BasePlateModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/08/subsystems/prp/assemblies#PrimaryThruster" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#BasePlateModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/08/subsystems/prp/assemblies#ACSThruster5" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/systems/spc/assemblies#SpacecraftSystemSegment" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/08/subsystems/prp/assemblies#PropulsionModule" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#BasePlateModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/08/subsystems/prp/assemblies#ACSThruster4" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/08/subsystems/prp/assemblies#PropellantHandlingSection" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/08/subsystems/prp/assemblies#FillDrainValveUnit" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/08/subsystems/prp/assemblies#PropulsionModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/08/subsystems/prp/assemblies#PMPropellantLineUnit" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#BasePlateModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/08/subsystems/prp/assemblies#ACSThruster6" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#BasePlateModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/07/subsystems/ang/assemblies#ReactionWheel4" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/systems/spc/assemblies#SpacecraftSystemSegment" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/05/subsystems/thc/assemblies#ThermalBlankets" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#AvionicsStackSection" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/07/subsystems/ang/assemblies#Magnetorquer1" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#AvionicsStackSection" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/07/subsystems/ang/assemblies#Magnetorquer3" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#TopPanelModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/07/subsystems/ang/assemblies#EarthSensor" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#TopPanelModule" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/07/subsystems/ang/assemblies#SunSensor" }
      } ,
      { 
        "assembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/10/subsystems/cdh/assemblies#AvionicsStackSection" } ,
        "subassembly": { "type": "uri" , "value": "http://opencaesar.io/examples/firesat/programs/earth-science/projects/firesat/workpackages/06/07/subsystems/ang/assemblies#GPSReceiverUnit" }
      }
    ]
  }
}
'
]

{ #category : #running }
PBSPARQLTest >> setUp [

	super setUp.
	sparqlClient := PBSPARQL new
]

{ #category : #accessing }
PBSPARQLTest >> sparqlString [

	^ 'SELECT DISTINCT ?concept
WHERE {
    ?s a ?concept .
} LIMIT 50'
]

{ #category : #tests }
PBSPARQLTest >> testEndpoint [

	sparqlClient endpoint: 'http://localhost:3030/database/sparql'.
	sparqlClient appendUrlEncodedSPARQLStringToQueryStream:
		self sparqlString urlEncoded.
	self assert: (sparqlClient endpoint isKindOf: String).
	self assert: sparqlClient endpoint notEmpty.
	self assert: (sparqlClient endpoint beginsWith: 'http:')
]

{ #category : #tests }
PBSPARQLTest >> testQueryStream [

	self assert: (sparqlClient queryStream isKindOf: Stream)
]

{ #category : #tests }
PBSPARQLTest >> testResultAsJSON [

	"Parse result as json, then check shape of rows and columns used to generate table"

	| resultAsJSON parsedJSON bindings bindgingsListItem rowSize colSize formattedValue |
	resultAsJSON := self resultAsJSONString contents.
	parsedJSON := NeoJSONReader fromString: resultAsJSON.
	bindings := (parsedJSON at: #results) at: #bindings.
	bindgingsListItem := (parsedJSON at: #head) at: #vars.
	rowSize := bindings size.
	colSize := bindgingsListItem size.
	formattedValue := [ :input | 
	                  [ (input asString splitOn: '#') at: 2 ]
		                  on: Error
		                  do: [ input asString ] ].
	self assert: rowSize equals: 71.
	self assert: colSize equals: 2
]

{ #category : #tests }
PBSPARQLTest >> testResultAsTableHasColumnNames [

	"Test result as table contains column names"

	| resultAsTable |
	sparqlClient result: self resultAsJSONString.
	resultAsTable := sparqlClient resultAsTable.

	self assert: (resultAsTable columnNames at: 1) equals: 'assembly'.
	self assert: (resultAsTable columnNames at: 2) equals: 'subassembly'
]
