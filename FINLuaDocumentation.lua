--- The base class of every object.
---@class Object
---@field public hash number @A Hash of this object. This is a value that nearly uniquely identifies this object.
---@field public internalName string @The unreal engine internal name of this object.
---@field public internalPath string @The unreal engine internal path name of this object.
---@field public hash number @A Hash of this object. This is a value that nearly uniquely identifies this object.
---@field public internalName string @The unreal engine internal name of this object.
---@field public internalPath string @The unreal engine internal path name of this object.
local Object
--- Returns a hash of this object. This is a value that nearly uniquely identifies this object.
---@return number
function Object:getHash() end
--- Returns the type (aka class) of this object.
---@return Class
function Object:getType() end
--- Checks if this Object is a child of the given typen.
---@param parent Object-Class @The parent we check if this object is a child of.
---@return boolean
function Object:isA(parent) end

--- A component/part of an actor in the world.
---@class ActorComponent:Object
---@field public owner Actor @The parent actor of which this component is part of
local ActorComponent

--- This is the base class of all things that can exist within the world by them self.
---@class Actor:Object
---@field public location Vector @The location of the actor in the world.
---@field public scale Vector @The scale of the actor in the world.
---@field public rotation Rotator @The rotation of the actor in the world.
local Actor
--- Returns a list of power connectors this actor might have.
---@return PowerConnection[]
function Actor:getPowerConnectors() end
--- Returns a list of factory connectors this actor might have.
---@return FactoryConnection[]
function Actor:getFactoryConnectors() end
--- Returns a list of pipe (fluid & hyper) connectors this actor might have.
---@return PipeConnectionBase[]
function Actor:getPipeConnectors() end
--- Returns a list of inventories this actor might have.
---@return Inventory[]
function Actor:getInventories() end
--- Returns the name of network connectors this actor might have.
---@return ActorComponent[]
function Actor:getNetworkConnectors() end
--- Returns the components that make-up this actor.
---@param componentType ActorComponent-Class @The class will be used as filter.
---@return ActorComponent[]
function Actor:getComponents(componentType) end

--- The type of an item (iron plate, iron rod, leaves)
---@class ItemType:Object
---@field public form number @The matter state of this resource. 1: Solid 2: Liquid 3: Gas 4: Heat
---@field public energy number @How much energy this resource provides if used as fuel.
---@field public radioactiveDecay number @The amount of radiation this item radiates.
---@field public name string @The name of the item.
---@field public description string @The description of this item.
---@field public max number @The maximum stack size of this item.
---@field public canBeDiscarded boolean @True if this item can be discarded.
---@field public category ItemCategory-Class @The category in which this item is in.
---@field public fluidColor Color @The color of this fluid.
local ItemType

--- The base class of all buildables.
---@class Buildable:Actor
---@field public numPowerConnections number @The count of available power connections this building has.
---@field public numFactoryConnections number @The cound of available factory connections this building has.
---@field public numFactoryOutputConnections number @The count of available factory output connections this building has.
local Buildable

--- 
---@class FGBuildableConveyorAttachment:Buildable
local FGBuildableConveyorAttachment

--- 
---@class FGBuildableAttachmentMerger:FGBuildableConveyorAttachment
local FGBuildableAttachmentMerger

--- 
---@class FGBuildableAttachmentSplitter:FGBuildableConveyorAttachment
local FGBuildableAttachmentSplitter

--- The base class of most machines you can build.
---@class Factory:Buildable
---@field public progress number @The current production progress of the current production cycle.
---@field public powerConsumProducing number @The power consumption when producing.
---@field public productivity number @The productivity of this factory.
---@field public cycleTime number @The time that passes till one production cycle is finsihed.
---@field public maxPotential number @The maximum potential this factory can be set to.
---@field public minPotential number @The minimum potential this factory needs to be set to.
---@field public standby boolean @True if the factory is in standby.
---@field public potential number @The potential this factory is currently set to. (the overclock value)  0 = 0%, 1 = 100%
local Factory

--- The base class of every machine that uses a recipe to produce something automatically.
---@class Manufacturer:Factory
local Manufacturer
--- Returns the currently set recipe of the manufacturer.
---@return Recipe-Class
function Manufacturer:getRecipe() end
--- Returns the list of recipes this manufacturer can get set to and process.
---@return Recipe-Class[]
function Manufacturer:getRecipes() end
--- Sets the currently producing recipe of this manufacturer.
---@param recipe Recipe-Class @The recipe this manufacturer should produce.
---@return boolean
function Manufacturer:setRecipe(recipe) end
--- Returns the input inventory of this manufacturer.
---@return Inventory
function Manufacturer:getInputInv() end
--- Returns the output inventory of this manufacturer.
---@return Inventory
function Manufacturer:getOutputInv() end

--- 
---@class FGBuildableAutomatedWorkBench:Manufacturer
local FGBuildableAutomatedWorkBench

--- 
---@class FGBuildableFactoryBuilding:Buildable
local FGBuildableFactoryBuilding

--- 
---@class FGBuildableBeam:FGBuildableFactoryBuilding
local FGBuildableBeam

--- 
---@class FGBuildableBeamLightweight:FGBuildableBeam
local FGBuildableBeamLightweight

--- 
---@class FGBuildableBlueprintDesigner:Buildable
local FGBuildableBlueprintDesigner

--- 
---@class FGBuildableCalendar:Buildable
local FGBuildableCalendar

--- 
---@class FGBuildableCheatFluidSink:Factory
local FGBuildableCheatFluidSink

--- 
---@class FGBuildableCheatFluidSpawner:Factory
local FGBuildableCheatFluidSpawner

--- A building that can connect two circuit networks together.
---@class CircuitBridge:Buildable
---@field public isBridgeConnected boolean @True if the bridge is connected to two circuits.
---@field public isBridgeActive boolean @True if the two circuits are connected to each other and act as one entity.
local CircuitBridge

--- A circuit bridge that can be activated and deactivate by the player.
---@class CircuitSwitch:CircuitBridge
---@field public isSwitchOn boolean @True if the two circuits are connected to each other and act as one entity.
local CircuitSwitch
--- Changes the circuit switch state.
---@param state boolean @The new switch state.
function CircuitSwitch:setIsSwitchOn(state) end

--- 
---@class FGBuildableControlPanelHost:CircuitBridge
local FGBuildableControlPanelHost

--- 
---@class FGBuildableConveyorAttachmentLightweight:FGBuildableConveyorAttachment
local FGBuildableConveyorAttachmentLightweight

--- 
---@class FGBuildableConveyorBase:Buildable
local FGBuildableConveyorBase

--- 
---@class FGBuildableConveyorBelt:FGBuildableConveyorBase
local FGBuildableConveyorBelt

--- 
---@class FGBuildableConveyorLift:FGBuildableConveyorBase
local FGBuildableConveyorLift

--- 
---@class FGBuildableCornerWall:FGBuildableFactoryBuilding
local FGBuildableCornerWall

--- 
---@class FGBuildableDecor:Buildable
local FGBuildableDecor

--- A docking station for wheeled vehicles to transfer cargo.
---@class DockingStation:Factory
---@field public isLoadMode boolean @True if the docking station loads docked vehicles, flase if it unloads them.
---@field public isLoadUnloading boolean @True if the docking station is currently loading or unloading a docked vehicle.
local DockingStation
--- Returns the fuel inventory of the docking station.
---@return Inventory
function DockingStation:getFuelInv() end
--- Returns the cargo inventory of the docking staiton.
---@return Inventory
function DockingStation:getInv() end
--- Returns the currently docked actor.
---@return Actor
function DockingStation:getDocked() end
--- Undocked the currently docked vehicle from this docking station.
function DockingStation:undock() end

--- 
---@class FGBuildableWall:FGBuildableFactoryBuilding
local FGBuildableWall

--- The base class of all doors.
---@class Door:FGBuildableWall
local Door
--- Returns the Door Mode/Configuration.
--- 0 = Automatic
--- 1 = Always Closed
--- 2 = Always Open
---@return number
function Door:getConfiguration() end
--- Sets the Door Mode/Configuration, only some modes are allowed, if the mod you try to set is invalid, nothing changes.
--- 0 = Automatic
--- 1 = Always Closed
--- 2 = Always Open
---@param configuration number @The new configuration for the door.
function Door:setConfiguration(configuration) end

--- 
---@class FGBuildableDroneStation:Factory
local FGBuildableDroneStation

--- 
---@class FGBuildableFactoryBuildingLightweight:FGBuildableFactoryBuilding
local FGBuildableFactoryBuildingLightweight

--- 
---@class FGBuildableFactorySimpleProducer:Factory
local FGBuildableFactorySimpleProducer

--- The base class for all light you can build.
---@class LightSource:Buildable
---@field public isLightEnabled boolean @True if the light is enabled
---@field public isTimeOfDayAware boolean @True if the light should automatically turn on and off depending on the time of the day.
---@field public intensity number @The intensity of the light.
---@field public colorSlot number @The color slot the light uses.
local LightSource
--- Returns the light color that is referenced by the given slot.
---@param slot number @The slot you want to get the referencing color from.
---@return Color
function LightSource:getColorFromSlot(slot) end
--- Allows to update the light color that is referenced by the given slot.
---@param slot number @The slot you want to update the referencing color for.
---@param color Color @The color this slot should now reference.
function LightSource:setColorFromSlot(slot, color) end

--- 
---@class FGBuildableFloodlight:LightSource
local FGBuildableFloodlight

--- 
---@class FGBuildableFoundation:FGBuildableFactoryBuilding
local FGBuildableFoundation

--- 
---@class FGBuildableFoundationLightweight:FGBuildableFoundation
local FGBuildableFoundationLightweight

--- 
---@class FGBuildableResourceExtractorBase:Factory
local FGBuildableResourceExtractorBase

--- 
---@class FGBuildableFrackingActivator:FGBuildableResourceExtractorBase
local FGBuildableFrackingActivator

--- 
---@class FGBuildableResourceExtractor:FGBuildableResourceExtractorBase
local FGBuildableResourceExtractor

--- 
---@class FGBuildableFrackingExtractor:FGBuildableResourceExtractor
local FGBuildableFrackingExtractor

--- 
---@class FGBuildableGenerator:Factory
local FGBuildableGenerator

--- 
---@class FGBuildableGeneratorFuel:FGBuildableGenerator
local FGBuildableGeneratorFuel

--- 
---@class FGBuildableGeneratorGeoThermal:FGBuildableGenerator
local FGBuildableGeneratorGeoThermal

--- 
---@class FGBuildableGeneratorNuclear:FGBuildableGeneratorFuel
local FGBuildableGeneratorNuclear

--- 
---@class FGBuildableHubTerminal:Buildable
local FGBuildableHubTerminal

--- 
---@class FGBuildableJumppad:Factory
local FGBuildableJumppad

--- 
---@class FGBuildableLadder:Buildable
local FGBuildableLadder

--- A control panel to configure multiple lights at once.
---@class LightsControlPanel:FGBuildableControlPanelHost
---@field public isLightEnabled boolean @True if the lights should be enabled
---@field public isTimeOfDayAware boolean @True if the lights should automatically turn on and off depending on the time of the day.
---@field public intensity number @The intensity of the lights.
---@field public colorSlot number @The color slot the lights should use.
local LightsControlPanel
--- Allows to update the light color that is referenced by the given slot.
---@param slot number @The slot you want to update the referencing color for.
---@param color Color @The color this slot should now reference.
function LightsControlPanel:setColorFromSlot(slot, color) end

--- 
---@class FGBuildableMAM:Buildable
local FGBuildableMAM

--- 
---@class FGBuildableManufacturerVariablePower:Manufacturer
local FGBuildableManufacturerVariablePower

--- 
---@class FGBuildablePassthroughBase:Buildable
local FGBuildablePassthroughBase

--- 
---@class FGBuildablePassthrough:FGBuildablePassthroughBase
local FGBuildablePassthrough

--- 
---@class FGBuildablePassthroughPipeHyper:FGBuildablePassthroughBase
local FGBuildablePassthroughPipeHyper

--- 
---@class FGBuildablePillar:FGBuildableFactoryBuilding
local FGBuildablePillar

--- 
---@class FGBuildablePillarLightweight:FGBuildablePillar
local FGBuildablePillarLightweight

--- 
---@class FGBuildablePipeBase:Buildable
local FGBuildablePipeBase

--- A hypertube pipe
---@class BuildablePipeHyper:FGBuildablePipeBase
local BuildablePipeHyper

--- 
---@class FGBuildablePipeHyperAttachment:Factory
local FGBuildablePipeHyperAttachment

--- 
---@class FGBuildablePipeHyperBooster:FGBuildablePipeHyperAttachment
local FGBuildablePipeHyperBooster

--- 
---@class FGBuildablePipeHyperJunction:FGBuildablePipeHyperAttachment
local FGBuildablePipeHyperJunction

--- 
---@class FGBuildablePipeline:FGBuildablePipeBase
local FGBuildablePipeline

--- 
---@class FGBuildablePipelineAttachment:Factory
local FGBuildablePipelineAttachment

--- 
---@class FGBuildablePipelineFlowIndicator:Buildable
local FGBuildablePipelineFlowIndicator

--- 
---@class FGBuildablePipelineJunction:FGBuildablePipelineAttachment
local FGBuildablePipelineJunction

--- A building that can pump fluids to a higher level within a pipeline.
---@class PipelinePump:FGBuildablePipelineAttachment
---@field public maxHeadlift number @The maximum amount of headlift this pump can provide.
---@field public designedHeadlift number @The amomunt of headlift this pump is designed for.
---@field public indicatorHeadlift number @The amount of headlift the indicator shows.
---@field public indicatorHeadliftPct number @The amount of headlift the indicator shows as percantage from max.
---@field public userFlowLimit number @The flow limit of this pump the user can specifiy. Use -1 for now user set limit. (in m^3/s)
---@field public flowLimit number @The overal flow limit of this pump. (in m^3/s)
---@field public flowLimitPct number @The overal flow limit of this pump. (in percent)
---@field public flow number @The current flow amount. (in m^3/s)
---@field public flowPct number @The current flow amount. (in percent)
local PipelinePump

--- 
---@class FGBuildablePoleBase:Buildable
local FGBuildablePoleBase

--- 
---@class FGBuildablePipelineSupport:FGBuildablePoleBase
local FGBuildablePipelineSupport

--- 
---@class FGBuildablePipePart:Factory
local FGBuildablePipePart

--- 
---@class FGBuildablePipeHyperPart:FGBuildablePipePart
local FGBuildablePipeHyperPart

--- The base class for all fluid tanks.
---@class PipeReservoir:Factory
---@field public fluidContent number @The amount of fluid in the tank.
---@field public maxFluidContent number @The maximum amount of fluid this tank can hold.
---@field public flowFill number @The currentl inflow rate of fluid.
---@field public flowDrain number @The current outflow rate of fluid.
---@field public flowLimit number @The maximum flow rate of fluid this tank can handle.
local PipeReservoir
--- Emptys the whole fluid container.
function PipeReservoir:flush() end
--- Returns the type of the fluid.
---@return ItemType-Class
function PipeReservoir:getFluidType() end

--- The base class for all signs in the game.
---@class SignBase:Buildable
local SignBase
--- Returns the sign type descriptor
---@return SignType-Class
function SignBase:getSignType() end

--- 
---@class FGBuildablePixelSign:SignBase
local FGBuildablePixelSign

--- 
---@class FGBuildablePole:FGBuildablePoleBase
local FGBuildablePole

--- 
---@class FGBuildablePoleLightweight:FGBuildablePole
local FGBuildablePoleLightweight

--- 
---@class FGBuildablePowerPole:Buildable
local FGBuildablePowerPole

