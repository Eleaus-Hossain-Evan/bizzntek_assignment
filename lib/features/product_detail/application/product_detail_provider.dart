import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../cart/application/cart_provider.dart';
import '../../home/domain/entity/product_entity.dart';

part 'product_detail_provider.g.dart';

@riverpod
ProductEntity product(Ref ref) {
  throw UnimplementedError();
}

@Riverpod(dependencies: [product, Cart])
int currentProductCartCount(Ref ref) {
  final product = ref.watch(productProvider);
  final cart = ref.watch(cartProvider);
  final cartItem = cart.where((element) => element.product.id == product.id).firstOrNull;
  return cartItem?.quantity ?? 0;
}
