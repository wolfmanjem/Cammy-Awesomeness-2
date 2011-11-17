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
		public var comboTimer:Timer;
		public var comboKeys:Array = [];
		public var timeout:int = 500;
		
		public function Character(bitmapData:BitmapData, frames:Array = null) 
		{
			super(bitmapData, frames);
			
			comboTimer = new Timer(timeout, 0);
			
			Main.STAGE.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPressed);
			Main.STAGE.addEventListener(KeyboardEvent.KEY_UP, onKeyReleased);
			
			comboTimer.addEventListener(TimerEvent.TIMER, comboCheck);
		}
		
		public function onEnterFrame(e:Event)
		{
			
		}
		
		public function onKeyPressed(e:KeyboardEvent)
		{
			comboTimer.start();
			Main.KEYCODE = e.keyCode;
			comboKeys.push(e.keyCode);
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		public function onKeyReleased(e:KeyboardEvent = null)
		{
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		public function comboCheck(e:TimerEvent)
		{

		}
	}
}
