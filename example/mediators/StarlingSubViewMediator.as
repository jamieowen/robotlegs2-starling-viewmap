package mediators
{
	import starling.display.DisplayObject;
	import robotlegs.extensions.starlingViewMap.api.IStarlingMediator;

	/**
	 * @author jamieowen
	 */
	public class StarlingSubViewMediator implements IStarlingMediator
	{
		public function StarlingSubViewMediator()
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
