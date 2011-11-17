package
{
	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;
	import flash.xml.*;
	import flash.net.*;
	
	import SpriteLoaderEvent;
	
	public class SpriteLoader extends EventDispatcher
	{
		public var xmlLoader:URLLoader;
		public var xmlRoot:XML;
		
		public var name:String;
		
		public var spriteSheetName:String;
		public var spriteSheetWidth:uint;
		public var spriteSheetHeight:uint;
		
		public var animation:Array;
		
		public function SpriteLoader(spriteFilename:String = "")
		{
			xmlLoader = new URLLoader();
			
			xmlLoader.addEventListener(Event.COMPLETE, onXMLLoad);
			
			xmlLoader.load(new URLRequest(spriteFilename));
		}
		
		public function onXMLLoad(e:Event)
		{
			var animationDefinitions:XMLList;
			var i:uint;
			
			xmlRoot = new XML(e.target.data);

			spriteSheetName = xmlRoot.attribute("name");
			spriteSheetWidth = uint(xmlRoot.attribute("w"));
			spriteSheetHeight = uint(xmlRoot.attribute("h"));
			
			animationDefinitions = xmlRoot.definitions.dir;
			
			name = animationDefinitions.attribute("name");
			
			animation = new Array(animationDefinitions.children().length());
			
			for each(var animationElement:XML in animationDefinitions.children())
			{
				var animationName:String = String(animationElement.attribute("name"));
				var animationLength:uint = animationElement.children().length();
				
				animation[animationName] = new Array(animationLength);
				
				for each(var animationFrame:XML in animationElement.children())
				{
					var frameNum:uint = uint(animationFrame.attribute("name"));
					var x:uint = uint(animationFrame.attribute("x"));
					var y:uint = uint(animationFrame.attribute("y"));
					var width:uint = uint(animationFrame.attribute("w"));
					var height:uint = uint(animationFrame.attribute("h"));
					
					animation[animationName][frameNum] = new Rectangle(x, y, width, height);
				}
			}
			
			dispatchEvent(new SpriteLoaderEvent(SpriteLoaderEvent.LOADED));
		}
	}
}