import 'package:floor/floor.dart';
import 'package:object_tive_test/src/data/local/dao/cache_dao.dart';
import 'package:object_tive_test/src/data/local/dao/entity/User.dart';

@Database(version: 1, entities: [User])
abstract class AppDatabase extends FloorDatabase{
  UserDao get userDao;
}