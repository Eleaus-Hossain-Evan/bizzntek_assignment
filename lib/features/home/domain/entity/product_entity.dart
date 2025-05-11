import 'package:equatable/equatable.dart';

import 'rating_entity.dart';

class ProductEntity extends Equatable {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingEntity rating;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  const ProductEntity.empty()
      : this(
          id: 0,
          title: '',
          price: 0.0,
          description: '',
          category: '',
          image: '',
          rating: const RatingEntity.empty(),
        );

  @override
  List<Object?> get props => [id, title, price, description, category, image, rating];
}
