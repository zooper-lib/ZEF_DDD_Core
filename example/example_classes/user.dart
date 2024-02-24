import 'package:zef_ddd_core/zef_ddd_core.dart';

import 'name.dart';
import 'user_id.dart';

class User extends AggregateRoot<UserId> {
  final Name name;

  User({required super.id, required this.name});
}
