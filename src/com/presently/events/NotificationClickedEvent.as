package com.presently.events
{
    import com.presently.model.Status;

    import flash.events.Event;

    public class NotificationClickedEvent extends Event
    {
        public static const NOTIFICATION_CLICKED:String = "notificationClicked";

        private var _status:Status;

        public function NotificationClickedEvent(status:Status)
        {
            super(NOTIFICATION_CLICKED);
            _status = status;
        }

        public function get status():Status {
            return _status;
        }

        public override function toString():String {
            return formatToString("NotificationClickedEvent", "type", "bubbles", "cancelable", "eventPhase", "status");
        }

        public override function clone():Event {
            return new NotificationClickedEvent(_status);
        }
    }
}