import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'afazer_provider.dart';
import 'config_provider.dart';

class RootProvider {
  static List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider(create: (_) => AfazerProvider()),
      ChangeNotifierProvider(create: (_) => ConfigProvider()),
    ];
  }
}