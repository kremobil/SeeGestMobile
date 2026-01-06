// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlainCommentModel {
  int get id;
  String get content;
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  int get depth;
  @JsonKey(name: 'is_anonymous')
  bool get isAnonymous;

  /// Create a copy of PlainCommentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlainCommentModelCopyWith<PlainCommentModel> get copyWith =>
      _$PlainCommentModelCopyWithImpl<PlainCommentModel>(
          this as PlainCommentModel, _$identity);

  /// Serializes this PlainCommentModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlainCommentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.depth, depth) || other.depth == depth) &&
            (identical(other.isAnonymous, isAnonymous) ||
                other.isAnonymous == isAnonymous));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, content, createdAt, depth, isAnonymous);

  @override
  String toString() {
    return 'PlainCommentModel(id: $id, content: $content, createdAt: $createdAt, depth: $depth, isAnonymous: $isAnonymous)';
  }
}

/// @nodoc
abstract mixin class $PlainCommentModelCopyWith<$Res> {
  factory $PlainCommentModelCopyWith(
          PlainCommentModel value, $Res Function(PlainCommentModel) _then) =
      _$PlainCommentModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String content,
      @JsonKey(name: 'created_at') DateTime createdAt,
      int depth,
      @JsonKey(name: 'is_anonymous') bool isAnonymous});
}

/// @nodoc
class _$PlainCommentModelCopyWithImpl<$Res>
    implements $PlainCommentModelCopyWith<$Res> {
  _$PlainCommentModelCopyWithImpl(this._self, this._then);

  final PlainCommentModel _self;
  final $Res Function(PlainCommentModel) _then;

  /// Create a copy of PlainCommentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? createdAt = null,
    Object? depth = null,
    Object? isAnonymous = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      depth: null == depth
          ? _self.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as int,
      isAnonymous: null == isAnonymous
          ? _self.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PlainCommentModel implements PlainCommentModel {
  const _PlainCommentModel(
      {required this.id,
      required this.content,
      @JsonKey(name: 'created_at') required this.createdAt,
      required this.depth,
      @JsonKey(name: 'is_anonymous') required this.isAnonymous});
  factory _PlainCommentModel.fromJson(Map<String, dynamic> json) =>
      _$PlainCommentModelFromJson(json);

  @override
  final int id;
  @override
  final String content;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  final int depth;
  @override
  @JsonKey(name: 'is_anonymous')
  final bool isAnonymous;

  /// Create a copy of PlainCommentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlainCommentModelCopyWith<_PlainCommentModel> get copyWith =>
      __$PlainCommentModelCopyWithImpl<_PlainCommentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlainCommentModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlainCommentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.depth, depth) || other.depth == depth) &&
            (identical(other.isAnonymous, isAnonymous) ||
                other.isAnonymous == isAnonymous));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, content, createdAt, depth, isAnonymous);

  @override
  String toString() {
    return 'PlainCommentModel(id: $id, content: $content, createdAt: $createdAt, depth: $depth, isAnonymous: $isAnonymous)';
  }
}

/// @nodoc
abstract mixin class _$PlainCommentModelCopyWith<$Res>
    implements $PlainCommentModelCopyWith<$Res> {
  factory _$PlainCommentModelCopyWith(
          _PlainCommentModel value, $Res Function(_PlainCommentModel) _then) =
      __$PlainCommentModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String content,
      @JsonKey(name: 'created_at') DateTime createdAt,
      int depth,
      @JsonKey(name: 'is_anonymous') bool isAnonymous});
}

