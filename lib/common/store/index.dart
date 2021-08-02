import 'package:provide/provide.dart';
import 'package:flutter_note/models/config_state_model.dart' show ConfigModel;

class Store {
  //  我们将会在main.dart中runAPP实例化init
  static init({model, child, dispose = true}) {
    final providers = Providers()..provide(Provider.value(ConfigModel()));
    return ProviderNode(child: child, providers: providers, dispose: dispose);

    // provider写法
    // MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider.value(value: Counter()),
    //   ],
    //   child: child,
    // ),
  }

  //  通过Provide小部件获取状态封装
  static connect<T>({builder, child, scope}) {
    return Provide<T>(builder: builder, child: child, scope: scope);
  }

  //  通过Provide.value<T>(context)获取封装
  static T value<T>(context, {scope}) {
    return Provide.value<T>(context, scope: scope);

    // provider写法
    // Provider.of<Counter>(context, listen: false).increment();
  }
}
