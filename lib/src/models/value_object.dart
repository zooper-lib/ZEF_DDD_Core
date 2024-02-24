/// Represents the base class for value objects in the domain model.
///
/// Value objects are objects that do not have a conceptual identity, are immutable, and
/// are defined only by their attributes. This class provides a foundation for creating
/// value objects by enforcing equality and hash code based on the values of the object's
/// properties rather than an identity.
///
/// Implementers must override the [props] getter to return a list of the properties that
/// should be considered for equality and hash code calculations. This allows for flexible
/// and comprehensive comparison between value object instances based on their contained values.
///
/// Usage:
/// ```
/// class Money extends ValueObject {
///   final double amount;
///   final String currency;
///
///   Money(this.amount, this.currency);
///
///   @override
///   List<Object?> get props => [amount, currency];
/// }
/// ```
abstract class ValueObject {
  /// A list of properties that should be considered for equality and hash code.
  ///
  /// Implementers must override this getter to include all properties that should
  /// be used to determine equality and hash code. This ensures that value object
  /// equality is based on the values of all significant properties rather than object identity.
  List<Object?> get props;

  /// Constructs a new [ValueObject] instance.
  const ValueObject();

  /// Compares this value object to another object.
  ///
  /// Two value objects are considered equal if they are of the same runtime type
  /// and all their respective [props] are equal. This method provides a way to check
  /// value object equality based on contained values rather than object identity.
  ///
  /// - Parameters:
  ///   - `other`: The object to compare to this value object.
  ///
  /// - Returns: `true` if the value objects are considered equal, `false` otherwise.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ValueObject && runtimeType == other.runtimeType && props.every((prop) => other.props.contains(prop));

  /// Gets the hash code for the value object.
  ///
  /// The hash code is calculated based on the [props] of the value object, ensuring
  /// that instances with the same values have the same hash code.
  ///
  /// - Returns: The hash code of the value object based on its properties.
  @override
  int get hashCode => props.fold(0, (prev, element) => prev ^ element.hashCode);
}
