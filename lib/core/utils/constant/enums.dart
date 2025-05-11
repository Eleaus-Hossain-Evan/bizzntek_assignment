enum Gender {
  male('Male'),
  female('Female'),
  ratherNotSay('Rather Not Say');

  final String text;

  const Gender(this.text);
}

enum NotificationType {
  notification,
  notice,
  alert,
  task;

  const NotificationType();

  static NotificationType fromInt(int value) => switch (value) {
        0 => NotificationType.notice,
        1 => NotificationType.alert,
        2 => NotificationType.task,
        3 => NotificationType.notification,
        _ => throw Exception('Invalid value'),
      };

  static NotificationType fromString(String value) => switch (value) {
        'notice' => NotificationType.notice,
        'alert' => NotificationType.alert,
        'task' => NotificationType.task,
        'notification' => NotificationType.notification,
        _ => throw Exception('Invalid value'),
      };
}

enum TaskStatus {
  pending,
  delivered,
  reopened,
  done;

  const TaskStatus();

  static TaskStatus fromInt(int value) => switch (value) {
        0 => TaskStatus.pending,
        1 => TaskStatus.delivered,
        2 => TaskStatus.reopened,
        3 => TaskStatus.done,
        _ => throw Exception('Invalid value'),
      };
  static TaskStatus fromString(String value) => switch (value) {
        'pending' => TaskStatus.pending,
        'delivered' => TaskStatus.delivered,
        'reopened' => TaskStatus.reopened,
        'done' => TaskStatus.done,
        _ => throw Exception('Invalid value'),
      };
}
