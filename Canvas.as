package
{
	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;
	
	import StaticSprite;
	import AnimatedSprite;
	
	public class Canvas extends Bitmap
	{
		public static var CANVAS:Canvas;
		
		public var imageContainer:Array;
		
		public function Canvas(width:uint = 0, height:uint = 0)
		{
			super(new BitmapData(width, height, false));
			
			imageContainer = new Array();
			
			Canvas.CANVAS = this;
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function addSprite(image:Bitmap = null)
		{
			imageContainer.push(image);
		}
		
		public function removeSprite(image:Bitmap = null)
		{
			var i:int;
			
			for (i = 0; i < imageContainer.length; i++)
			{
				if (imageContainer[i] == image)
				{
					imageContainer.splice(i, 1);
				}
			}
		}
		
		public function update(e:Event = null)
		{
			bitmapData.lock();
			
			for each(var image:StaticSprite in imageContainer)
			{
				image.update(e);
			}
			
			bitmapData.unlock();
		}
	}
}