package 
{
	import robotlegs.bender.extensions.contextView.ContextView;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;
	import robotlegs.extensions.starlingViewMap.StarlingViewMapExtension;
	import starling.core.Starling;
	import views.StarlingContextView;

	/**
	 * An example to demo the RL2 Starling extension.
	 * 
	 * @author jamieowen
	 */
	public class StarlingExtensionExample extends Sprite
	{
		private var _context:IContext;
		
		public function StarlingExtensionExample()
		{
			stage.align 		= StageAlign.TOP_LEFT;
			stage.scaleMode 	= StageScaleMode.NO_SCALE;
			
			init();
		}
		
		private function init():void
		{
			const starling:Starling = new Starling(StarlingContextView, stage);
			
			_context = new Context()
				.install( MVCSBundle, StarlingViewMapExtension )
				.configure(StarlingConfig, new ContextView( this ), starling);
				
		}
	}
}
