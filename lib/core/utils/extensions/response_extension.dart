part of 'extensions.dart';

extension ResponseExtension on Response {
  bool get isSuccess =>
      statusCode != null && statusCode! >= 200 && statusCode! < 300;
}
