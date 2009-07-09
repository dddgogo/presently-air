/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.business
{
	
	import com.intridea.presentlyAIRClient.business.ServiceUtils;
	import com.intridea.presentlyAIRClient.model.ModelLocator;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class ServiceUtilsTest extends TestCase
	{
		
		/**
		 * 
		 */
		private var serviceID : String;
		
		/**
		 * 
		 */
		private var expectedEndpoint : String;
		
		/**
		 * 
		 */
		private var model : ModelLocator;
		
			
		/**
	     *
	     */
		public function ServiceUtilsTest( methodName : String = null )
		{	
			super( methodName );
		}
		
		/**
		 * 
		 */
		override public function setUp() : void
		{
			serviceID = "logout";
			expectedEndpoint = "https://kannopy.presentlyapp.com/logout";
			model = ModelLocator.instance;
			model.currentAccount = "kannopy";
			model.presentlyBaseURL = ".presentlyapp.com";
		}
		
		/**
		 * 
		 */
		override public function tearDown() : void
		{
			serviceID = null;
			expectedEndpoint = null;
			model = null;
		}
		
        /**
	     *
	     */
		public function testGetEndpoint() : void
		{
			var endpoint : String = ServiceUtils.getEndpoint( serviceID );
			assertEquals( expectedEndpoint, endpoint );
		}
	}
}