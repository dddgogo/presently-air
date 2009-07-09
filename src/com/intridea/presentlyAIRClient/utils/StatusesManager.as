/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */
 
package com.intridea.presentlyAIRClient.utils
{
	import com.intridea.presentlyAIRClient.events.StatusAddedEvent;
	import com.intridea.presentlyAIRClient.events.StatusesUpdatedEvent;
	import com.intridea.presentlyAIRClient.vo.Status;
	
	[Bindable]
	/**
	 * 
	 * Provides serialization methods for <code>Status</code> objects. Facilitates the updates
	 * of new <code>Status</code> objects. Intended to house all other <code>User</code> related 
	 * tasks and functionality.
	 * 
	 */
	public final class StatusesManager
	{
		/**
		 * 
		 * Represents the collection of client side <code>Status</code> objects.
		 * 
		 */		
		private var _statuses : Array;
		
		/**
		 * 
		 * Provides serialization methods for <code>Status</code> objects. Facilitates the updates
		 * of new <code>Status</code> objects. Intended to house all other <code>Status</code> related 
		 * tasks and functionality.
		 * 
		 * @see com.intridea.presentlyAIRClient.vo.Status
		 * 
		 */
		public function StatusesManager()
		{
			_statuses = new Array();
		}
		
		/**
		 * 
		 * Hand back the collection of client side <code>Status</code> objects.
		 * 
		 * @return _statuses The collection of client side <code>Status</code> objects.
		 * 
		 */
		public function getStatuses() : Array
		{
			return _statuses;
		}
		
		/**
		 * 
		 * Updates the collection of client side <code>Status</code> objects. Notifies the view that the client
		 * side statuses collection has been updated.
		 * 
		 * @param statuses A collection of <code>Status</code> objects that will be added to the client side <code>Status</code> object collection.  
		 * 
		 */
		public function addStatuses( statuses : Array ) : void
		{
			_statuses = new Array();
			
			if ( !statuses )
			{
				throw new Error( "No statuses argument passed to StatusesManager.addStatuses method. Expected an ArrayCollection of Object objects." );
			}
			else
			{
				for each ( var status : Object in statuses )
				{
					var serializedStatus : Status = serialize( status );
					addStatus( serializedStatus );
				}
			}
			
			new StatusesUpdatedEvent( StatusesUpdatedEvent.EVENT ).dispatch();
			
		}
		
		/**
		 * 
		 * Interrogate the collection of client side <code>Status</code> objects. Compare the text message of 
		 * each one and return matching the instances.
		 * 
		 * @param statusArg The specific <code>Status</code> that is being located.
		 * 
		 */
		public function getStatus( statusArg : Status ) : Status
		{
			var returnStatus : Status;

			for ( var i:int=0;i<_statuses.length;i++ )
			{
				
				if ( statusArg.text == _statuses[i].text )
				{
					returnStatus = _statuses[i] as Status;
				}
			}

			return returnStatus;
		}
		
		/**
		 * 
		 * Update the client side statuses memory store. Notify the view that the statuses have been udpated.
		 * 
		 * @param status A binary representation of a Present.ly <code>Status</code> object.
		 * @see com.intridea.presentlyAIRClient.vo.Status
		 * 
		 */
		public function addStatus( status : Status ) : void
		{
			_statuses.push( status );
			
			var statusAddedEvent : StatusAddedEvent = new StatusAddedEvent();
			statusAddedEvent.status = status;
			statusAddedEvent.dispatch();
		}
		
		/**
		 * 
		 * Converts an XML representation of a Present.ly status to a binary ActionScript object available for
		 * use in the Present.ly AIR Client.
		 * 
		 * @param rawUser The XML status representation returned by the Present.ly server.
		 * @return user The binary ActionScript <code>Status</code> object.
		 * com.intridea.presentlyAIRClient.vo.Status
		 * 
		 */
		public function serialize( rawStatus : Object ) : Status
		{
			var s : Status = new Status();
			s.createdAt = new Date( rawStatus.created_at );
			s.ID = rawStatus.id;
			s.text = rawStatus.text;
			s.source = rawStatus.source;
			s.truncated = rawStatus.truncated;
			s.inReplyToStatusID = rawStatus.in_reply_to_status_id;
			s.inReplyToUserID = rawStatus.in_reply_to_user_id;
			s.favorited = rawStatus.favorited;
			
			// statuses with the receiver property are direct messages from one user to another.
			if ( rawStatus.receiver )
			{
				s.isDirectMessage = true;
			}
			
			// isReply property for each Status instance is set in the Status class 
			// and is determine by the presence of an @ symbol as the first character 
			// in the text property string 
			
			s.user = UserManager.serialize( rawStatus.user );			
			return s;
		}
	}
}