// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'main_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MainStateTearOff {
  const _$MainStateTearOff();

  _State call(
      {int? currentIndex,
      EditController? currentEditController,
      required List<EditController> editControllers}) {
    return _State(
      currentIndex: currentIndex,
      currentEditController: currentEditController,
      editControllers: editControllers,
    );
  }
}

/// @nodoc
const $MainState = _$MainStateTearOff();

/// @nodoc
mixin _$MainState {
  int? get currentIndex => throw _privateConstructorUsedError;
  EditController? get currentEditController =>
      throw _privateConstructorUsedError;
  List<EditController> get editControllers =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainStateCopyWith<MainState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) then) =
      _$MainStateCopyWithImpl<$Res>;
  $Res call(
      {int? currentIndex,
      EditController? currentEditController,
      List<EditController> editControllers});
}

/// @nodoc
class _$MainStateCopyWithImpl<$Res> implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  final MainState _value;
  // ignore: unused_field
  final $Res Function(MainState) _then;

  @override
  $Res call({
    Object? currentIndex = freezed,
    Object? currentEditController = freezed,
    Object? editControllers = freezed,
  }) {
    return _then(_value.copyWith(
      currentIndex: currentIndex == freezed
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      currentEditController: currentEditController == freezed
          ? _value.currentEditController
          : currentEditController // ignore: cast_nullable_to_non_nullable
              as EditController?,
      editControllers: editControllers == freezed
          ? _value.editControllers
          : editControllers // ignore: cast_nullable_to_non_nullable
              as List<EditController>,
    ));
  }
}

/// @nodoc
abstract class _$StateCopyWith<$Res> implements $MainStateCopyWith<$Res> {
  factory _$StateCopyWith(_State value, $Res Function(_State) then) =
      __$StateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? currentIndex,
      EditController? currentEditController,
      List<EditController> editControllers});
}

/// @nodoc
class __$StateCopyWithImpl<$Res> extends _$MainStateCopyWithImpl<$Res>
    implements _$StateCopyWith<$Res> {
  __$StateCopyWithImpl(_State _value, $Res Function(_State) _then)
      : super(_value, (v) => _then(v as _State));

  @override
  _State get _value => super._value as _State;

  @override
  $Res call({
    Object? currentIndex = freezed,
    Object? currentEditController = freezed,
    Object? editControllers = freezed,
  }) {
    return _then(_State(
      currentIndex: currentIndex == freezed
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      currentEditController: currentEditController == freezed
          ? _value.currentEditController
          : currentEditController // ignore: cast_nullable_to_non_nullable
              as EditController?,
      editControllers: editControllers == freezed
          ? _value.editControllers
          : editControllers // ignore: cast_nullable_to_non_nullable
              as List<EditController>,
    ));
  }
}

/// @nodoc

class _$_State implements _State {
  const _$_State(
      {this.currentIndex,
      this.currentEditController,
      required this.editControllers});

  @override
  final int? currentIndex;
  @override
  final EditController? currentEditController;
  @override
  final List<EditController> editControllers;

  @override
  String toString() {
    return 'MainState(currentIndex: $currentIndex, currentEditController: $currentEditController, editControllers: $editControllers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _State &&
            const DeepCollectionEquality()
                .equals(other.currentIndex, currentIndex) &&
            const DeepCollectionEquality()
                .equals(other.currentEditController, currentEditController) &&
            const DeepCollectionEquality()
                .equals(other.editControllers, editControllers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentIndex),
      const DeepCollectionEquality().hash(currentEditController),
      const DeepCollectionEquality().hash(editControllers));

  @JsonKey(ignore: true)
  @override
  _$StateCopyWith<_State> get copyWith =>
      __$StateCopyWithImpl<_State>(this, _$identity);
}

abstract class _State implements MainState {
  const factory _State(
      {int? currentIndex,
      EditController? currentEditController,
      required List<EditController> editControllers}) = _$_State;

  @override
  int? get currentIndex;
  @override
  EditController? get currentEditController;
  @override
  List<EditController> get editControllers;
  @override
  @JsonKey(ignore: true)
  _$StateCopyWith<_State> get copyWith => throw _privateConstructorUsedError;
}
