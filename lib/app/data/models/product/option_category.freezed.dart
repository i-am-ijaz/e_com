// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'option_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OptionCategory _$OptionCategoryFromJson(Map<String, dynamic> json) {
  return _OptionCategory.fromJson(json);
}

/// @nodoc
mixin _$OptionCategory {
  String get title => throw _privateConstructorUsedError;
  List<Option> get options => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OptionCategoryCopyWith<OptionCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionCategoryCopyWith<$Res> {
  factory $OptionCategoryCopyWith(
          OptionCategory value, $Res Function(OptionCategory) then) =
      _$OptionCategoryCopyWithImpl<$Res, OptionCategory>;
  @useResult
  $Res call({String title, List<Option> options});
}

/// @nodoc
class _$OptionCategoryCopyWithImpl<$Res, $Val extends OptionCategory>
    implements $OptionCategoryCopyWith<$Res> {
  _$OptionCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? options = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Option>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OptionCategoryImplCopyWith<$Res>
    implements $OptionCategoryCopyWith<$Res> {
  factory _$$OptionCategoryImplCopyWith(_$OptionCategoryImpl value,
          $Res Function(_$OptionCategoryImpl) then) =
      __$$OptionCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, List<Option> options});
}

/// @nodoc
class __$$OptionCategoryImplCopyWithImpl<$Res>
    extends _$OptionCategoryCopyWithImpl<$Res, _$OptionCategoryImpl>
    implements _$$OptionCategoryImplCopyWith<$Res> {
  __$$OptionCategoryImplCopyWithImpl(
      _$OptionCategoryImpl _value, $Res Function(_$OptionCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? options = null,
  }) {
    return _then(_$OptionCategoryImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Option>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OptionCategoryImpl implements _OptionCategory {
  _$OptionCategoryImpl(
      {required this.title, required final List<Option> options})
      : _options = options;

  factory _$OptionCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$OptionCategoryImplFromJson(json);

  @override
  final String title;
  final List<Option> _options;
  @override
  List<Option> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  String toString() {
    return 'OptionCategory(title: $title, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionCategoryImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(_options));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionCategoryImplCopyWith<_$OptionCategoryImpl> get copyWith =>
      __$$OptionCategoryImplCopyWithImpl<_$OptionCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OptionCategoryImplToJson(
      this,
    );
  }
}

abstract class _OptionCategory implements OptionCategory {
  factory _OptionCategory(
      {required final String title,
      required final List<Option> options}) = _$OptionCategoryImpl;

  factory _OptionCategory.fromJson(Map<String, dynamic> json) =
      _$OptionCategoryImpl.fromJson;

  @override
  String get title;
  @override
  List<Option> get options;
  @override
  @JsonKey(ignore: true)
  _$$OptionCategoryImplCopyWith<_$OptionCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
