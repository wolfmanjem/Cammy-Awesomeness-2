package
{
	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;
	
	import Canvas;
	import StaticSprite;
	import AnimatedSprite;
	import SpriteLoader;
	import SpriteLoaderEvent;
	
	public class Main extends Sprite
	{
		public static var STAGE:Stage;
		public static var KEYCODE:uint;
		public static const MAXX:uint = 512;
		public static const MAXY:uint = 223;
		
		public var canvas:Canvas;
		
		public var backgroundSprite:StaticSprite;
		
		public var cammy:Cammy;
		public var cammySpriteData:SpriteLoader;
		
		public function Main()
		{
			Main.STAGE = stage;
			
			canvas = new Canvas(512, 223);
			
			backgroundSprite = new StaticSprite(new CammyStageBG());
			
			cammySpriteData = new SpriteLoader("media/cammy.sprites");
			cammySpriteData.addEventListener(SpriteLoaderEvent.LOADED, onLoaded);
			
			canvas.addSprite(backgroundSprite);
			
			addChild(canvas);
		}
		
		public function onLoaded(e:SpriteLoaderEvent)
		{
			cammy = new Cammy(new CammySpriteSheet(), cammySpriteData.animation);
			
			cammy.x = 100;
			cammy.y = 115;
			cammy.play("Idle", 3);
			
			cammySpriteData.removeEventListener(SpriteLoaderEvent.LOADED, onLoaded);
			
			canvas.addSprite(cammy);
		}
	}
}