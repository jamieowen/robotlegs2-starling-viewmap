# Starling View Manager

A Robotlegs2 extension to enable Starling Views in Robotlegs2.

## Kept simple
This an absolute bare minimum approach to mapping Starling DisplayObject's to the RL2 Mediator Map.
It adds a configHandler to the context to handle a single Starling instance.

When a Starling instance is added, the Starling stage is listened to for DisplayObject ADD/REMOVE events.

When a DisplayObject is added or removed it calls MediatorMap.mediate() 
or MediatorMap.unmediate() respectively.


## Notes.
There is no Mediator.addViewListener() or Mediator.addContextListener() yet as Starling uses it's own EventDispatcher. 




