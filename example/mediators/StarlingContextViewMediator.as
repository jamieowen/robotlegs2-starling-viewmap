package mediators {
	import robotlegs.extensions.starlingViewMap.impl.StarlingMediator;

	/**
	 * @author jamieowen
	 */
	public class StarlingContextViewMediator extends StarlingMediator
	{
		
		public function StarlingContextViewMediator()
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