/// @nodoc
class __$PlainCommentModelCopyWithImpl<$Res>
    implements _$PlainCommentModelCopyWith<$Res> {
  __$PlainCommentModelCopyWithImpl(this._self, this._then);

  final _PlainCommentModel _self;
  final $Res Function(_PlainCommentModel) _then;

  /// Create a copy of PlainCommentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? createdAt = null,
    Object? depth = null,
    Object? isAnonymous = null,
  }) {
    return _then(_PlainCommentModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      depth: null == depth
          ? _self.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as int,
      isAnonymous: null == isAnonymous
          ? _self.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$CommentModel {
  int get id;
  String get content;
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  UserModel get author;
  PostModel get post;
  @JsonKey(name: 'parent_comment')
  PlainCommentModel get parentComment;
  List<CommentModel> get replies;
  int get depth;
  @JsonKey(name: 'is_anonymous')
  bool get isAnonymous;
  String get path;

  /// Create a copy of CommentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentModelCopyWith<CommentModel> get copyWith =>
      _$CommentModelCopyWithImpl<CommentModel>(
          this as CommentModel, _$identity);

  /// Serializes this CommentModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.post, post) || other.post == post) &&
            (identical(other.parentComment, parentComment) ||
                other.parentComment == parentComment) &&
            const DeepCollectionEquality().equals(other.replies, replies) &&
            (identical(other.depth, depth) || other.depth == depth) &&
            (identical(other.isAnonymous, isAnonymous) ||
                other.isAnonymous == isAnonymous) &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      content,
      createdAt,
      author,
      post,
      parentComment,
      const DeepCollectionEquality().hash(replies),
      depth,
      isAnonymous,
      path);

  @override
  String toString() {
    return 'CommentModel(id: $id, content: $content, createdAt: $createdAt, author: $author, post: $post, parentComment: $parentComment, replies: $replies, depth: $depth, isAnonymous: $isAnonymous, path: $path)';
  }
}

/// @nodoc
abstract mixin class $CommentModelCopyWith<$Res> {
  factory $CommentModelCopyWith(
          CommentModel value, $Res Function(CommentModel) _then) =
      _$CommentModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String content,
      @JsonKey(name: 'created_at') DateTime createdAt,
      UserModel author,
      PostModel post,
      @JsonKey(name: 'parent_comment') PlainCommentModel parentComment,
      List<CommentModel> replies,
      int depth,
      @JsonKey(name: 'is_anonymous') bool isAnonymous,
      String path});

  $UserModelCopyWith<$Res> get author;
  $PostModelCopyWith<$Res> get post;
  $PlainCommentModelCopyWith<$Res> get parentComment;
}

/// @nodoc
class _$CommentModelCopyWithImpl<$Res> implements $CommentModelCopyWith<$Res> {
  _$CommentModelCopyWithImpl(this._self, this._then);

  final CommentModel _self;
  final $Res Function(CommentModel) _then;

  /// Create a copy of CommentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? createdAt = null,
    Object? author = null,
    Object? post = null,
    Object? parentComment = null,
    Object? replies = null,
    Object? depth = null,
    Object? isAnonymous = null,
    Object? path = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      author: null == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as UserModel,
      post: null == post
          ? _self.post
          : post // ignore: cast_nullable_to_non_nullable
              as PostModel,
      parentComment: null == parentComment
          ? _self.parentComment
          : parentComment // ignore: cast_nullable_to_non_nullable
              as PlainCommentModel,
      replies: null == replies
          ? _self.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>,
      depth: null == depth
          ? _self.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as int,
      isAnonymous: null == isAnonymous
          ? _self.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of CommentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get author {
    return $UserModelCopyWith<$Res>(_self.author, (value) {
      return _then(_self.copyWith(author: value));
    });
  }

