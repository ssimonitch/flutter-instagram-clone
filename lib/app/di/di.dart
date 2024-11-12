import 'package:get_it/get_it.dart';
import 'package:shared/shared.dart';

void setupDi({required AppFlavor appFlavor}) {
  GetIt.instance.registerSingleton(appFlavor);
}
