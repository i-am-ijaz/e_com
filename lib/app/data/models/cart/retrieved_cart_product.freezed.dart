// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'retrieved_cart_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RetrievedCartProduct _$RetrievedCartProductFromJson(Map<String, dynamic> json) {
  return _RetrievedCartProduct.fromJson(json);
}

/// @nodoc
mixin _$RetrievedCartProduct {
  Product get product => throw _privateConstructorUsedError;
  List<Option> get options => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RetrievedCartProductCopyWith<RetrievedCartProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RetrievedCartProductCopyWith<$Res> {
  factory $RetrievedCartProductCopyWith(RetrievedCartProduct value,
          $Res Function(RetrievedCartProduct) then) =
      _$RetrievedCartProductCopyWithImpl<$Res, RetrievedCartProduct>;
  @useResult
  $Res call({Product product, List<Option> options});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$RetrievedCartProductCopyWithImpl<$Res,
        $Val extends RetrievedCartProduct>
    implements $RetrievedCartProductCopyWith<$Res> {
  _$RetrievedCartProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? options = null,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Option>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RetrievedCartProductImplCopyWith<$Res>
    implements $RetrievedCartProductCopyWith<$Res> {
  factory _$$RetrievedCartProductImplCopyWith(_$RetrievedCartProductImpl value,
          $Res Function(_$RetrievedCartProductImpl) then) =
      __$$RetrievedCartProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Product product, List<Option> options});

  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$RetrievedCartProductImplCopyWithImpl<$Res>
    extends _$RetrievedCartProductCopyWithImpl<$Res, _$RetrievedCartProductImpl>
    implements _$$RetrievedCartProductImplCopyWith<$Res> {
  __$$RetrievedCartProductImplCopyWithImpl(_$RetrievedCartProductImpl _value,
      $Res Function(_$RetrievedCartProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? options = null,
  }) {
    return _then(_$RetrievedCartProductImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Option>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RetrievedCartProductImpl implements _RetrievedCartProduct {
  _$RetrievedCartProductImpl(
      {required this.product, required final List<Option> options})
      : _options = options;

  factory _$RetrievedCartProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$RetrievedCartProductImplFromJson(json);

  @override
  final Product product;
  final List<Option> _options;
  @override
  List<Option> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  String toString() {
    return 'RetrievedCartProduct(product: $product, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RetrievedCartProductImpl &&
            (identical(other.product, product) || other.product == product) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, product, const DeepCollectionEquality().hash(_options));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RetrievedCartProductImplCopyWith<_$RetrievedCartProductImpl>
      get copyWith =>
          __$$RetrievedCartProductImplCopyWithImpl<_$RetrievedCartProductImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RetrievedCartProductImplToJson(
      this,
    );
  }
}

abstract class _RetrievedCartProduct implements RetrievedCartProduct {
  factory _RetrievedCartProduct(
      {required final Product product,
      required final List<Option> options}) = _$RetrievedCartProductImpl;

  factory _RetrievedCartProduct.fromJson(Map<String, dynamic> json) =
      _$RetrievedCartProductImpl.fromJson;

  @override
  Product get product;
  @override
  List<Option> get options;
  @override
  @JsonKey(ignore: true)
  _$$RetrievedCartProductImplCopyWith<_$RetrievedCartProductImpl>
      get copyWith => throw _privateConstructorUsedError;
}