--- A building that can store power for later usage.
---@class PowerStorage:Factory
---@field public powerStore number @The current amount of energy stored in the storage.
---@field public powerCapacity number @The amount of energy the storage can hold max.
---@field public powerStorePercent number @The current power store in percent.
---@field public powerIn number @The amount of power coming into the storage.
---@field public powerOut number @The amount of power going out from the storage.
---@field public timeUntilFull number @The time in seconds until the storage is filled.
---@field public timeUntilEmpty number @The time in seconds until the storage is empty.
---@field public batteryStatus number @The current status of the battery. 0 = Idle, 1 = Idle Empty, 2 = Idle Full, 3 = Power In, 4 = Power Out
---@field public batteryMaxIndicatorLevel number @The maximum count of Level lights that are shown.
local PowerStorage

--- 
---@class FGBuildablePowerTower:Buildable
local FGBuildablePowerTower

--- A circuit power switch that can be activated and deactivated based on a priority to prevent a full factory power shutdown.
---@class CircuitSwitchPriority:CircuitSwitch
---@field public priority number @The priority group of which this switch is part of.
local CircuitSwitchPriority

--- 
---@class FGBuildableRadarTower:Factory
local FGBuildableRadarTower

--- 
---@class FGBuildableRailroadBridge:Buildable
local FGBuildableRailroadBridge

--- A train signal to control trains on a track.
---@class RailroadSignal:Buildable
---@field public isPathSignal boolean @True if this signal is a path-signal.
---@field public isBiDirectional boolean @True if this signal is bi-directional. (trains can pass into both directions)
---@field public hasObservedBlock boolean @True if this signal is currently observing at least one block.
---@field public blockValidation number @Any error states of the block. 0 = Unknown 1 = No Error 2 = No Exit Signal 3 = Contains Loop 4 = Contains Mixed Entry Signals
---@field public aspect number @The aspect of the signal. The aspect shows if a train is allowed to pass (clear) or not and if it should dock. 0 = Unknown 1 = The track is clear and the train is allowed to pass. 2 = The next track is Occupied and the train should stop 3 = The train should dock.
local RailroadSignal
--- Returns the track block this signals observes.
---@return RailroadSignalBlock
function RailroadSignal:getObservedBlock() end
--- Returns a list of the guarded connections. (incoming connections)
---@return RailroadTrackConnection[]
function RailroadSignal:getGuardedConnnections() end
--- Returns a list of the observed connections. (outgoing connections)
---@return RailroadTrackConnection[]
function RailroadSignal:getObservedConnections() end

--- The base class for all train station parts.
---@class TrainPlatform:Factory
---@field public status number @The current docking status of the platform.
---@field public isReversed boolean @True if the orientation of the platform is reversed relative to the track/station.
local TrainPlatform
--- Returns the track graph of which this platform is part of.
---@return TrackGraph
function TrainPlatform:getTrackGraph() end
--- Returns the track pos at which this train platform is placed.
---@return RailroadTrack,number,number
function TrainPlatform:getTrackPos() end
--- Returns the connected platform in the given direction.
---@param direction number @The direction in which you want to get the connected platform.
---@return TrainPlatform
function TrainPlatform:getConnectedPlatform(direction) end
--- Returns the currently docked vehicle.
---@return Vehicle
function TrainPlatform:getDockedVehicle() end
--- Returns the master platform of this train station.
---@return RailroadVehicle
function TrainPlatform:getMaster() end
--- Returns the currently docked locomotive at the train station.
---@return RailroadVehicle
function TrainPlatform:getDockedLocomotive() end

--- The train station master platform. This platform holds the name and manages docking of trains.
---@class RailroadStation:TrainPlatform
---@field public name string @The name of the railroad station.
---@field public dockedOffset number @The Offset to the beginning of the station at which trains dock.
local RailroadStation

--- The controler object for a railroad switch.
---@class RailroadSwitchControl:Factory
local RailroadSwitchControl
--- Toggles the railroad switch like if you interact with it.
function RailroadSwitchControl:toggleSwitch() end
--- Returns the current switch position of this switch.
---@return number
function RailroadSwitchControl:switchPosition() end
--- Returns the Railroad Connection this switch is controlling.
---@return RailroadTrackConnection
function RailroadSwitchControl:getControlledConnection() end

--- A peice of railroad track over which trains can drive.
---@class RailroadTrack:Buildable
---@field public length number @The length of the track.
---@field public isOwnedByPlatform boolean @True if the track is part of/owned by a railroad platform.
local RailroadTrack
--- Returns the closes track position from the given world position
---@param worldPos Vector @The world position form which you want to get the closest track position.
---@return RailroadTrack,number,number
function RailroadTrack:getClosestTrackPosition(worldPos) end
--- Returns the world location and world rotation of the track position from the given track position.
---@param track RailroadTrack @The track the track pos points to.
---@param offset number @The offset of the track pos.
---@param forward number @The forward direction of the track pos. 1 = with the track direction, -1 = against the track direction
---@return Vector,Vector
function RailroadTrack:getWorldLocAndRotAtPos(track, offset, forward) end
--- Returns the railroad track connection at the given direction.
---@param direction number @The direction of which you want to get the connector from. 0 = front, 1 = back
---@return RailroadTrackConnection
function RailroadTrack:getConnection(direction) end
--- Returns the track graph of which this track is part of.
---@return TrackGraph
function RailroadTrack:getTrackGraph() end
--- Returns a list of Railroad Vehicles on the Track
---@return RailroadVehicle[]
function RailroadTrack:getVehciles() end

--- 
---@class FGBuildableRamp:FGBuildableFoundation
local FGBuildableRamp

--- The resource sink, also known a A.W.E.S.O.M.E Sink
---@class ResourceSink:Factory
---@field public numPoints number @The number of available points.
---@field public numCoupons number @The number of available coupons to print.
---@field public numPointsToNextCoupon number @The number of needed points for the next coupon.
---@field public couponProgress number @The percentage of the progress for the next coupon.
local ResourceSink

--- 
---@class FGBuildableResourceSinkShop:Factory
local FGBuildableResourceSinkShop

--- 
---@class FGBuildableRoad:Buildable
local FGBuildableRoad

--- 
---@class FGBuildableSignSupport:FGBuildablePoleBase
local FGBuildableSignSupport

--- 
---@class FGBuildableSnowDispenser:Buildable
local FGBuildableSnowDispenser

--- 
---@class FGBuildableSpaceElevator:Factory
local FGBuildableSpaceElevator

--- 
---@class FGBuildableSpeedSign:Buildable
local FGBuildableSpeedSign

--- 
---@class FGBuildableSplitterSmart:FGBuildableConveyorAttachment
local FGBuildableSplitterSmart

--- 
---@class FGBuildableStair:FGBuildableFactoryBuilding
local FGBuildableStair

--- 
---@class FGBuildableStorage:Factory
local FGBuildableStorage

--- 
---@class FGBuildableTradingPost:Factory
local FGBuildableTradingPost

--- A train platform that allows for loading and unloading cargo cars.
---@class TrainPlatformCargo:TrainPlatform
---@field public isLoading boolean @True if the cargo platform is currently loading the docked cargo vehicle.
---@field public isUnloading boolean @True if the cargo platform is currently loading or unloading the docked cargo vehicle.
---@field public dockedOffset number @The offset to the track start of the platform at were the vehicle docked.
---@field public outputFlow number @The current output flow rate.
---@field public inputFlow number @The current input flow rate.
---@field public fullLoad boolean @True if the docked cargo vehicle is fully loaded.
---@field public fullUnload boolean @Ture if the docked cargo vehicle is fully unloaded.
local TrainPlatformCargo

--- 
---@class FGBuildableTrainPlatformEmpty:TrainPlatform
local FGBuildableTrainPlatformEmpty

--- 
---@class FGBuildableWalkway:FGBuildableFactoryBuilding
local FGBuildableWalkway

--- 
---@class FGBuildableWalkwayLightweight:FGBuildableWalkway
local FGBuildableWalkwayLightweight

--- 
---@class FGBuildableWallLightweight:FGBuildableWall
local FGBuildableWallLightweight

--- 
---@class FGBuildableWaterPump:FGBuildableResourceExtractor
local FGBuildableWaterPump

--- The type of sign that allows you to define layouts, images, texts and colors manually.
---@class WidgetSign:SignBase
local WidgetSign
--- Sets the prefabg sign data e.g. the user settings like colo and more to define the signs content.
---@param prefabSignData PrefabSignData @The new prefab sign data for this sign.
function WidgetSign:setPrefabSignData(prefabSignData) end
--- Returns the prefabg sign data e.g. the user settings like colo and more to define the signs content.
---@return PrefabSignData
function WidgetSign:getPrefabSignData() end

--- 
---@class FGBuildableWindTurbine:Factory
local FGBuildableWindTurbine

--- 
---@class FGBuildableWire:Buildable
local FGBuildableWire

--- 
---@class FGCentralStorageContainer:FGBuildableStorage
local FGCentralStorageContainer

--- 
---@class FGConveyorPoleStackable:FGBuildablePole
local FGConveyorPoleStackable

--- A struct that holds information about a recipe in its class. Means don't use it as object, use it as class type!
---@class Recipe:Object
---@field public name string @The name of this recipe.
---@field public duration number @The duration how much time it takes to cycle the recipe once.
local Recipe

--- A base class for all vehciles.
---@class Vehicle:Actor
---@field public health number @The health of the vehicle.
---@field public maxHealth number @The maximum amount of health this vehicle can have.
---@field public isSelfDriving boolean @True if the vehicle is currently self driving.
local Vehicle

--- A actor component that is a connection point to which a conveyor or pipe can get attached to.
---@class FactoryConnection:ActorComponent
---@field public type number @Returns the type of the connection. 0 = Conveyor, 1 = Pipe
---@field public direction number @The direction in which the items/fluids flow. 0 = Input, 1 = Output, 2 = Any, 3 = Used just as snap point
---@field public isConnected boolean @True if something is connected to this connection.
---@field public allowedItem ItemType-Class @This item type defines which items are the only ones this connector can transfer. Null allows all items to be transfered.
---@field public blocked boolean @True if this connector doesn't transfer any items except the 'Unblocked Transfers'.
---@field public unblockedTransfers number @The count of transfers that can still happen even if the connector is blocked. Use the 'AddUnblockedTransfers' function to change this. The count decreases by one when an item gets transfered.
local FactoryConnection
--- Adds the given count to the unblocked transfers counter. The resulting value gets clamped to >= 0. Negative values allow to decrease the counter manually. The returning int is the now set count.
---@param unblockedTransfers number @The count of unblocked transfers to add.
---@return number
function FactoryConnection:addUnblockedTransfers(unblockedTransfers) end
--- Returns the internal inventory of the connection component.
---@return Inventory
function FactoryConnection:getInventory() end
--- Returns the connected factory connection component.
---@return FactoryConnection
function FactoryConnection:getConnected() end

--- The base class for any vehicle that drives on train tracks.
---@class RailroadVehicle:Vehicle
---@field public length number @The length of this vehicle on the track.
---@field public isDocked boolean @True if this vehicle is currently docked to a platform.
---@field public isReversed boolean @True if the vheicle is placed reversed on the track.
local RailroadVehicle
--- Returns the train of which this vehicle is part of.
---@return Train
function RailroadVehicle:getTrain() end
--- Allows to check if the given coupler is coupled to another car.
---@param coupler number @The Coupler you want to check. 0 = Front, 1 = Back
---@return boolean
function RailroadVehicle:isCoupled(coupler) end
--- Allows to get the coupled vehicle at the given coupler.
---@param coupler number @The Coupler you want to get the car from. 0 = Front, 1 = Back
---@return RailroadVehicle
function RailroadVehicle:getCoupled(coupler) end
--- Returns the track graph of which this vehicle is part of.
---@return TrackGraph
function RailroadVehicle:getTrackGraph() end
--- Returns the track pos at which this vehicle is.
---@return RailroadTrack,number,number
function RailroadVehicle:getTrackPos() end
--- Returns the vehicle movement of this vehicle.
---@return RailroadVehicleMovement
function RailroadVehicle:getMovement() end

--- A actor component that can hold multiple item stacks.
--- WARNING! Be aware of container inventories, and never open their UI, otherwise these function will not work as expected.
---@class Inventory:ActorComponent
---@field public itemCount number @The absolute amount of items in the whole inventory.
---@field public size number @The count of available item stack slots this inventory has.
local Inventory
--- Returns the item stack at the given index.
--- Takes integers as input and returns the corresponding stacks.
function Inventory:getStack() end
--- Sorts the whole inventory. (like the middle mouse click into a inventory)
function Inventory:sort() end
--- Swaps two given stacks inside the inventory.
---@param index1 number @The index of the first stack in the inventory.
---@param index2 number @The index of the second stack in the inventory.
---@return boolean
function Inventory:swapStacks(index1, index2) end
--- Removes all discardable items from the inventory completely. They will be gone! No way to get them back!
function Inventory:flush() end

--- The category of some items.
---@class ItemCategory:Object
---@field public name string @The name of the category.
local ItemCategory

--- This actor component contains all the infomation about the movement of a railroad vehicle.
---@class RailroadVehicleMovement:ActorComponent
---@field public orientation number @The orientation of the vehicle
---@field public mass number @The current mass of the vehicle.
---@field public tareMass number @The tare mass of the vehicle.
---@field public payloadMass number @The mass of the payload of the vehicle.
---@field public speed number @The current forward speed of the vehicle.
---@field public relativeSpeed number @The current relative forward speed to the ground.
---@field public maxSpeed number @The maximum forward speed the vehicle can reach.
---@field public gravitationalForce number @The current gravitational force acting on the vehicle.
---@field public tractiveForce number @The current tractive force acting on the vehicle.
---@field public resistiveForce number @The resistive force currently acting on the vehicle.
---@field public gradientForce number @The gradient force currently acting on the vehicle.
---@field public brakingForce number @The braking force currently acting on the vehicle.
---@field public airBrakingForce number @The air braking force currently acting on the vehicle.
---@field public dynamicBrakingForce number @The dynamic braking force currently acting on the vehicle.
---@field public maxTractiveEffort number @The maximum tractive effort of this vehicle.
---@field public maxDynamicBrakingEffort number @The maximum dynamic braking effort of this vehicle.
---@field public maxAirBrakingEffort number @The maximum air braking effort of this vehcile.
---@field public trackGrade number @The current track grade of this vehicle.
---@field public trackCurvature number @The current track curvature of this vehicle.
---@field public wheelsetAngle number @The wheelset angle of this vehicle.
---@field public rollingResistance number @The current rolling resistance of this vehicle.
---@field public curvatureResistance number @The current curvature resistance of this vehicle.
---@field public airResistance number @The current air resistance of this vehicle.
---@field public gradientResistance number @The current gardient resistance of this vehicle.
---@field public wheelRotation number @The current wheel rotation of this vehicle.
---@field public numWheelsets number @The number of wheelsets this vehicle has.
---@field public isMoving boolean @True if this vehicle is currently moving.
local RailroadVehicleMovement
--- Returns the vehicle this movement component holds the movement information of.
---@return RailroadVehicle
function RailroadVehicleMovement:getVehicle() end
--- Returns the current rotation of the given wheelset.
---@param wheelset number @The index of the wheelset you want to get the rotation of.
---@return number,number,number
function RailroadVehicleMovement:getWheelsetRotation(wheelset) end
--- Returns the offset of the wheelset with the given index from the start of the vehicle.
---@param wheelset number @The index of the wheelset you want to get the offset of.
---@return number
function RailroadVehicleMovement:getWheelsetOffset(wheelset) end
--- Returns the normal vector and the extention of the coupler with the given index.
---@param coupler number @The index of which you want to get the normal and extention of.
---@return number,number,number,number
function RailroadVehicleMovement:getCouplerRotationAndExtention(coupler) end

--- A actor component base that is a connection point to which a pipe for fluid or hyper can get attached to.
---@class PipeConnectionBase:ActorComponent
---@field public isConnected boolean @True if something is connected to this connection.
local PipeConnectionBase
--- Returns the connected pipe connection component.
---@return PipeConnectionBase
function PipeConnectionBase:getConnection() end

