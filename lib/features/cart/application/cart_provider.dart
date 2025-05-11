import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/cart_entity.dart';

part 'cart_provider.g.dart';

@riverpod
class Cart extends _$Cart {
  @override
  List<CartEntity> build() {
    return [];
  }
}
