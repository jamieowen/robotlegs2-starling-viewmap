# Starling View Manager

A Robotlegs2 extension to enable Starling Views in Robotlegs2.

## Keep Simple.
This an absolute bare minimum approach to mapping Starling DisplayObject's to the RL2 Mediator Map.
It adds a configHandler to the context to handle a single Starling instance.

When a Starling instance is added, the Starling stage is listened to for DisplayObject ADD/REMOVE events.

When a DisplayObject is added or removed it calls MediatorMap.mediate() 
or MediatorMap.unmediate() respectively.

One bottleneck is the RL2 DefaultMediatorManager class.  Which casts views to flash.display.DisplayObject in the intializeMediator(view) method. This means that views are passed to the Mediator as null even though the IMediator interface is typed as an Object.

The solution was to introduce a IStarlingMediator interface and manage the set viewComponent / initialise() / destroy() methods manually.  The standard initialise()/ destroy() methods are called by the DefaultManagerMediator but we ignore them.

Without the DefaultMediatorManager casting you would be able to use the default RL2 IMediator class as usual.

## Notes.
There is no Mediator.addViewListener() or Mediator.addContextListener() yet as Starling uses it's own EventDispatcher.  You'll have to inject those dependencies to the Mediator manually.




