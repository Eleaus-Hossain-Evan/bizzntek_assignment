import 'package:equatable/equatable.dart';

class RatingEntity extends Equatable {
  final double rate;
  final int count;

  const RatingEntity({
    required this.rate,
    required this.count,
  });

  const RatingEntity.empty()
      : this(
          rate: 0.0,
          count: 0,
        );

  @override
  List<Object?> get props => [rate, count];
}
