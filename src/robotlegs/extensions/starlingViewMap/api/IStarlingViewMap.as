//------------------------------------------------------------------------------
//  Copyright (c) 2011 the original author or authors. All Rights Reserved. 
// 
//  NOTICE: You are permitted to use, modify, and distribute this file 
//  in accordance with the terms of the license agreement accompanying it. 
//------------------------------------------------------------------------------

package robotlegs.extensions.starlingViewMap.api
{
	import starling.display.DisplayObject;
	
	/**
	 * @author jamieowen
	 */
	public interface IStarlingViewMap
	{
		function addStarlingView( view:DisplayObject ):void;
		function removeStarlingView( view:DisplayObject ):void;
	}
}
