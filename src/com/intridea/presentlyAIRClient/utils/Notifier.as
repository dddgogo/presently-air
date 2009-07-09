/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Intridea (edited by Sean Moore)
 
 @internal
 */
 
package com.intridea.presentlyAIRClient.utils
{

    import com.intridea.presentlyAIRClient.view.InfoNotification;
    import com.intridea.presentlyAIRClient.view.NotificationWindow;
    import com.intridea.presentlyAIRClient.vo.Status;
    
    import flash.display.NativeWindowSystemChrome;
    import flash.display.NativeWindowType;
    import flash.display.Screen;
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.TimerEvent;
    import flash.utils.Timer;

    public class Notifier extends EventDispatcher
    {
    	/**
    	 * 
    	 */
        private var _timer : Timer;
        
        /**
    	 * 
    	 */
        private var _lifeTicks : int = 0;
        
        /**
    	 * 
    	 */
        private var _maxStacked : Number = 4;
        
        /**
    	 * 
    	 */
        private var _allStacked : Array = new Array();
        
        /**
    	 * 
    	 */
        private var _displayingStacked : Boolean = false;
        
        /**
    	 * 
    	 */
        private var _notifications : Array = new Array();
        
        /**
    	 * 
    	 */
        private var _currentNotification : NotificationWindow = null;
        
        /**
    	 * 
    	 */
        private var _infoNotification : InfoNotification = null;
        
        /**
    	 * 
    	 */
        public function Notifier()
        {
            _timer = new Timer( 1000 );
            _timer.addEventListener( TimerEvent.TIMER, onTimer );
            _timer.start();
        }
        
        /**
    	 * 
    	 */
        public function queueNotification( status : Status ) : void
        {
        	var notification : NotificationWindow = new NotificationWindow();
            notification.systemChrome = NativeWindowSystemChrome.NONE;
            notification.type = NativeWindowType.LIGHTWEIGHT;
            notification.pStatus = status;
            _notifications.push( notification );
        }
        
        /**
    	 * 
    	 */
        public function displayStackedNotifications() : void
        {
            var screen : Screen = Screen.mainScreen;

            if ( _notifications.length > 0 && !_displayingStacked )
            {
                _displayingStacked = true;

                var limit : Number = Math.min( _maxStacked, _notifications.length );

                // Position of the first notification window
                var firstNotification : NotificationWindow = NotificationWindow( _notifications[0] );
                var currentX : Number = screen.visibleBounds.width - firstNotification.width;
                var currentY : Number = screen.visibleBounds.height - firstNotification.height;

                for ( var i : int = 0; i < limit; i++ ) {
                    var notification : NotificationWindow = NotificationWindow( _notifications[i] );
                    notification.setPosition( currentX, currentY );
                    notification.addEventListener( NotificationWindow.NOTIFICATION_CLOSED, onStackedNotificationClosed );
                    notification.open( false );

                     _allStacked.push( notification );

                    currentY -= ( notification.height + 3 );
                }

                if ( _notifications.length > _maxStacked )
                {
                    _infoNotification = new InfoNotification();
                    _infoNotification.systemChrome = NativeWindowSystemChrome.NONE;
                    _infoNotification.type = NativeWindowType.LIGHTWEIGHT;

                    var remaining : Number = _notifications.length - _maxStacked;
                    var updatestr : String = ( remaining == 1 ) ? "update" : "updates";
                    _infoNotification.infoText = remaining.toString() + " more " + updatestr + "...";

                    currentY = ( currentY + firstNotification.height ) - ( _infoNotification.height );
                    _infoNotification.setPosition( currentX, currentY );
                    _infoNotification.open( false );
                }
            }
        }
        
        /**
    	 * 
    	 */
        private function onTimer( event : Event ) : void
        {
            if ( _displayingStacked )
            {
                for ( var i : int = 0; i < _allStacked.length; i++ )
                {
                    if ( _allStacked[i] != null )
                    {
                        NotificationWindow( _allStacked[i] ).ttl -= 1;
                    }
                }

                if ( _infoNotification != null )
                {
                    _infoNotification.ttl -= 1;
                }
            } 
            else
            {
                if ( _currentNotification != null )
                {
                    _currentNotification.ttl -= 1;
                }
            }
        }
        
        /**
    	 * 
    	 */
        private function displayNextNotification() : void
        {
            if ( _notifications.length > 0 )
            {
                // Sort notification statuses by ID
                _notifications.sort( sortNotifications );

                // Get the next notification window to display
                var notification : NotificationWindow = NotificationWindow( _notifications.shift() );
                _currentNotification = notification;
				notification.addEventListener( NotificationWindow.NOTIFICATION_CLOSED, onNotificationClosed );
                notification.open( false );
            }
        }
        
        /**
    	 * 
    	 */
        private function onNotificationClosed( event : Event ) : void
        {
            _currentNotification = null;
            displayNextNotification();
        }
        
        /**
    	 * 
    	 */
        private function onStackedNotificationClosed( event : Event ) : void
        {
            // Remove the notification window from the list of stacked windows that were displayed
            delete _allStacked[ _allStacked.indexOf( event.currentTarget ) ];

            if ( _allStacked.length < 1 )
            {
                // Clear all notifications after the stacked ones have been displayed.
                _notifications = new Array();
                _displayingStacked = false;
            }
        }
        
        /**
    	 * 
    	 */
        private function sortNotifications( a : NotificationWindow, b : NotificationWindow ) : Number
        {
            var aId : Number = parseInt( a.pStatus.ID );
            var bId : Number = parseInt( b.pStatus.ID );

            if ( aId > bId )
            {
                return 1;
            }

            if ( aId < bId )
            {
                return -1;
            }

            // equal
            return 0;
        }
    }
}