--- A actor component that is a connection point to which a fluid pipe can get attached to.
---@class PipeConnection:PipeConnectionBase
---@field public fluidBoxContent number @Returns the amount of fluid this fluid container contains
---@field public fluidBoxHeight number @Returns the height of this fluid container
---@field public fluidBoxLaminarHeight number @Returns the laminar height of this fluid container
---@field public fluidBoxFlowThrough number @Returns the amount of fluid flowing through this fluid container
---@field public fluidBoxFlowFill number @Returns the fill rate of this fluid container
---@field public fluidBoxFlowDrain number @Returns the drain rate of this fluid container
---@field public fluidBoxFlowLimit number @Returns the the maximum flow limit of this fluid container
---@field public networkID number @Returns the network ID of the pipe network this connection is associated with
local PipeConnection
--- ?
---@return ItemType
function PipeConnection:getFluidDescriptor() end
--- Flush the associated pipe network
function PipeConnection:flushPipeNetwork() end

--- A actor that is a hypertube entrance buildable
---@class PipeHyperStart:FGBuildablePipeHyperPart
local PipeHyperStart

--- A Object that represents a whole power circuit.
---@class PowerCircuit:Object
---@field public production number @The amount of power produced by the whole circuit in the last tick.
---@field public consumption number @The power consumption of the whole circuit in thge last tick.
---@field public capacity number @The power capacity of the whole network in the last tick. (The max amount of power available in the last tick)
---@field public batteryInput number @The power that gone into batteries in the last tick.
---@field public maxPowerConsumption number @The maximum consumption of power in the last tick.
---@field public isFuesed boolean @True if the fuse in the network triggered.
---@field public hasBatteries boolean @True if the power circuit has batteries connected to it.
---@field public batteryCapacity number @The energy capacity all batteries of the network combined provide.
---@field public batteryStore number @The amount of energy currently stored in all battereies of the network combined.
---@field public batteryStorePercent number @The fill status in percent of all battereies of the network combined.
---@field public batteryTimeUntilFull number @The time in seconds until every battery in the network is filled.
---@field public batteryTimeUntilEmpty number @The time in seconds until every battery in the network is empty.
---@field public batteryIn number @The amount of energy that currently gets stored in every battery of the whole network.
---@field public batteryOut number @The amount of energy that currently discharges from every battery in the whole network.
local PowerCircuit

--- A actor component that allows for a connection point to the power network. Basically a point were a power cable can get attached to.
---@class PowerConnection:ActorComponent
---@field public connections number @The amount of connections this power connection has.
---@field public maxConnections number @The maximum amount of connections this power connection can handle.
local PowerConnection
--- Returns the power info component of this power connection.
---@return PowerInfo
function PowerConnection:getPower() end
--- Returns the power circuit to which this connection component is attached to.
---@return PowerCircuit
function PowerConnection:getCircuit() end

--- A actor component that provides information and mainly statistics about the power connection it is attached to.
---@class PowerInfo:ActorComponent
---@field public dynProduction number @The production cpacity this connection provided last tick.
---@field public baseProduction number @The base production capactiy this connection always provides.
---@field public maxDynProduction number @The maximum production capactiy this connection could have provided to the circuit in the last tick.
---@field public targetConsumption number @The amount of energy the connection wanted to consume from the circuit in the last tick.
---@field public consumption number @The amount of energy the connection actually consumed in the last tick.
---@field public hasPower boolean @True if the connection has satisfied power values and counts as beeing powered. (True if it has power)
local PowerInfo
--- Returns the power circuit this info component is part of.
---@return PowerCircuit
function PowerInfo:getCircuit() end

--- Contains the time table information of train.
---@class TimeTable:Actor
---@field public numStops number @The current number of stops in the time table.
local TimeTable
--- Adds a stop to the time table.
---@param index number @The index at which the stop should get added.
---@param station RailroadStation @The railroad station at which the stop should happen.
---@param ruleSet TrainDockingRuleSet @The docking rule set that descibes when the train will depart from the station.
---@return boolean
function TimeTable:addStop(index, station, ruleSet) end
--- Removes the stop with the given index from the time table.
---@param index number @The index at which the stop should get added.
function TimeTable:removeStop(index) end
--- Returns a list of all the stops this time table has
---@return TimeTableStop[]
function TimeTable:getStops() end
--- Allows to empty and fill the stops of this time table with the given list of new stops.
---@return boolean
function TimeTable:setStops() end
--- Allows to check if the given stop index is valid.
---@param index number @The stop index you want to check its validity.
---@return boolean
function TimeTable:isValidStop(index) end
--- Returns the stop at the given index.
---@param index number @The index of the stop you want to get.
---@return TimeTableStop
function TimeTable:getStop(index) end
--- Allows to override a stop already in the time table.
---@param index number @The index of the stop you want to override.
---@param stop TimeTableStop @The time table stop you want to override with.
---@return boolean
function TimeTable:setStop(index, stop) end
--- Sets the stop, to which the train trys to drive to right now.
---@param index number @The index of the stop the train should drive to right now.
function TimeTable:setCurrentStop(index) end
--- Sets the current stop to the next stop in the time table.
function TimeTable:incrementCurrentStop() end
--- Returns the index of the stop the train drives to right now.
---@return number
function TimeTable:getCurrentStop() end

--- This is a actor component for railroad tracks that allows to connecto to other track connections and so to connection multiple tracks with each eather so you can build a train network.
---@class RailroadTrackConnection:ActorComponent
---@field public connectorLocation Vector @The world location of the the connection.
---@field public connectorNormal Vector @The normal vecotr of the connector.
---@field public isConnected boolean @True if the connection has any connection to other connections.
---@field public isFacingSwitch boolean @True if this connection is pointing to the merge/spread point of the switch.
---@field public isTrailingSwitch boolean @True if this connection is pointing away from the merge/spread point of a switch.
---@field public numSwitchPositions number @Returns the number of different switch poisitions this switch can have.
local RailroadTrackConnection
--- Returns the connected connection with the given index.
---@param index number @The index of the connected connection you want to get.
---@return RailroadTrackConnection
function RailroadTrackConnection:getConnection(index) end
--- Returns a list of all connected connections.
---@return RailroadTrackConnection[]
function RailroadTrackConnection:getConnections() end
--- Returns the track pos at which this connection is.
---@return RailroadTrack,number,number
function RailroadTrackConnection:getTrackPos() end
--- Returns the track of which this connection is part of.
---@return RailroadTrack
function RailroadTrackConnection:getTrack() end
--- Returns the switch control of this connection.
---@return RailroadSwitchControl
function RailroadTrackConnection:getSwitchControl() end
--- Returns the station of which this connection is part of.
---@return RailroadStation
function RailroadTrackConnection:getStation() end
--- Returns the signal this connection is facing to.
---@return RailroadSignal
function RailroadTrackConnection:getFacingSignal() end
--- Returns the signal this connection is trailing from.
---@return RailroadSignal
function RailroadTrackConnection:getTrailingSignal() end
--- Returns the opposite connection of the track this connection is part of.
---@return RailroadTrackConnection
function RailroadTrackConnection:getOpposite() end
--- Returns the next connection in the direction of the track. (used the correct path switched point to)
---@return RailroadTrackConnection
function RailroadTrackConnection:getNext() end
--- Sets the position (connection index) to which the track switch points to.
---@param index number @The connection index to which the switch should point to.
function RailroadTrackConnection:setSwitchPosition(index) end
--- Returns the current switch position.
---@return number
function RailroadTrackConnection:getSwitchPosition() end
--- Forces the switch position to a given location. Even autopilot will be forced to use this track. A negative number can be used to remove the forced track.
---@param index number @The connection index to whcih the switch should be force to point to. Negative number to remove the lock.
function RailroadTrackConnection:forceSwitchPosition(index) end

--- Describes the type of a sign.
---@class SignType:Object
---@field public dimensions Vector2D @The canvas dimensions of this sign.
local SignType

--- Descibes a layout of a sign.
---@class SignPrefab:Object
local SignPrefab

--- The list of targets/path-waypoints a autonomous vehicle can drive
---@class TargetList:Actor
local TargetList
--- Returns the target struct at with the given index in the target list.
---@return TargetPoint
function TargetList:getTarget() end
--- Removes the target with the given index from the target list.
---@param index number @The index of the target point you want to remove from the target list.
function TargetList:removeTarget(index) end
--- Adds the given target point struct at the end of the target list.
---@param target TargetPoint @The target point you want to add.
function TargetList:addTarget(target) end
--- Allows to set the target at the given index to the given target point struct.
---@param index number @The index of the target point you want to update with the given target point struct.
---@param target TargetPoint @The new target point struct for the given index.
function TargetList:setTarget(index, target) end
--- Returns a list of target point structs of all the targets in the target point list.
---@return TargetPoint[]
function TargetList:getTargets() end
--- Removes all targets from the target point list and adds the given array of target point structs to the empty target point list.
---@param targets TargetPoint[] @A list of target point structs you want to place into the empty target point list.
function TargetList:setTargets(targets) end

--- This class holds information and references about a trains (a collection of multiple railroad vehicles) and its timetable f.e.
---@class Train:Actor
---@field public isPlayerDriven boolean @True if the train is currently player driven.
---@field public isSelfDriving boolean @True if the train is currently self driving.
---@field public selfDrivingError number @The last self driving error. 0 = No Error 1 = No Power 2 = No Time Table 3 = Invalid Next Stop 4 = Invalid Locomotive Placement 5 = No Path
---@field public hasTimeTable boolean @True if the train has currently a time table.
---@field public dockState number @The current docking state of the train.
---@field public isDocked boolean @True if the train is currently docked.
local Train
--- Returns the name of this train.
---@return string
function Train:getName() end
--- Allows to set the name of this train.
---@param name string @The new name of this trian.
function Train:setName(name) end
--- Returns the track graph of which this train is part of.
---@return TrackGraph
function Train:getTrackGraph() end
--- Allows to set if the train should be self driving or not.
---@param selfDriving boolean @True if the train should be self driving.
function Train:setSelfDriving(selfDriving) end
--- Returns the master locomotive that is part of this train.
---@return RailroadVehicle
function Train:getMaster() end
--- Returns the timetable of this train.
---@return TimeTable
function Train:getTimeTable() end
--- Creates and returns a new timetable for this train.
---@return TimeTable
function Train:newTimeTable() end
--- Returns the first railroad vehicle that is part of this train.
---@return RailroadVehicle
function Train:getFirst() end
--- Returns the last railroad vehicle that is part of this train.
---@return RailroadVehicle
function Train:getLast() end
--- Trys to dock the train to the station it is currently at.
function Train:dock() end
--- Returns a list of all the vehicles this train has.
---@return RailroadVehicle[]
function Train:getVehicles() end

--- The base class for all vehicles that used wheels for movement.
---@class WheeledVehicle:Vehicle
---@field public speed number @The current forward speed of this vehicle.
---@field public burnRatio number @The amount of fuel this vehicle burns.
---@field public hasFuel boolean @True if the vehicle has currently fuel to drive.
local WheeledVehicle
--- Returns the inventory that contains the fuel of the vehicle.
---@return Inventory
function WheeledVehicle:getFuelInv() end
--- Returns the inventory that contains the storage of the vehicle.
---@return Inventory
function WheeledVehicle:getStorageInv() end
--- Allows to check if the given item type is a valid fuel for this vehicle.
---@param item ItemType-Class @The item type you want to check.
---@return boolean
function WheeledVehicle:isValidFuel(item) end
--- Returns the index of the target that the vehicle tries to move to right now.
---@return number
function WheeledVehicle:getCurrentTarget() end
--- Sets the current target to the next target in the list.
function WheeledVehicle:nextTarget() end
--- Sets the target with the given index as the target this vehicle tries to move to right now.
---@param index number @The index of the target this vehicle should move to now.
function WheeledVehicle:setCurrentTarget(index) end
--- Returns the list of targets/path waypoints.
---@return TargetList
function WheeledVehicle:getTargetList() end

--- 
---@class FINAdvancedNetworkConnectionComponent:ActorComponent
local FINAdvancedNetworkConnectionComponent

--- The base class for all things of the reflection system.
---@class ReflectionBase:Object
---@field public name string @The internal name.
---@field public displayName string @The display name used in UI which might be localized.
---@field public description string @The description of this base.
local ReflectionBase

--- A Reflection object that holds information about properties and parameters.
---@class Property:ReflectionBase
---@field public dataType number @The data type of this property. 0: nil, 1: bool, 2: int, 3: float, 4: str, 5: object, 6: class, 7: trace, 8: struct, 9: array, 10: anything
---@field public flags number @The property bit flag register defining some behaviour of it.  Bits and their meaing (least significant bit first): Is this property a member attribute. Is this property read only. Is this property a parameter. Is this property a output paramter. Is this property a return value. Can this property get accessed in syncrounus runtime. Can this property can get accessed in parallel runtime. Can this property get accessed in asynchronus runtime. This property is a class attribute.
local Property

--- A reflection object representing a array property.
---@class ArrayProperty:Property
local ArrayProperty
--- Returns the inner type of this array.
---@return Property
function ArrayProperty:getInner() end

--- Reflection Object that holds information about structures.
---@class Struct:ReflectionBase
---@field public isConstructable boolean @True if this struct can be constructed by the user directly.
local Struct
--- Returns the parent type of this type.
---@return Class
function Struct:getParent() end
--- Returns all the properties of this type.
---@return Property[]
function Struct:getProperties() end
--- Returns all the properties of this and parent types.
---@return Property[]
function Struct:getAllProperties() end
--- Returns all the functions of this type.
---@return Function[]
function Struct:getFunctions() end
--- Returns all the functions of this and parent types.
---@return Property[]
function Struct:getAllFunctions() end
--- Allows to check if this struct is a child struct of the given struct or the given struct it self.
---@param parent Struct @The parent struct you want to check if this struct is a child of.
---@return boolean
function Struct:isChildOf(parent) end

--- Object that contains all information about a type.
---@class Class:Struct
local Class
--- Returns all the signals of this type.
---@return Signal[]
function Class:getSignals() end
--- Returns all the signals of this and its parent types.
---@return Signal[]
function Class:getAllSignals() end

--- A reflection object representing a class property.
---@class ClassProperty:Property
local ClassProperty
--- Returns the subclass type of this class. Meaning, the stored classes need to be of this type.
---@return Class
function ClassProperty:getSubclass() end

--- 
---@class CodeableMerger:FGBuildableConveyorAttachment
---@field public canOutput boolean @Is true if the output queue has a slot available for an item from one of the input queues.
local CodeableMerger
--- Allows to transfer an item from the given input queue to the output queue if possible.
---@param input number @The index of the input queue you want to transfer the next item to the output queue. (0 = right, 1 = middle, 2 = left)
---@return boolean
function CodeableMerger:transferItem(input) end
--- Returns the next item in the given input queue.
---@param input number @The index of the input queue you want to check (0 = right, 1 = middle, 2 = left)
---@return Item
function CodeableMerger:getInput(input) end

--- 
---@class CodeableSplitter:FGBuildableConveyorAttachment
local CodeableSplitter
--- Allows to transfer an item from the input queue to the given output queue if possible.
---@param output number @The index of the output queue you want to transfer the next item to (0 = left, 1 = middle, 2 = right)
---@return boolean
function CodeableSplitter:transferItem(output) end
--- Returns the next item in the input queue.
---@return Item
function CodeableSplitter:getInput() end
--- Allows to check if we can transfer an item to the given output queue.
---@param output number @The index of the output queue you want to check (0 = left, 1 = middle, 2 = right)
---@return boolean
function CodeableSplitter:canOutput(output) end

--- 
---@class ComputerCase:Buildable
local ComputerCase
--- Stops the Computer (Processor).
function ComputerCase:stopComputer() end
--- Starts the Computer (Processor).
function ComputerCase:startComputer() end
--- Returns the internal kernel state of the computer.
---@return number
function ComputerCase:getState() end
--- Returns the log of the computer. Output is paginated using the input parameters. A negative Page will indicate pagination from the bottom (latest log entry first).
---@param pageSize number @The size of the returned page.
---@param page number @The index of the page you want to return. Negative to start indexing at the bottom (latest entries first).
---@return LogEntry[],number
function ComputerCase:getLog(pageSize, page) end

