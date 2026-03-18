// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <benoit.rolandeau@allcircuits.com>
//
// SPDX-License-Identifier: LicenseRef-ALLCircuits-ACT-1.1

import 'package:equatable/equatable.dart';

/// Abstract factory for converting between FFI models and Dart models.
abstract class AbsRuntimeModelFactory<M extends Equatable, FfiModel> {
  /// {@template act_ffi_utility.AbsRuntimeModelFactory.fromFfi}
  /// Convert an FFI model to a Dart model.
  /// {@endtemplate}
  M? fromFfi(FfiModel? ffiModel);
}
