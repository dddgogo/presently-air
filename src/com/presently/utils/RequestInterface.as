/**
 * Present.ly AIR application
 *
 * Copyright (c) 2008. All rights reserved.
 * Author: Akinwale Ariwodola
 * Version: 1.0
 *
 */
package com.presently.utils
{
    import flash.events.ErrorEvent;
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.IOErrorEvent;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import flash.net.URLRequestDefaults;
    import flash.net.URLRequestHeader;
    import flash.net.URLVariables;

    public class RequestInterface extends EventDispatcher
    {
        private static const CLIENT_NAME:String = "AIR/Present.ly";

        public static const SENDING_NEW_REQUEST:String = "sendingNewRequest";

        public static const PUBLIC_TIMELINE:String = "Public Timeline";
        public static const FRIENDS_TIMELINE:String = "Main Stream";
        public static const USER_TIMELINE:String = "User Timeline";
        public static const REPLIES:String = "Replies";
        public static const DIRECT_MESSAGES:String = "Direct Messages";
        public static const FRIENDS:String = "Following";
        public static const FOLLOWERS:String = "Followers";
        public static const LOOKUP:String = "Lookup";
        public static const UPDATE:String = "Update";

        private var subUrlBase:String = ".presentlyapp.com/api/twitter/";

        private var publicTimelineUrl:String = subUrlBase+"statuses/public_timeline.xml";
        private var friendsTimelineUrl:String = subUrlBase+"statuses/friends_timeline.xml";
        private var userTimelineUrl:String = subUrlBase+"statuses/user_timeline.xml";
        private var repliesUrl:String = subUrlBase+"statuses/replies.xml";
        private var directMessagesUrl:String = subUrlBase+"direct_messages.xml";
        private var friendsUrl:String = subUrlBase+"statuses/friends.xml";
        private var followersUrl:String = subUrlBase+"statuses/followers.xml";
        private var updateUrl:String = subUrlBase+"statuses/update.xml";
        private var lookupUrl:String = subUrlBase+"users/show.xml";

        private var _type:String;
        private var _username:String;
        private var _password:String;
        private var _request:URLRequest;
        private var _requestData:String;
        private var _accountName:String;
        private var _params:String;
        private var _method:String = 'GET';
        private var _currentPage:Number = 1;
        private var _lastRequestedNextPage:Number = 0;
        private var _requestInProgress:Boolean = false;
        private var _nextPageRequest:Boolean = false;

        public function get type():String {
            return _type;
        }

        public function set requestData(value:String):void {
            _requestData = null;
        }

        public function get requestData():String {
            return _requestData;
        }

        public function set params(value:String):void {
            _params = value;
        }

        public function get params():String {
            return _params;
        }

        public function set method(value:String):void {
            _method = value;
        }

        public function get method():String {
            return _method;
        }

        public function get requestInProgress():Boolean {
            return _requestInProgress;
        }

        public function get nextPageRequest():Boolean {
            return _nextPageRequest;
        }

        public function RequestInterface(type:String, credentials:String)
        {
            _type = type;

            var credentialParts:Array = credentials.split(';');
            _username = credentialParts[0];
            _password = credentialParts[1];
            _accountName = credentialParts[2];
            URLRequestDefaults.setLoginCredentialsForHost(
                _accountName+".presentlyapp.com", _username, _password);
        }

        public function send(method:String = "GET", params:String = null):void {
             if (!_requestInProgress) {
                _requestInProgress = true;
                _nextPageRequest = (_currentPage > 1);

                var preUrl:String = "https://"+_accountName;
                var url:String = '';

                switch (_type) {
                    case PUBLIC_TIMELINE: url = preUrl+publicTimelineUrl; break;
                    case FRIENDS_TIMELINE: url = preUrl+friendsTimelineUrl; break;
                    case USER_TIMELINE: url = preUrl+userTimelineUrl; break;
                    case REPLIES: url = preUrl+repliesUrl; break;
                    case DIRECT_MESSAGES: url = preUrl+directMessagesUrl; break;
                    case FRIENDS: url = preUrl+friendsUrl; break;
                    case FOLLOWERS: url = preUrl+followersUrl; break;
                    case UPDATE: url = preUrl+updateUrl; break;
                    case LOOKUP: url = preUrl+lookupUrl; break;
                }

                // set the private parameters
                _method = method;
                _params = params;

                var urlParams:URLVariables = new URLVariables(params);
                var loader:URLLoader = new URLLoader();
                _request = new URLRequest(url);
                _request.method = method;
                _request.data = urlParams;
                //trace(urlParams);

                dispatchEvent(new Event(SENDING_NEW_REQUEST));
                loader.addEventListener(Event.COMPLETE, handleLoadComplete);
                loader.addEventListener(IOErrorEvent.IO_ERROR, handleLoadError);
                loader.load(_request);
            }
        }

        public function requestNextPage():void {
            _currentPage = (_lastRequestedNextPage > 1) ? _lastRequestedNextPage : (_currentPage + 1);
            sendPageRequest();
        }

        public function requestPrevPage():void {
            // Only request for the previous page if the current page is not page 1
            if (_currentPage > 1) {
                _currentPage -= 1;
                sendPageRequest();
            }
        }

        public function resetPage():void {
            if (_currentPage > 1) {
                _lastRequestedNextPage = _currentPage;
            }

            _currentPage = 1;
        }

        private function sendPageRequest():void {
            if (_params != null) {
                if (_params.substr(0,5) != "page=") {
                    _params += "&page="+_currentPage.toString();
                } else {
                    _params = "page="+_currentPage.toString();
                }
            } else {
                _params = "page="+_currentPage.toString();
            }

            this.send(_method, _params);
        }

        private function addRequestHeader(name:String, value:String):void {
            _request.requestHeaders.push(new URLRequestHeader(name, value));
        }

        private function handleLoadComplete(event:Event):void {
            _requestInProgress = false;
            _requestData = URLLoader(event.currentTarget).data;
            dispatchEvent(new Event(Event.COMPLETE));
        }

        private function handleLoadError(event:IOErrorEvent):void {
            _requestInProgress = false;
            dispatchEvent(new ErrorEvent(ErrorEvent.ERROR));
        }

        public override function toString():String {
            return _type+" RequestInterface";
        }

    }
}