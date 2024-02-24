import 'package:zef_ddd_core/zef_ddd_core.dart';

/// A generic abstract class for creating value objects that encapsulate a single value of a specific type.
///
/// This class extends [ValueObject] and provides a standard implementation for value objects
/// that contain a single value of type `T`. It enforces immutability and value-based equality
/// by considering the encapsulated value in equality and hash code calculations.
///
/// The generic type `T` allows for the creation of value objects with various underlying data
/// types, making this class versatile for different domain modeling scenarios.
///
/// Usage:
/// ```
/// class EmailAddress extends SingleTypeValueObject<String> {
///   EmailAddress(String value) : super(value);
///
///   // Additional validation or behavior specific to an email address can be added here.
/// }
/// ```
abstract class SingleTypeValueObject<T> extends ValueObject {
  /// The encapsulated value of the value object.
  final T _value;

  /// Public getter to expose the encapsulated value of the value object.
  T get value => _value;

  /// Constructs a new [SingleTypeValueObject] instance with the provided value.
  ///
  /// The constructor initializes the value object with a value of type `T`,
  /// enforcing immutability by design. The provided value is stored internally
  /// and can be accessed through the [value] getter.
  ///
  /// - Parameters:
  ///   - `_value`: The value to encapsulate within the value object.
  const SingleTypeValueObject(this._value);

  /// A list containing the encapsulated value for equality and hash code calculations.
  ///
  /// Overrides the [props] getter from [ValueObject] to return a list containing
  /// the single encapsulated value. This ensures that equality and hash code are
  /// based on the value contained within the value object.
  @override
  List<Object?> get props => [_value];
}
