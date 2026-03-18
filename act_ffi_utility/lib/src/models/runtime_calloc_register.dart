// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <benoit.rolandeau@allcircuits.com>
//
// SPDX-License-Identifier: LicenseRef-ALLCircuits-ACT-1.1

import 'dart:ffi' show NativeType, Pointer;

import 'package:equatable/equatable.dart';
import 'package:ffi/ffi.dart' show calloc;

/// A register to keep track of allocated memory using calloc.
class RuntimeCallocRegister extends Equatable {
  /// The list of pointers used for calloc allocations.
  final List<Pointer> _pointers;

  /// Class constructor
  RuntimeCallocRegister() : _pointers = [];

  /// Allocate memory for a given type [T] using the provided [callocAllocator] function.
  /// The allocated pointer is stored in the register for later cleanup.
  /// Returns the allocated pointer.
  ///
  /// To call like this:
  ///
  /// ```dart
  /// final pointer = register.allocate(calloc<YourType>);
  /// // or with count:
  /// final pointer = register.allocate(calloc<YourType>, count);
  /// ```
  Pointer<T> allocate<T extends NativeType>(
    Pointer<T> Function([int count]) callocAllocator, [
    int? count,
  ]) {
    final Pointer<T> pointer;
    if (count != null) {
      pointer = callocAllocator(count);
    } else {
      pointer = callocAllocator();
    }
    _pointers.add(pointer);
    return pointer;
  }

  /// Free all allocated memory.
  void freeAll() {
    for (final pointer in _pointers) {
      calloc.free(pointer);
    }
    _pointers.clear();
  }

  /// Class properties
  @override
  List<Object?> get props => [_pointers];
}
