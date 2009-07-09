package com.intridea.tests.intridea.presentlyAIRClient.mocks
{
	/**
	 * 
	 */
	public final class MockStatus
	{
		/**
		 * 
		 */
		public function MockStatus()
		{
		}
		
		/**
		 * 
		 */
		public static function getMockStatus() : XML
		{
			return mockStatus;
		}
		
		/**
		 * 
		 */
		private static var mockStatus : XML = <status>
										    <created_at>Fri Mar 27 15:29:41 -0700 2009</created_at>
										    <id>181324</id>
										    <text>another message test...</text>
										    <source>web</source>
										    <truncated>false</truncated>
										    <in_reply_to_status_id></in_reply_to_status_id>
										    <in_reply_to_user_id></in_reply_to_user_id>
										    <favorited>false</favorited>
										    <user>
										      <id>5168</id>
										      <name>Sean Moore</name>
										      <screen_name>info</screen_name>
										      <location></location>
										      <description></description>
										      <profile_image_url>https://assets.presentlyapp.com/images/avatars/missing_small.png</profile_image_url>
										      <url></url>
										      <protected>false</protected>
										      <followers_count>0</followers_count>
										      <profile_background_color>94CBF0</profile_background_color>
										      <profile_text_color>000000</profile_text_color>
										      <profile_link_color>22608A</profile_link_color>
										      <profile_sidebar_fill_color>FFF18C</profile_sidebar_fill_color>
										      <profile_sidebar_border_color>5D5D5D</profile_sidebar_border_color>
										      <friends_count>0</friends_count>
										      <created_at>Sun Mar 15 13:49:20 -0700 2009</created_at>
										      <time_zone>Pacific Time (US &amp; Canada)</time_zone>
										      <following>false</following>
										      <notifications>false</notifications>
										      <statuses_count>2</statuses_count>
										    </user>
									   </status>;

	}
}