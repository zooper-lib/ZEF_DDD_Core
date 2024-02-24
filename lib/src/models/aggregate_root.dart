import 'package:zef_ddd_core/zef_ddd_core.dart';

/// Represents the root of an aggregate, a cluster of domain entities and value objects.
///
/// This abstract class extends [Entity], inheriting its identity characteristics,
/// and serves as the foundation for all aggregate roots in the domain model. Aggregate
/// roots are the main entry points for accessing and performing operations on aggregates,
/// ensuring consistency and enforcing aggregate boundaries.
///
/// The generic type parameter `TId` represents the type of the identifier used by the
/// aggregate root, which must extend from [Id]. This allows for flexibility in defining
/// custom identifier types for different aggregates.
///
/// Usage:
/// ```
/// class User extends AggregateRoot<UserId> {
///   final String name;
///
///   User({required UserId id, required this.name}) : super(id: id);
/// }
/// ```
abstract class AggregateRoot<TId extends Id> extends Entity<TId> {
  /// Constructs a new instance of [AggregateRoot] with the provided identifier.
  ///
  /// The `id` parameter is required to uniquely identify instances of the aggregate root
  /// and must be of a type that extends [Id], ensuring that each aggregate root has a
  /// distinct and meaningful identity within the domain.
  ///
  /// - Parameters:
  ///   - `id`: The unique identifier for the aggregate root instance.
  const AggregateRoot({required super.id});
}
