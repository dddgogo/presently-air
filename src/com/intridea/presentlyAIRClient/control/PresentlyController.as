/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.presentlyAIRClient.control
{
	import com.adobe.cairngorm.control.FrontController;
	import com.intridea.presentlyAIRClient.commands.*;
	import com.intridea.presentlyAIRClient.events.*;
    
    /**
     *
     * Used to associate application events to commands. Events are
     * dispatched by users or the system. Commands contain the logic that
     * should be executed when the events are dispatched.
     * 
     * @see com.adobe.cairngorm.control.FrontController
     *
     */
	public final class PresentlyController extends FrontController
	{
	    /**
	     *
	     * Call the <code>initialize()</code> method to set up the event/command relationships.
	     *
	     */
		public function PresentlyController()
		{
			initialize();
		}
		
	    /**
	     *
	     * Assigns specific events to their corresponding command by calling the 
	     * <code>addCommand</code> method.
	     * 
	     */
		private function initialize() : void
		{
		    this.addCommand( SetSelectedViewStateEvent.EVENT, SetSelectedViewStateCommand );
		    this.addCommand( AuthenticationEvent.LOGIN_EVENT, LoginCommand );
		    this.addCommand( AuthenticationEvent.LOGOUT_EVENT, LogoutCommand );
		    this.addCommand( PublicTimelineEvent.EVENT, PublicTimelineCommand );
		    this.addCommand( UserTimelineEvent.EVENT, UserTimelineCommand );
		    this.addCommand( FriendsTimelineEvent.EVENT, FriendsTimelineCommand );
		    this.addCommand( RepliesEvent.EVENT, RepliesCommand );
		    this.addCommand( DirectMessagesEvent.EVENT, DirectMessagesCommand );
		    this.addCommand( SendTextUpdateEvent.EVENT, SendTextUpdateCommand );
		    this.addCommand( FriendsEvent.EVENT, FriendsCommand );
		    this.addCommand( FollowersEvent.EVENT, FollowersCommand );
		    this.addCommand( ShowEvent.EVENT, ShowCommand );
		    this.addCommand( ClearCurrentLookupUserScreenNameEvent.EVENT, ClearCurrentLookupUserScreenNameCommand );
		    this.addCommand( SetCurrentLookupUserScreenNameEvent.EVENT, SetCurrentLookupUserScreenNameCommand );
		    this.addCommand( InitializeAutoUpdateIntervalEvent.EVENT, InitializeAutoUpdateIntervalCommand );
		    this.addCommand( RefreshTimelineEvent.EVENT, RefreshTimelineCommand );
		    this.addCommand( UpdateAutoRefreshEvent.EVENT, UpdateAutoRefreshCommand );
		    this.addCommand( EnableTransparencyEvent.EVENT, EnableTransparencyCommand );
		    this.addCommand( UpdateTransparencyEvent.EVENT, UpdateTransparencyCommand );
		    this.addCommand( SetSystemTrayPreferenceEvent.EVENT, SetSystemTrayPreferenceCommand );
		    this.addCommand( InitializeSystemTrayEvent.EVENT, InitializeSystemTrayCommand );
		    this.addCommand( SetRememberLoginInfoPreferenceEvent.EVENT, SetRememberLoginInfoPreferenceCommand );
		    this.addCommand( ExitApplicationEvent.EVENT, ExitApplicationCommand );
		    this.addCommand( PersistUserSettingsToLocalDatabaseEvent.EVENT, PersistUserSettingsToLocalDatabaseCommand );
		    this.addCommand( SetMainStreamNotificationsPrefEvent.EVENT, SetMainStreamNotificationsPrefCommand );
		    this.addCommand( SetDirectMessagesNotificationsPrefEvent.EVENT, SetDirectMessagesNotificationsPrefCommand );
		    this.addCommand( CheckDatabaseForUserSettingsEvent.EVENT, CheckDatabaseForUserSettingsCommand );
		    this.addCommand( CreateUserSettingsDatabaseEvent.EVENT, CreateUserSettingsDatabaseCommand );
		    this.addCommand( PresentlyURLChangeEvent.EVENT, PresentlyURLChangeCommand );
		}
	}
}
