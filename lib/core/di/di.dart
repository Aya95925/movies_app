import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'di.config.dart'; // سيتم توليده تلقائياً بواسطة build_runner

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();
