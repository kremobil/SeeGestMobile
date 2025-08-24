// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locationAutocompleteProvider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$locationAutocompleteHash() =>
    r'72553cdfae3cfd0f3123cc47479835e256d90893';

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

/// See also [locationAutocomplete].
@ProviderFor(locationAutocomplete)
const locationAutocompleteProvider = LocationAutocompleteFamily();

/// See also [locationAutocomplete].
class LocationAutocompleteFamily
    extends Family<AsyncValue<List<LocationSuggestionModel>>> {
  /// See also [locationAutocomplete].
  const LocationAutocompleteFamily();

  /// See also [locationAutocomplete].
  LocationAutocompleteProvider call({
    required String query,
    required double latitude,
    required double longitude,
  }) {
    return LocationAutocompleteProvider(
      query: query,
      latitude: latitude,
      longitude: longitude,
    );
  }

  @override
  LocationAutocompleteProvider getProviderOverride(
    covariant LocationAutocompleteProvider provider,
  ) {
    return call(
      query: provider.query,
      latitude: provider.latitude,
      longitude: provider.longitude,
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
  String? get name => r'locationAutocompleteProvider';
}

/// See also [locationAutocomplete].
class LocationAutocompleteProvider
    extends AutoDisposeFutureProvider<List<LocationSuggestionModel>> {
  /// See also [locationAutocomplete].
  LocationAutocompleteProvider({
    required String query,
    required double latitude,
    required double longitude,
  }) : this._internal(
          (ref) => locationAutocomplete(
            ref as LocationAutocompleteRef,
            query: query,
            latitude: latitude,
            longitude: longitude,
          ),
          from: locationAutocompleteProvider,
          name: r'locationAutocompleteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$locationAutocompleteHash,
          dependencies: LocationAutocompleteFamily._dependencies,
          allTransitiveDependencies:
              LocationAutocompleteFamily._allTransitiveDependencies,
          query: query,
          latitude: latitude,
          longitude: longitude,
        );

  LocationAutocompleteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
    required this.latitude,
    required this.longitude,
  }) : super.internal();

  final String query;
  final double latitude;
  final double longitude;

  @override
  Override overrideWith(
    FutureOr<List<LocationSuggestionModel>> Function(
            LocationAutocompleteRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LocationAutocompleteProvider._internal(
        (ref) => create(ref as LocationAutocompleteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
        latitude: latitude,
        longitude: longitude,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<LocationSuggestionModel>>
      createElement() {
    return _LocationAutocompleteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LocationAutocompleteProvider &&
        other.query == query &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);
    hash = _SystemHash.combine(hash, latitude.hashCode);
    hash = _SystemHash.combine(hash, longitude.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LocationAutocompleteRef
    on AutoDisposeFutureProviderRef<List<LocationSuggestionModel>> {
  /// The parameter `query` of this provider.
  String get query;

  /// The parameter `latitude` of this provider.
  double get latitude;

  /// The parameter `longitude` of this provider.
  double get longitude;
}

class _LocationAutocompleteProviderElement
    extends AutoDisposeFutureProviderElement<List<LocationSuggestionModel>>
    with LocationAutocompleteRef {
  _LocationAutocompleteProviderElement(super.provider);

  @override
  String get query => (origin as LocationAutocompleteProvider).query;
  @override
  double get latitude => (origin as LocationAutocompleteProvider).latitude;
  @override
  double get longitude => (origin as LocationAutocompleteProvider).longitude;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
