import 'package:zef_ddd_core/zef_ddd_core.dart';

/// Represents a generic identifier for entities within the domain model.
///
/// This abstract class extends [SingleTypeValueObject] to encapsulate an identifier value
/// of a specific type `T`. It provides a standard way to handle entity identifiers across
/// the domain, ensuring they are treated as value objects with value-based equality.
///
/// The class overrides the equality and hash code methods to compare identifier instances
/// based on their encapsulated value, and provides a `toString` method for convenient
/// string representation of the identifier.
///
/// Usage:
/// ```
/// class UserId extends Id<String> {
///   UserId(String value) : super(value);
/// }
/// ```
abstract class Id<T> extends SingleTypeValueObject<T> {
  /// Constructs a new [Id] instance with the provided identifier value.
  ///
  /// The constructor initializes the identifier with a value of type `T`,
  /// leveraging the immutability and value-based equality provided by
  /// [SingleTypeValueObject].
  ///
  /// - Parameters:
  ///   - `value`: The identifier value to encapsulate.
  const Id(super.value);

  /// Compares this identifier to another object.
  ///
  /// Two identifiers are considered equal if they are of the same runtime type
  /// and their encapsulated values are equal. This method ensures that identifiers
  /// can be compared based on their value, maintaining consistency with the concept
  /// of value objects.
  ///
  /// - Parameters:
  ///   - `other`: The object to compare to this identifier.
  ///
  /// - Returns: `true` if the identifiers are considered equal, `false` otherwise.
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Id && runtimeType == other.runtimeType && value == other.value;

  /// Gets the hash code for the identifier.
  ///
  /// The hash code is based on the encapsulated identifier value, ensuring that
  /// identifiers with the same value have the same hash code.
  ///
  /// - Returns: The hash code of the encapsulated identifier value.
  @override
  int get hashCode => value.hashCode;

  /// Returns a string representation of the identifier.
  ///
  /// This method provides a convenient way to represent the identifier as a string,
  /// including its runtime type and encapsulated value, facilitating debugging and logging.
  ///
  /// - Returns: A string that represents the identifier.
  @override
  String toString() => '$runtimeType($value)';
}
