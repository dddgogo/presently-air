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
	import com.intridea.presentlyAIRClient.events.PublicTimelineEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	/**
     *
     * Retrieves public timeline data from the Present.ly server and updates the data model. The view is bound to
     * the statuses property on the data model and will update accordingly.
     * 
     * @see com.intridea.presentlyAIRClient.commands.AbstractCommand
     * @see com.adobe.cairngorm.commands.ICommand
     * @see mx.rpc.IResponder
     * 
     */
	public final class PublicTimelineCommand extends AbstractCommand implements ICommand, IResponder
	{
		
		/**
		 * 
		 * Sets the current service on the data model. Creates a delegate to gather publc timeline statuses
		 * from the Present.ly server.
		 * 
		 * @param event Dispatched from the view to run this command. Not used in this method.
		 * 
		 */
		override public function execute( event : CairngormEvent ) : void
		{
			model.currentService = "publicTimeline";
			
			var publicTimelineEvent : PublicTimelineEvent = event as PublicTimelineEvent;
			var delegate : HTTPDelegate = new HTTPDelegate( this, model.currentUser, Services.PUBLIC_TIMELINE, ServiceConfigurations.PUBLIC_TIMELINE_URL );
			delegate.callHTTPService();
		}
		
		/**
		 * 
		 * Handles response from server containing public timeline data. Updates the 
		 * <code>StatusesManager</code> on the data model with the direct messages.
		 * 
		 * @param result Contains the statuses retrived from the Present.ly server.
		 * 
		 */
		override public function result( event : Object ) : void
		{
			var resultEvent : ResultEvent = event as ResultEvent;
			var statuses : ArrayCollection = resultEvent.result.statuses.status as ArrayCollection;			
			var message : String = "New public messages received from server.";
			if ( statuses )
			{
				model.statusesManager.addStatuses( statuses.source );				
			}
			else
			{
				message = "You have no public messages at this time.";
			}
			model.statusMessage = message;
		}
		
		/**
		 * 
		 * Creates an Alert to notify the user that a problem has occured with the request for the public timeline 
		 * data from the Present.ly server.
		 * 
		 * @param event Contains error information for failed public timeline requests.
		 * 
		 */
		override public function fault( event : Object ):void
		{
			var faultEvent : FaultEvent = FaultEvent( event );
			Alert.show("System error: " + faultEvent.fault );
		}
	}

}