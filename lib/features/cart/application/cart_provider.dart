import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../home/domain/entity/product_entity.dart';
import '../domain/cart_entity.dart';

part 'cart_provider.g.dart';

@riverpod
class Cart extends _$Cart {
  @override
  List<CartEntity> build() {
    return [];
  }

  void addProduct(ProductEntity product) {
    final cart = state;
    final index = cart.indexWhere((element) => element.product.id == product.id);
    if (index == -1) {
      cart.add(CartEntity(product: product, quantity: 1));
    } else {
      cart[index] = cart[index].copyWith(quantity: cart[index].quantity + 1);
    }
    state = [...cart];
  }

  void removeProduct(ProductEntity product) {
    final cart = state;
    final index = cart.indexWhere((element) => element.product.id == product.id);
    if (index == -1) {
      return;
    } else {
      if (cart[index].quantity == 1) {
        cart.removeAt(index);
      } else {
        cart[index] = cart[index].copyWith(quantity: cart[index].quantity - 1);
      }
    }
    state = [...cart];
  }

  void clear() {
    state = [];
  }
}

@Riverpod(dependencies: [Cart])
int totalCartCount(Ref ref) {
  final cart = ref.watch(cartProvider);
  return cart.fold(0, (previousValue, element) => previousValue + element.quantity);
}

@Riverpod(dependencies: [Cart])
double totalCartPrice(Ref ref) {
  final cart = ref.watch(cartProvider);
  return cart.fold(0, (previousValue, e) => previousValue + (e.product.price * e.quantity));
}

@Riverpod(dependencies: [])
CartEntity currentCart(Ref ref) {
  throw UnimplementedError();
}
