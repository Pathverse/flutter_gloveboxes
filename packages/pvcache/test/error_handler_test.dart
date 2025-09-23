import 'package:flutter_test/flutter_test.dart';
import 'package:pvcache/src/adapter.dart';
import 'package:pvcache/src/cache.dart';
import 'package:pvcache/src/interface.dart';
import 'package:pvcache/templates/storage/inmemory.dart';

/// Test adapter that implements OnError to catch exceptions
class TestErrorAdapter extends PVAdapter with OnError, PreGet {
  bool errorHandlerCalled = false;
  Exception? caughtException;

  TestErrorAdapter(super.uid);

  @override
  int get onErrorPriority => 0;

  @override
  bool get mainFuncExclusive => false;

  @override
  Future<void> onError(PVCtx ctx) async {
    errorHandlerCalled = true;
    caughtException = ctx.exception;
    ctx.errorHandled = true; // Mark error as handled
  }

  @override
  int get preGetPriority => 0;

  @override
  Future<void> preGet(PVCtx ctx) async {
    // Intentionally throw an error to test error handling
    throw Exception('Test error from preGet');
  }
}

/// Test adapter that implements OnError for main function only
class TestMainErrorAdapter extends PVAdapter with OnError {
  bool errorHandlerCalled = false;
  Exception? caughtException;

  TestMainErrorAdapter(super.uid);

  @override
  int get onErrorPriority => 0;

  @override
  bool get mainFuncExclusive => true; // Only handle main function errors

  @override
  Future<void> onError(PVCtx ctx) async {
    errorHandlerCalled = true;
    caughtException = ctx.exception;
    ctx.errorHandled = true; // Mark error as handled
  }
}

/// Storage that throws errors in get method
class ErrorStorage extends PVBaseStorage with MetadataStorage {
  @override
  Future<void> get(PVCtx ctx) async {
    throw Exception('Storage error in get');
  }

  @override
  Future<void> set(PVCtx ctx) async {
    throw Exception('Storage error in set');
  }

  @override
  Future<void> delete(PVCtx ctx) async {
    throw Exception('Storage error in delete');
  }

  @override
  Future<void> clear(PVCtx ctx) async {
    throw Exception('Storage error in clear');
  }

  @override
  Future<void> exists(PVCtx ctx) async {
    throw Exception('Storage error in exists');
  }

  @override
  Future<void> init(PVBaseCache cache) async {
    // No init needed for error storage
  }
}

/// Test adapter with high priority for testing execution order
class HighPriorityErrorAdapter extends PVAdapter with OnError, PreGet {
  bool errorHandlerCalled = false;
  
  HighPriorityErrorAdapter(super.uid);
  
  @override
  int get onErrorPriority => 0; // High priority
  
  @override
  bool get mainFuncExclusive => false;
  
  @override
  Future<void> onError(PVCtx ctx) async {
    errorHandlerCalled = true;
    ctx.errorHandled = true; // Mark error as handled
  }
  
  @override
  int get preGetPriority => 0;
  
  @override
  Future<void> preGet(PVCtx ctx) async {
    throw Exception('Test error for priority testing');
  }
}

/// Test adapter with low priority for testing execution order
class LowPriorityErrorAdapter extends PVAdapter with OnError {
  bool errorHandlerCalled = false;
  
  LowPriorityErrorAdapter(super.uid);
  
  @override
  int get onErrorPriority => 10; // Low priority
  
  @override
  bool get mainFuncExclusive => false;
  
  @override
  Future<void> onError(PVCtx ctx) async {
    errorHandlerCalled = true;
    // This should not be reached since high priority handler handles error first
  }
}

void main() {
  group('OnError Handler Tests', () {
    test('OnError should catch adapter exceptions', () async {
      final errorAdapter = TestErrorAdapter('test-error-adapter');
      final storage = InMemory();
      
      final cache = PVCache(
        env: 'test-env-1',
        adapters: [errorAdapter],
        storage: storage,
      );

      // This should trigger the error handler due to preGet exception
      // Since errorHandled is set to true, we should NOT get an exception
      dynamic result;
      try {
        result = await cache.get('test-key');
      } catch (e) {
        fail('Exception should have been handled by OnError: $e');
      }

      // Check if error handler was called
      expect(errorAdapter.errorHandlerCalled, isTrue, 
        reason: 'OnError handler should have been called');
      expect(errorAdapter.caughtException?.toString(), contains('Test error from preGet'),
        reason: 'Should have caught the preGet exception');
      expect(result, isNull, reason: 'Result should be null since operation was short-circuited');
    });

    test('OnError mainFuncExclusive should only catch main function errors', () async {
      final mainErrorAdapter = TestMainErrorAdapter('test-main-error-adapter');
      final storage = ErrorStorage();
      
      final cache = PVCache(
        env: 'test-env-2',
        adapters: [mainErrorAdapter],
        storage: storage,
      );

      // This should trigger the main error handler due to storage exception
      // Since errorHandled is set to true, we should NOT get an exception
      dynamic result;
      try {
        result = await cache.get('test-key');
      } catch (e) {
        fail('Exception should have been handled by OnError main: $e');
      }

      // Check if main error handler was called
      expect(mainErrorAdapter.errorHandlerCalled, isTrue,
        reason: 'OnError main handler should have been called for storage errors');
      expect(mainErrorAdapter.caughtException?.toString(), contains('Storage error in get'),
        reason: 'Should have caught the storage exception');
      expect(result, isNull, reason: 'Result should be null since storage threw an error');
    });

    test('OnError mainFuncExclusive should NOT catch adapter exceptions', () async {
      final mainErrorAdapter = TestMainErrorAdapter('test-main-error-adapter-2');
      final errorAdapter = TestErrorAdapter('test-error-adapter-2');
      final storage = InMemory();
      
      final cache = PVCache(
        env: 'test-env-3',
        adapters: [mainErrorAdapter, errorAdapter],
        storage: storage,
      );

      // This should NOT trigger the main error handler due to adapter exception
      // But it should trigger the general error handler and not throw
      dynamic result;
      try {
        result = await cache.get('test-key');
      } catch (e) {
        fail('Exception should have been handled by general OnError: $e');
      }

      // Check that main error handler was NOT called for adapter errors
      expect(mainErrorAdapter.errorHandlerCalled, isFalse,
        reason: 'OnError main handler should NOT be called for adapter errors');
      
      // But the general error handler should have been called
      expect(errorAdapter.errorHandlerCalled, isTrue,
        reason: 'General OnError handler should have been called');
      expect(result, isNull, reason: 'Result should be null since operation was short-circuited');
    });
  });
}