# Starling View Manager

A Robotlegs2 (test) extension to enable Starling Views in Robotlegs2.

## Simple.
This an absolute bare minimum approach to mapping Starling DisplayObject's to the RL2 Mediator Map.
It adds a configHandler to the context to handle a single Starling instance.

When a Starling instance is added, the stage is listened to for DisplayObject ADD/REMOVE events.
When a DisplayObject is added it checks the RL2 MediatorMap for mappings for that type and calls MediatorMap.mediate() 
and MediatorMap.unmediate().

That's it.