--- 
---@class FINComputerModule:Buildable
local FINComputerModule

--- 
---@class FINComputerDriveHolder:FINComputerModule
local FINComputerDriveHolder

--- 
---@class FINComputerGPU:FINComputerModule
local FINComputerGPU
--- 
---@return Vector2D
function FINComputerGPU:getScreenSize() end
--- Binds this GPU to the given screen. Unbinds the already bound screen.
---@param newScreen Object @The screen you want to bind this GPU to. Null if you want to unbind the screen.
function FINComputerGPU:bindScreen(newScreen) end

--- 
---@class GPUT1:FINComputerGPU
local GPUT1
--- Draws the given text at the given position to the hidden screen buffer.
---@param x number @The x coordinate at which the text should get drawn.
---@param y number @The y coordinate at which the text should get drawn.
---@param str string @The text you want to draw on-to the buffer.
function GPUT1:setText(x, y, str) end
--- Changes the size of the text-grid (and buffer).
---@param w number @The width of the text-gird.
---@param h number @The height of the text-grid.
function GPUT1:setSize(w, h) end
--- Changes the foreground color that is used for the next draw calls.
---@param r number @The red portion of the foreground color. (0.0 - 1.0)
---@param g number @The green portion of the foreground color. (0.0 - 1.0)
---@param b number @The blue portion of the foreground color. (0.0 - 1.0)
---@param a number @The opacity of the foreground color. (0.0 - 1.0)
function GPUT1:setForeground(r, g, b, a) end
--- Allows to change the back buffer of the GPU to the given buffer.
---@param buffer GPUT1Buffer @The Buffer you want to now use as back buffer.
function GPUT1:setBuffer(buffer) end
--- Changes the background color that is used for the next draw calls.
---@param r number @The red portion of the background color. (0.0 - 1.0)
---@param g number @The green portion of the background color. (0.0 - 1.0)
---@param b number @The blue portion of the background color. (0.0 - 1.0)
---@param a number @The opacity of the background color. (0.0 - 1.0)
function GPUT1:setBackground(r, g, b, a) end
--- Returns the size of the text-grid (and buffer).
---@return number,number
function GPUT1:getSize() end
--- Returns the currently bound screen.
---@return Object
function GPUT1:getScreen() end
--- Returns the back buffer as struct to be able to use advanced buffer handling functions. (struct is a copy)
---@return GPUT1Buffer
function GPUT1:getBuffer() end
--- Flushes the hidden screen buffer to the visible screen buffer and so makes the draw calls visible.
function GPUT1:flush() end
--- Draws the given character at all given positions in the given rectangle on-to the hidden screen buffer.
---@param x number @The x coordinate at which the rectangle should get drawn. (upper-left corner)
---@param y number @The y coordinate at which the rectangle should get drawn. (upper-left corner)
---@param dx number @The width of the rectangle.
---@param dy number @The height of the rectangle.
---@param str string @The character you want to use for the rectangle. (first char in the given string)
function GPUT1:fill(x, y, dx, dy, str) end

--- 
---@class FINComputerGPUT2:FINComputerGPU
local FINComputerGPUT2
--- Pushes a transformation to the geometry stack. All subsequent drawcalls will be transformed through all previously pushed geometries and this one. Be aware, only all draw calls till, this geometry gets pop'ed are transformed, previous draw calls (and draw calls after the pop) are unaffected by this.
---@param translation Vector2D @The local translation that is supposed to happen to all further drawcalls. Translation can be also thought as 'repositioning'.
---@param rotation number @The local rotation that gets applied to all subsequent draw calls. The origin of the rotation is the whole screens center point. The value is in degrees.
---@param scale Vector2D @The scale that gets applied to the whole screen localy along the (rotated) axis. No change in scale is (1,1).
function FINComputerGPUT2:pushTransform(translation, rotation, scale) end
--- Pushes a layout to the geometry stack. All subsequent drawcalls will be transformed through all previously pushed geometries and this one. Be aware, only all draw calls, till this geometry gets pop'ed are transformed, previous draw calls (and draw calls after the pop) are unaffected by this.
---@param offset Vector2D @The local translation (or offset) that is supposed to happen to all further drawcalls. Translation can be also thought as 'repositioning'.
---@param size Vector2D @The scale that gets applied to the whole screen localy along both axis. No change in scale is 1.
---@param scale number @
function FINComputerGPUT2:pushLayout(offset, size, scale) end
--- Pushes a rectangle to the clipping stack. All subsequent drawcalls will be clipped to only be visible within this clipping zone and all previously pushed clipping zones. Be aware, only all draw calls, till this clipping zone gets pop'ed are getting clipped by it, previous draw calls (and draw calls after the pop) are unaffected by this.
---@param position Vector2D @The local position of the upper left corner of the clipping rectangle.
---@param size Vector2D @The size of the clipping rectangle.
function FINComputerGPUT2:pushClipRect(position, size) end
--- Pushes a 4 pointed polygon to the clipping stack. All subsequent drawcalls will be clipped to only be visible within this clipping zone and all previously pushed clipping zones. Be aware, only all draw calls, till this clipping zone gets pop'ed are getting clipped by it, previous draw calls (and draw calls after the pop) are unaffected by this.
---@param topLeft Vector2D @The local position of the top left point.
---@param topRight Vector2D @The local position of the top right point.
---@param bottomLeft Vector2D @The local position of the top right point.
---@param bottomRight Vector2D @The local position of the bottom right point.
function FINComputerGPUT2:pushClipPolygon(topLeft, topRight, bottomLeft, bottomRight) end
--- Pops the top most geometry from the geometry stack. The latest geometry on the stack gets removed first. (Last In, First Out)
function FINComputerGPUT2:popGeometry() end
--- Pops the top most clipping zone from the clipping stack. The latest clipping zone on the stack gets removed first. (Last In, First Out)
function FINComputerGPUT2:popClip() end
--- 
---@param Text string @
---@param Size number @
---@param bMonospace boolean @
---@return Vector2D
function FINComputerGPUT2:measureText(Text, Size, bMonospace) end
--- Flushes all draw calls to the visible draw call buffer to show all changes at once. The draw buffer gets cleared afterwards.
function FINComputerGPUT2:flush() end
--- Draws some Text at the given position (top left corner of the text), text, size, color and rotation.
---@param position Vector2D @The position of the top left corner of the text.
---@param text string @The text to draw.
---@param size number @The font size used.
---@param color Color @The color of the text.
---@param monospace boolean @True if a monospace font should be used.
function FINComputerGPUT2:drawText(position, text, size, color, monospace) end
--- Draws a Spline from one position to another with given directions, thickness and color.
---@param start Vector2D @The local position of the start point of the spline.
---@param startDirections Vector2D @The direction of the spline of how it exists the start point.
---@param end Vector2D @The local position of the end point of the spline.
---@param endDirection Vector2D @The direction of how the spline enters the end position.
---@param thickness number @The thickness of the line drawn.
---@param color Color @The color of the line drawn.
function FINComputerGPUT2:drawSpline(start, startDirections, end, endDirection, thickness, color) end
--- Draws a Rectangle with the upper left corner at the given local position, size, color and rotation around the upper left corner.
---@param position Vector2D @The local position of the upper left corner of the rectangle.
---@param size Vector2D @The size of the rectangle.
---@param color Color @The color of the rectangle.
---@param image string @If not empty string, should be image reference that should be placed inside the rectangle.
---@param rotation number @The rotation of the rectangle around the upper left corner in degrees.
function FINComputerGPUT2:drawRect(position, size, color, image, rotation) end
--- Draws connected lines through all given points with the given thickness and color.
---@param points Vector2D[] @The local points that get connected by lines one after the other.
---@param thickness number @The thickness of the lines.
---@param color Color @The color of the lines.
function FINComputerGPUT2:drawLines(points, thickness, color) end
--- Draws a box.
---@param boxSettings GPUT2DrawCallBox @The settings of the box you want to draw.
function FINComputerGPUT2:drawBox(boxSettings) end
--- Draws a Cubic Bezier Spline from one position to another with given control points, thickness and color.
---@param p0 Vector2D @The local position of the start point of the spline.
---@param p1 Vector2D @The local position of the first control point.
---@param p2 Vector2D @The local position of the second control point.
---@param p3 Vector2D @The local position of the end point of the spline.
---@param thickness number @The thickness of the line drawn.
---@param color Color @The color of the line drawn.
function FINComputerGPUT2:drawBezier(p0, p1, p2, p3, thickness, color) end

--- 
---@class FINComputerMemory:FINComputerModule
local FINComputerMemory

--- 
---@class NetworkCard:FINComputerModule
local NetworkCard
--- Sends a network message to the receiver with the given address on the given port. The data you want to add can be passed as additional parameters. Max amount of such parameters is 7 and they can only be nil, booleans, numbers and strings.
---@param receiver string @The component ID as string of the component you want to send the network message to.
---@param port number @The port on which the network message should get sent. For outgoing network messages a port does not need to be opened.
function NetworkCard:send(receiver, port) end
--- Opens the given port so the network card is able to receive network messages on the given port.
---@param port number @The port you want to open.
function NetworkCard:open(port) end
--- Closes all ports of the network card so no further messages are able to get received
function NetworkCard:closeAll() end
--- Closes the given port so the network card wont receive network messages on the given port.
---@param port number @The port you want to close.
function NetworkCard:close(port) end
--- Sends a network message to all components in the network message network (including networks sepperated by network routers) on the given port. The data you want to add can be passed as additional parameters. Max amount of such parameters is 7 and they can only be nil, booleans, numbers and strings.
---@param port number @The port on which the network message should get sent. For outgoing network messages a port does not need to be opened.
function NetworkCard:broadcast(port) end

--- 
---@class FINComputerProcessor:FINComputerModule
local FINComputerProcessor

--- 
---@class FINComputerScreen:FINComputerModule
local FINComputerScreen

--- A reflection object representing a function.
---@class Function:ReflectionBase
---@field public flags number @The function bit flag register defining some behaviour of it.  Bits and their meaing (least significant bit first): Is this function has a variable amount of input parameters. Can this function get called in syncrounus runtime. Can this function can get called in parallel runtime. Can this function get called in asynchronus runtime. Is this function a member function. The function is a class function. The function is a static function. The function has a variable amount of return values.
local Function
--- Returns all the parameters of this function.
---@return Property[]
function Function:getParameters() end

--- 
---@class IndicatorPole:Buildable
local IndicatorPole
--- Allows to change the color and light intensity of the indicator lamp.
---@param r number @The red part of the color in which the light glows. (0.0 - 1.0)
---@param g number @The green part of the color in which the light glows. (0.0 - 1.0)
---@param b number @The blue part of the color in which the light glows. (0.0 - 1.0)
---@param e number @The light intensity of the pole. (0.0 - 5.0)
function IndicatorPole:setColor(r, g, b, e) end
--- Allows to get the pole placed on top of this pole.
---@return IndicatorPole
function IndicatorPole:getTopPole() end
--- Allows to get the color and light intensity of the indicator lamp.
---@return number,number,number,number
function IndicatorPole:getColor() end
--- 
---@return IndicatorPole
function IndicatorPole:getBottomPole() end

--- 
---@class FINInternetCard:FINComputerModule
local FINInternetCard
--- Does an HTTP-Request. If a payload is given, the Content-Type header has to be set. All additional parameters have to be strings and in pairs of two for defining the http headers and values.
---@param url string @The URL for which you want to make an HTTP Request.
---@param method string @The http request method/verb you want to make the request. f.e. 'GET', 'POST'
---@param data string @The http request payload you want to sent.
---@return Future
function FINInternetCard:request(url, method, data) end

--- 
---@class FINMCPAdvConnector:FINAdvancedNetworkConnectionComponent
local FINMCPAdvConnector

--- 
---@class FINMediaSubsystem:Actor
local FINMediaSubsystem
--- 
---@param TextureReference string @
function FINMediaSubsystem:loadTexture(TextureReference) end
--- 
---@param TextureReference string @
---@return boolean
function FINMediaSubsystem:isTextureLoading(TextureReference) end
--- 
---@param TextureReference string @
---@return boolean
function FINMediaSubsystem:isTextureLoaded(TextureReference) end
--- 
---@param PageSize number @
---@param Page number @
---@return IconData[]
function FINMediaSubsystem:getGameIcons(PageSize, Page) end
--- Tries to find an game icon like the ones you use for signs.
---@param IconName string @
---@return IconData
function FINMediaSubsystem:findGameIcon(IconName) end

--- 
---@class ModularIndicatorPole:Buildable
local ModularIndicatorPole
--- Returns the next pole module if any.
---@return Actor
function ModularIndicatorPole:getNext() end
--- Gets the module at the given position in the stack
---@param module number @The module at the given offset in the stack or nil if none
---@return Actor
function ModularIndicatorPole:getModule(module) end

--- 
---@class FINModularIndicatorPoleModule:Buildable
local FINModularIndicatorPoleModule
--- Gets the previous module or the base mount if this called from the last module.
---@return Buildable
function FINModularIndicatorPoleModule:getPrevious() end
--- Returns the next pole module if any.
---@return FINModularIndicatorPoleModule
function FINModularIndicatorPoleModule:getNext() end

--- 
---@class FINModuleBase:Buildable
local FINModuleBase

--- 
---@class FINModuleScreen:FINModuleBase
local FINModuleScreen

--- 
---@class FINNetworkAdapter:Buildable
local FINNetworkAdapter

--- 
---@class FINNetworkCable:Buildable
local FINNetworkCable

--- 
---@class NetworkRouter:Buildable
---@field public isWhitelist boolean @
---@field public isAddrWhitelist boolean @True if the address filter list is used as whitelist.
local NetworkRouter
--- Overrides the port filter list with the given array.
---@return number[]
function NetworkRouter:setPortList() end
--- Overrides the address filter list with the given array.
---@return string[]
function NetworkRouter:setAddrList() end
--- Removes the given port from the port filter list.
---@param port number @The port you want to remove from the list.
function NetworkRouter:removePortList(port) end
--- Removes the given address from the address filter list.
---@param addr string @The address you want to remove from the list.
function NetworkRouter:removeAddrList(addr) end
--- Allows to get all the ports of the port filter list as array.
---@return number[]
function NetworkRouter:getPortList() end
--- Allows to get all the addresses of the address filter list as array.
---@return string[]
function NetworkRouter:getAddrList() end
--- Adds a given port to the port filter list.
---@param port number @The port you want to add to the list.
function NetworkRouter:addPortList(port) end
--- 
---@param addr string @
function NetworkRouter:addAddrList(addr) end

--- A reflection object representing a object property.
---@class ObjectProperty:Property
local ObjectProperty
--- Returns the subclass type of this object. Meaning, the stored objects need to be of this type.
---@return Class
function ObjectProperty:getSubclass() end

--- 
---@class Screen:Buildable
local Screen
--- Returns the size of the screen in 'panels'.
---@return number,number
function Screen:getSize() end

--- A reflection object representing a signal.
---@class Signal:ReflectionBase
---@field public isVarArgs boolean @True if this signal has a variable amount of arguments.
local Signal
--- Returns all the parameters of this signal.
---@return Property[]
function Signal:getParameters() end

--- 
---@class FINSizeablePanel:Buildable
local FINSizeablePanel

--- This speaker pole allows to play custom sound files, In-Game
---@class SpeakerPole:Buildable
local SpeakerPole
--- Stops the currently playing sound file.
function SpeakerPole:stopSound() end
--- Plays a custom sound file ingame
---@param sound string @The sound file (without the file ending) you want to play
---@param startPoint number @The start point in seconds at which the system should start playing
function SpeakerPole:playSound(sound, startPoint) end

--- A reflection object representing a struct property.
---@class StructProperty:Property
local StructProperty
--- Returns the subclass type of this struct. Meaning, the stored structs need to be of this type.
---@return Struct
function StructProperty:getSubclass() end

--- A reflection object representing a trace property.
---@class TraceProperty:Property
local TraceProperty
--- Returns the subclass type of this trace. Meaning, the stored traces need to be of this type.
---@return Class
function TraceProperty:getSubclass() end

