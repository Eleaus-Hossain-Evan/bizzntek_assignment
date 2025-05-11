import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/repository/home_repository_impl.dart'; // Required for the provider
import '../domain/entity/product_entity.dart';

part 'home_products_controller.g.dart';

@riverpod
FutureOr<List<ProductEntity>> homeProducts(Ref ref) {
  return ref.watch(homeRepositoryProvider).fetchProducts();
}
