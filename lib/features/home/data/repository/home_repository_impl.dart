import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entity/product_entity.dart';
import '../../domain/repository/home_repository.dart';
import '../data_sources/home_remote_data_source.dart';

part 'home_repository_impl.g.dart';

class HomeRepositoryImpl implements IHomeRepository {
  final IHomeRemoteDataSource remoteDataSource;
  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<ProductEntity>> fetchProducts() async {
    final productModels = await remoteDataSource.fetchProducts();
    return productModels.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<String>> fetchCategories() async {
    return remoteDataSource.fetchCategories();
  }
}

@riverpod
IHomeRepository homeRepository(Ref ref) {
  return HomeRepositoryImpl(ref.watch(homeRemoteDataSourceProvider));
}