--- 
---@class VehicleScanner:Buildable
local VehicleScanner
--- Allows to change the color and light intensity of the scanner.
---@param r number @The red part of the color in which the scanner glows. (0.0 - 1.0)
---@param g number @The green part of the color in which the scanner glows. (0.0 - 1.0)
---@param b number @The blue part of the color in which the scanner glows. (0.0 - 1.0)
---@param e number @The light intensity of the scanner. (0.0 - 5.0)
function VehicleScanner:setColor(r, g, b, e) end
--- Returns the last vehicle that entered the scanner.
---@return Vehicle
function VehicleScanner:getLastVehicle() end
--- Allows to get the color and light intensity of the scanner.
---@return number,number,number,number
function VehicleScanner:getColor() end

--- 
---@class FINWirelessAccessPoint:Buildable
local FINWirelessAccessPoint

--- 
---@class FINComputerProcessorLua:FINComputerProcessor
local FINComputerProcessorLua

--- See Display Name
---@class Build_Blueprint_C:Buildable
local Build_Blueprint_C

--- 
---@class Build_DoorMiddle_C:FGBuildableWall
local Build_DoorMiddle_C

--- Drone Ports can have one other Port assigned as their transport destination.
--- Each Drone Port can contain a single Drone, which transports available input back and forth between its home and destination Ports.
--- 
--- The Drone Port interface provides delivery details and allows management of Port connections.
---@class Build_DroneStation_C:FGBuildableDroneStation
local Build_DroneStation_C

--- Blueprint Storage that parts are returned to when the Blueprint Designer is cleared.
--- 
--- 40 slots.
---@class Build_StorageBlueprint_C:FGBuildableStorage
local Build_StorageBlueprint_C

--- The Blueprint Designer is used to create custom factory designs and save them as Blueprints.
--- Blueprints can be accessed from the Build Menu - Blueprint tab.
--- 
--- Note that buildings can only be placed within the Blueprint Designer if they are fully within the boundary frame.
--- 
--- Designer Dimensions: 32m x 32m x 32m
---@class Build_BlueprintDesigner_C:FGBuildableBlueprintDesigner
local Build_BlueprintDesigner_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 4m
---@class Build_SteelWall_8x4_C:FGBuildableWallLightweight
local Build_SteelWall_8x4_C

--- 
---@class BUILD_SingleDoor_Base_01_C:Door
local BUILD_SingleDoor_Base_01_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 8m
---@class Build_Wall_Orange_Tris_8x8_C:FGBuildableWallLightweight
local Build_Wall_Orange_Tris_8x8_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Orange_Tris_8x4_C:FGBuildableWallLightweight
local Build_Wall_Orange_Tris_8x4_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 2m
---@class Build_Wall_Orange_Tris_8x2_C:FGBuildableWallLightweight
local Build_Wall_Orange_Tris_8x2_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 1m
---@class Build_Wall_Orange_Tris_8x1_C:FGBuildableWallLightweight
local Build_Wall_Orange_Tris_8x1_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 8m
---@class Build_Wall_Orange_FlipTris_8x8_C:FGBuildableWallLightweight
local Build_Wall_Orange_FlipTris_8x8_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Orange_FlipTris_8x4_C:FGBuildableWallLightweight
local Build_Wall_Orange_FlipTris_8x4_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 2m
---@class Build_Wall_Orange_FlipTris_8x2_C:FGBuildableWallLightweight
local Build_Wall_Orange_FlipTris_8x2_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 1m
---@class Build_Wall_Orange_FlipTris_8x1_C:FGBuildableWallLightweight
local Build_Wall_Orange_FlipTris_8x1_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 8m
---@class Build_Wall_Orange_8x8_Corner_01_C:FGBuildableCornerWall
local Build_Wall_Orange_8x8_Corner_01_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Orange_8x4_Corner_01_C:FGBuildableCornerWall
local Build_Wall_Orange_8x4_Corner_01_C

--- Snaps to Foundations and other Walls.
--- The windows allow Pioneers to see through the wall.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Window_8x4_03_C:FGBuildableWallLightweight
local Build_Wall_Window_8x4_03_C

--- Allows Pioneers to pass through the wall.
--- Door settings can be configured.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Door_8x4_03_C:BUILD_SingleDoor_Base_01_C
local Build_Wall_Door_8x4_03_C

--- Allows Pioneers to pass through the wall.
--- Door settings can be configured.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Door_8x4_01_C:BUILD_SingleDoor_Base_01_C
local Build_Wall_Door_8x4_01_C

--- Has 1 Conveyor Belt connection.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Conveyor_8x4_03_C:FGBuildableWall
local Build_Wall_Conveyor_8x4_03_C

--- Has 2 Conveyor Belt connections.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Conveyor_8x4_02_C:FGBuildableWall
local Build_Wall_Conveyor_8x4_02_C

--- Has 3 Conveyor Belt connections.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Conveyor_8x4_01_C:FGBuildableWall
local Build_Wall_Conveyor_8x4_01_C

--- Allows Pioneers to pass through walls.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Gate_8x4_01_C:FGBuildableWallLightweight
local Build_Wall_Gate_8x4_01_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Orange_8x4_Corner_02_C:FGBuildableCornerWall
local Build_Wall_Orange_8x4_Corner_02_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 8m
---@class Build_Wall_Orange_8x8_Corner_02_C:FGBuildableCornerWall
local Build_Wall_Orange_8x8_Corner_02_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Orange_Angular_8x4_C:FGBuildableWallLightweight
local Build_Wall_Orange_Angular_8x4_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 8m
---@class Build_Wall_Orange_Angular_8x8_C:FGBuildableWallLightweight
local Build_Wall_Orange_Angular_8x8_C

--- Snaps to Foundations and other Walls.
--- The windows allow Pioneers to see through the wall.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Window_8x4_02_C:FGBuildableWallLightweight
local Build_Wall_Window_8x4_02_C

--- Snaps to Foundations and other Walls.
--- The windows allow Pioneers to see through the wall.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Window_8x4_01_C:FGBuildableWallLightweight
local Build_Wall_Window_8x4_01_C

--- Has 1 Conveyor Belt connection.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Conveyor_8x4_03_Steel_C:FGBuildableWall
local Build_Wall_Conveyor_8x4_03_Steel_C

--- Has 3 Conveyor Belt connections.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Conveyor_8x4_01_Steel_C:FGBuildableWall
local Build_Wall_Conveyor_8x4_01_Steel_C

--- Has 2 Conveyor Belt connections.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Conveyor_8x4_02_Steel_C:FGBuildableWall
local Build_Wall_Conveyor_8x4_02_Steel_C

--- Has 3 Conveyor Belt connections.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Concrete_8x4_ConveyorHole_03_C:FGBuildableWall
local Build_Wall_Concrete_8x4_ConveyorHole_03_C

--- Has 2 Conveyor Belt connections.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Concrete_8x4_ConveyorHole_02_C:FGBuildableWall
local Build_Wall_Concrete_8x4_ConveyorHole_02_C

--- Has 1 Conveyor Belt connection.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Concrete_8x4_ConveyorHole_01_C:FGBuildableWallLightweight
local Build_Wall_Concrete_8x4_ConveyorHole_01_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Concrete_8x4_C:FGBuildableWallLightweight
local Build_Wall_Concrete_8x4_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 1m
---@class Build_Wall_Concrete_8x1_C:FGBuildableWallLightweight
local Build_Wall_Concrete_8x1_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 1m
---@class Build_Wall_Orange_8x1_C:FGBuildableWallLightweight
local Build_Wall_Orange_8x1_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
---@class Build_SteelWall_8x4_DoorC_01_C:BUILD_SingleDoor_Base_01_C
local Build_SteelWall_8x4_DoorC_01_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
---@class Build_SteelWall_8x4_DoorS_01_C:BUILD_SingleDoor_Base_01_C
local Build_SteelWall_8x4_DoorS_01_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 8m
---@class Build_WallSet_Steel_Angular_8x8_C:FGBuildableWallLightweight
local Build_WallSet_Steel_Angular_8x8_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 4m
---@class Build_WallSet_Steel_Angular_8x4_C:FGBuildableWallLightweight
local Build_WallSet_Steel_Angular_8x4_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 8m
---@class Build_Wall_Steel_8x8_Corner_2_C:FGBuildableCornerWall
local Build_Wall_Steel_8x8_Corner_2_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Steel_8x4_Corner_2_C:FGBuildableCornerWall
local Build_Wall_Steel_8x4_Corner_2_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 8m
---@class Build_SteelWall_Tris_8x8_C:FGBuildableWallLightweight
local Build_SteelWall_Tris_8x8_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 4m
---@class Build_SteelWall_Tris_8x4_C:FGBuildableWallLightweight
local Build_SteelWall_Tris_8x4_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 2m
---@class Build_SteelWall_Tris_8x2_C:FGBuildableWallLightweight
local Build_SteelWall_Tris_8x2_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 1m
---@class Build_SteelWall_Tris_8x1_C:FGBuildableWallLightweight
local Build_SteelWall_Tris_8x1_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 8m
---@class Build_SteelWall_FlipTris_8x8_C:FGBuildableWall
local Build_SteelWall_FlipTris_8x8_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 4m
---@class Build_SteelWall_FlipTris_8x4_C:FGBuildableWallLightweight
local Build_SteelWall_FlipTris_8x4_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 2m
---@class Build_SteelWall_FlipTris_8x2_C:FGBuildableWallLightweight
local Build_SteelWall_FlipTris_8x2_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 1m
---@class Build_SteelWall_FlipTris_8x1_C:FGBuildableWallLightweight
local Build_SteelWall_FlipTris_8x1_C

--- Snaps to Foundations and other Walls.
--- The windows allow Pioneers to see through the wall.
--- 
--- Size: 8m x 4m
---@class Build_SteelWall_8x4_Window_04_C:FGBuildableWallLightweight
local Build_SteelWall_8x4_Window_04_C

--- Snaps to Foundations and other Walls.
--- The windows allow Pioneers to see through the wall.
--- 
--- Size: 8m x 4m
---@class Build_SteelWall_8x4_Window_03_C:FGBuildableWallLightweight
local Build_SteelWall_8x4_Window_03_C

--- Snaps to Foundations and other Walls.
--- The windows allow Pioneers to see through the wall.
--- 
--- Size: 8m x 4m
---@class Build_SteelWall_8x4_Window_02_C:FGBuildableWallLightweight
local Build_SteelWall_8x4_Window_02_C

--- Snaps to Foundations and other Walls.
--- The windows allow Pioneers to see through the wall.
--- 
--- Size: 8m x 4m
---@class Build_SteelWall_8x4_Window_01_C:FGBuildableWallLightweight
local Build_SteelWall_8x4_Window_01_C

--- The gate allows Pioneers to pass through the wall.
--- Snaps to foundations and other walls.
--- 
--- Size: 8m x 4m
---@class Build_SteelWall_8x4_Gate_01_C:FGBuildableWallLightweight
local Build_SteelWall_8x4_Gate_01_C

--- Allows Pioneers to pass through the wall.
--- Door settings can be configured.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Door_8x4_03_Steel_C:Build_SteelWall_8x4_DoorS_01_C
local Build_Wall_Door_8x4_03_Steel_C

--- Allows Pioneers to pass through the wall.
--- Door settings can be configured.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Door_8x4_01_Steel_C:Build_SteelWall_8x4_DoorC_01_C
local Build_Wall_Door_8x4_01_Steel_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 1m
---@class Build_SteelWall_8x1_C:FGBuildableWallLightweight
local Build_SteelWall_8x1_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 4m
---@class Build_Wall_8x4_02_C:FGBuildableWallLightweight
local Build_Wall_8x4_02_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 8m
---@class Build_Wall_Concrete_Tris_8x8_C:FGBuildableWallLightweight
local Build_Wall_Concrete_Tris_8x8_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Concrete_Tris_8x4_C:FGBuildableWallLightweight
local Build_Wall_Concrete_Tris_8x4_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 2m
---@class Build_Wall_Concrete_Tris_8x2_C:FGBuildableWallLightweight
local Build_Wall_Concrete_Tris_8x2_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 1m
---@class Build_Wall_Concrete_Tris_8x1_C:FGBuildableWallLightweight
local Build_Wall_Concrete_Tris_8x1_C

--- The gate allows Pioneers to pass through walls.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Concrete_Gate_8x4_C:FGBuildableWallLightweight
local Build_Wall_Concrete_Gate_8x4_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 8m
---@class Build_Wall_Concrete_FlipTris_8x8_C:FGBuildableWallLightweight
local Build_Wall_Concrete_FlipTris_8x8_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Concrete_FlipTris_8x4_C:FGBuildableWallLightweight
local Build_Wall_Concrete_FlipTris_8x4_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 2m
---@class Build_Wall_Concrete_FlipTris_8x2_C:FGBuildableWallLightweight
local Build_Wall_Concrete_FlipTris_8x2_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 1m
---@class Build_Wall_Concrete_FlipTris_8x1_C:FGBuildableWallLightweight
local Build_Wall_Concrete_FlipTris_8x1_C

--- Allows Pioneers to pass through the wall.
--- Door settings can be configured.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Concrete_CDoor_8x4_C:BUILD_SingleDoor_Base_01_C
local Build_Wall_Concrete_CDoor_8x4_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 8m
---@class Build_Wall_Concrete_Angular_8x8_C:FGBuildableWallLightweight
local Build_Wall_Concrete_Angular_8x8_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Concrete_Angular_8x4_C:FGBuildableWallLightweight
local Build_Wall_Concrete_Angular_8x4_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 8m
---@class Build_Wall_Concrete_8x8_Corner_2_C:FGBuildableCornerWall
local Build_Wall_Concrete_8x8_Corner_2_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 8m
---@class Build_Wall_Concrete_8x8_Corner_01_C:FGBuildableCornerWall
local Build_Wall_Concrete_8x8_Corner_01_C

--- Snaps to Foundations and other Walls.
--- The windows allow Pioneers to see through the wall.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Concrete_8x4_Window_04_C:FGBuildableWallLightweight
local Build_Wall_Concrete_8x4_Window_04_C

--- Snaps to Foundations and other Walls.
--- The windows allow Pioneers to see through the wall.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Concrete_8x4_Window_03_C:FGBuildableWallLightweight
local Build_Wall_Concrete_8x4_Window_03_C

--- Snaps to Foundations and other Walls.
--- The windows allow Pioneers to see through the wall.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Concrete_8x4_Window_02_C:FGBuildableWallLightweight
local Build_Wall_Concrete_8x4_Window_02_C

--- Snaps to Foundations and other Walls.
--- The windows allow Pioneers to see through the wall.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Concrete_8x4_Window_01_C:FGBuildableWallLightweight
local Build_Wall_Concrete_8x4_Window_01_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Concrete_8x4_Corner_2_C:FGBuildableCornerWall
local Build_Wall_Concrete_8x4_Corner_2_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Concrete_8x4_Corner_01_C:FGBuildableCornerWall
local Build_Wall_Concrete_8x4_Corner_01_C

--- Allows Pioneers to pass through the wall.
--- Door settings can be configured.
--- Snaps to Foundations and other Walls.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Concrete_SDoor_8x4_C:BUILD_SingleDoor_Base_01_C
local Build_Wall_Concrete_SDoor_8x4_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 4m
---@class Build_Wall_8x4_01_C:FGBuildableWallLightweight
local Build_Wall_8x4_01_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 8m
---@class Build_Wall_Steel_8x8_Corner_01_C:FGBuildableCornerWall
local Build_Wall_Steel_8x8_Corner_01_C

--- Snaps to foundations and other walls.
--- Useful for building multi-floor structures.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Steel_8x4_Corner_01_C:FGBuildableCornerWall
local Build_Wall_Steel_8x4_Corner_01_C

--- Snaps to Foundations and other Walls.
--- The windows allow Pioneers to see through the wall.
--- 
--- Size: 8m x 4m
---@class Build_Wall_Window_8x4_04_C:FGBuildableWallLightweight
local Build_Wall_Window_8x4_04_C

