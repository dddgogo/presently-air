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
	import com.intridea.presentlyAIRClient.events.UserLookupStatusesUpdatedEvent;
	import com.intridea.presentlyAIRClient.events.UserTimelineEvent;
	import com.intridea.presentlyAIRClient.utils.StatusesManager;
	import com.intridea.presentlyAIRClient.vo.Status;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	/**
     *
     * Retrieves timeline data for specific users via lookup requests. Updates statuses with results from 
     * Present.ly server. The view is bound to the statuses property on the data model and will update accordingly.
     * 
     * @see com.intridea.presentlyAIRClient.commands.AbstractCommand
     * @see com.adobe.cairngorm.commands.ICommand
     * @see mx.rpc.IResponder
     * 
     */
	public final class UserTimelineCommand extends AbstractCommand implements ICommand, IResponder
	{
		
		/**
		 * 
		 * Creates objects required to call the Present.ly server to request the user for the user lookup.
		 * 
		 * @param event Provides the id for the user being looked up.
		 * 
		 */
		override public function execute( event : CairngormEvent ) : void
		{
			var userTimelineEvent : UserTimelineEvent = event as UserTimelineEvent;
			var delegate : HTTPDelegate = new HTTPDelegate( this, model.currentUser, Services.USER_TIMELINE, ServiceConfigurations.USER_TIMELINE_URL );
			var param : Object = new Object();
			param.id = userTimelineEvent.id;
			delegate.callHTTPService( param );
		}
		
		/**
		 * 
		 * Updates the statuses on the data model returned for the user lookup request. Notifies the view that updated 
		 * statuses have been returned by the Present.ly server.
		 * 
		 * @param event Contains the statuses for the user lookup request. 
		 * 
		 */
		override public function result( event : Object ) : void
		{
			var resultEvent : ResultEvent = event as ResultEvent;
			var rawStatuses : ArrayCollection = resultEvent.result.statuses.status as ArrayCollection;
			var message : String = "New messages from user timeline received from server.";
			if ( rawStatuses )
			{
				var manager : StatusesManager = new StatusesManager();
				var statuses : ArrayCollection = new ArrayCollection();
				for each ( var status : Object in rawStatuses )
				{
					var serializedStatus : Status = manager.serialize( status );
					statuses.addItem( serializedStatus );
				}				
			}
			else
			{
				message = "You have no direct messages at this time.";
			}
			model.statusMessage = message;
			
			var userLookupStatusesUpdatedEvent : UserLookupStatusesUpdatedEvent = new UserLookupStatusesUpdatedEvent( UserLookupStatusesUpdatedEvent.EVENT );
			userLookupStatusesUpdatedEvent.statuses = statuses;
			userLookupStatusesUpdatedEvent.dispatch();
		}
		
		/**
		 * 
		 * Creates an Alert to notify the user that a problem has occured with the user lookup request.
		 * 
		 * @param event Contains error information for user lookup requests.
		 * 
		 */
		override public function fault( event : Object ):void
		{
			var faultEvent : FaultEvent = FaultEvent( event );			
			Alert.show("System error: " + faultEvent.fault );
		}
	}

}