  /// Create a copy of CommentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostModelCopyWith<$Res> get post {
    return $PostModelCopyWith<$Res>(_self.post, (value) {
      return _then(_self.copyWith(post: value));
    });
  }

  /// Create a copy of CommentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlainCommentModelCopyWith<$Res> get parentComment {
    return $PlainCommentModelCopyWith<$Res>(_self.parentComment, (value) {
      return _then(_self.copyWith(parentComment: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _CommentModel implements CommentModel {
  const _CommentModel(
      {required this.id,
      required this.content,
      @JsonKey(name: 'created_at') required this.createdAt,
      required this.author,
      required this.post,
      @JsonKey(name: 'parent_comment') required this.parentComment,
      required final List<CommentModel> replies,
      required this.depth,
      @JsonKey(name: 'is_anonymous') required this.isAnonymous,
      required this.path})
      : _replies = replies;
  factory _CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  @override
  final int id;
  @override
  final String content;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  final UserModel author;
  @override
  final PostModel post;
  @override
  @JsonKey(name: 'parent_comment')
  final PlainCommentModel parentComment;
  final List<CommentModel> _replies;
  @override
  List<CommentModel> get replies {
    if (_replies is EqualUnmodifiableListView) return _replies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_replies);
  }

  @override
  final int depth;
  @override
  @JsonKey(name: 'is_anonymous')
  final bool isAnonymous;
  @override
  final String path;

  /// Create a copy of CommentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CommentModelCopyWith<_CommentModel> get copyWith =>
      __$CommentModelCopyWithImpl<_CommentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CommentModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CommentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.post, post) || other.post == post) &&
            (identical(other.parentComment, parentComment) ||
                other.parentComment == parentComment) &&
            const DeepCollectionEquality().equals(other._replies, _replies) &&
            (identical(other.depth, depth) || other.depth == depth) &&
            (identical(other.isAnonymous, isAnonymous) ||
                other.isAnonymous == isAnonymous) &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      content,
      createdAt,
      author,
      post,
      parentComment,
      const DeepCollectionEquality().hash(_replies),
      depth,
      isAnonymous,
      path);

  @override
  String toString() {
    return 'CommentModel(id: $id, content: $content, createdAt: $createdAt, author: $author, post: $post, parentComment: $parentComment, replies: $replies, depth: $depth, isAnonymous: $isAnonymous, path: $path)';
  }
}

/// @nodoc
abstract mixin class _$CommentModelCopyWith<$Res>
    implements $CommentModelCopyWith<$Res> {
  factory _$CommentModelCopyWith(
          _CommentModel value, $Res Function(_CommentModel) _then) =
      __$CommentModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String content,
      @JsonKey(name: 'created_at') DateTime createdAt,
      UserModel author,
      PostModel post,
      @JsonKey(name: 'parent_comment') PlainCommentModel parentComment,
      List<CommentModel> replies,
      int depth,
      @JsonKey(name: 'is_anonymous') bool isAnonymous,
      String path});

  @override
  $UserModelCopyWith<$Res> get author;
  @override
  $PostModelCopyWith<$Res> get post;
  @override
  $PlainCommentModelCopyWith<$Res> get parentComment;
}

/// @nodoc
class __$CommentModelCopyWithImpl<$Res>
    implements _$CommentModelCopyWith<$Res> {
  __$CommentModelCopyWithImpl(this._self, this._then);

  final _CommentModel _self;
  final $Res Function(_CommentModel) _then;

  /// Create a copy of CommentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? createdAt = null,
    Object? author = null,
    Object? post = null,
    Object? parentComment = null,
    Object? replies = null,
    Object? depth = null,
    Object? isAnonymous = null,
    Object? path = null,
  }) {
    return _then(_CommentModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      author: null == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as UserModel,
      post: null == post
          ? _self.post
          : post // ignore: cast_nullable_to_non_nullable
              as PostModel,
      parentComment: null == parentComment
          ? _self.parentComment
          : parentComment // ignore: cast_nullable_to_non_nullable
              as PlainCommentModel,
      replies: null == replies
          ? _self._replies
          : replies // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>,
      depth: null == depth
          ? _self.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as int,
      isAnonymous: null == isAnonymous
          ? _self.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of CommentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get author {
    return $UserModelCopyWith<$Res>(_self.author, (value) {
      return _then(_self.copyWith(author: value));
    });
  }

  /// Create a copy of CommentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostModelCopyWith<$Res> get post {
    return $PostModelCopyWith<$Res>(_self.post, (value) {
      return _then(_self.copyWith(post: value));
    });
  }

  /// Create a copy of CommentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlainCommentModelCopyWith<$Res> get parentComment {
    return $PlainCommentModelCopyWith<$Res>(_self.parentComment, (value) {
      return _then(_self.copyWith(parentComment: value));
    });
  }
}

// dart format on
