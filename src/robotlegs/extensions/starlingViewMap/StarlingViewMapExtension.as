//------------------------------------------------------------------------------
//  Copyright (c) 2011 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.extensions.starlingViewMap
{
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IExtension;
	import robotlegs.bender.framework.impl.UID;
	import robotlegs.extensions.starlingViewMap.api.IStarlingViewMap;
	import robotlegs.extensions.starlingViewMap.impl.StarlingViewMap;
	import robotlegs.bender.extensions.matching.instanceOfType;
	
	import starling.core.Starling;


	/**
	 * Basic StarlingView Extension.
	 * 
	 * @author jamieowen
	 */
	public class StarlingViewMapExtension implements IExtension
	{
		
		/*============================================================================*/
		/* Public Properties                                                         */
		/*============================================================================*/
		
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		
		private var _uid:String = UID.create( StarlingViewMapExtension );
		
		private var _context:IContext;
		
		/*============================================================================*/
		/* Constructor                                                                */
		/*============================================================================*/
		
		public function StarlingViewMapExtension()
		{
			
		}
		
		/*============================================================================*/
		/* Public Functions                                                           */
		/*============================================================================*/
		
		public function extend(context : IContext) : void
		{
			_context = context;
			_context.addConfigHandler(instanceOfType(Starling), handleStarling);
			
			_context.injector.map( IStarlingViewMap).toSingleton(StarlingViewMap);
		}
	
		/*============================================================================*/
		/* Private Functions                                                           */
		/*============================================================================*/	
		
		private function handleStarling( starling:Starling ):void
		{
			_context.injector.map(Starling).toValue(starling);
			
			// init the IStarlingViewMap now we have the reference to Starling
			_context.injector.getInstance(IStarlingViewMap);
		}		
	}
}
