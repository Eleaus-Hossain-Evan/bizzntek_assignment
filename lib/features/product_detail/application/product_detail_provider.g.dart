// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productHash() => r'2bd4c274b374378bafe993230d2075b346d6774b';

/// See also [product].
@ProviderFor(product)
final productProvider = AutoDisposeProvider<ProductEntity>.internal(
  product,
  name: r'productProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$productHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProductRef = AutoDisposeProviderRef<ProductEntity>;
String _$currentProductCartCountHash() =>
    r'cbba70074f2f44f8ed78891115f9266928263dcc';

/// See also [currentProductCartCount].
@ProviderFor(currentProductCartCount)
final currentProductCartCountProvider = AutoDisposeProvider<int>.internal(
  currentProductCartCount,
  name: r'currentProductCartCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentProductCartCountHash,
  dependencies: <ProviderOrFamily>[productProvider, cartProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    productProvider,
    ...?productProvider.allTransitiveDependencies,
    cartProvider,
    ...?cartProvider.allTransitiveDependencies
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentProductCartCountRef = AutoDisposeProviderRef<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
