import 'package:test/test.dart';
import 'package:zef_ddd_core/zef_ddd_core.dart';

import 'test_classes/events.dart';
import 'test_classes/listeners.dart';

void main() {
  group('DomainEvent Tests', () {
    test('should correctly initialize occurredOn property', () {
      var event = MockEvent();
      expect(event.occurredOn, isA<DateTime>());
    });
  });

  group('DomainEventDispatcher Tests', () {
    late DomainEventDispatcher dispatcher;
    late MockEventListener listener;

    setUp(() {
      dispatcher = DomainEventDispatcher.instance;
      listener = MockEventListener();
      dispatcher.registerListener<MockEvent>(listener);
    });

    test('should correctly dispatch events to registered listeners', () async {
      var event = MockEvent();
      await dispatcher.dispatch(event);

      expect(listener.eventHandled, isTrue);
    });
  });

  group('Event Handling Order Tests', () {
    late DomainEventDispatcher dispatcher;
    late List<String> orderLog;

    setUp(() {
      dispatcher = DomainEventDispatcher.instance;
      orderLog = [];
      dispatcher.registerListener<MockEvent>(FirstMockEventListener(orderLog));
      dispatcher.registerListener<MockEvent>(SecondMockEventListener(orderLog));
    });

    test('should handle events in the correct order', () async {
      var event = MockEvent();
      await dispatcher.dispatch(event);

      expect(orderLog, equals(['first', 'second']));
    });
  });

  group('Event Handler Unregistration Tests', () {
    late DomainEventDispatcher dispatcher;
    late MockEventListener listener;

    setUp(() {
      dispatcher = DomainEventDispatcher.instance;
      listener = MockEventListener();
      dispatcher.registerListener<MockEvent>(listener);
    });

    test('should not handle events after listener is unregistered', () async {
      dispatcher.unregisterListener<MockEvent>(listener);

      var event = MockEvent();
      await dispatcher.dispatch(event);

      expect(listener.eventHandled, isFalse);
    });
  });

  group('Event Listener Error Handling Tests', () {
    late DomainEventDispatcher dispatcher;
    late ErrorMockEventListener errorListener;

    setUp(() {
      dispatcher = DomainEventDispatcher.instance;
      errorListener = ErrorMockEventListener();
      dispatcher.registerListener<MockEvent>(errorListener);
    });

    test('should gracefully handle listener errors', () async {
      var event = MockEvent();

      // Expect dispatching to complete without throwing
      expect(dispatcher.dispatch(event), completes);
    });
  });

  group('Asynchronous Event Handling Tests', () {
    late DomainEventDispatcher dispatcher;
    late AsyncMockEventListener asyncListener;

    setUp(() {
      dispatcher = DomainEventDispatcher.instance;
      asyncListener = AsyncMockEventListener();
      dispatcher.registerListener<MockEvent>(asyncListener);
    });

    test('should wait for asynchronous operations in listeners to complete', () async {
      var event = MockEvent();
      await dispatcher.dispatch(event);

      expect(asyncListener.asyncOperationCompleted, isTrue);
    });
  });
}
