#tag Module
Protected Module Minecraft
	#tag Method, Flags = &h1
		Protected Function GetBlockByName(selector As String) As Integer
		  
		  Return -1
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetItemByName(selector As String) As Integer
		  
		  Return -1
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetWorldById(selector As Integer) As Minecraft.World
		  
		  If selector < 0 Or selector > UBound(Minecraft.Worlds) Then Return Nil
		  
		  Return Minecraft.Worlds(selector)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetWorldByName(selector As String) As Minecraft.World
		  
		  Dim i As Integer = UBound(Minecraft.Worlds)
		  While i >= 0
		    If MatchBasic(Minecraft.Worlds(i).Name, selector) = True Then _
		    Return Minecraft.Worlds(i)
		    i = i - 1
		  Wend
		  Return Nil
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected Worlds() As Minecraft.World
	#tag EndProperty


	#tag Enum, Name = Blocks, Type = Integer, Flags = &h0
		Air
		  Stone
		  Grass
		  Dirt
		  Cobblestone
		  WoodenPlanks
		  Sapling
		  Bedrock
		  Water
		  StationaryWater
		  Lava
		  StationaryLava
		  Sand
		  Gravel
		  GoldOre
		  IronOre
		  CoalOre
		  Wood
		  Leaves
		  Sponge
		  Glass
		  LapisLazuliOre
		  LapisLazuliBlock
		  Dispenser
		  Sandstone
		  NoteBlock
		  Bed
		  PoweredRail
		  DetectorRail
		  StickyPiston
		  Cobweb
		  TallGrass
		  DeadBush
		  Piston
		  PistonExtension
		  Wool
		  BlockMovedByPiston
		  Dandelion
		  Rose
		  BrownMushroom
		  RedMushroom
		  GoldBlock
		  IronBlock
		  DoubleSlabs
		  Slabs
		  Bricks
		  TNT
		  Bookshelf
		  MossyCobblestone
		  Obsidian
		  Torch
		  Fire
		  MonsterSpawner
		  OakWoodStairs
		  Chest
		  RedstoneWire
		  DiamondOre
		  DiamondBlock
		  Workbench
		  Wheat
		  Farmland
		  Furnace
		  BurningFurnace
		  SignPost
		  WoodenDoor
		  Ladders
		  Rail
		  CobblestoneStairs
		  WallSign
		  Lever
		  StonePressurePlate
		  IronDoor
		  WoodenPressurePlate
		  RedstoneOre
		  GlowingRedstoneOre
		  RedstoneTorchInactive
		  RedstoneTorchActive
		  StoneButton
		  Snow
		  Ice
		  SnowBlock
		  Cactus
		  Clay
		  SugarCane
		  Jukebox
		  Fence
		  Pumpkin
		  Netherrack
		  SoulSand
		  Glowstone
		  NetherPortal
		  JackOLantern
		  CakeBlock
		  RedstoneRepeaterInactive
		  RedstoneRepeaterActive
		  LockedChest
		  Trapdoor
		  MonsterEgg
		  StoneBricks
		  HugeBrownMushroom
		  HugeRedMushroom
		  IronBars
		  GlassPane
		  Melon
		  PumpkinStem
		  MelonStem
		  Vines
		  FenceGate
		  BrickStairs
		  StoneBrickStairs
		  Mycelium
		  LilyPad
		  NetherBrick
		  NetherBrickFence
		  NetherBrickStairs
		  NetherWart
		  EnchantmentTable
		  BrewingStand
		  Cauldron
		  EndPortal
		  EndPortalBlock
		  EndStone
		  DragonEgg
		  RedstoneLampInactive
		  RedstoneLampActive
		  WoodenDoubleSlab
		  WoodenSlab
		  Cococa
		  SandstoneStairs
		  EmeraldOre
		  EnderChest
		  TripwireHook
		  Tripwire
		  EmeraldBlock
		  SpruceWoodStairs
		  BirchWoodStairs
		  JungleWoodStairs
		  CommandBlock
		  Beacon
		  CobblestoneWall
		  FlowerPot
		  Carrots
		  Potatoes
		  WoodenButton
		  MobHead
		  Anvil
		  TrappedChest
		  WeightedPressurePlateLight
		  WeightedPressurePlateHeavy
		  RedstoneComparatorInactive
		  RedstoneComparatorActive
		  DaylightSensor
		  RedstoneBlock
		  NetherQuartzOre
		  Hopper
		  NetherQuartzBlock
		  NetherQuartzStairs
		  ActivatorRail
		  Dropper
		  StainedClay
		  Unused1
		  Unused2
		  Unused3
		  Unused4
		  Unused5
		  Unused6
		  Unused7
		  Unused8
		  Unused9
		  HayBlock
		  Carpet
		  HardenedClay
		  CoalBlock
		  Unused10
		Unused11
	#tag EndEnum


End Module
#tag EndModule
