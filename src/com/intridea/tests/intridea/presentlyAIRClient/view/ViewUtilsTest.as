/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */

package com.intridea.tests.intridea.presentlyAIRClient.view
{
	
	import com.intridea.presentlyAIRClient.view.ViewUtils;
	
	import flexunit.framework.TestCase;

	/**
     *
     */
	public final class ViewUtilsTest extends TestCase
	{
		
		/**
	     *
	     */
		private var expectedProfileImageWidth : int;
		
		/**
	     *
	     */
		private var expectedProfileImageHeight : int;

		/**
	     *
	     */
		private var expectedTransparency : Number;

		/**
	     *
	     */
		private var expectedIsTransparencyEnabled : Boolean;
		
		/**
	     *
	     */
		public function ViewUtilsTest( methodName : String = null )
		{	
			super( methodName );
		}
		
		/**
		 * 
		 */
		override public function setUp() : void
		{
			expectedProfileImageWidth = 55;
			expectedProfileImageHeight = 55;
			expectedTransparency = 1.0;
			expectedIsTransparencyEnabled = false;
		}
		
		/**
		 * 
		 */
		override public function tearDown() : void
		{
			
		}
	
		/**
	     *
	     */
		public function testUserProfileImageWidth() : void
		{	
			assertEquals( expectedProfileImageWidth, ViewUtils.userProfileImageWidth );
		}
		
		/**
	     *
	     */
		public function testUserProfileImageHeight() : void
		{	
			assertEquals( expectedProfileImageHeight, ViewUtils.userProfileImageHeight );
		}
		
		/**
	     *
	     */
		public function testTransparency() : void
		{	
			assertEquals( expectedTransparency, ViewUtils.transparency );
		}
		
		/**
	     *
	     */
		public function testIsTransparencyEnabled() : void
		{	
			assertEquals( expectedIsTransparencyEnabled, ViewUtils.isTransparencyEnabled );
		}
	}
}