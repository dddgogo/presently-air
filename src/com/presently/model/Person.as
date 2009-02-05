/**
 * Present.ly AIR application
 *
 * Copyright (c) 2008. All rights reserved.
 * Author: Akinwale Ariwodola
 * Version: 1.0
 *
 */
package com.presently.model
{
    import flash.events.EventDispatcher;

    [Bindable]
    public class Person extends EventDispatcher
    {
        private var _id:Number;
        private var _screenName:String;
        private var _name:String;
        private var _profileImageUrl:String;
        private var _location:String;
        private var _timezone:String;
        private var _description:String;
        private var _url:String;
        private var _followers:Number;
        private var _following:Number;
        private var _statuses:Number;
        private var _isFollowing:Boolean;

        public function Person(id:Number, screenName:String, name:String, profileImageUrl:String,
            location:String, timezone:String, description:String, url:String, followers:Number,
            following:Number, statuses:Number, isFollowing:Boolean = false)
        {
            _id = id;
            _screenName = screenName;
            _name = name;
            _profileImageUrl = profileImageUrl;
            _location = location;
            _timezone = timezone;
            _description = description;
            _url = url;
            _followers = followers;
            _following = following;
            _statuses = statuses;
            _isFollowing = isFollowing;
        }

        public function toHTMLString():String {
            var htmlStr:String = "<span class=\"normal\"><b>"+name+"</b><br />";
            if (description.length > 0) {
                htmlStr += description + "<br />";
            }
            if (location.length > 0) {
                htmlStr += location + " ("+timezone+") <br />";
            }

            htmlStr += getSingularPlural("friend", following) + ", "
                + getSingularPlural("follower", followers) + ", "
                + getSingularPlural("update", statuses);
            if (url.length > 0) {
                htmlStr += "<a href=\"event:"+url+"\">"+url+"</a>";
            }
            htmlStr += "</span>";

            return htmlStr;
        }

        private function getSingularPlural(word:String, value:Number):String {
            return value.toString() + " " + ((value == 1) ? word : word+"s");
        }

        public function get id():Number {
            return _id;
        }

        public function get screenName():String {
            return _screenName;
        }

        public function get name():String {
            return _name;
        }

        public function get profileImageUrl():String {
            return _profileImageUrl;
        }

        public function get location():String {
            return _location;
        }

        public function get timezone():String {
            return _timezone;
        }

        public function get description():String {
            return _description;
        }

        public function get url():String {
            return _url;
        }

        public function get followers():Number {
            return _followers;
        }

        public function get following():Number {
            return _following;
        }

        public function get statuses():Number {
            return _statuses;
        }

        public function get isFollowing():Boolean {
            return _isFollowing;
        }

        public function set id(value:Number):void {
            _id = value;
        }

        public function set screenName(value:String):void {
            _screenName = value;
        }

        public function set name(value:String):void {
            _name = value;
        }

        public function set profileImageUrl(value:String):void {
            _profileImageUrl = value;
        }

        public function set location(value:String):void {
            _location = value;
        }

        public function set timezone(value:String):void {
            _timezone = value;
        }

        public function set description(value:String):void {
            _description = value;
        }

        public function set url(value:String):void {
            _url = value;
        }

        public function set followers(value:Number):void {
            _followers = value;
        }

        public function set following(value:Number):void {
            _following = value;
        }

        public function set statuses(value:Number):void {
            _statuses = value;
        }

        public function set isFollowing(value:Boolean):void {
            _isFollowing = value;
        }
    }
}