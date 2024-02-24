import 'package:zef_ddd_core/zef_ddd_core.dart';

import 'events.dart';

class MockEventListener extends DomainEventListener<MockEvent> {
  bool eventHandled = false;

  @override
  Future<void> listen(MockEvent event) async {
    eventHandled = true; // Indicate that the event was handled
  }
}

class FirstMockEventListener extends DomainEventListener<MockEvent> {
  final List<String> orderLog;

  FirstMockEventListener(this.orderLog);

  @override
  Future<void> listen(MockEvent event) async {
    // Simulate some work
    await Future.delayed(Duration(milliseconds: 100));
    orderLog.add('first');
  }
}

class SecondMockEventListener extends DomainEventListener<MockEvent> {
  final List<String> orderLog;

  SecondMockEventListener(this.orderLog);

  @override
  Future<void> listen(MockEvent event) async {
    orderLog.add('second');
  }
}

class ErrorMockEventListener extends DomainEventListener<MockEvent> {
  @override
  Future<void> listen(MockEvent event) async {
    throw Exception('Listener error');
  }
}

class AsyncMockEventListener extends DomainEventListener<MockEvent> {
  bool asyncOperationCompleted = false;

  @override
  Future<void> listen(MockEvent event) async {
    await Future.delayed(Duration(milliseconds: 100));
    asyncOperationCompleted = true;
  }
}
