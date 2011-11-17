package  
{
	import flash.ui.*;
	import flash.net.*;
	import flash.utils.*;
	import flash.display.*;
	import flash.events.*;
	import flash.media.*;
	
	import Character;
	
	public class Cammy extends Character
	{
		public var jumpVelocity:int;
		public var attack:String;
		public var forwardVelocity:int;
		public var fallVelocity;
		public var combo:String;
		public var crouch:String;
		public var onCrouch:String;
		public static const ipunch:uint=78;
		public static const ikick:uint=77;	
		
		public static var block:uint=66;
		public static var LPunch:uint=77;
		public static var Mpunch:uint=7777;
		public static var Hpunch:uint=777777;
		public static var F_Lpunch:uint=3777;
		public static var F_Lrightpunch:uint=3977;
		public static var Lkick:uint=78;
		public static var Mkick:uint=7878;
		public static var Hkick:uint=787878;
		public static var F_Hkick:uint=37787878;
		public static var F_Hrightkick:uint=39787878;
		public static var F_Lkick:uint=3778;
		public static var F_Lrightkick:uint=3978;
		public static var C_Lpunch:uint=4077;
		public static var C_Mpunch:uint=407777;
		public static var C_Hpunch:uint=40777777;
		public static var C_Lkick:uint=4078;
		public static var C_Mkick:uint= 407878;
		public static var C_Hkick:uint=40787878;
		public static var J_Lpunch:uint=3877;
		public static var J_Mpunch:uint=387777;
		public static var J_Hpunch:uint=38777777;
		public static var J_Lkick:uint=4078;
		public static var J_Mkick:uint=407878;
		public static var J_Hkick:uint=40787878;
		public static var F_J_Hpunch:uint=3738777777;
		public static var F_J_Hrightpunch:uint=3938777777;
		public static var cannonDrill:uint=37377777;
		public static var cannonDrillright:uint=39397777;
		public static var thrustKick:uint=37377878;
		public static var thrustKickright:uint=39397878;
		public static var spinningKnuckle:uint=373877;
		public static var spinningKnuckleright:uint=393877;
		public static var suplex:uint=37373777;
		public static var suplexright:uint=39393977;
		public static var thighPress:uint=3737;
		public static var thighPressright:uint=3939;
		public static var Frankensteiner:uint=37373778;
		public static var Frankensteinerright:uint=39393978;
		public static var airbodytoss:uint=40383777;
		public static var airbodytossright:uint=40383977;	
		
		public function Cammy(bitmapData:BitmapData, frames:Array = null)
		{
			super(bitmapData, frames);
			jumpVelocity = 30;
			forwardVelocity = 9;
			fallVelocity = 20;
		}
		
		public override function onEnterFrame(e:Event)
		{
			super.onEnterFrame(e);
			
			switch(Main.KEYCODE)
			{
				
				case ipunch :

					attack = "LPunch";
					addEventListener(AnimatedSpriteEvent.ANIMATION_START, onAttack);
					addEventListener(AnimatedSpriteEvent.ANIMATION_COMPLETE, onAttackComplete);
					break;

				case ikick :

					attack = "LKick";
					addEventListener(AnimatedSpriteEvent.ANIMATION_START, onKick);
					addEventListener(AnimatedSpriteEvent.ANIMATION_COMPLETE, onKickComplete);
					break;

				case block :

					attack = "Block";
					addEventListener(AnimatedSpriteEvent.ANIMATION_START, onBlock);
					addEventListener(AnimatedSpriteEvent.ANIMATION_COMPLETE, onBlockComplete);
					break;
				
				case Keyboard.LEFT:
					
					play("Walking", 3);
					x -= 2;
					break;
				
				case Keyboard.RIGHT:
					
					play("Walking", 3);
					x += 2;
					break;
				
				case Keyboard.UP:
				
					play("Jump", 2, false);
				
					Main.STAGE.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyPressed);
					Main.STAGE.removeEventListener(KeyboardEvent.KEY_UP, onKeyReleased);
					
					removeEventListener(Event.ENTER_FRAME, onEnterFrame);
					
					addEventListener(AnimatedSpriteEvent.ANIMATION_BLIT_FRAME, onJump);
					addEventListener(AnimatedSpriteEvent.ANIMATION_COMPLETE, onJumpComplete);
					
					break;
			}
		}
		
		public override function onKeyPressed(e:KeyboardEvent)
		{
			super.onKeyPressed(e);
		}
		
		public override function onKeyReleased(e:KeyboardEvent = null)
		{
			super.onKeyReleased(e);
			
			play("Idle", 3);
		}
		
		public override function comboCheck(e:TimerEvent)
		{
			super.comboCheck(e);
			
			switch(int(comboKeys.join("")))
			{
					case Cammy.cannonDrill:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.cannonDrillright:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.thrustKick:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.thrustKickright:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.spinningKnuckle:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.spinningKnuckleright:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.suplex:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.suplexright:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.thighPress:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.thighPressright:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.F_J_Hpunch:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.F_J_Hrightpunch:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.Frankensteiner:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.Frankensteinerright:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.airbodytoss:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.airbodytossright:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;


				case Cammy.J_Hkick:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.J_Hpunch:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.C_Hpunch:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.F_Hkick:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.J_Mpunch:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.J_Mkick:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.C_Mkick:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.C_Mpunch:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.Hkick:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.Hpunch:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.J_Lkick:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.J_Lpunch:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.C_Lkick:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.C_Lpunch:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.F_Lkick:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.Mkick:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.F_Lpunch:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.Mpunch:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.Lkick:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

				case Cammy.LPunch:
					Main.KEYCODE = int(comboKeys.join(""));
					addEventListener(Event.ENTER_FRAME, onEnterFrame);
					break;

			}
			
			comboKeys = [];
		}
		
		public function onJump(e:Event)
		{
			if (currentFrame == 1)
			{
				y -= jumpVelocity;
			}
			else if (currentFrame == 3)
			{
				y += jumpVelocity;
			}
		}
		
		public function onCrouchComplete(e:Event)
		{
			y = 105;
			play("Idle", 3);
		}
		
		public function onAttack(e:Event)
		{
			play(attack,3,false);
		}
		
		public function onAttackComplete(e:Event)
		{
			Main.STAGE.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPressed);
			Main.STAGE.addEventListener(KeyboardEvent.KEY_UP, onKeyReleased);

			removeEventListener(AnimatedSpriteEvent.ANIMATION_START, onAttack);
			removeEventListener(AnimatedSpriteEvent.ANIMATION_COMPLETE, onAttackComplete);
			play("Idle",3);
		}
		
		public function onKick(e:Event)
		{
			play(attack,3,false);
		}
		
		public function onKickComplete(e:Event)
		{
			Main.STAGE.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPressed);
			Main.STAGE.addEventListener(KeyboardEvent.KEY_UP, onKeyReleased);

			removeEventListener(AnimatedSpriteEvent.ANIMATION_START, onKick);
			removeEventListener(AnimatedSpriteEvent.ANIMATION_COMPLETE, onKickComplete);
			play("Idle",3);

		}
		public function onBlock(e:Event)
		{
			play(attack,3,false);
		}
		
		public function onBlockComplete(e:Event)
		{
			Main.STAGE.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPressed);
			Main.STAGE.addEventListener(KeyboardEvent.KEY_UP, onKeyReleased);

			removeEventListener(AnimatedSpriteEvent.ANIMATION_START, onBlock);
			removeEventListener(AnimatedSpriteEvent.ANIMATION_COMPLETE, onBlockComplete);
			play("Idle", 3);
		}
		
		public function onJumpComplete(e:Event)
		{		
			Main.STAGE.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPressed);
			Main.STAGE.addEventListener(KeyboardEvent.KEY_UP, onKeyReleased);
			
			removeEventListener(AnimatedSpriteEvent.ANIMATION_BLIT_FRAME, onJump);
			removeEventListener(AnimatedSpriteEvent.ANIMATION_COMPLETE, onJumpComplete);
			
			play("Idle", 3);
		}
	}
}