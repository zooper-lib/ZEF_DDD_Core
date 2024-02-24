/// Represents the base class for all domain events in the application.
///
/// This abstract class provides a common structure for all events within
/// the domain, including a timestamp indicating when the event occurred.
/// Derived classes should extend this class to include additional information
/// specific to the event they represent.
///
/// The [occurredOn] field records the date and time when the event instance
/// was created, providing a temporal context for the event in the domain.
///
/// Usage:
/// ```
/// class UserRegisteredEvent extends DomainEvent {
///   final String userId;
///
///   UserRegisteredEvent(this.userId);
/// }
/// ```
abstract class DomainEvent {
  /// The date and time when the event occurred, recorded in UTC.
  ///
  /// This field is automatically set to the current date and time
  /// when the event is instantiated, ensuring that every domain event
  /// has a precise timestamp indicating when it was created.
  final DateTime occurredOn;

  /// Constructs a new [DomainEvent] instance with the [occurredOn] field
  /// set to the current date and time in UTC.
  DomainEvent() : occurredOn = DateTime.now().toUtc();
}
