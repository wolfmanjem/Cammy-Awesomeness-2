package
{
	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;
	
	public class StaticSprite extends Bitmap
	{
		public var source:Rectangle;
		
		public function StaticSprite(bitmapData:BitmapData)
		{
			super(bitmapData);
			
			super.x = 0;
			super.y = 0;
			
			source = new Rectangle(x, y, width, height);
		}
	
		public function update(e:Event = null)
		{
			Canvas(e.currentTarget).bitmapData.copyPixels(bitmapData, source, new Point(x, y));	
		}
	}
}