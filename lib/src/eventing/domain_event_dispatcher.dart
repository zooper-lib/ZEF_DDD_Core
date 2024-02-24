import 'package:zef_ddd_core/zef_ddd_core.dart';

/// Manages the dispatching of domain events to registered listener.
///
/// This class implements the Singleton pattern to ensure that only one
/// instance is used throughout the application. It provides methods to
/// register event listeners and dispatch events to them.
///
/// Usage:
/// ```
/// DomainEventDispatcher.instance.registerListener<MyEvent>(myEventListener);
/// DomainEventDispatcher.instance.dispatch(myEventInstance);
/// ```
class DomainEventDispatcher {
  // Singleton instance, internally managed
  static final DomainEventDispatcher _instance =
      DomainEventDispatcher._internal();

  // Instance variable to hold listeners
  final Map<Type, List<DomainEventListener<DomainEvent>>> _listeners = {};

  // Private constructor to prevent external instantiation
  DomainEventDispatcher._internal();

  /// Gets the singleton instance of [DomainEventDispatcher].
  static DomainEventDispatcher get instance => _instance;

  /// Registers an event listener for a specific domain event type.
  ///
  /// The generic type parameter `T` specifies the domain event type
  /// for which the listener is being registered. The `listener` parameter
  /// is a callback function that will be invoked when an event of type `T`
  /// is dispatched.
  ///
  /// - Parameters:
  ///   - `T`: The type of the domain event.
  ///   - `listener`: The event listener to be invoked on event dispatch.
  void registerListener<T extends DomainEvent>(
      DomainEventListener<T> listener) {
    final Type eventType = T;

    _listeners[eventType] ??= [];
    _listeners[eventType]!.add(listener);
  }

  /// Dispatches a domain event to all registered listeners for its type.
  ///
  /// This method asynchronously invokes all event listeners registered
  /// for the runtime type of the provided `event` parameter. Event listeners
  /// are invoked in the order they were registered.
  ///
  /// - Parameters:
  ///   - `event`: The domain event to dispatch to registered listeners.
  ///
  /// - Returns: A future that completes when all event listeners have been invoked.
  Future<void> dispatch(DomainEvent event) async {
    List<DomainEventListener<DomainEvent>>? eventListeners =
        _listeners[event.runtimeType];
    if (eventListeners != null) {
      for (var listener in eventListeners) {
        try {
          await listener.listen(event);
        } catch (e) {
          // Handle the error, log it, or ignore it, depending on your application's needs
          print('Error in listener $listener for event $event: $e');
        }
      }
    }
  }

  /// Unregisters a previously registered event listener for a specific domain event type.
  ///
  /// This method allows for the removal of a specific event listener from the internal
  /// registry, preventing it from receiving future events of type `T`. If the specified
  /// listener is not found within the registry for the specified event type, the method
  /// has no effect.
  ///
  /// It's important to note that if the same listener instance was registered multiple
  /// times for the same event type, this method will only remove the first occurrence
  /// found in the list of registered listeners for that event type.
  ///
  /// - Parameters:
  ///   - `T`: The type of the domain event for which the listener was registered.
  ///   - `listener`: The event listener to be unregistered.
  ///
  /// Usage:
  /// ```
  /// DomainEventDispatcher.instance.unregisterListener<MyEvent>(myEventListener);
  /// ```
  void unregisterListener<T extends DomainEvent>(
      DomainEventListener<T> listener) {
    final Type eventType = T;
    List<DomainEventListener<DomainEvent>>? eventListeners =
        _listeners[eventType];

    if (eventListeners != null) {
      eventListeners.remove(listener);

      // Optionally, remove the entry for the event type if there are no more listeners.
      if (eventListeners.isEmpty) {
        _listeners.remove(eventType);
      }
    }
  }
}
