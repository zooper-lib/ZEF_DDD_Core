import 'package:zef_ddd_core/zef_ddd_core.dart';

import 'user_registered_event.dart';

class UserRegistrationWelcomeEmailHandler extends DomainEventListener<UserRegisteredEvent> {
  @override
  Future<void> listen(UserRegisteredEvent event) async {
    // Simulate sending an email
    print('Sending welcome email to ${event.email}');
  }
}
