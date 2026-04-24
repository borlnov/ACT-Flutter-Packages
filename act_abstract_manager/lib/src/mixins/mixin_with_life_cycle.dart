// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <benoit.rolandeau@allcircuits.com>
//
// SPDX-License-Identifier: LicenseRef-ALLCircuits-ACT-1.1

import 'package:act_abstract_manager/src/mixins/mixin_with_life_cycle_dispose.dart';
import 'package:flutter/foundation.dart';

/// This mixin is used to add life cycle methods to services and managers
mixin MixinWithLifeCycle on MixinWithLifeCycleDispose {
  /// {@template act_abstract_manager.MixinWithLifeCycle.initLifeCycle}
  /// Asynchronous initialization of the class.
  /// {@endtemplate}
  ///
  /// Call `super.initLifeCycle()` first in the derived class method (unless otherwise specified by
  /// a derived class)
  @mustCallSuper
  Future<void> initLifeCycle() async {}
}
