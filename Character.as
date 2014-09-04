package  
{
	import flash.ui.*;
	import flash.utils.*;
	import flash.display.*;
	import flash.events.*;
	
	import Main;
	import AnimatedSprite;
	
	public class Character extends AnimatedSprite
	{
		public var comboKeys:Array = [];
		public var timeout:int = 1000;
		protected var comboTimeoutTimer:Timer = null;
		
		public function Character(bitmapData:BitmapData, frames:Array = null) 
		{
			super(bitmapData, frames);
						
			Main.STAGE.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPressed);
			Main.STAGE.addEventListener(KeyboardEvent.KEY_UP, onKeyReleased);
		}
		
		public function onEnterFrame(e:Event)
		{
			
		}
		
		public function onKeyPressed(e:KeyboardEvent)
		{
		    // reset combo timeout timer
			if (comboTimeoutTimer) {
				comboTimeoutTimer.stop();
				comboTimeoutTimer = null;
			}
			
			Main.KEYCODE = e.keyCode;
			comboKeys.push(e.keyCode);
			var combo:String = comboKeys.join(',');
			comboCheck(combo);
			
			// start timeout timer
			comboTimeoutTimer = new Timer(timeout, 0);
			comboTimeoutTimer.addEventListener(TimerEvent.TIMER, clearCombo);
			comboTimeoutTimer.start();
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		public function onKeyReleased(e:KeyboardEvent = null)
		{
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		protected function clearCombo(e:TimerEvent)
		{
			comboKeys = [];
		}
		
		protected function comboCheck()
		{
            // override in subclass
		}
	}
}
