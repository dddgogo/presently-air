/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.utils
{
	import com.intridea.presentlyAIRClient.utils.ApplicationManager;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class ApplicationManagerTest extends TestCase
	{

		/**
	     *
	     */
		public function ApplicationManagerTest( methodName : String = null )
		{	
			super( methodName );
		}
				
		/**
		 * 
		 */
		public function testAppVersion() : void
		{
			assertEquals(ApplicationManager.getAppVersion(), "v2.1.1");
		}
	}
}