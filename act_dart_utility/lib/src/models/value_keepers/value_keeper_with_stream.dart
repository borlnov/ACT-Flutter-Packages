// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <benoit.rolandeau@allcircuits.com>
//
// SPDX-License-Identifier: LicenseRef-ALLCircuits-ACT-1.1

import 'package:act_abstract_manager/act_abstract_manager.dart';
import 'package:act_dart_utility/src/mixins/value_keepers/mixin_value_keeper_with_stream.dart';
import 'package:act_dart_utility/src/models/value_keepers/value_keeper.dart';

/// {@macro act_dart_utility.ValueTypeIsEqualToSetterValue}
///
/// {@macro act_dart_utility.ValueKeeper}
///
/// {@macro act_dart_utility.MixinValueKeeperWithStream}
///
/// {@macro act_abstract_manager.MixinWithLifeCycleDispose.disposeLifeCycle}
typedef ValueKeeperWithStream<T> = BaseValueKeeperWithStream<T, T>;

/// {@macro act_dart_utility.ValueIsNullableButNotSetter}
///
/// {@macro act_dart_utility.ValueKeeper}
///
/// {@macro act_dart_utility.MixinValueKeeperWithStream}
///
/// {@macro act_abstract_manager.MixinWithLifeCycleDispose.disposeLifeCycle}
typedef ValueKeeperWithStreamAndNullInit<T> = BaseValueKeeperWithStream<T, T?>;

/// {@macro act_dart_utility.ValueKeeper}
///
/// {@macro act_dart_utility.MixinValueKeeperWithStream}
///
/// {@macro act_abstract_manager.MixinWithLifeCycleDispose.disposeLifeCycle}
///
/// {@macro act_dart_utility.SMustBeCastableToT}
class BaseValueKeeperWithStream<S extends T, T> extends BaseValueKeeper<S, T>
    with MixinWithLifeCycleDispose, MixinValueKeeperWithStream<S, T> {
  /// {@macro act_dart_utility.MixinValueKeeperWithStream.emitUnchangedValue}
  @override
  final bool emitUnchangedValue;

  /// Class constructor
  BaseValueKeeperWithStream({required super.value, this.emitUnchangedValue = false});
}
