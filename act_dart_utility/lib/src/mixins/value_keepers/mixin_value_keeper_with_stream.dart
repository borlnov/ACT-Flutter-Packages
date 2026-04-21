// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <benoit.rolandeau@allcircuits.com>
//
// SPDX-License-Identifier: LicenseRef-ALLCircuits-ACT-1.1

import 'dart:async' show StreamController;

import 'package:act_dart_utility/src/mixins/value_keepers/mixin_disposable_value_keeper.dart';

/// {@template act_dart_utility.MixinValueKeeperWithStream}
/// Adds a stream to a ValueKeeper to notify the listeners when the value changes
///
/// Because it adds a stream, it also adds a [dispose] method to close the stream controller when
/// it's no longer needed. Therefore, you should call the [dispose] method when you no longer need
/// the model to avoid memory leaks.
/// {@endtemplate}
mixin MixinValueKeeperWithStream<T> on MixinDisposableValueKeeper<T> {
  /// This stream controller is used to notify the listeners when the value changes
  final StreamController<T> _valueStreamController = StreamController<T>.broadcast();

  /// This stream is used to notify the listeners when the value changes
  Stream<T> get valueStream => _valueStreamController.stream;

  /// {@macro act_dart_utility.ValueKeeper.value.setter}
  @override
  set value(T newValue) {
    if (newValue == value) {
      // Nothing to do
      return;
    }

    super.value = newValue;
    _valueStreamController.add(newValue);
  }

  /// {@macro act_dart_utility.MixinDisposableValueKeeper.dispose}
  @override
  Future<void> dispose() async {
    await _valueStreamController.close();

    return super.dispose();
  }
}