--- The FicsIt-Networks Thin Network Cable allows you to connect your network panels wich each other more gracefully.
--- 
--- This cable works just like the normal network cable except it can only connect between MCP panels and Small Network Plugs.
--- 
--- You can then connect Normal/Large Network Cables to those Small Network Plugs to be able to connect your MCP Panels with a computer.
---@class ThinNetworkCable_C:FINNetworkCable
local ThinNetworkCable_C

--- This FicsIt-Networks Small Wall Plug allows you to connect the thin network cable only usable with MCH panels and other small components.
--- 
--- You can then connect Normal/Large Network Cables to those Small Network Plugs to be able to connect your MCP Panels and such to a computer.
---@class Item_SmallNetworkWallPlug_C:Buildable
local Item_SmallNetworkWallPlug_C

--- The FicsIt-Networks Network Cable allows you to connect your network components wich each other.
--- 
--- This is the core process of building up your own computer network.
--- 
--- You can cconnect this cable via two a two step placement procedure to two network connectors, or, if the component/machine/whatever doesn't have a network connector, it will try to create add a network adpater to the machine to still allow you to connect it to your network.
---@class NetworkCable_C:FINNetworkCable
local NetworkCable_C

--- 
---@class BP_NetworkAdapter_C:FINNetworkAdapter
local BP_NetworkAdapter_C

--- This FicsIt-Networks Wall Plug allows you to distribute a network circuit more easily near buildings and indoors.
---@class NetworkWallPlug_C:Buildable
local NetworkWallPlug_C

--- This Pole allows you to connect multiple network components to it via the network cables.
--- 
--- This is a essential building for spreading your computer network into the whole landscape.
--- 
--- It basically allows you to digitalize the world!
---@class NetworkPole_C:Buildable
local NetworkPole_C

--- The Lever Module for the modular I/O Panel is used to switch a programm state between two different value (on or off).
---@class ModuleSwitch:FINModuleBase
---@field public state boolean @The current state in which the switch is in
local ModuleSwitch

--- This Stop Button Module for the modular I/O Panel is used to trigger important programmable events.
---@class ModuleStopButton:FINModuleBase
local ModuleStopButton
--- Triggers a button press by code.
function ModuleStopButton:trigger() end

--- The Potentiometer Module for the Modular I/O Control Panel allows you to have rotation input value for you programs.
--- 
--- You can rotate it indefinetly into any direction where every rotation triggers a computer network signal.
---@class ModulePotentiometer:FINModuleBase
local ModulePotentiometer
--- Rotates the potentiometer into the given direction.
---@param anticlockwise boolean @True if the potentiometer should be rotated anticlockwise.
function ModulePotentiometer:rotate(anticlockwise) end

--- This Button Module for modular I/O Panels can have different knob color and brightnesses and you can use them to trigger specific programmed events.
---@class ModuleButton:FINModuleBase
local ModuleButton
--- 
---@param red number @
---@param green number @
---@param blue number @
---@param Emit number @
function ModuleButton:setColor(red, green, blue, Emit) end
--- Triggers a button press by code.
function ModuleButton:trigger() end

--- This Button Module for modular I/O Panels can have different knob color and brightnesses and you can use them to trigger specific programmed events.
---@class PushbuttonModule:FINModuleBase
---@field public enabled boolean @Sets wheter to accept input on this encoder or not. True means accept input, false means to igore input
local PushbuttonModule
--- 
---@param red number @
---@param green number @
---@param blue number @
---@param Emit number @
function PushbuttonModule:setColor(red, green, blue, Emit) end
--- Triggers a button press by code.
function PushbuttonModule:trigger() end

--- This Potentiometer Module allows for input of a fixed value range and fires a signal with the new value each time the internal counter changes. This version has a readout display on it.
---@class PotWDisplayModule:FINModuleBase
---@field public enabled boolean @
---@field public autovalue boolean @
---@field public value number @
---@field public max number @
---@field public min number @
local PotWDisplayModule
--- 
---@param red number @
---@param green number @
---@param blue number @
---@param Emit number @
function PotWDisplayModule:setColor(red, green, blue, Emit) end
--- Sets the text to be displayed on this micro display
---@param text string @The new text to display
function PotWDisplayModule:setText(text) end

--- This Potentiometer Module allows for input of a fixed value range and fires a signal with the new value each time the internal counter changes.
---@class PotentiometerModule:FINModuleBase
---@field public enabled boolean @
---@field public value number @
---@field public max number @
---@field public min number @
local PotentiometerModule
--- 
---@param red number @
---@param green number @
---@param blue number @
---@param Emit number @
function PotentiometerModule:setColor(red, green, blue, Emit) end

--- This Mushroom Button Module for modular I/O Panels can have different knob color and brightnesses and you can use them to trigger specific programmed events.
---@class MushroomPushbuttonModule:FINModuleBase
---@field public enabled boolean @Sets wheter to accept input on this encoder or not. True means accept input, false means to igore input
local MushroomPushbuttonModule
--- 
---@param red number @
---@param green number @
---@param blue number @
---@param Emit number @
function MushroomPushbuttonModule:setColor(red, green, blue, Emit) end
--- Triggers a button press by code.
function MushroomPushbuttonModule:trigger() end

--- This Potentiometer Module allows for input of a value with infinite range, this because it only fires how much the value changed since last, not how much it is at.
---@class EncoderModule:FINModuleBase
---@field public enabled boolean @Sets wheter to accept input on this encoder or not. True means accept input, false means to igore input
local EncoderModule
--- 
---@param red number @
---@param green number @
---@param blue number @
---@param Emit number @
function EncoderModule:setColor(red, green, blue, Emit) end

--- This Switch Module for modular I/O Panels is used to toggle between three different settings. It has an illuminable spot on the knob and you can use them to trigger specific programmed events.
---@class SwitchModule3Position:FINModuleBase
---@field public enabled boolean @Sets wheter to accept input on this encoder or not. True means accept input, false means to igore input
---@field public state number @
local SwitchModule3Position
--- 
---@param red number @
---@param green number @
---@param blue number @
---@param Emit number @
function SwitchModule3Position:setColor(red, green, blue, Emit) end

--- This Switch Module for modular I/O Panels is used to toggle between a true and false value. It has an illuminable spot on the knob and you can use them to trigger specific programmed events.
---@class SwitchModule2Position:FINModuleBase
---@field public enabled boolean @Sets wheter to accept input on this encoder or not. True means accept input, false means to igore input
---@field public state boolean @
local SwitchModule2Position
--- 
---@param red number @
---@param green number @
---@param blue number @
---@param Emit number @
function SwitchModule2Position:setColor(red, green, blue, Emit) end

--- Used to connect Power Poles, Power Generators and Factory buildings.
---@class Build_PowerLine_C:FGBuildableWire
local Build_PowerLine_C

--- Can handle up to 4 Power Line connections.
--- 
--- Connect Power Poles, Power Generators and factory buildings together with Power Lines to create a power grid. The power grid supplies the connected buildings with power.
---@class Build_PowerPoleMk1_C:FGBuildablePowerPole
local Build_PowerPoleMk1_C

--- Power Pole that attaches to a wall.
--- 
--- Can handle up to 4 Power Line connections.
--- 
--- Connect Power Poles, Power Generators and factory buildings together with Power Lines to create a power grid. The power grid supplies the connected buildings with power.
---@class Build_PowerPoleWall_C:FGBuildablePowerPole
local Build_PowerPoleWall_C

--- 
---@class Build_RailroadSwitchControl_C:RailroadSwitchControl
local Build_RailroadSwitchControl_C

--- 
---@class Build_RailroadTrackIntegrated_C:RailroadTrack
local Build_RailroadTrackIntegrated_C

--- Used to transport trains in a reliable and fast manner.
--- Has a wide turn angle so make sure to plan it out properly.
---@class Build_RailroadTrack_C:RailroadTrack
local Build_RailroadTrack_C

--- Can be attached to walls.
--- Useful to route conveyor belts in a more controlled manner and over long distances.
---@class Build_ConveyorPoleWall_C:Buildable
local Build_ConveyorPoleWall_C

--- Can be attached to ceilings and other ceiling mounts.
--- Useful to route conveyor belts in a more controlled manner and over long distances.
---@class Build_ConveyorCeilingAttachment_C:Buildable
local Build_ConveyorCeilingAttachment_C

--- Transports up to 60 resources per minute. Used to move resources between buildings.
---@class Build_ConveyorBeltMk1_C:FGBuildableConveyorBelt
local Build_ConveyorBeltMk1_C

--- Can be used as a connection for conveyor belts. The height of the pole can be adjusted.
--- Useful to route conveyor belts in a more controlled manner and over long distances.
---@class Build_ConveyorPole_C:FGBuildablePoleLightweight
local Build_ConveyorPole_C

--- Burns Biomass to produce power. Biomass must be loaded manually and is obtained by picking up flora in the world. Produces up to 20 MW of power while operating.
---@class Build_GeneratorIntegratedBiomass_C:FGBuildableGeneratorFuel
local Build_GeneratorIntegratedBiomass_C

--- 
---@class Build_HubTerminal_C:FGBuildableHubTerminal
local Build_HubTerminal_C

--- A box you can put things in.
--- Has 25 inventory slots.
---@class Build_StorageIntegrated_C:FGBuildableStorage
local Build_StorageIntegrated_C

--- The Craft Bench allows you to manually produce parts to use in constructing buildings.
---@class Build_WorkBenchIntegrated_C:Buildable
local Build_WorkBenchIntegrated_C

--- The heart of your factory. This is where you complete FICSIT milestones to unlock additional blueprints of buildings, vehicles, parts, equipment etc.
---@class Build_TradingPost_C:FGBuildableTradingPost
local Build_TradingPost_C

--- The FicsIt-Networks Drive holder allows you to add any hard drive to the computer system.
--- 
--- The drive will then be able to get mounted as root FS or to get added as device file to the FS, after that you wil be able to manually mount the drive to your desired location.
---@class DriveHolder_C:FINComputerDriveHolder
local DriveHolder_C

--- This large modular I/O control panel allows you to attach multiple different modules on to it and use them as I/O to control you programms.
--- 
--- You can connect it to the FicsIt-Network.
--- 
--- Important to note is that every module is it's own component, that means if you want to listen to the signals, you will need to listen to each of them individually.
---@class LargeControlPanel:Buildable
local LargeControlPanel
--- Returns all modules placed on the panel.
---@return Object[]
function LargeControlPanel:getModules() end
--- Returns the module placed at the given location on the panel.
---@param x number @The x location of the module on the panel. (0 = left)
---@param y number @The y location of the module on the panel. (0 = bottom)
---@return Actor
function LargeControlPanel:getModule(x, y) end

--- This FicsIt-Networks Wall Plug allows you to pass a network circuit through a wall, allowing for more ease of use of the network cables.
---@class NetworkWallPlug_Double_C:Buildable
local NetworkWallPlug_Double_C

--- This large verical modular I/O control panel allows you to attach multiple different modules on to it and use them as I/O to control you programms.
--- 
--- You can connect it to the FicsIt-Network.
--- 
--- Important to note is that every module is it's own component, that means if you want to listen to the signals, you will need to listen to each of them individually.
---@class LargeVerticalControlPanel:Buildable
local LargeVerticalControlPanel
--- Returns all modules placed on the panels.
---@return Object[]
function LargeVerticalControlPanel:getModules() end
--- Returns the module placed at the given location on the given panel.
---@param x number @The x location of the module on the panel. (0 = left)
---@param y number @The y location of the module on the panel. (0 = bottom)
---@param panel number @The panel you want to get the module from.
---@return Actor
function LargeVerticalControlPanel:getModule(x, y, panel) end

--- Provides a relatively small text only display for Control Panels. 
--- Text height is fixed, but text is squeezed to fit horizontally.
---@class SquareMicroDisplayModule:FINModuleBase
local SquareMicroDisplayModule
--- Sets the text to be displayed on this micro display
---@param text string @The new text to display
function SquareMicroDisplayModule:setText(text) end
--- 
---@param red number @
---@param green number @
---@param blue number @
---@param Emit number @
function SquareMicroDisplayModule:setColor(red, green, blue, Emit) end

--- Provides a small text only display for Control Panels. 
--- Can display up to 3 digits, One additional dot may be used.
---@class MicroDisplayModule:FINModuleBase
local MicroDisplayModule
--- Sets the text to be displayed on this micro display
---@param text string @The new text to display
function MicroDisplayModule:setText(text) end
--- 
---@param red number @
---@param green number @
---@param blue number @
---@param Emit number @
function MicroDisplayModule:setColor(red, green, blue, Emit) end

--- Provides a relatively small text only display for Control Panels. 
--- Text height is fixed, but text is squeezed to fit horizontally.
---@class LargeMicroDisplayModule:FINModuleBase
local LargeMicroDisplayModule
--- Sets the text to be displayed on this micro display
---@param text string @The new text to display
function LargeMicroDisplayModule:setText(text) end
--- 
---@param red number @
---@param green number @
---@param blue number @
---@param Emit number @
function LargeMicroDisplayModule:setColor(red, green, blue, Emit) end

--- Indicator Module for panels
---@class IndicatorModule:FINModuleBase
local IndicatorModule
--- 
---@param red number @
---@param green number @
---@param blue number @
---@param Emit number @
function IndicatorModule:setColor(red, green, blue, Emit) end

--- The FicsIt-Networks Text-Display Module for the Modular Control Panel is a simple GPU and Screen combined!
--- 
--- It allows you to display any kind of text with differnt font sizes and you can even switch between two fonts!
--- 
--- But you can't interact with it, nor change the background/foreground color as you can do with a GPU.
---@class ModuleTextDisplay:FINModuleBase
---@field public monospace boolean @True if the text should be displayed in monospace.
---@field public size number @The size of the text that is displayed.
---@field public text string @The text that is displayed on the screen.
local ModuleTextDisplay

--- A small buzzer for panel mounting capable of playing single frequency beeps
---@class BuzzerModule:FINModuleBase
---@field public volume number @
---@field public decayCurve number @
---@field public decayTime number @
---@field public attackCurve number @
---@field public isPlaying boolean @
---@field public attackTime number @
---@field public frequency number @
local BuzzerModule
--- 
function BuzzerModule:stop() end
--- 
function BuzzerModule:beep() end

--- A small analogue Gauge for use on Micro Enclosures. The red portion and needle position can be changed through FIN
---@class GaugeModule:FINModuleBase
---@field public limit number @
---@field public percent number @
local GaugeModule
--- 
---@param red number @
---@param green number @
---@param blue number @
---@param Emit number @
function GaugeModule:setColor(red, green, blue, Emit) end
--- 
---@param red number @
---@param green number @
---@param blue number @
function GaugeModule:setBackgroundColor(red, green, blue) end

--- This Button Module for modular I/O Panels can have different knob color and brightnesses and you can use them to trigger specific programmed events.
---@class MCP_Mod_Plug_C:FINModuleBase
local MCP_Mod_Plug_C

--- A medium analogue Gauge for use on Large Panels. The red portion and needle position can be changed through FIN
---@class BigGaugeModule:FINModuleBase
---@field public limit number @
---@field public percent number @
local BigGaugeModule
--- 
---@param red number @
---@param green number @
---@param blue number @
---@param Emit number @
function BigGaugeModule:setColor(red, green, blue, Emit) end
--- 
---@param red number @
---@param green number @
---@param blue number @
---@param Emit number @
function BigGaugeModule:setBackgroundColor(red, green, blue, Emit) end

--- Label is just a module for placing a label onto the panel
---@class Label1x1Module:FINModuleBase
local Label1x1Module

--- Label is just a module for placing a label onto the panel
---@class Label2x1Module:FINModuleBase
local Label2x1Module

