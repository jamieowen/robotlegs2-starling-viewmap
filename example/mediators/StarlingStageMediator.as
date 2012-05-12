package mediators {
	import robotlegs.bender.extensions.mediatorMap.api.IMediator;

	/**
	 * @author jamieowen
	 */
	public class StarlingStageMediator implements IMediator
	{
		public function StarlingStageMediator()
		{
			
		}
		
		public function set viewComponent(view:Object):void
		{
			trace( "rl2 view comp : " + view + " " + this );
		}

		public function initialize():void
		{
			trace( "rl2 initialise : " + this );
		}

		public function destroy():void
		{
			trace( "rl2 destroy " + this );
		}
	}
}
