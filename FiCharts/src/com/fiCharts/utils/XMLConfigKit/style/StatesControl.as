package com.fiCharts.utils.XMLConfigKit.style
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	/**
	 */	
	public class StatesControl
	{
		public function StatesControl(target:IStyleStatesUI, states:States = null)
		{
			ui = target;
			
			ui.addEventListener(MouseEvent.ROLL_OVER, overHandler, false, 0, true);
			ui.addEventListener(MouseEvent.ROLL_OUT, outHandler, false, 0, true);
			ui.addEventListener(MouseEvent.MOUSE_DOWN, downHandler, false, 0, true);
			ui.addEventListener(MouseEvent.MOUSE_UP, upHandler, false, 0, true);
		}

		/**
		 */		
		private var ui:IStyleStatesUI;
		
		/**
		 */		
		private var _states:States;

		/**
		 */
		public function get states():States
		{
			return _states;
		}

		/**
		 * @private
		 */
		public function set states(value:States):void
		{
			_states = value;
			ui.style = states.getNormal;
		}

		/**
		 */		
		private function overHandler(evt:MouseEvent):void
		{
			//trace(this.ui, 'over', this.enable);
			if (enable)
				this.toHover();
		}
		
		/**
		 */		
		private function outHandler(evt:MouseEvent):void
		{
			//trace(this.ui, 'out', this.enable);
			if (enable)
				this.toNormal();
		}
		
		/**
		 */		
		private function downHandler(evt:MouseEvent):void
		{
			//trace(this.ui, 'down');
			if (enable)
				this.toDown();	
		}
		
		/**
		 */		
		private function upHandler(evt:MouseEvent):void
		{
			//trace(this.ui, 'up');	
			if (enable)
				this.toHover();
		}
		
		/**
		 */		
		public function toNormal():void
		{
			ui.normalHandler();
			
			if (states && states.normal)
			{
				ui.style = states.getNormal;
				ui.render();
			}
		}
		
		/**
		 */		
		public function toHover():void
		{
			ui.hoverHandler();
			
			if (states && states.hover)
			{
				ui.style = states.getHover;
				ui.render();
			}
		}
		
		/**
		 */		
		public function toDown():void
		{
			ui.downHandler();
			
			if (states && states.down)
			{
				ui.style = states.getDown;
				ui.render();
			}
		}
		
		/**
		 */		
		private var _enable:Boolean = true;

		/**
		 */
		public function get enable():Boolean
		{
			return _enable;
		}

		/**
		 * @private
		 */
		public function set enable(value:Boolean):void
		{
			_enable = value;
		}
		
		/**
		 */		
		public function toShow():void
		{
			if (enable)
				ui.visible = true;
		}
		
		public function toHide():void
		{
			if (enable)
				ui.visible = false;
		}
	}
}