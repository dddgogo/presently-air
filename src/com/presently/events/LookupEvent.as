/**
 * Present.ly AIR application
 *
 * Copyright (c) 2008. All rights reserved.
 * Author: Akinwale Ariwodola
 * Version: 1.0
 *
 */
package com.presently.events
{
    import flash.events.Event;

    public class LookupEvent extends Event
    {
        public static const LOOKUP:String = "lookup";

        private var _username:String;

        public function LookupEvent(username:String)
        {
            super(LOOKUP);
            _username = username;
        }

        public function get username():String {
            return _username;
        }

        public override function toString():String {
            return formatToString("LookupEvent", "type", "bubbles", "cancelable", "eventPhase", "username");
        }

        public override function clone():Event {
            return new LookupEvent(_username);
        }
    }
}