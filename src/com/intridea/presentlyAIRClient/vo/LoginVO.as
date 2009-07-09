/*
 Copyright (c) 2009 Intridea. All Rights Reserved.
 
 @project  Intridea: Present.ly AIR Client
 @version  2.1.1
 @author   Sean Moore (for Intridea)
 
 @internal
 */
 
package com.intridea.presentlyAIRClient.vo
{
	/**
	 * 
	 * Simple object used to store authentication information collected from the user
	 * during the login process.  
	 * 
	 */
	public final class LoginVO
	{
		/**
		 * 
		 * Used for authentication to the Present.ly server.
		 * 
		 */
		public var username : String;
		
		/**
		 * 
		 * Used for authentication to the Present.ly server.
		 * 
		 */
		public var account : String;
		
		/**
		 *
		 * Used for authentication to the Present.ly server. 
		 *  
		 */
		public var password : String;
		
		/**
		 * 
		 * Update <code>Login</code> object with account information collected from the view.
		 * 
		 * @param account Specific account information provided by user.
		 * @param username Specific screen name information provided by user.
		 * @param password Specific account information provided by user.
		 * 
		 */
		public function LoginVO( account : String, username : String, password : String )
		{
			this.username = username;
			this.account = account;
			this.password = password;
		}
		
		/**
		 * 
		 * Used for diagnostics, testing, debugging and trace statements.
		 * 
		 */
		public function toString() : String
		{
			return 	"account: "  + account + ", " +
					"username: " + username + ", " +
					"password: " + password;			
		}
	}
}