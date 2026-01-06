// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendarPreviewProvider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$calendarPreviewHash() => r'47195d19b673d2692961ecd14544c3be892e045c';

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

/// See also [calendarPreview].
@ProviderFor(calendarPreview)
const calendarPreviewProvider = CalendarPreviewFamily();

/// See also [calendarPreview].
class CalendarPreviewFamily extends Family<AsyncValue<List<DateTime>>> {
  /// See also [calendarPreview].
  const CalendarPreviewFamily();

  /// See also [calendarPreview].
  CalendarPreviewProvider call({
    TimeOfDay? fromTime,
    TimeOfDay? toTime,
    List<TagsModel>? tags,
    required int month,
    required int year,
  }) {
    return CalendarPreviewProvider(
      fromTime: fromTime,
      toTime: toTime,
      tags: tags,
      month: month,
      year: year,
    );
  }

  @override
  CalendarPreviewProvider getProviderOverride(
    covariant CalendarPreviewProvider provider,
  ) {
    return call(
      fromTime: provider.fromTime,
      toTime: provider.toTime,
      tags: provider.tags,
      month: provider.month,
      year: provider.year,
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
  String? get name => r'calendarPreviewProvider';
}

/// See also [calendarPreview].
class CalendarPreviewProvider
    extends AutoDisposeFutureProvider<List<DateTime>> {
  /// See also [calendarPreview].
  CalendarPreviewProvider({
    TimeOfDay? fromTime,
    TimeOfDay? toTime,
    List<TagsModel>? tags,
    required int month,
    required int year,
  }) : this._internal(
          (ref) => calendarPreview(
            ref as CalendarPreviewRef,
            fromTime: fromTime,
            toTime: toTime,
            tags: tags,
            month: month,
            year: year,
          ),
          from: calendarPreviewProvider,
          name: r'calendarPreviewProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$calendarPreviewHash,
          dependencies: CalendarPreviewFamily._dependencies,
          allTransitiveDependencies:
              CalendarPreviewFamily._allTransitiveDependencies,
          fromTime: fromTime,
          toTime: toTime,
          tags: tags,
          month: month,
          year: year,
        );

  CalendarPreviewProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fromTime,
    required this.toTime,
    required this.tags,
    required this.month,
    required this.year,
  }) : super.internal();

  final TimeOfDay? fromTime;
  final TimeOfDay? toTime;
  final List<TagsModel>? tags;
  final int month;
  final int year;

  @override
  Override overrideWith(
    FutureOr<List<DateTime>> Function(CalendarPreviewRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CalendarPreviewProvider._internal(
        (ref) => create(ref as CalendarPreviewRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fromTime: fromTime,
        toTime: toTime,
        tags: tags,
        month: month,
        year: year,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<DateTime>> createElement() {
    return _CalendarPreviewProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CalendarPreviewProvider &&
        other.fromTime == fromTime &&
        other.toTime == toTime &&
        other.tags == tags &&
        other.month == month &&
        other.year == year;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fromTime.hashCode);
    hash = _SystemHash.combine(hash, toTime.hashCode);
    hash = _SystemHash.combine(hash, tags.hashCode);
    hash = _SystemHash.combine(hash, month.hashCode);
    hash = _SystemHash.combine(hash, year.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CalendarPreviewRef on AutoDisposeFutureProviderRef<List<DateTime>> {
  /// The parameter `fromTime` of this provider.
  TimeOfDay? get fromTime;

  /// The parameter `toTime` of this provider.
  TimeOfDay? get toTime;

  /// The parameter `tags` of this provider.
  List<TagsModel>? get tags;

  /// The parameter `month` of this provider.
  int get month;

  /// The parameter `year` of this provider.
  int get year;
}

class _CalendarPreviewProviderElement
    extends AutoDisposeFutureProviderElement<List<DateTime>>
    with CalendarPreviewRef {
  _CalendarPreviewProviderElement(super.provider);

  @override
  TimeOfDay? get fromTime => (origin as CalendarPreviewProvider).fromTime;
  @override
  TimeOfDay? get toTime => (origin as CalendarPreviewProvider).toTime;
  @override
  List<TagsModel>? get tags => (origin as CalendarPreviewProvider).tags;
  @override
  int get month => (origin as CalendarPreviewProvider).month;
  @override
  int get year => (origin as CalendarPreviewProvider).year;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
