import 'package:zef_ddd_core/zef_ddd_core.dart';

/// An abstract base class representing a domain entity with a unique identity.
///
/// Entities within a domain model are objects that are not defined by their attributes,
/// but rather by a thread of continuity and identity. The [Entity] class captures this
/// concept by wrapping an identity of type `TId`, which extends [Id], ensuring that each
/// entity instance can be uniquely identified within the domain.
///
/// The class provides an implementation for the equality operator and hash code based on
/// the entity's identity, enabling entities to be compared and used in collections effectively.
///
/// Usage:
/// ```
/// class User extends Entity<UserId> {
///   final String name;
///
///   User({required UserId id, required this.name}) : super(id: id);
/// }
/// ```
abstract class Entity<TId extends Id> {
  /// The unique identifier for the entity.
  final TId _id;

  /// Public getter to expose the entity's unique identifier.
  TId get id => _id;

  /// Constructs a new [Entity] instance with the provided identifier.
  ///
  /// The `id` parameter is required to uniquely identify the entity instance,
  /// ensuring that each entity has a distinct and meaningful identity within
  /// the domain.
  ///
  /// - Parameters:
  ///   - `id`: The unique identifier for the entity instance.
  const Entity({required TId id}) : _id = id;

  /// Compares this entity to another object.
  ///
  /// Two entities are considered equal if they are of the same runtime type and their
  /// identifiers are equal. This method provides a way to check entity equality based on
  /// identity rather than object state.
  ///
  /// - Parameters:
  ///   - `other`: The object to compare to this entity.
  ///
  /// - Returns: `true` if the entities are considered equal, `false` otherwise.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Entity && runtimeType == other.runtimeType && _id == other._id;

  /// Gets the hash code for the entity.
  ///
  /// The hash code is based on the entity's unique identifier, ensuring consistency
  /// across instances with the same identity.
  ///
  /// - Returns: The hash code of the entity's identifier.
  @override
  int get hashCode => _id.hashCode;
}
