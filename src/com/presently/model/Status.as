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
    import com.presently.events.StatusTypeChangedEvent;

    import flash.events.EventDispatcher;

    [Bindable]
    public class Status extends EventDispatcher
    {
        private var _id:Number;
        private var _screenName:String;
        private var _name:String;
        private var _statusText:String;
        private var _profileImageUrl:String;
        private var _createdAt:Date;
        private var _isReply:Boolean;
        private var _isDirectMessage:Boolean;
        private var _isFollowing:Boolean;
        private const _months:Array = new Array(
            'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
            'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
        );

        public function Status(id:Number, screenName:String, name:String, statusText:String,
            profileImageUrl:String, createdAt:Date, isFollowing:Boolean = false)
        {
            _id = id;
            _screenName = screenName;
            _name = name;
            _statusText = statusText;
            _profileImageUrl = profileImageUrl;
            _createdAt = createdAt;
            _isFollowing = isFollowing;
        }

        public function toHTMLString():String {
            var htmlStr:String = "<span class=\"big\">"+_name+" (<a href=\"event:lookup;"+_screenName+"\">@"
                +screenName+"</a>)</span><br />";
            htmlStr += "<span class=\"normal\">"+parseStatusText(_statusText)+"</span><br />";
            htmlStr += "<span class=\"info\">" +getCreatedAtString()+ "</span>";

            return htmlStr;
        }

        public function getCreatedAtString():String {
            var dt:Date = new Date();
            var timeStr:String = "";

            var hour:int = _createdAt.getHours();
            var amPm:String = "am";
            if (hour >= 12) {
                amPm = "pm";
                hour = hour - 12;
            }
            if (hour == 0) {
                hour = 12;
            }

            timeStr = hour.toString()+":"+zeroPad(_createdAt.getMinutes(), 2)+amPm;

            if (dt.getDate() != _createdAt.getDate() ||
                dt.getMonth() != _createdAt.getMonth() ||
                dt.getFullYear() != _createdAt.getFullYear()) {
                // Different day, prepend the day information
                timeStr += ' on ' + _months[_createdAt.getMonth()]+' '+_createdAt.getDate();
            }

            // Append the year string if it is not the current year
            if (dt.getFullYear() != _createdAt.getFullYear())
            {
                timeStr += ', ' + _createdAt.getFullYear().toString();
            }

            return timeStr;
            //var timeStr:String = dt.getHours()+":"+dt.getMinutes()+dt.get
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

        public function get statusText():String {
            return _statusText;
        }

        public function get createdAt():Date {
            return _createdAt;
        }

        public function get isReply():Boolean {
            return _isReply;
        }

        public function get isDirectMessage():Boolean {
            return _isDirectMessage;
        }

        public function get profileImageUrl():String {
            return _profileImageUrl;
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

        public function set statusText(value:String):void {
            _statusText = value;
        }

        public function set createdAt(value:Date):void {
            _createdAt = value;
        }

        public function set isReply(value:Boolean):void {
            _isReply = value;
            dispatchEvent(new StatusTypeChangedEvent(this));
        }

        public function set isDirectMessage(value:Boolean):void {
            _isDirectMessage = value;
            dispatchEvent(new StatusTypeChangedEvent(this));
        }

        public function set isFollowing(value:Boolean):void {
            _isFollowing = value;
        }

        private function parseStatusText(stext:String):String {
            // Add links
            stext = stext.replace(/@[a-zA-Z0-9_]+/ig, userLinkReplace);
            stext = stext.replace(/(http|https|ftp):\/\/[a-zA-Z0-9_\.\/\-_;=\?,&:]+/ig, urlReplace);

            return stext;
        }

        private function userLinkReplace():String {
            return "<a href=\"event:lookup;"+String(arguments[0]).substr(1)+"\">"+arguments[0]+"</a>";
        }

        private function urlReplace():String {
            return "<a href=\"event:"+arguments[0]+"\">"+arguments[0]+"</a>";
        }

        private function zeroPad(number:Number, size:int):String {
            var str:String = number.toString();
            while (str.length < size) {
                str = "0"+str;
            }
            return str;
        }
    }
}