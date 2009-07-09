package com.intridea.tests.intridea.presentlyAIRClient.mocks
{
	/**
	 * 
	 */
	public final class MockUsers
	{
		/**
		 * 
		 */
		public function MockUsers()
		{
		}
		
		/**
		 * 
		 */
		public static function getMockUsers() : XML
		{
			return mockUsers;
		}
		
		/**
		 * 
		 */
		private static var mockUsers : XML = <users type="array">
											  <user>
											    <id>7601</id>
											    <name>Kannopy Sales</name>
											    <screen_name>sales</screen_name>
											    <location></location>
											    <description></description>
											    <profile_image_url>https://assets.presentlyapp.com/images/avatars/missing_small.png</profile_image_url>
											    <url></url>
											    <protected>false</protected>
											    <followers_count>1</followers_count>
											    <profile_background_color>94CBF0</profile_background_color>
											    <profile_text_color>000000</profile_text_color>
											    <profile_link_color>22608A</profile_link_color>
											    <profile_sidebar_fill_color>FFF18C</profile_sidebar_fill_color>
											    <profile_sidebar_border_color>5D5D5D</profile_sidebar_border_color>
											    <friends_count>1</friends_count>
											    <created_at>Tue May 19 05:37:38 -0700 2009</created_at>
											    <time_zone>Pacific Time (US &amp; Canada)</time_zone>
											    <following>true</following>
											    <notifications>false</notifications>
											    <statuses_count>0</statuses_count>
											  </user>
											  <user>
											    <id>6022</id>
											    <name>Sean Moore</name>
											    <screen_name>sean</screen_name>
											    <location>San Diego</location>
											    <description>Senior Flex Developer</description>
											    <profile_image_url>http://s3.amazonaws.com/intridea-presently-production/kannopy/avatars/users/sean/small.png</profile_image_url>
											    <url></url>
											    <protected>false</protected>
											    <followers_count>1</followers_count>
											    <profile_background_color>94CBF0</profile_background_color>
											    <profile_text_color>000000</profile_text_color>
											    <profile_link_color>22608A</profile_link_color>
											    <profile_sidebar_fill_color>FFF18C</profile_sidebar_fill_color>
											    <profile_sidebar_border_color>5D5D5D</profile_sidebar_border_color>
											    <friends_count>1</friends_count>
											    <created_at>Mon Apr 06 08:22:33 -0700 2009</created_at>
											    <time_zone>Pacific Time (US &amp; Canada)</time_zone>
											    <following>true</following>
											    <notifications>false</notifications>
											    <statuses_count>49</statuses_count>
											    <status>
											      <created_at>Fri Apr 24 15:44:57 -0700 2009</created_at>
											      <id>215323</id>
											      <text>[3:44:51:750] This is a valid test messaged from the SendTextUpdateEventTest test case.</text>
											      <source>web</source>
											      <truncated>false</truncated>
											      <in_reply_to_status_id></in_reply_to_status_id>
											      <in_reply_to_user_id></in_reply_to_user_id>
											      <favorited>false</favorited>
											    </status>
											  </user>
											</users>;
	}
}