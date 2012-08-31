package mediators {
	import robotlegs.extensions.starlingViewMap.impl.StarlingMediator;

	/**
	 * @author jamieowen
	 */
	public class StarlingStageMediator extends StarlingMediator
	{
		public function StarlingStageMediator()
		{
			
		}
		
		override public function initialize():void
		{
			super.initialize();
			trace( "rl2 initialise : " + this );
		}

		override public function destroy():void
		{
			super.initialize();
			trace( "rl2 destroy " + this );
		}
	}
}
