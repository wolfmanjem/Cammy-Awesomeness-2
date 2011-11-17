package
{
	import flash.events.*;
	
	public class SpriteLoaderEvent extends Event
	{
		public static const LOADED:String = "loaded";
		
		public function SpriteLoaderEvent(type:String = "loaded", bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
		
		public override  function clone():Event 
		{
			return new SpriteLoaderEvent(type, bubbles, cancelable);
        }
		
        public override  function toString():String 
		{
			return formatToString("SpriteLoaderEvent", "StartingPoint", "type", "bubbles", "cancelable");
        }

	}
}