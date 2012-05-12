//------------------------------------------------------------------------------
//  Copyright (c) 2011 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.extensions.starlingViewMap.impl
{
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.extensions.starlingViewMap.api.IStarlingViewMap;

	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.events.Event;

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
			// listen for display object events
			starling.stage.addEventListener( Event.ADDED, onStarlingAdded );
			starling.stage.addEventListener( Event.REMOVED, onStarlingRemoved );
			
			// adds stage as view to allow a Starling Stage Mediator.
			starling.addEventListener( Event.ROOT_CREATED, onRootCreated );
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
		
		private function onRootCreated( event:Event ):void
		{
			starling.removeEventListener( Event.ROOT_CREATED, onRootCreated );
			
			addStarlingView( starling.stage );
		}
	}
}
