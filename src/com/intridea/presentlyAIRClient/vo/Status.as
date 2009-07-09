/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */
 
package com.intridea.presentlyAIRClient.vo
{
	import com.intridea.presentlyAIRClient.model.domain.User;
	
	[Bindable]
	/**
	 * 
	 * Represents a status text message in the Present.ly system.
	 * 
	 */
	public final class Status
	{	
		/**
		 * 
		 * Represents the creation data of this <code>Status</code> in the Present.ly system.
		 * 
		 */
		public var createdAt : Date;
	    
	    /**
		 * 
		 * Represents the system based id associated with this <code>Status</code>.
		 * 
		 */
	    public var ID : String;
	    
	    /**
		 * 
		 * Represents the text message collected by a <code>User</code> of the Present.ly system.
		 * 
		 */
	    public var text : String;
	    
	    /**
		 * 
		 * Represents the origin of this <code>Status</code>.
		 * 
		 */
	    public var source : String;
	    
	    /**
		 * 
		 * If the text in this <code>Status</code> has trailing text beyond the 140 character limit mandated 
		 * by the Present.ly API. <code>User</code>, (not used in the current AIR client implementation).
		 * 
		 */
	    public var truncated : Boolean;
	    
	    /**
		 *
		 * If this <code>Status</code> is in reply to another <code>Status</code>, (not used in the current AIR client implementation).
		 *  
		 */
	    public var inReplyToStatusID : String;
	    
	    /**
		 * 
		 * If this <code>Status</code> is in reply to another <code>User</code>, (not used in the current AIR client implementation).
		 * 
		 */
	    public var inReplyToUserID : String;
	    
	    /**
		 * 
		 * If this <code>Status</code> has been marked as a favorite, (not used in the current AIR client implementation).
		 * 
		 */
	    public var favorited : Boolean;
	    
	    /**
		 * 
		 * The main participant in the interactions with the Present.ly AIR client.
		 * @see com.intridea.presentlyAIRClient.model.domain.User
		 * 
		 */
	    public var user : User;
	    
	    /**
	     * 
	     * If this <code>Status</code> is a direct message in the Present.ly system or a just a standard <code>Status</code>.
	     * 
	     */
	    public var isDirectMessage : Boolean = false;
	    
	    /**
	     * 
	     * If this <code>Status</code> is a reply in the Present.ly system or a just a standard <code>Status</code>.
	     * 
	     */
	    private var _isReply : Boolean; 
	    
	    public function get isReply() : Boolean
	    {
	    	var reply : Boolean = ( this.text.substr( 0, 1 ) == '@' );
	    	return reply;
	    }
	    
	    /* public function set isReply( isReply : Boolean ) : void
	    {
	    	_isReply = isReply;
	    } */
	    
	    /**
		 * 
		 * Provides support for abberiviated English month names.
		 * 
		 */
	    private const months : Array = new Array(
            'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
            'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
        );
		
		/**
		 * 
		 * Represents a status text message in the Present.ly system.
		 * 
		 */
		public function Status()
		{
		}
		
		/**
		 * 
		 * Convert user creation date to Present.ly specific formatting.
		 * 
		 */
		public function getCreatedAtString() : String
		{
            var dt:Date = new Date();
            var timeStr:String = "";

            var hour : int = createdAt.getHours();
            var amPm:String = "am";
            if ( hour >= 12 )
            {
                amPm = "pm";
                hour = hour - 12;
            }
            if (hour == 0)
            {
                hour = 12;
            }

            timeStr = hour.toString() + 
            			":" + 
            			zeroPad( createdAt.getMinutes(), 2 ) + 
            			amPm;

            if ( dt.getDate() != createdAt.getDate() ||
                dt.getMonth() != createdAt.getMonth() ||
                dt.getFullYear() != createdAt.getFullYear())
            {
                // Different day, prepend the day information
                timeStr += ' on ' + 
                			months[ createdAt.getMonth() ] + 
                			' ' + createdAt.getDate();
            }

            // Append the year string if it is not the current year
            if (dt.getFullYear() != createdAt.getFullYear())
            {
                timeStr += ', ' + 
                			createdAt.getFullYear().toString();
            }
			trace( "timeStr: " + timeStr );
            return timeStr;
            //var timeStr:String = dt.getHours()+":"+dt.getMinutes()+dt.get
        }
        
        /**
		 * 
		 * Provides support adding a zero to the beginning of single digit numbers, i.e.: 03. This 
		 * formatting is not available by default in Flex. 
		 * 
		 */
        private function zeroPad( number : Number, size : int ) : String
        {
            var s : String = number.toString();
            while ( s.length < size ) {
                s = "0" + s;
            }
            return s;
        }
		
		/**
		 * 
		 * Used for diagnostics, testing, debugging and trace statements.
		 * 
		 */
		public function toString() : String
		{
			return 	"createdAt: "			 + getCreatedAtString() + ", " +
					"ID: "				     + ID + ", " +
					"text: "				 + text + ", " +
					"source: "				 + source + ", " +
					"truncated: "			 + truncated + ", " +
					"inReplyToStatusID: "	 + inReplyToStatusID + ", " + 
					"inReplyToUserID: "		 + inReplyToUserID + ", " +
					"favorited: "			 + favorited + ", " +
					"isReply: "				 + isReply + ", " +
					"user: "				 + user.toString();
		}

	}
}