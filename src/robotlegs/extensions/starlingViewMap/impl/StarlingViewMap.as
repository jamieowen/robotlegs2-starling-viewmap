//------------------------------------------------------------------------------
//  Copyright (c) 2011 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.extensions.starlingViewMap.impl
{
	import robotlegs.extensions.starlingViewMap.api.IStarlingMediator;
	import robotlegs.bender.extensions.mediatorMap.api.MediatorFactoryEvent;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorFactory;
	import starling.events.Event;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import starling.core.Starling;
	import robotlegs.extensions.starlingViewMap.api.IStarlingViewMap;

	import starling.display.DisplayObject;

	/**
	 * 
	 * StarlingViewMap Impl
	 * 
	 * @author jamieowen
	 */
	public class StarlingViewMap implements IStarlingViewMap
	{
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*
		 * 
		 */
		[Inject]
		public var starling:Starling;
		
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		[Inject]
		public var mediatorFactory:IMediatorFactory;
				
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		
		
		
		/*============================================================================*/
		/* Constructor
		/*============================================================================*/
		
		public function StarlingViewMap()
		{
			
		}
		
		[PostConstruct]
		public function init():void
		{	
			// listen for mediator create events to call initialise(), set view component etc.
			// via the IStarlingMediator interface
			
			// Note: listening for MEDIATOR_CREATE events is normally carried out in the DefaultMediatorManager in RL2
			// the standard set viewComponent and initialize() would work if the DefaultMediatorManager.initializeMediator() method did not cast to flash.display.DisplayObject
			

			mediatorFactory.addEventListener( MediatorFactoryEvent.MEDIATOR_CREATE, onMediatorCreate );
			mediatorFactory.addEventListener( MediatorFactoryEvent.MEDIATOR_REMOVE, onMediatorRemove );
			
			// listen for display object events
			starling.stage.addEventListener( Event.ADDED, onStarlingAdded );
			starling.stage.addEventListener( Event.REMOVED, onStarlingRemoved );
			
			// add stage as view to allow a Starling Stage Mediator.
			addStarlingView( starling.stage );
		}
		
		/*============================================================================*/
		/* Public Methods
		/*============================================================================*/
		
		public function addStarlingView(view : DisplayObject) : void
		{
			mediatorMap.mediate(view);
		}

		public function removeStarlingView(view : DisplayObject) : void
		{
			mediatorMap.unmediate(view);
		}
		
		/*============================================================================*/
		/* Private Methods
		/*============================================================================*/
		
		private function onStarlingAdded( event:Event ):void
		{
			addStarlingView( event.target as DisplayObject );
		}
		
		private function onStarlingRemoved( event:Event ):void
		{
			removeStarlingView( event.target as DisplayObject );
		}
		
		private function onMediatorCreate( event:MediatorFactoryEvent ):void
		{
			initializeMediator(event.view as DisplayObject, event.mediator as IStarlingMediator );
		}
		
		private function onMediatorRemove( event:MediatorFactoryEvent ):void
		{
			destroyMediator( event.mediator as IStarlingMediator );
		}
		
		private function initializeMediator(view:DisplayObject, mediator:IStarlingMediator):void
		{
			if( mediator )
			{
				mediator.starling_viewComponent = view;
				mediator.starling_initialize();
			}
		}
		
		private function destroyMediator( mediator:IStarlingMediator ):void
		{
			if( mediator )
			{
				mediator.starling_destroy();
			}
		}
	}
}
