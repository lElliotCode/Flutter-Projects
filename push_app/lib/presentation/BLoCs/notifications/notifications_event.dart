part of 'notifications_bloc.dart';

sealed class NotificationsEvent {
  const NotificationsEvent();
}

class NotificationStatusChanged extends NotificationsEvent {
  final AuthorizationStatus status;

  NotificationStatusChanged(this.status);

}

//TODO 2: NotificationReceived # PushMessage
