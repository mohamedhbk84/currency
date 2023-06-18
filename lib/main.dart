
import 'package:currency/ui/pages/main_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // final storage = await HydratedStorage.build(
  //   storageDirectory: kIsWeb
  //       ? HydratedStorage.webStorageDirectory
  //       : await getTemporaryDirectory(),
  // );
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: await getTemporaryDirectory(),);
  // HydratedBlocOverrides.runZoned(
  //       () =>
            runApp(const MyApp());
  //   storage: storage,
  //   blocObserver: CurrencyBlocObservable(),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner:false,
      darkTheme: ThemeData.dark(),
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home:  MainPage(),
    );
  }
}
