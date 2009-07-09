/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */
 
package com.intridea.presentlyAIRClient.commands
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.intridea.presentlyAIRClient.events.InitializeAutoUpdateIntervalEvent;
	import com.intridea.presentlyAIRClient.events.RefreshTimelineEvent;
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
     *
     * Sets up the auto update interval used by the application to call the current service and update the main timeline view.
     * 
     * @see com.adobe.cairngorm.commands.ICommand
     * 
     */
	public final class InitializeAutoUpdateIntervalCommand implements ICommand
	{
		
		/**
		 * 
		 * Defines a reference to the <code>ModelLocator</code> implementation.
		 * 
		 */
		private static var model : ModelLocator = ModelLocator.instance;
		
		/**
		 * 
		 * Used to call the current service and update the statuses timeline view at intervals supplied by the user
		 * through the settings view.
		 * 
		 * @see flash.utils.Timer 
		 * 
		 */
		private var timer : Timer;
		
		/**
		 * 
		 * Creates the <code>Timer</code> instance used for the auto interval call to the Present.ly server. Sets the 
		 * initial value of the auto update.
		 * 
		 * @see com.adobe.cairngorm.control.CairngormEvent
		 * 
		 */
		public function execute( event : CairngormEvent ) : void
		{
			model.autoUpdateInterval = 200000;
			var initializeAutoUpdateIntervalEvent : InitializeAutoUpdateIntervalEvent = event as InitializeAutoUpdateIntervalEvent;
			timer = new Timer( model.autoUpdateInterval );
	        timer.addEventListener( TimerEvent.TIMER, timerTick, false, 0, false );	
	        timer.start();
		}
		
		/**
		 * 
		 * Creates and dispatches a <code>RefreshTimelineEvent</code>. <code>MainView</code> is registered to listen to the
		 * broadcasting of the <code>RefreshTimelineEvent</code>. When broadcast the <code>StatusesTimeline</code> is updated 
		 * with the most recent statuses returned by the Present.ly server.
		 * 
		 * @param event Standard <code>TimerEvent</code>. Not used in this method.
		 * @see com.intridea.presentlyAIRClient.events.RefreshTimelineEvent
		 * @see com.intridea.presentlyAIRClient.views.MainView
		 * @see com.intridea.presentlyAIRClient.views.StatusesTimeline
		 * 
		 */
		private function timerTick( event : TimerEvent ) : void
		{
			var refreshEvent : RefreshTimelineEvent = new RefreshTimelineEvent( RefreshTimelineEvent.EVENT );
			refreshEvent.currentService = model.currentService;
			refreshEvent.dispatch();
		}
	}		

}