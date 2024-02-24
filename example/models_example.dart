import 'example_classes/name.dart';
import 'example_classes/user.dart';
import 'example_classes/user_id.dart';

void main() {
  // Creating a new UserId
  UserId userId = UserId('123');

  // Creating a new User Name
  Name userName = Name('John Doe');

  // Creating a new User entity with the UserId and Name
  User user = User(id: userId, name: userName);

  // Demonstrating usage
  print('User ID: ${user.id.value}'); // Output: User ID: 123
  print('User Name: ${user.name.value}'); // Output: User Name: John Doe
}
