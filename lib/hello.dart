import 'hello_platform_interface.dart';
import 'dart:ffi' as ffi;
import 'dart:io';
import 'package:ffi/ffi.dart';
import 'package:path/path.dart' as path;
// C function signatures

// Dart function signatures
typedef _testFunc = ffi.Pointer<Utf8> Function();
typedef _addFunc = ffi.Double Function(ffi.Double, ffi.Double);

// Getting a library that holds needed sym bols

ffi.DynamicLibrary _lib = Platform.isAndroid
    ? ffi.DynamicLibrary.open('libfoo.so')
    : Platform.isLinux
        ? ffi.DynamicLibrary.open(path.join('../', 'library', 'libfoo.so'))
        : ffi.DynamicLibrary.process();

// Looking for the functions
final _testFunc _test =
    _lib.lookup<ffi.NativeFunction<_testFunc>>('test').asFunction();
final double Function(double, double) _add =
    _lib.lookup<ffi.NativeFunction<_addFunc>>('add').asFunction();

String printTest() {
  return _test().toDartString();
}

double add(double x, double y) {
  return _add(x, y);
}

class Hello {
  Future<String?> getPlatformVersion() {
    return HelloPlatform.instance.getPlatformVersion();
  }
}
