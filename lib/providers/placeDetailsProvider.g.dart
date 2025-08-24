// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placeDetailsProvider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$placeDetailsHash() => r'14d42ac18cd41b285d58e765c6faea71e72db3a8';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [placeDetails].
@ProviderFor(placeDetails)
const placeDetailsProvider = PlaceDetailsFamily();

/// See also [placeDetails].
class PlaceDetailsFamily extends Family<AsyncValue<PlaceDetailsModel>> {
  /// See also [placeDetails].
  const PlaceDetailsFamily();

  /// See also [placeDetails].
  PlaceDetailsProvider call({
    required String placeId,
  }) {
    return PlaceDetailsProvider(
      placeId: placeId,
    );
  }

  @override
  PlaceDetailsProvider getProviderOverride(
    covariant PlaceDetailsProvider provider,
  ) {
    return call(
      placeId: provider.placeId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'placeDetailsProvider';
}

/// See also [placeDetails].
class PlaceDetailsProvider
    extends AutoDisposeFutureProvider<PlaceDetailsModel> {
  /// See also [placeDetails].
  PlaceDetailsProvider({
    required String placeId,
  }) : this._internal(
          (ref) => placeDetails(
            ref as PlaceDetailsRef,
            placeId: placeId,
          ),
          from: placeDetailsProvider,
          name: r'placeDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$placeDetailsHash,
          dependencies: PlaceDetailsFamily._dependencies,
          allTransitiveDependencies:
              PlaceDetailsFamily._allTransitiveDependencies,
          placeId: placeId,
        );

  PlaceDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.placeId,
  }) : super.internal();

  final String placeId;

  @override
  Override overrideWith(
    FutureOr<PlaceDetailsModel> Function(PlaceDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PlaceDetailsProvider._internal(
        (ref) => create(ref as PlaceDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        placeId: placeId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PlaceDetailsModel> createElement() {
    return _PlaceDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlaceDetailsProvider && other.placeId == placeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, placeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PlaceDetailsRef on AutoDisposeFutureProviderRef<PlaceDetailsModel> {
  /// The parameter `placeId` of this provider.
  String get placeId;
}

class _PlaceDetailsProviderElement
    extends AutoDisposeFutureProviderElement<PlaceDetailsModel>
    with PlaceDetailsRef {
  _PlaceDetailsProviderElement(super.provider);

  @override
  String get placeId => (origin as PlaceDetailsProvider).placeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
