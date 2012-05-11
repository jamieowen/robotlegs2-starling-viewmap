package {
	import mediators.StarlingContextViewMediator;
	import mediators.StarlingStageMediator;
	import mediators.StarlingSubViewMediator;

	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;

	import starling.display.Stage;

	import views.StarlingContextView;
	import views.StarlingSubView;

	/**
	 * @author jamieowen
	 */
	public class StarlingConfig implements IConfig
	{
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		public function configure() : void
		{
			mediatorMap.map( StarlingContextView ).toMediator(StarlingContextViewMediator);
			mediatorMap.map( Stage ).toMediator(StarlingStageMediator);
			mediatorMap.map( StarlingSubView ).toMediator(StarlingSubViewMediator);
		}
	}
}
