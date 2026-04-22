// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <benoit.rolandeau@allcircuits.com>
//
// SPDX-License-Identifier: LicenseRef-ALLCircuits-ACT-1.1

import 'package:act_dart_utility/src/models/value_keepers/value_keeper.dart';
import 'package:flutter/foundation.dart';

/// {@template act_dart_utility.MixinDisposableValueKeeper}
/// This mixin should be used on ValueKeepers that need to dispose of resources when they are no
/// longer needed. It adds a [dispose] method that should be called to clean up any resources held
/// by the value keeper.
/// {@endtemplate}
mixin MixinDisposableValueKeeper<T> on ValueKeeper<T> {
  /// {@template act_dart_utility.MixinDisposableValueKeeper.dispose}
  /// This method should be called when the value keeper is no longer needed, to dispose of any
  /// resources it may hold.
  /// {@endtemplate}
  ///
  /// Call `super.dispose()` at the end in the derived class method (unless otherwise specified by
  /// a derived class)
  @mustCallSuper
  Future<void> dispose() async {}
}
