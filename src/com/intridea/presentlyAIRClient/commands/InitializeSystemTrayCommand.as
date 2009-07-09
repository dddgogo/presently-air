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
	import com.intridea.presentlyAIRClient.events.ExitApplicationEvent;
	import com.intridea.presentlyAIRClient.events.InitializeSystemTrayEvent;
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	
	import flash.desktop.DockIcon;
	import flash.desktop.NativeApplication;
	import flash.desktop.SystemTrayIcon;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.NativeMenu;
	import flash.display.NativeMenuItem;
	import flash.display.NativeWindowDisplayState;
	import flash.events.Event;
	import flash.events.InvokeEvent;
	import flash.events.MouseEvent;
	import flash.events.NativeWindowDisplayStateEvent;
	import flash.net.URLRequest;
	
	import mx.core.Application;
	
	/**
     *
     * Initializes system tray capabilities including the display of an icon in the system tray and the ability to minimize
     * the applicatin to the system tray.
     * 
     * @see com.adobe.cairngorm.commands.ICommand
     * 
     */
	public final class InitializeSystemTrayCommand implements ICommand
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
		 * Used to load the icon for use with the system tray.
		 * 
		 * @see flash.display.Loader
		 * 
		 */
		private var icon : Loader = new Loader();
		
		/**
		 * 
		 * Used to capture the contents of the loaded image file and enable icon support for the system tray.
		 * 
		 * @see flash.display.BitmapData
		 * 
		 */
		private var iconBitmapData : BitmapData;
		
		/**
		 * 
		 * Enables icon support for the system tray and holds a reference to the <code>SystemTrayIcon</code> instance. 
		 * 
		 * @see flash.desktop.SystemTrayIcon
		 * 
		 */
		private var systemTrayIcon : SystemTrayIcon;
		
		/**
		 * 
		 * Used to capture the contents of the loaded image file and enable icon support for the system tray for the Mac
		 * platform.
		 * 
		 * @see flash.desktop.DockIcon
		 * 
		 */
		private var dockIcon : DockIcon;
		
		/**
		 * 
		 * Used to create the menu available by right clicking on the system tray.
		 * 
		 */
		private var copyrightNativeWindowItem : NativeMenuItem = new NativeMenuItem( "© " + new Date().getFullYear() + " Intridea" );
		
		/**
		 * 
		 * Adds the ability to select a restore action from the system tray menu.
		 * 
		 */
		private var restoreNativeWindowItem : NativeMenuItem = new NativeMenuItem( "Restore" );
		
		/**
		 * 
		 * Adds the ability to exit the application from the system tray menu.
		 * 
		 */
		private var exitNativeWindowItem : NativeMenuItem = new NativeMenuItem( "Exit" );
		
		/**
		 * 
		 * Captures the system tray initialization event and creates the objects required to build and set up 
		 * system tray support for Windows, Linux and Mac.
		 * 
		 * @param event Standard <code>InitializeSystemTrayEvent</code>. Not used in this method. 
		 * 
		 */
		public function execute( event : CairngormEvent ) : void
		{
			var initializeSystemTrayEvent : InitializeSystemTrayEvent = event as InitializeSystemTrayEvent;
			var hasSystemTrayIconSupport : Boolean = NativeApplication.supportsSystemTrayIcon;
			var hasDockIconSupport : Boolean = NativeApplication.supportsDockIcon;
			
            if ( hasSystemTrayIconSupport )
            {
            	icon.contentLoaderInfo.addEventListener( Event.COMPLETE, iconLoadComplete );
		  		icon.load( new URLRequest( "assets/images/icon_16.png" ) );
		  		systemTrayIcon = NativeApplication.nativeApplication.icon as SystemTrayIcon;
		  		systemTrayIcon.tooltip = "Present.ly AIR Client";
		  		systemTrayIcon.menu = createIconMenu( hasSystemTrayIconSupport );
		  		
		  		Application.application.stage.nativeWindow.addEventListener( NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGE, onDisplayStateChange );       	
            	
            	systemTrayIcon.addEventListener( MouseEvent.CLICK, maximize );
			}
			else if ( hasDockIconSupport )
			{
				// NOTE: this code needs to be tested on the Mac platform.
				icon.contentLoaderInfo.addEventListener( Event.COMPLETE , iconLoadComplete );
				icon.load(new URLRequest("assets/images/icon_128.png"));
				NativeApplication.nativeApplication.addEventListener( InvokeEvent.INVOKE, maximize );
				dockIcon = NativeApplication.nativeApplication.icon as DockIcon;
				dockIcon.menu = createIconMenu( hasDockIconSupport );

			}
		}
		
		/**
		 * 
		 * Assigns the image loaded for the system tray icon, extracts the bitmap data from it and assigns the 
		 * system tray icon.
		 * 
		 * @param event Standard flash event. Not used in this method.
		 * 
		 */
		private function iconLoadComplete( event : Event ) : void
		{
			iconBitmapData = event.target.content.bitmapData;
			NativeApplication.nativeApplication.icon.bitmaps = [ iconBitmapData ];
		}
		
		/**
		 * 
		 * Checks to see if the application is running on an OS with support for minimizing to the system tray and
		 * creates the right click menu for the system tray.
		 * 
		 * @param hasSystemTrayIconSupport Used to determine if the current OS has support for working with the system tray.
		 * @return iconMenu Represents the system tray menu avaiable by right clicking the system tray. 
		 * 
		 */
		private function createIconMenu( hasSystemTrayIconSupport : Boolean ) : NativeMenu
		{
			var iconMenu : NativeMenu = new NativeMenu();
			iconMenu.addItem( copyrightNativeWindowItem );
			
			if ( hasSystemTrayIconSupport ) {
				iconMenu.addItem( new NativeMenuItem( "", true ) );
				iconMenu.addItem( restoreNativeWindowItem );
				restoreNativeWindowItem.addEventListener( Event.SELECT, maximize );
				iconMenu.addItem( exitNativeWindowItem );
				exitNativeWindowItem.addEventListener( Event.SELECT, onExit );
			}
			return iconMenu;
		}
		
		/**
		 * 
		 * Handles the minimize request from the user.
		 * 
		 * @param event Used to check the event type of the inbound <code>NativeWindowDisplayStateEvent</code>
		 * 
		 */
		private function onDisplayStateChange( event : NativeWindowDisplayStateEvent ) : void
		{
			if( event.afterDisplayState == NativeWindowDisplayState.MINIMIZED )
			{
            	event.preventDefault();
            	minimize();
   			}
		}
		
		/**
		 * 
		 * Makes the system call to minimize the application to the system tray.
		 * 
		 */
		public function minimize() : void
		{
			Application.application.stage.nativeWindow.visible = false;
			NativeApplication.nativeApplication.icon.bitmaps = [ iconBitmapData ];
		}
		
		/**
		 * 
		 * Makes the system call to minimize the application to the system tray.
		 * 
		 * @param event Standard flash event. Not used in this method.
		 * 
		 */
		private function maximize( event : Event ) : void
		{
			Application.application.stage.nativeWindow.visible = true;
			Application.application.stage.nativeWindow.restore();
			Application.application.stage.nativeWindow.orderToFront();
			NativeApplication.nativeApplication.icon.bitmaps = [];
		}
		
		/**
		 * 
		 * Dispatches an event to exit the application.
		 * 
		 * @param event Standard flash event. Not used in this method.
		 * 
		 */
		private function onExit( event : Event ) : void
		{
			new ExitApplicationEvent( ExitApplicationEvent.EVENT ).dispatch();
		}
	}
}