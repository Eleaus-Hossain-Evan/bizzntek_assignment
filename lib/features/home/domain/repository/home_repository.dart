import '../entity/product_entity.dart';

abstract interface class IHomeRepository {
  Future<List<ProductEntity>> fetchProducts();
  Future<List<String>> fetchCategories();
}
