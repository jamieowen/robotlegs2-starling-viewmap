package mediators
{
	import robotlegs.extensions.starlingViewMap.api.IStarlingMediator;
	import starling.display.DisplayObject;

	/**
	 * @author jamieowen
	 */
	public class StarlingStageMediator implements IStarlingMediator
	{
		public function StarlingStageMediator()
		{
			
		}
		
		public function set starling_viewComponent(view:DisplayObject):void
		{
			trace( "starling view comp : " + view + " " + this );
		}

		public function starling_initialize():void
		{
			trace( "starling initialise : " + this );
		}

		public function starling_destroy():void
		{
			trace( "starling destroy " + this );
		}
	}
}
