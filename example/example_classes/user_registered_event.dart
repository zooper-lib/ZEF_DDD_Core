import 'package:zef_ddd_core/zef_ddd_core.dart';

import 'user_id.dart';

class UserRegisteredEvent extends DomainEvent {
  final UserId userId;
  final String email;

  UserRegisteredEvent(this.userId, this.email);
}