--- This panel allows for dynamic sizeing. For placing on walls.
---@class SizeableModulePanel:FINSizeablePanel
---@field public height number @The Height of this panel in modules
---@field public width number @The Width of this panel in modules
local SizeableModulePanel
--- Returns all modules placed on the panel.
---@return Object[]
function SizeableModulePanel:getModules() end
--- Returns the module placed at the given location on the panel.
---@param x number @The x position of the command point, starting from the non-cable end. Indexing starts at 0.
---@param y number @The y position  of the command point, starting from the non-cable end. Indexing starts at 0.
---@return Actor
function SizeableModulePanel:getModule(x, y) end

--- The Modular FicsIt Indicator Pole allows busy pioneers to check on the status of machines, factories and much more from a long distance far away. To express the status you can stack individual modules. FicsIt invested more money to make the indicator pole suitable for every situation by allowing it to be placed on walls, floors and beams with a dynamic orientation and even dynamic height.
---@class Build_ModularIndicatorPole_C:ModularIndicatorPole
local Build_ModularIndicatorPole_C

--- FicsIt Indicator Module for FicsIt Modular Indicator Poles provides pioneers with the most fundamental indicator. The new and improved incandecent RGB bulb provides versatility to the industrious. Each modules color and intensity can be set via the network by a computer.
---@class ModularIndicatorPoleModule:FINModularIndicatorPoleModule
local ModularIndicatorPoleModule
--- 
---@return Color
function ModularIndicatorPoleModule:getColor() end
--- Sets the color of this module
---@param r number @The red part of the color in which the light glows. (0.0 - 1.0)
---@param g number @The green part of the color in which the light glows. (0.0 - 1.0)
---@param b number @The blue part of the color in which the light glows. (0.0 - 1.0)
---@param e number @The light intensity of the pole. (>=0.0)
function ModularIndicatorPoleModule:setColor(r, g, b, e) end

--- This CPU is from the FicsIt-Lua series and allows you to program the PC with Lua.
--- 
--- You can only place one CPU per PC.
--- 
--- You are required to have at least one CPU per PC to run it. FicsIt does not allow unused PC Cases to get build.
---@class CPU_Lua_C:FINComputerProcessorLua
local CPU_Lua_C

--- The Graphical Processing Unit T2 allows for 2D Drawing on a screen.
--- 
--- You are able to draw with lines, boxes, text, images & more.
--- 
--- And through the use of transformation stack and clipping stack, you can more easily create more complex drawings!
--- 
--- The GPU also implemnts some signals allowing you to interact with the graphics more easily via keyboard, mouse and even touch.
---@class GPU_T2_C:FINComputerGPUT2
local GPU_T2_C

--- The FicsIt-Networks GPU T1 allows you to render a character grid onto any kind of screen.
--- 
--- Each character of this grid can be colored as you want as well as the background of each character.
--- 
--- You can also change the resolution to up to 150x50 characters.
--- 
--- The GPU also implemnts some signals allowing you to interact with the graphics more easily via keyboard, mouse and even touch.
---@class GPU_T1_C:GPUT1
local GPU_T1_C

--- The FicsIt-Networks speaker pole is a network component which allows you to use one more sense of the pioneers to give commands to them or to just make ambient better.
--- 
--- The speaker pole can play sound files located in the Computer Folder "/Sounds" in your Satisfactory Save-Games-Folder. The FicsIt-Networks speaker pole is only able to play .ogg files cause FicsIt Inc. has the opinion other file formates are useless.
---@class Speakers_C:SpeakerPole
local Speakers_C
--- 
---@param Volume number @
function Speakers_C:setVolume(Volume) end
--- 
---@param Range number @
function Speakers_C:setRange(Range) end
--- 
---@return number
function Speakers_C:getVolume() end
--- 
---@return number
function Speakers_C:getRange() end

--- The FicsIt-Networks Vehicle Scanner allows you to communicate with vehicles driving over the scanner.
--- 
--- You can also get notfied when a vehicle enters or leaves the scanner.
---@class VehicleScanner_C:VehicleScanner
local VehicleScanner_C

--- The FicsIt-Networks Screen Driver allows you to add a screen display to the UI of the computer case you build this module intol.
--- 
--- You can then use the computer API to get a reference to the screen and so you can bind the screen to a GPU.
---@class ScreenDriver_C:FINComputerScreen
local ScreenDriver_C

--- This is 100kB of amazing FicsIt-Networks Memory.
--- 
--- You can add multiple of the memory bars to your PC and so you can extend the memory of your PC.
--- 
--- You always need to hove enough memory because FicsIt doesn't allow out of memory exceptions and if you bring a computer to throw one, you will loose one month of payment.
---@class RAM_T1_C:FINComputerMemory
local RAM_T1_C

--- The Ficsit Networks Wireless Access Point allows you to connect a circuit to the Ficsit Wireless Area Network (FWAN), which uses Radio Towers frequencies to create a messaging network over the planet.
---  
--- It should be connected to a Radio Tower, then all network messages received will be broadcasted to all other Wireless Access Points across the map.
---@class WirelessAccessPoint_C:FINWirelessAccessPoint
local WirelessAccessPoint_C

--- The FicsIt-Network computer case is the most important thing you will know of. This case already holds the essentials of a computer for you. Like a network connector, keyboard, mouse and screen. But most important of all, it already has a motherboard were you can place and configure the computer just like you want.
---@class Computer_C:ComputerCase
local Computer_C

--- A Internet Card!
---@class InternetCard_C:FINInternetCard
local InternetCard_C

--- The FicsIt-Networks Network Card allows yout to send network messages to other network cards in the same computer network.
--- 
--- You can use unicast and broadcast messages to share information between multiple different computers in the same network.
--- 
--- This is the best and easiest way for you to communicate between multiple computers.
--- 
--- If you want to recieve network messages, make sure you also open the according port, since every message is asscociated with a port allowing for better filtering.
---@class NetworkCard_C:NetworkCard
local NetworkCard_C

--- The FicsIt-Networks large screen allows you to display anything a GPU can render onto a huge plane.
--- 
--- You can also interact with the monitor by locking at it and also by clicking on it.
---@class Build_Screen_C:Screen
local Build_Screen_C

--- This Screen Module for modular I/O Panels allows you to show graphics a GPU renders and to interact with it.
--- 
--- You can use the instance of the module to bind it to a GPU. The screen will then display the graphics the GPU renders. If you just look at the screen with the crosshair you will trigger the GPUs OnMouseMove events or if you event click with the right of left mouse button while doing so, you can also trigger the MouseDown and MouseUp events.
---@class ModuleScreen_C:FINModuleScreen
local ModuleScreen_C

--- The FicsIt-Networks Network Router allows you to sepperate two different component network from each other.
--- But it still lets network messages sent by network cards through.
--- This allows for better networking capabilities, faster networking (can reduce game lag) and makes working with larger networks and multiple computer more easy.
--- 
--- The router also provides a couple of functions which allow you to create filters for ports and message senders.
---@class NetworkRouter_C:NetworkRouter
local NetworkRouter_C

--- The FicsIt-Networks Codeable Splitter is able to get connected to the component network and provides functions and signals for custom splitter behaviour defenition.
--- 
--- This allows you to change the splitting behaviour in runtime by connected computers so it can f.e. depend on the amount of items in a storage container.
---@class CodeableSplitter_C:CodeableSplitter
local CodeableSplitter_C

--- The FicsIt-Networks indicator light allows yout to determine by the looks of from far away the state of a machine or program.
--- 
--- It has dynamic height, is stack able and you can control the color of it via accessing it from the computer network.
---@class IndicatorPole_C:IndicatorPole
local IndicatorPole_C

--- The FicsIt-Networks Codeable Merger  is able to get connected to the component network and provides functions and signals for custom merger behaviour defenition.
--- 
--- This allows you to change the merging behaviour in runtime by connected computers so it can f.e. depend on the amount of items in a storage container.
---@class CodeableMerger_C:CodeableMerger
local CodeableMerger_C

--- Enclosure for 1 command points
---@class ModulePanel:Buildable
local ModulePanel
--- 
---@param Y number @
---@return Actor
function ModulePanel:getYModule(Y) end
--- 
---@param X number @
---@return Actor
function ModulePanel:getXModule(X) end
--- Returns all modules placed on the panel.
---@return Object[]
function ModulePanel:getModules() end
--- Returns the module placed at the given location on the panel.
---@param x number @The x position of the command point, starting from the non-cable end. Indexing starts at 0.
---@param y number @The y position  of the command point, starting from the non-cable end. Indexing starts at 0.
---@return Actor
function ModulePanel:getModule(x, y) end

--- Micro Control Panel for 1 command point, center placement.
--- 
--- These Micro Control Panels can be used through out your factory and allow you to have an easier look on the state of your factory and they allow you to control your factory more easily.
--- 
--- You can fully customize the control panels with buttons lights etc.
---@class MCP_1Point_Center_C:ModulePanel
local MCP_1Point_Center_C

--- Enclosure for 1 command points.
--- 
--- These Micro Control Panels can be used through out your factory and allow you to have an easier look on the state of your factory and they allow you to control your factory more easily.
--- 
--- You can fully customize the control panels with buttons lights etc.
---@class MCP_1Point_C:ModulePanel
local MCP_1Point_C

--- Enclosure for 2 command points.
--- 
--- These Micro Control Panels can be used through out your factory and allow you to have an easier look on the state of your factory and they allow you to control your factory more easily.
--- 
--- You can fully customize the control panels with buttons lights etc.
---@class MCP_2Point_C:ModulePanel
local MCP_2Point_C

--- Enclosure for 6 command points.
--- 
--- These Micro Control Panels can be used through out your factory and allow you to have an easier look on the state of your factory and they allow you to control your factory more easily.
--- 
--- You can fully customize the control panels with buttons lights etc.
---@class MCP_6Point_C:ModulePanel
local MCP_6Point_C

--- Enclosure for 3 command points.
--- 
--- These Micro Control Panels can be used through out your factory and allow you to have an easier look on the state of your factory and they allow you to control your factory more easily.
--- 
--- You can fully customize the control panels with buttons lights etc.
---@class MCP_3Point_C:ModulePanel
local MCP_3Point_C

--- Contains 24 slots for storing large amounts of items.
--- Has an input and output for conveyor belts.
---@class Build_StorageContainerMk1_C:FGBuildableStorage
local Build_StorageContainerMk1_C

--- Contains 48 slots for storing large amounts of items.
--- Has two inputs and outputs for conveyor belts.
---@class Build_StorageContainerMk2_C:FGBuildableStorage
local Build_StorageContainerMk2_C

--- Can contain up to 2400m³ of fluid.
--- Has an input and output for pipes.
---@class Build_IndustrialTank_C:PipeReservoir
local Build_IndustrialTank_C

--- Can contain up to 400m³ of fluid.
--- Has an input and output for pipes.
---@class Build_PipeStorageTank_C:PipeReservoir
local Build_PipeStorageTank_C

--- Used to limit Pipeline flow rates.
--- Can be attached to a Pipeline.
--- 
--- NOTE: Has an in- and output direction.
---@class Build_Valve_C:PipelinePump
local Build_Valve_C

--- Train Signals are used to direct the movement of Trains to avoid collisions and bottlenecks.
--- 
--- Block Signals can be placed on Railways to create 'Blocks' between each other. When a Train is occupying such a Block, other Trains will be unable to enter it.
--- 
--- Caution: Signals are directional! Trains are unable to move against this direction, so be sure to set up Signals in both directions for bi-directional Railways.
---@class Build_RailroadBlockSignal_C:RailroadSignal
local Build_RailroadBlockSignal_C

--- Train Signals are used to direct the movement of Trains to avoid collisions and bottlenecks.
--- 
--- Path Signals are advanced signals that are especially useful for bi-directional Railways and complex intersections. They function similarly to Block Signals but rather than occupying the entire Block, Trains can reserve a specific path through it and will only enter the Block if their path allows them to fully pass through it.
--- 
--- Caution: Signals are directional! Trains are unable to move against this direction, so be sure to set up Signals in both directions for bi-directional Railways.
---@class Build_RailroadPathSignal_C:RailroadSignal
local Build_RailroadPathSignal_C

--- 
---@class Build_SignPole_C:FGBuildableSignSupport
local Build_SignPole_C

--- Signs can be customized with different elements, such as icons and text, to improve factory organization.
--- 
--- Can be placed freely, on Walls, or attached to a variety of buildings, such as Storage Containers.
--- 
--- Size: 16m x 8m
---@class Build_StandaloneWidgetSign_Huge_C:WidgetSign
local Build_StandaloneWidgetSign_Huge_C

--- Signs can be customized with different elements, such as icons and text, to improve factory organization.
--- 
--- Can be placed freely, on Walls, or attached to a variety of buildings, such as Storage Containers.
--- 
--- Size: 8m x 4m
---@class Build_StandaloneWidgetSign_Large_C:WidgetSign
local Build_StandaloneWidgetSign_Large_C

--- Signs can be customized with different elements, such as icons and text, to improve factory organization.
--- 
--- Can be placed freely, on Walls, or attached to a variety of buildings, such as Storage Containers.
--- 
--- Size: 2m x 1m
---@class Build_StandaloneWidgetSign_Medium_C:WidgetSign
local Build_StandaloneWidgetSign_Medium_C

--- Signs can be customized with different elements, such as icons and text, to improve factory organization.
--- 
--- Can be placed freely, on Walls, or attached to a variety of buildings, such as Storage Containers.
--- 
--- Size: 2m x 3m
---@class Build_StandaloneWidgetSign_Portrait_C:WidgetSign
local Build_StandaloneWidgetSign_Portrait_C

--- Signs can be customized with different elements, such as icons and text, to improve factory organization.
--- 
--- Can be placed freely, on Walls, or attached to a variety of buildings, such as Storage Containers.
--- 
--- Size: 2m x 0.5m
---@class Build_StandaloneWidgetSign_Small_C:WidgetSign
local Build_StandaloneWidgetSign_Small_C

--- Signs can be customized with different elements, such as icons and text, to improve factory organization.
--- 
--- Can be placed freely, on Walls, or attached to a variety of buildings, such as Storage Containers.
--- 
--- Size: 4m x 0.5m
---@class Build_StandaloneWidgetSign_SmallVeryWide_C:WidgetSign
local Build_StandaloneWidgetSign_SmallVeryWide_C

--- Signs can be customized with different elements, such as icons and text, to improve factory organization.
--- 
--- Can be placed freely, on Walls, or attached to a variety of buildings, such as Storage Containers.
--- 
--- Size: 3m x 0.5m
---@class Build_StandaloneWidgetSign_SmallWide_C:WidgetSign
local Build_StandaloneWidgetSign_SmallWide_C

--- Signs can be customized with different elements, such as icons and text, to improve factory organization.
--- 
--- Can be placed freely, on Walls, or attached to a variety of buildings, such as Storage Containers.
--- 
--- Size: 2m x 2m
---@class Build_StandaloneWidgetSign_Square_C:WidgetSign
local Build_StandaloneWidgetSign_Square_C

--- Signs can be customized with different elements, such as icons and text, to improve factory organization.
--- 
--- Can be placed freely, on Walls, or attached to a variety of buildings, such as Storage Containers.
--- 
--- Size: 1m x 1m
---@class Build_StandaloneWidgetSign_Square_Small_C:WidgetSign
local Build_StandaloneWidgetSign_Square_Small_C

--- Signs can be customized with different elements, such as icons and text, to improve factory organization.
--- 
--- Can be placed freely, on Walls, or attached to a variety of buildings, such as Storage Containers.
--- 
--- Size: 0.5m x 0.5m
---@class Build_StandaloneWidgetSign_Square_Tiny_C:WidgetSign
local Build_StandaloneWidgetSign_Square_Tiny_C

--- Automatically opens when living beings or vehicles approach it.
--- Gate settings can be configured.
--- Snaps to foundations and walls.
--- 
--- Size: 8m x 4m
---@class Build_Gate_Automated_8x4_C:Door
local Build_Gate_Automated_8x4_C

--- Can be switched ON/OFF to enable/disable the connection between two Power Grids.
--- 
--- Note the location of the A and B connections.
---@class Build_PowerSwitch_C:CircuitSwitch
local Build_PowerSwitch_C

