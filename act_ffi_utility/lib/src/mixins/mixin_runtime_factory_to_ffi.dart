// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <benoit.rolandeau@allcircuits.com>
//
// SPDX-License-Identifier: LicenseRef-ALLCircuits-ACT-1.1

import 'package:act_ffi_utility/src/models/abs_runtime_model_factory.dart';
import 'package:equatable/equatable.dart';

/// Mixin to add FFI conversion capabilities to a runtime model factory.
mixin MixinRuntimeFactoryToFfi<M extends Equatable, FfiModel>
    on AbsRuntimeModelFactory<M, FfiModel> {
  /// {@template act_ffi_utility.MixinRuntimeFactoryToFfi.toFfi}
  /// Convert a Dart model to an FFI model.
  /// {@endtemplate}
  FfiModel toFfi(M model);
}
