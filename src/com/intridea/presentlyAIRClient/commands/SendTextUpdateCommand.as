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
	import com.intridea.presentlyAIRClient.business.SendTextUpdateDelegate;
	import com.intridea.presentlyAIRClient.events.RefreshTimelineEvent;
	import com.intridea.presentlyAIRClient.events.SendTextUpdateEvent;
	import com.intridea.presentlyAIRClient.events.TextUpdateSentEvent;
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	import com.intridea.presentlyAIRClient.vo.Status;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	/**
     *
     * Send text messages entered by the user to the Present.ly server and notifies the view when the
     * text message has been sent.
     * 
     * @see com.intridea.presentlyAIRClient.commands.AbstractCommand
     * @see com.adobe.cairngorm.commands.ICommand
     * @see mx.rpc.IResponder
     * 
     */
	public final class SendTextUpdateCommand implements ICommand, IResponder
	{
		
		/**
		 * 
		 * Collects text entered by user from the inbound event. Checks to ensure the text message is
		 * under the maximum character count. Creates the objects required to call the Present.ly
		 * server and send the text message.
		 * 
		 * @param event Provides the text message entered into the <code>MainView</code> by the user.
		 * 
		 */
		public function execute( event : CairngormEvent ) : void
		{
			var sendTextUpdateEvent : SendTextUpdateEvent = event as SendTextUpdateEvent;
			var textUpdate : String = sendTextUpdateEvent.textUpdate;
			if ( textUpdate.length < 140 )
			{				
				var delegate : SendTextUpdateDelegate = new SendTextUpdateDelegate( this );
				delegate.callHTTPService( textUpdate );
			}
		}
		
		/**
		 * 
		 * Notifies the view that the text message was sent.
		 * 
		 * @param event Contains the <code>Status</code> instance returned by the Present.ly server for the
		 * text message update request. 
		 * 
		 */
		public function result( event : Object ) : void
		{
			var resultEvent : ResultEvent = event as ResultEvent;		
			var status : Status = ModelLocator.instance.statusesManager.serialize( resultEvent.result.status );			
			new TextUpdateSentEvent( TextUpdateSentEvent.EVENT ).dispatch();		
		}
		
		/**
		 * 
		 * Creates an Alert to notify the user that a problem has occured with the text message update request  
		 * to the Present.ly server.
		 * 
		 * @param event Contains error information for failed text message update requests.
		 * 
		 */
		public function fault( event : Object ):void
		{
			var faultEvent : FaultEvent = FaultEvent( event );
			Alert.show("System error: " + faultEvent.fault );
		}
	}

}