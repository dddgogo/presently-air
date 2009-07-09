/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */
 
package com.intridea.presentlyAIRClient.business
{
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	
	/**
	 * 
	 * Assembles URI patterns for service invocations.
	 * 
	 */
	public final class ServiceUtils
	{
		/**
		 * 
		 * Provides a static reference to the URI pattern assembler method.
		 * 
		 */
		public function ServiceUtils()
		{
		}
		
		/**
		 * 
		 * Builds a string representing URI patterns for service invocations.
		 * 
		 * @param serviceID Provides the partial URI patterns for the service invocation.
		 * @return endPoint Fully assembled URI pattern used by the business delegates to make service calls.
		 * 
		 */
		public static function getEndpoint( serviceID : String ) : String
		{
			var endpoint : String = ServiceConfigurations.URL_BASE + 
									ModelLocator.instance.currentAccount + 
									ModelLocator.instance.presentlyBaseURL + 
									"/" + serviceID;
			return endpoint;
		}
	}
}