package
{
	import flash.events.*;
	
	public class AnimatedSpriteEvent extends Event
	{
		public static const ANIMATION_START:String = "animation_start";
		public static const ANIMATION_COMPLETE:String = "animation_complete";
		public static const ANIMATION_BLIT_FRAME:String = "animation_blit_frame";
		
		public function AnimatedSpriteEvent(type:String = "", bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
		
		public override  function clone():Event 
		{
			return new AnimatedSpriteEvent(type, bubbles, cancelable);
        }
		
        public override  function toString():String 
		{
			return formatToString("AnimatedSpriteEvent", "StartingPoint", "type", "bubbles", "cancelable");
        }

	}
}