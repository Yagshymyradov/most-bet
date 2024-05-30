// ignore_for_file: constant_identifier_names
// ignore: depend_on_referenced_packages
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/enums.dart';
import 'auth_model.dart';
import 'service/preferences.dart';

class UserState {
  final String? name;
  final String? age;
  final ProfilePhoto? photo;
  final List<WorkoutTypes>? workoutTypes;

  UserState({
    this.name,
    this.age,
    this.photo,
    this.workoutTypes,
  });

  factory UserState.fromJson(Map<String, dynamic> json) {
    return UserState(
      name: json['name'] as String,
      age: json['age'] as String,
      photo: ProfilePhoto.fromJson(json['photo'] as String),
      workoutTypes: (json['workoutTypes'] as List<dynamic>?)
          ?.map((e) => WorkoutTypes.fromJson(e as String))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'age': age,
        'photo': photo,
        'workoutTypes': workoutTypes,
      };
}

class UserStateController extends StateNotifier<UserState?> {
  static const _UserState = 'user_state';

  final AppPrefsService _service;

  UserStateController(this._service, super._state);

  static UserState? initialState(AppPrefsService service) {
    UserState? state;
    try {
      final jsonStr = service.getString(_UserState);
      if (jsonStr != null) {
        state = UserState.fromJson(jsonDecode(jsonStr) as Map<String, dynamic>);
      }
    } catch (e) {
      //ignore
    }

    return state;
  }

  Future<void> onSignedIn(AuthModel authModel) async {
    final newState = UserState(
      name: authModel.name,
      age: authModel.age,
      photo: authModel.photo,
      workoutTypes: authModel.workoutTypes,
    );

    state = newState;

    try {
      await _service.setString(_UserState, jsonEncode(newState.toJson()));
    } catch (e) {
      //ignore
    }
  }
}
