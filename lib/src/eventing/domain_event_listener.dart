import 'package:zef_ddd_core/zef_ddd_core.dart';

/// Defines the interface for a listener that handles domain events.
///
/// This abstract class is meant to be implemented by any class that
/// wishes to handle specific types of domain events. Implementers
/// must provide an implementation for the [listen] method, which
/// defines how an event of type `T` should be handled.
///
/// The generic type parameter `T` specifies the type of the domain
/// event that the listener is interested in handling.
///
/// Usage:
/// ```
/// class MyEventListener implements DomainEventListener<MyEvent> {
///   @override
///   Future<void> listen(MyEvent event) async {
///     // Handle the event
///   }
/// }
/// ```
abstract class DomainEventListener<T extends DomainEvent> {
  /// Called when an event of type `T` is dispatched.
  ///
  /// Implementers should provide the logic inside this method to handle
  /// the incoming event as necessary. This method might perform actions
  /// such as updating the application state, triggering additional events,
  /// or any other domain-specific logic required by the application.
  ///
  /// - Parameters:
  ///   - `event`: The event of type `T` that needs to be handled.
  ///
  /// - Returns: A future that completes when the event has been fully handled.
  Future<void> listen(T event);
}
