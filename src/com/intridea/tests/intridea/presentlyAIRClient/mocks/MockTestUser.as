package com.intridea.tests.intridea.presentlyAIRClient.mocks
{
	import com.intridea.presentlyAIRClient.model.domain.User;
	
	public final class MockTestUser
	{
		
		private static var testUser : User;
		
		public function MockTestUser()
		{
		}
		
		public static function getUser() : User
		{
			testUser = new User();		
			testUser.account = "kannopy";
			testUser.screenName = "info";
			testUser.password = "kannopy2009";
			return testUser;
		}

	}
}