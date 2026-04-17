// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <benoit.rolandeau@allcircuits.com>
//
//
// SPDX-License-Identifier: LicenseRef-ALLCircuits-ACT-1.1

import 'dart:async' show FutureOr, unawaited;

import 'package:act_dart_utility/src/mixins/value_keepers/mixin_disposable_value_keeper.dart';
import 'package:act_dart_utility/src/mixins/value_keepers/mixin_value_keeper_on_stream_update.dart';
import 'package:act_dart_utility/src/mixins/value_keepers/mixin_value_keeper_with_stream.dart';
import 'package:act_dart_utility/src/models/value_keepers/value_keeper.dart';

/// {@macro act_dart_utility.ValueKeeper}
///
/// {@macro act_dart_utility.MixinValueKeeperOnStreamUpdate}
///
/// {@macro act_dart_utility.MixinValueKeeperWithStream}
///
/// {@macro act_dart_utility.MixinDisposableValueKeeper}
class ValueKeeperWithAndOnStream<T, Listened> extends ValueKeeper<T>
    with
        MixinDisposableValueKeeper<T>,
        MixinValueKeeperWithStream<T>,
        MixinValueKeeperOnStreamUpdate<T, Listened> {
  /// {@macro act_dart_utility.MixinValueKeeperOnStreamUpdate.parserCallback}
  @override
  final T? Function(Listened listenedValue) parserCallback;

  /// Class constructor
  ValueKeeperWithAndOnStream({
    required T initialValue,
    required this.parserCallback,
    required Stream<Listened> listenedStream,
    FutureOr<Listened?> Function()? initListenedValueGetter,
  }) : super(value: initialValue) {
    unawaited(initStreamListener(
      listenedStream: listenedStream,
      initListenedValueGetter: initListenedValueGetter,
    ));
  }

  /// Alternative constructor to initialize the stream listener later. In this case, you should call
  /// the [initStreamListener] method to initialize the stream listener when the listened stream is
  /// available.
  ValueKeeperWithAndOnStream.lateInitStream({
    required T initialValue,
    required this.parserCallback,
  }) : super(value: initialValue);
}