--- Locomotives can be set to drive to and stop at the Train Station.
--- You can connect power to the train station to power up the trains on the railway as well as transport the power to other stations.
---@class Build_TrainStation_C:RailroadStation
local Build_TrainStation_C

--- Contains three cordinates (X, Y, Z) to describe a position or movement vector in 3D Space
---@class Vector
---@field public x number @The X coordinate component
---@field public y number @The Y coordinate component
---@field public z number @The Z coordinate component
local Vector
--- The addition (+) operator for this struct.
---@param other Vector @The other vector that should be added to this vector
---@return Vector
function Vector:FIN_Operator_Add(other) end
--- The subtraction (-) operator for this struct.
---@param other Vector @The other vector that should be subtracted from this vector
---@return Vector
function Vector:FIN_Operator_Sub(other) end
--- The Negation operator for this struct.
---@return Vector
function Vector:FIN_Operator_Neg() end
--- 
---@param other Vector @The other vector to calculate the scalar product with.
---@return number
function Vector:FIN_Operator_Mul(other) end
--- 
---@param factor number @The factor with which this vector should be scaled with.
---@return Vector
function Vector:FIN_Operator_Mul_1(factor) end

--- Contains two cordinates (X, Y) to describe a position or movement vector in 2D Space
---@class Vector2D
---@field public x number @The X coordinate component
---@field public y number @The Y coordinate component
local Vector2D
--- The addition (+) operator for this struct.
---@param other Vector2D @The other vector that should be added to this vector
---@return Vector2D
function Vector2D:FIN_Operator_Add(other) end
--- The subtraction (-) operator for this struct.
---@param other Vector2D @The other vector that should be subtracted from this vector
---@return Vector2D
function Vector2D:FIN_Operator_Sub(other) end
--- The Negation operator for this struct.
---@return Vector2D
function Vector2D:FIN_Operator_Neg() end
--- 
---@param other Vector2D @The other vector to calculate the scalar product with.
---@return number
function Vector2D:FIN_Operator_Mul(other) end
--- 
---@param factor number @The factor with which this vector should be scaled with.
---@return Vector2D
function Vector2D:FIN_Operator_Mul_1(factor) end

--- A structure that holds a rgba color value
---@class Color
---@field public r number @The red portion of the color.
---@field public g number @The green portion of the color.
---@field public b number @The blue portion of the color.
---@field public a number @The alpha (opacity) portion of the color.
local Color
--- The addition (+) operator for this struct.
---@param other Color @The other color that should be added to this color
---@return Color
function Color:FIN_Operator_Add(other) end
--- The Negation operator for this struct. Does NOT make the color negative. Calculates 1 - this.
---@return Color
function Color:FIN_Operator_Neg_1() end
--- The subtraction (-) operator for this struct.
---@param other Color @The other color that should be subtracted from this color
---@return Color
function Color:FIN_Operator_Sub(other) end
--- 
---@param factor number @The factor with which this color should be scaled with.
---@return Vector
function Color:FIN_Operator_Mul_1(factor) end
--- 
---@param factor number @The factor with which this color should be scaled inversly with.
---@return Vector
function Color:FIN_Operator_Div_1(factor) end

--- Contains rotation information about a object in 3D spaces using 3 rotation axis in a gimble.
---@class Rotator
---@field public pitch number @The pitch component
---@field public yaw number @The yaw component
---@field public roll number @The roll component
local Rotator
--- The addition (+) operator for this struct.
---@param other Rotator @The other rotator that should be added to this rotator
---@return Rotator
function Rotator:FIN_Operator_Add(other) end
--- The subtraction (-) operator for this struct.
---@param other Rotator @The other rotator that should be subtracted from this rotator
---@return Rotator
function Rotator:FIN_Operator_Sub(other) end

--- A Vector containing four values.
---@class Vector4
---@field public x number @The first value in the Vector4.
---@field public y number @The second value in the Vector4.
---@field public z number @The third value in the Vector4.
---@field public w number @The fourth value in the Vector4.
local Vector4

--- A struct containing four floats that describe a margin around a box (like a 9-patch).
---@class Margin
---@field public left number @The left edge of the rectangle.
---@field public right number @The right edge of the rectangle.
---@field public top number @The top edge of the rectangle.
---@field public bottom number @The bottom edge of the rectangle.
local Margin

--- A structure that holds item information.
---@class Item
---@field public type ItemType-Class @The type of the item.
local Item

--- A structure that holds item information and item amount to represent an item stack.
---@class ItemStack
---@field public count number @The count of items.
---@field public item Item @The item information of this stack.
local ItemStack

--- A struct that holds a pair of amount and item type.
---@class ItemAmount
---@field public amount number @The amount of items.
---@field public type ItemType-Class @The type of the items.
local ItemAmount

--- A struct containing information about a game icon (used in f.e. signs).
---@class IconData
---@field public isValid boolean @True if the icon data refers to an valid icon
---@field public id number @The icon ID.
---@field public ref string @The media reference of this icon.
---@field public animated boolean @True if the icon is animated.
---@field public iconName string @The name of the icon.
---@field public iconType string @The type of the icon. 0 = Building 1 = Part 2 = Equipment 3 = Monochrome 4 = Material 5 = Custom 6 = Map Stamp
---@field public hidden boolean @True if the icon is hidden in the selection.
---@field public searchOnly boolean @True if the icon will be shown in selection only if searched for directly by name.
local IconData

--- Contains infromation about the rules that descibe when a trian should depart from a station
---@class TrainDockingRuleSet
---@field public definition number @0 = Load/Unload Once, 1 = Fully Load/Unload
---@field public duration number @The amount of time the train will dock at least.
---@field public isDurationAndRule boolean @True if the duration of the train stop and the other rules have to be applied.
local TrainDockingRuleSet
--- Returns the types of items that will be loaded.
---@return ItemType-Class[]
function TrainDockingRuleSet:getLoadFilters() end
--- Sets the types of items that will be loaded.
---@param filters ItemType-Class[] @The item filter array
function TrainDockingRuleSet:setLoadFilters(filters) end
--- Returns the types of items that will be unloaded.
---@return ItemType-Class[]
function TrainDockingRuleSet:getUnloadFilters() end
--- Sets the types of items that will be loaded.
---@param filters ItemType-Class[] @The item filter array
function TrainDockingRuleSet:setUnloadFilters(filters) end

--- This structure stores all data that defines what a sign displays.
---@class PrefabSignData
---@field public layout Object-Class @The object that actually displayes the layout
---@field public foreground Color @The foreground Color.
---@field public background Color @The background Color.
---@field public auxiliary Color @The auxiliary Color.
---@field public signType SignType-Class @The type of sign this prefab fits to.
local PrefabSignData
--- Returns all text elements and their values.
---@return string[],string[]
function PrefabSignData:getTextElements() end
--- Returns all icon elements and their values.
---@return string[],number[]
function PrefabSignData:getIconElements() end
--- Sets all text elements and their values.
---@param textElements string[] @The element names for all text elements.
---@param textElementValues string[] @The values for all text elements.
function PrefabSignData:setTextElements(textElements, textElementValues) end
--- Sets all icon elements and their values.
---@param iconElements string[] @The element names for all icon elements.
---@param iconElementValues number[] @The values for all icon elements.
function PrefabSignData:setIconElements(iconElements, iconElementValues) end
--- Sets a text element with the given element name.
---@param elementName string @The name of the text element
---@param value string @The value of the text element
function PrefabSignData:setTextElement(elementName, value) end
--- Sets a icon element with the given element name.
---@param elementName string @The name of the icon element
---@param value number @The value of the icon element
function PrefabSignData:setIconElement(elementName, value) end
--- Gets a text element with the given element name.
---@param elementName string @The name of the text element
---@return number
function PrefabSignData:getTextElement(elementName) end
--- Gets a icon element with the given element name.
---@param elementName string @The name of the icon element
---@return number
function PrefabSignData:getIconElement(elementName) end

--- A structure that can hold a buffer of characters and colors that can be displayed with a gpu
---@class GPUT1Buffer
local GPUT1Buffer
--- Allows to get the dimensions of the buffer.
---@return number,number
function GPUT1Buffer:getSize() end
--- Allows to set the dimensions of the buffer.
---@param width number @The width this buffer should now have
---@param height number @The height this buffer now have
function GPUT1Buffer:setSize(width, height) end
--- Allows to get a single pixel from the buffer at the given position
---@param x number @The x position of the character you want to get
---@param y number @The y position of the character you want to get
---@return string,Color,Color
function GPUT1Buffer:get(x, y) end
--- Allows to set a single pixel of the buffer at the given position
---@param x number @The x position of the character you want to set
---@param y number @The y position of the character you want to set
---@param c string @The character the pixel should have
---@param foreground Color @The foreground color the pixel at the given position should have
---@param background Color @The background color the pixel at the given position should have
---@return boolean
function GPUT1Buffer:set(x, y, c, foreground, background) end
--- Copies the given buffer at the given offset of the upper left corner into this buffer.
---@param x number @The x offset of the upper left corner of the buffer relative to this buffer
---@param y number @The y offset of the upper left corener of the buffer relative to this buffer
---@param buffer GPUT1Buffer @The buffer from wich you want to copy from
---@param textBlendMode number @The blend mode that is used for the text. 0 = Overwrite this with the content of the given buffer 1 = Overwrite with only characters that are not ' ' 2 = Overwrite only were this characters are ' ' 3 = Keep this buffer
---@param foregroundBlendMode number @The blend mode that is used for the foreground color. 0 = Overwrite with the given color 1 = Normal alpha composition 2 = Multiply 3 = Divide 4 = Addition 5 = Subtraction 6 = Difference 7 = Darken Only 8 = Lighten Only 9 = None
---@param backgroundBlendMode number @The blend mode that is used for the background color. 0 = Overwrite with the given color 1 = Normal alpha composition 2 = Multiply 3 = Divide 4 = Addition 5 = Subtraction 6 = Difference 7 = Darken Only 8 = Lighten Only 9 = None
function GPUT1Buffer:copy(x, y, buffer, textBlendMode, foregroundBlendMode, backgroundBlendMode) end
--- Allows to write the given text onto the buffer and with the given offset.
---@param x number @The X Position at which the text should begin to get written.
---@param y number @The Y Position at which the text should begin to get written.
---@param text string @The text that should get written.
---@param foreground Color @The foreground color which will be used to write the text.
---@param background Color @The background color which will be used to write the text.
function GPUT1Buffer:setText(x, y, text, foreground, background) end
--- Draws the given character at all given positions in the given rectangle on-to the hidden screen buffer.
---@param x number @The x coordinate at which the rectangle should get drawn. (upper-left corner)
---@param y number @The y coordinate at which the rectangle should get drawn. (upper-left corner)
---@param width number @The width of the rectangle.
---@param height number @The height of the rectangle.
---@param character string @A string with a single character that will be used for each pixel in the range you want to fill.
---@param foreground Color @The foreground color which will be used to fill the rectangle.
---@param background Color @The background color which will be used to fill the rectangle.
function GPUT1Buffer:fill(x, y, width, height, character, foreground, background) end
--- Allows to set the internal data of the buffer more directly.
---@param characters string @The characters you want to draw with a length of exactly width*height.
---@param foreground number[] @The values of the foreground color slots for each character were a group of four values give one color. so the length has to be exactly width*height*4.
---@param background number[] @The values of the background color slots for each character were a group of four values give one color. so the length has to be exactly width*height*4.
---@return boolean
function GPUT1Buffer:setRaw(characters, foreground, background) end
--- Clones this buffer into a new struct
---@return GPUT1Buffer
function GPUT1Buffer:clone() end

--- This struct contains the necessary information to draw a box onto the GPU T2.
---@class GPUT2DrawCallBox
---@field public position Vector2D @The drawn local position of the rectangle.
---@field public size Vector2D @The drawn size of the rectangle.
---@field public rotation number @The draw rotation of the rectangle.
---@field public color Color @The fill color of the rectangle, or the tint of the image drawn.
---@field public image string @If not empty, should be a image reference to the image that should be drawn inside the rectangle.
---@field public imageSize Vector2D @The size of the internal image drawn, necessary for proper scaling, antialising and tiling.
---@field public hasCenteredOrigin boolean @If set to false, the position will give the left upper corner of the box and rotation will happen around this point. If set to true, the position will give the center point of box and the rotation will happen around this center point.
---@field public horizontalTiling boolean @True if the image should be tiled horizontally.
---@field public verticalTiling boolean @True if the image should be tiled vertically.
---@field public isBorder boolean @If true, the margin values provide a way to specify a fixed sized border thicknesses the boxes images will use (use the image as 9-patch).
---@field public margin Margin @The margin values of the 9-patch (border).
---@field public isRounded boolean @True if the box can have rounded borders.
---@field public radii Vector4 @The rounded border radii used if isRounded is set to true. The Vector4 corner mapping in order: Top Left, Top Right, Bottom Right & Bottom Left.
---@field public hasOutline boolean @True if the box has a colorful (inward) outline.
---@field public outlineThickness number @The uniform thickness of the outline around the box.
---@field public outlineColor Color @The color of the outline around the box.
local GPUT2DrawCallBox

--- A Future struct MAY BE HANDLED BY CPU IMPLEMENTATION differently, generaly, this is used to make resources available on a later point in time. Like if data won't be avaialble right away and you have to wait for it to process first. Like when you do a HTTP Request, then it takes some time to get the data from the web server. And since we don't want to halt the game and wait for the data, you can use a future to check if the data is available, or let just the Lua Code wait, till the data becomes available.
---@class Future
local Future

--- A track section that combines the area between multiple signals.
---@class RailroadSignalBlock
---@field public isValid boolean @Is true if this signal block reference is valid.
---@field public isBlockOccupied boolean @True if the block this signal is observing is currently occupied by a vehicle.
---@field public hasBlockReservation boolean @True if the block this signal is observing has a reservation of a train e.g. will be passed by a train soon.
---@field public isPathBlock boolean @True if the block this signal is observing is a path-block.
---@field public blockValidation number @Returns the blocks validation status.
local RailroadSignalBlock
--- Allows you to check if this block is occupied by a given train.
---@param train Train @The train you want to check if it occupies this block
---@return boolean
function RailroadSignalBlock:isOccupiedBy(train) end
--- Returns a list of trains that currently occupate the block.
---@return Train[]
function RailroadSignalBlock:getOccupation() end
--- Returns a list of trains that try to reserve this block and wait for approval.
---@return Train[]
function RailroadSignalBlock:getQueuedReservations() end
--- Returns a list of trains that are approved by this block.
---@return Train[]
function RailroadSignalBlock:getApprovedReservations() end

--- Target Point in the waypoint list of a wheeled vehicle.
---@class TargetPoint
---@field public pos Vector @The position of the target point in the world.
---@field public rot Rotator @The rotation of the target point in the world.
---@field public speed number @The speed at which the vehicle should pass the target point.
---@field public wait number @The amount of time which needs to pass till the vehicle will continue to the next target point.
local TargetPoint

--- Information about a train stop in a time table.
---@class TimeTableStop
---@field public station RailroadStation @The station at which the train should stop
local TimeTableStop
--- Returns The rule set wich describe when the train will depart from the train station.
---@return TrainDockingRuleSet
function TimeTableStop:getRuleSet() end
--- Allows you to change the Rule Set of this time table stop.
---@param ruleset TrainDockingRuleSet @The rule set you want to use instead.
function TimeTableStop:setRuleSet(ruleset) end

--- Struct that holds a cache of a whole train/rail network.
---@class TrackGraph
local TrackGraph
--- Returns a list of all trains in the network.
---@return Train[]
function TrackGraph:getTrains() end
--- Returns a list of all trainstations in the network.
---@return RailroadStation[]
function TrackGraph:getStations() end

--- An entry in the Computer Log.
---@class LogEntry
---@field public content string @The Message-Content contained within the log entry.
---@field public timestamp string @The timestamp at which the log entry got logged.
---@field public verbosity number @The verbosity of the log entry.
local LogEntry
--- Creates a formatted string representation of this log entry.
---@return string
function LogEntry:format() end

