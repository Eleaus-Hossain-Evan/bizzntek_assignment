import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/core.dart';
import '../model/product_model.dart';

part 'home_remote_data_source.g.dart';

abstract interface class IHomeRemoteDataSource {
  Future<List<ProductModel>> fetchProducts();
  Future<List<String>> fetchCategories();
}

class HomeRemoteDataSourceImpl implements IHomeRemoteDataSource {
  final Dio _dio;
  HomeRemoteDataSourceImpl(this._dio);

  @override
  Future<List<ProductModel>> fetchProducts() async {
    return DioService.run(
      request: () => _dio.get(ApiEndpoint.products),
      parse: (data) {
        return List<ProductModel>.from((data as List).map((e) => ProductModel.fromMap(e)));
      },
    );
  }

  @override
  Future<List<String>> fetchCategories() async {
    return DioService.run(
      request: () => _dio.get(ApiEndpoint.categories),
      parse: (data) {
        return List<String>.from((data as List).map((e) => e.toString()));
      },
    );
  }
}

@riverpod
IHomeRemoteDataSource homeRemoteDataSource(Ref ref) {
  return HomeRemoteDataSourceImpl(ref.watch(dioProvider));
}
