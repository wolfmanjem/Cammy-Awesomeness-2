package
{
	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;
	
	import StaticSprite;
	
	public class AnimatedSprite extends StaticSprite
	{
		public var delay:uint;
		public var repeat:Boolean;
		public var frames:Array;
		public var currentAnimation:String;
		public var currentFrame:uint; 
		public var animationTimer:uint;
		public var totalFrames:uint;
		
		private var stopped:Boolean;
		
		public function AnimatedSprite(bitmapData:BitmapData, frames:Array = null)
		{
			super(bitmapData);
			
			this.frames = frames;
			this.delay = 0;
			repeat = true;
			currentFrame = 0;
			animationTimer = 0;
			stopped = true;
		}

		public override function update(e:Event = null)
		{
			if (!stopped)
			{
				if ((currentFrame == 0) && (animationTimer == 0))
				{
					dispatchEvent(new AnimatedSpriteEvent(AnimatedSpriteEvent.ANIMATION_START));
				}
				
				if(animationTimer == delay)
				{
					currentFrame++;
					animationTimer = 0;
					
					if (currentFrame == totalFrames)
					{
						currentFrame = 0;
						
						if (repeat == false)
						{
							dispatchEvent(new AnimatedSpriteEvent(AnimatedSpriteEvent.ANIMATION_COMPLETE));
						}
					}
					else
					{
						dispatchEvent(new AnimatedSpriteEvent(AnimatedSpriteEvent.ANIMATION_BLIT_FRAME));
					}
				}
				else
				{
					animationTimer++;
				}
			}
			
			try
			{
				Canvas(e.currentTarget).bitmapData.copyPixels(bitmapData, frames[currentAnimation][currentFrame], new Point(x, y));
			}
			catch (error:Error)
			{
				currentFrame = 0;
				
				Canvas(e.currentTarget).bitmapData.copyPixels(bitmapData, frames[currentAnimation][currentFrame], new Point(x, y));
			}
		}
		
		public function play(animationType:String, delay:uint, repeat:Boolean = true)
		{
			currentAnimation = animationType;
			totalFrames = frames[currentAnimation].length;
			
			this.delay = delay;
			this.repeat = repeat;
			
			stopped = false;
			
			if (this.repeat == false)
			{
				currentFrame = 0;
				animationTimer = 0;
			}
		}
		
		public function stop()
		{
			stopped = true;
		}
	}
}