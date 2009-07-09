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
	import com.intridea.presentlyAIRClient.events.DirectMessagesEvent;
	import com.intridea.presentlyAIRClient.events.FriendsTimelineEvent;
	import com.intridea.presentlyAIRClient.events.PublicTimelineEvent;
	import com.intridea.presentlyAIRClient.events.RefreshTimelineEvent;
	import com.intridea.presentlyAIRClient.events.RepliesEvent;
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	
	/**
     *
     * Calls the Present.ly server using the current data model's service property. The view is bound to
     * the statuses property on the data model and will update accordingly.
     * 
     * @see com.adobe.cairngorm.commands.ICommand
     * 
     */
	public final class RefreshTimelineCommand implements ICommand
	{
		
		/**
		 * 
		 * Defines a reference to the <code>ModelLocator</code> implementation.
		 * 
		 * @see com.intridea.presentlyAIRClient.model.ModelLocator
		 * 
		 */
		private static var model : ModelLocator = ModelLocator.instance;
		
		/**
		 * 
		 * Send events to request statuses for the current service. Updates the current service 
		 * property on the data model. Updates statuses in the view.
		 * 
		 * @param event Determines the appropriate service event to call. 
		 * 
		 */
		public function execute( event : CairngormEvent ) : void
		{
			var refreshTimelineEvent : RefreshTimelineEvent = event as RefreshTimelineEvent;
			
			if ( !refreshTimelineEvent.currentService )
			{
				// provides a default service for the refresh event should the model property become null
				refreshTimelineEvent.currentService = "friendsTimeline";	
			}
			
			// resets the current service reference
			model.currentService = refreshTimelineEvent.currentService;
			
			if ( model.isAuthenticated )
			{
				if ( model.currentService == "friendsTimeline" )
				{
					new FriendsTimelineEvent( FriendsTimelineEvent.EVENT ).dispatch();
				}
				else if ( model.currentService == "publicTimeline" )
				{
					new PublicTimelineEvent( PublicTimelineEvent.EVENT ).dispatch();
				}
				else if ( model.currentService == "repliesTimeline" )
				{
					new RepliesEvent( RepliesEvent.EVENT ).dispatch();
				}
				else if ( model.currentService == "directMessagesTimeline" )
				{
					new DirectMessagesEvent( DirectMessagesEvent.EVENT ).dispatch();
				}
			}
		}
	}
}