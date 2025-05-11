// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$totalCartCountHash() => r'bc1aa257e0325df7b1f0e84063de3131b9ac5998';

/// See also [totalCartCount].
@ProviderFor(totalCartCount)
final totalCartCountProvider = AutoDisposeProvider<int>.internal(
  totalCartCount,
  name: r'totalCartCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$totalCartCountHash,
  dependencies: <ProviderOrFamily>[cartProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    cartProvider,
    ...?cartProvider.allTransitiveDependencies
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TotalCartCountRef = AutoDisposeProviderRef<int>;
String _$totalCartPriceHash() => r'640e948659dc2db963d0cffbe16b986b11c43ef7';

/// See also [totalCartPrice].
@ProviderFor(totalCartPrice)
final totalCartPriceProvider = AutoDisposeProvider<double>.internal(
  totalCartPrice,
  name: r'totalCartPriceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$totalCartPriceHash,
  dependencies: <ProviderOrFamily>[cartProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    cartProvider,
    ...?cartProvider.allTransitiveDependencies
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TotalCartPriceRef = AutoDisposeProviderRef<double>;
String _$currentCartHash() => r'f56ba61e7272b0a353c8286d19e624f1d150355a';

/// See also [currentCart].
@ProviderFor(currentCart)
final currentCartProvider = AutoDisposeProvider<CartEntity>.internal(
  currentCart,
  name: r'currentCartProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentCartHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentCartRef = AutoDisposeProviderRef<CartEntity>;
String _$cartHash() => r'8b522683d969c967d8c1422b72dd5fd57292cf53';

/// See also [Cart].
@ProviderFor(Cart)
final cartProvider =
    AutoDisposeNotifierProvider<Cart, List<CartEntity>>.internal(
  Cart.new,
  name: r'cartProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cartHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Cart = AutoDisposeNotifier<List<CartEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
