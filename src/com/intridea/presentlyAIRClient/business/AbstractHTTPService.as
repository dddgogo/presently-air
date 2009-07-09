/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.presentlyAIRClient.business
{
	import mx.rpc.http.mxml.HTTPService;
	
	/**
	 * 
	 * Provides abstract representation of the Present.ly HTTPService control. Sets 
	 * common properties for all other HTTPServices implementations.
	 * 
	 * @see mx.rpc.http.mxml.HTTPService
	 * 
	 */
	public class AbstractHTTPService extends HTTPService
	{
		/**
		 * 
		 * Abstract definition of the Present.ly HTTPService. Used to make requests to the Present.ly
		 * messaging API.
		 * 
		 */
		public function AbstractHTTPService()
		{
			showBusyCursor = true;
			makeObjectsBindable = true;
			method = "POST";
		}
		
	}
}