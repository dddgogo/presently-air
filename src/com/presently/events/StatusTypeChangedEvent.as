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
    import com.presently.model.Status;

    import flash.events.Event;

    public class StatusTypeChangedEvent extends Event
    {
        public static const STATUS_TYPE_CHANGED:String = "statusTypeChanged";

        private var _status:Status;

        public function StatusTypeChangedEvent(status:Status)
        {
            super(STATUS_TYPE_CHANGED);
            _status = status;
        }

        public function get status():Status {
            return _status;
        }

        public override function toString():String {
            return formatToString("StatusTypeChangedEvent", "type", "bubbles", "cancelable", "eventPhase", "status");
        }

        public override function clone():Event {
            return new StatusTypeChangedEvent(_status);
        }
    }
}