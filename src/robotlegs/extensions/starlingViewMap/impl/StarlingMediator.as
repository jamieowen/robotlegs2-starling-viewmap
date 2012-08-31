package robotlegs.extensions.starlingViewMap.impl {
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import robotlegs.bender.extensions.localEventMap.api.IEventMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediator;

	/**
	 * @author jamieowen
	 */
	public class StarlingMediator implements IMediator
	{
		[Inject]
		public var eventMap:IEventMap;

		[Inject]
		public var eventDispatcher:IEventDispatcher;

		private var _viewComponent:Object;

		public function set viewComponent(view:Object):void
		{
			_viewComponent = view;
		}
		
		public function initialize() : void
		{
			
		}

		public function destroy() : void
		{
			eventMap.unmapListeners();
		}

		protected function addContextListener(eventString:String, listener:Function, eventClass:Class = null):void
		{
			eventMap.mapListener(eventDispatcher, eventString, listener, eventClass);
		}

		protected function removeContextListener(eventString:String, listener:Function, eventClass:Class = null):void
		{
			eventMap.unmapListener(eventDispatcher, eventString, listener, eventClass);
		}

		protected function dispatch(event:Event):void
		{
			if (eventDispatcher.hasEventListener(event.type))
				eventDispatcher.dispatchEvent(event);
		}
	}
}
