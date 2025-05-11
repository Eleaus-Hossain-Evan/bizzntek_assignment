import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/repository/home_repository_impl.dart'; // Required for the provider

part 'home_categories_controller.g.dart';

@riverpod
FutureOr<List<String>> homeCategories(HomeCategoriesRef ref) {
  return ref.watch(homeRepositoryProvider).fetchCategories();
}
