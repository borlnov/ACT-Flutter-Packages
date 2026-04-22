// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <benoit.rolandeau@allcircuits.com>
//
// SPDX-License-Identifier: LicenseRef-ALLCircuits-ACT-1.1

import 'package:act_dart_utility/src/mixins/value_keepers/mixin_disposable_value_keeper.dart';
import 'package:act_dart_utility/src/mixins/value_keepers/mixin_value_keeper_with_stream.dart';
import 'package:act_dart_utility/src/models/value_keepers/value_keeper.dart';

/// {@macro act_dart_utility.ValueKeeper}
///
/// {@macro act_dart_utility.MixinValueKeeperWithStream}
///
/// {@macro act_dart_utility.MixinDisposableValueKeeper}
class ValueKeeperWithStream<T> extends ValueKeeper<T>
    with MixinDisposableValueKeeper<T>, MixinValueKeeperWithStream<T> {
  /// Class constructor
  ValueKeeperWithStream({required super.value});
}
