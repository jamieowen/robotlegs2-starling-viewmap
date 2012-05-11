package robotlegs.extensions.starlingViewMap.api 
{
	import starling.display.DisplayObject;

	/**
	 * 
	 * A custom Starling Mediator interface to solve the problems with current RL2 Mediator and DisplayObject.
	 * 
	 * Note : We cannot keep the standard set viewComponent, initialise(), destroy() method names as the RL2 DefaultMediatorManager calls them anyway. ( e.g. through mediator.hasOwnProperty("viewComponent") )
	 * 
	 * @author jamieowen
	 */
	public interface IStarlingMediator
	{
		function set starling_viewComponent(view:DisplayObject):void;

		function starling_initialize():void;

		function starling_destroy():void;
	}
}
