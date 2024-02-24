import 'package:zef_ddd_core/zef_ddd_core.dart';

import 'example_classes/user_id.dart';
import 'example_classes/user_registered_event.dart';
import 'example_classes/user_registration_welcome_email_handler.dart';

void main() {
  // Create and register the listener with the dispatcher
  var welcomeEmailHandler = UserRegistrationWelcomeEmailHandler();
  DomainEventDispatcher.instance.registerListener<UserRegisteredEvent>(welcomeEmailHandler);

  // Simulate user registration and creation of a UserRegisteredEvent
  var userId = UserId('456');
  var userRegisteredEvent = UserRegisteredEvent(userId, 'john.doe@example.com');

  // Dispatch the event
  DomainEventDispatcher.instance.dispatch(userRegisteredEvent).then((_) {
    print('User registration event dispatched successfully.');
  });
}
