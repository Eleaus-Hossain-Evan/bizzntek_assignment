import '../../core.dart';

enum Gender {
  male('Male'),
  female('Female'),
  ratherNotSay('Rather Not Say');

  final String text;

  const Gender(this.text);
}

enum TrainingCompletionStatus {
  upcoming(0, Images.svgUpcomingCollapseIcon, Images.svgUpcomingIcon),
  ongoing(1, Images.svgOngoingCollapseIcon, Images.svgOngoingIcon),
  completed(2, Images.svgCompletedCollapseIcon, Images.svgCompletedIcon);

  final int batchStatus;
  final String collapsedIcon;
  final String icon;
  const TrainingCompletionStatus(
    this.batchStatus,
    this.collapsedIcon,
    this.icon,
  );

  static TrainingCompletionStatus fromInt(int value) => switch (value) {
        0 => TrainingCompletionStatus.upcoming,
        1 => TrainingCompletionStatus.ongoing,
        2 => TrainingCompletionStatus.completed,
        _ => throw Exception('Invalid value'),
      };
}

enum TrainingType {
  hireAndTrain(
    1,
    'Hire & Train',
    Images.svgHireAndTrainCollapseIcon,
    Images.svgHomeBatchInfo,
  ),
  studentTraining(
    2,
    'Student Training',
    Images.svgStudentTrainingCollapseIcon,
    Images.svgStudentTrainingIcon,
  ),
  govtTraining(
    3,
    'Govt Training',
    Images.svgGovtTrainingCollapseIcon,
    Images.svgGovtTrainingIcon,
  ),
  cxoTraining(
    4,
    'CXO Training',
    Images.svgCxoTrainingCollapseIcon,
    Images.svgCxoTrainingIcon,
  ),
  ;

  final int type;
  final String text;
  final String collapsedIcon;
  final String icon;
  const TrainingType(this.type, this.text, this.collapsedIcon, this.icon);

  static TrainingType fromInt(int value) => switch (value) {
        1 => TrainingType.hireAndTrain,
        2 => TrainingType.studentTraining,
        3 => TrainingType.govtTraining,
        4 => TrainingType.cxoTraining,
        _ => throw Exception('Invalid value'),
      };
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
