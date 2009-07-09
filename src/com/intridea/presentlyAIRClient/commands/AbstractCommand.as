package com.intridea.presentlyAIRClient.commands
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	
	/**
	 *
	 * Defines an abstraction of common references from which concrete ICommand 
	 * implementations can inherit.
	 *
	 * @see com.adobe.cairngorm.commands.ICommand
	 * 
	 */
	internal class AbstractCommand implements ICommand
	{
		/**
		 * 
		 * Defines a common reference to the <code>ModelLocator</code> implementation.
		 * 
		 * @see com.intridea.presentlyAIRClient.model.ModelLocator
		 * 
		 */
		protected static var model : ModelLocator = ModelLocator.instance;
		
		/**
		 * 
		 * Forces a concrete command implementations to override execute.
		 * 
		 * @param event concrete event type.
		 * 
		 */
		public function execute( event : CairngormEvent ) : void
		{
			throw new Error( "AbstractCommand operation!" );
		}
		
		/**
		 * 
		 * Forces a concrete command implementations to override result.
		 * 
		 * @param event data response being returned by the server.
		 * 
		 */
		public function result( event : Object ) : void
		{
			throw new Error( "AbstractCommand operation!" );
		}
		
		/**
		 * 
		 * Forces a concrete command implementations to override fault.
		 * 
		 * @param fault error information for faulty requests.
		 * 
		 */
		public function fault( event : Object ):void
		{
			throw new Error( "AbstractCommand operation!" );
		}
	}
}