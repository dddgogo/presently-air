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
	import com.intridea.presentlyAIRClient.business.HTTPDelegate;
	import com.intridea.presentlyAIRClient.business.ServiceConfigurations;
	import com.intridea.presentlyAIRClient.business.Services;
	import com.intridea.presentlyAIRClient.events.FollowersEvent;
	import com.intridea.presentlyAIRClient.events.FollowersRetrievedEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	/**
     *
     * Retrieves the current user's followers from the Present.ly server and updates the data model.
     * 
     * @see com.intridea.presentlyAIRClient.commands.AbstractCommand
     * @see com.adobe.cairngorm.commands.ICommand
     * @see mx.rpc.IResponder
     * 
     */
	public final class FollowersCommand extends AbstractCommand implements ICommand, IResponder
	{
		
		/**
		 * 
		 * Sets the current service on the data model. Creates a delegate to gather the current user's followers
		 * from the Present.ly server.
		 * 
		 * @param event Dispatched from the view to run this command. Not used in this method.
		 * 
		 */
		override public function execute( event : CairngormEvent ) : void
		{
			
			model.currentService = "followers";
			
			var followersEvent : FollowersEvent = event as FollowersEvent;
			var delegate : HTTPDelegate = new HTTPDelegate( this, model.currentUser, Services.FOLLOWERS, ServiceConfigurations.FOLLOWERS_URL );
			delegate.callHTTPService();
		}
		
		/**
		 * 
		 * Update the data model with the current user's followers data response returned by the Present.ly server.
		 * 
		 * @param event Contains the followers retrieved from the Present.ly server. 
		 * 
		 */
		override public function result( event : Object ) : void
		{
			var resultEvent : ResultEvent = event as ResultEvent;
			
			// NOTE: need to handle the case where there is only 1 user in resultEvent.result.users.user
			// the result cannot be cast to an ArrayCollection in that case. it is just an Object object
			var followers : ArrayCollection = resultEvent.result.users.user as ArrayCollection;
			
			if ( followers )
			{
				model.followers = followers.source;
			
				model.statusMessage = "Followers received from server.";
			
				new FollowersRetrievedEvent().dispatch();
			}
		}
		
		/**
		 * 
		 * Creates an Alert to notify the user that a problem has occured with the request for the user's followers 
		 * from the Present.ly server.
		 * 
		 * @param event Contains error information for failed followers requests.
		 * 
		 */
		override public function fault( event : Object ):void
		{
			var faultEvent : FaultEvent = FaultEvent( event );			
			Alert.show("System error: " + faultEvent.fault );
		}
	}

}