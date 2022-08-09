import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:surprise/router/routes.dart';
import 'package:surprise/views/home/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  String get initialPage {
    return "/Home";
  }

  @override
  Widget build(BuildContext context) {
    Widget app = GetMaterialApp(
      initialRoute: initialPage,
      routingCallback: (routing) {
        // logger.i("Hello:${routing!.current}");
        // if (routing.current == "/NoticePage") {
        //   nextTick(Duration(seconds: 0))
        //       .then((value) => Get.offAndToNamed("/MyFormPage"));
        // }
      },
      getPages: getPages(),
      // unknownRoute: GetPage(
      //     name: "/NotFoound",
      //     page: () {
      //       return const UpholdPage(
      //         text: "页面未找到",
      //       );
      //     }),
      theme: ThemeData(
        platform: TargetPlatform.iOS,
        scaffoldBackgroundColor: Colors.white,
      ),
      localizationsDelegates: const [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('zh', 'CH')],
      builder: (context, child) {
        ScreenUtil.init(context, designSize: const Size(750, 1334));
        if (child == null) return Container();
        Widget newChild = child;
        newChild = BotToastInit()(context, newChild);
        newChild = Stack(
          children: [
            newChild,
          ],
        );
        return newChild;
      },
    );
    return app;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // switch (state) {
    //   case AppLifecycleState.inactive: // 处于这种状态的应用程序应该假设它们可能在任何时候暂停。
    //     break;
    //   case AppLifecycleState.resumed: // 应用程序可见，前台
    //     Statistics.appVisibleChange(true);
    //     Config.onVisible(true);
    //     break;
    //   case AppLifecycleState.paused: // 应用程序不可见，后台
    //     Statistics.appVisibleChange(false);
    //     Config.onVisible(false);
    //     break;
    //   case AppLifecycleState.detached:
    //     break;
    // }
  }
}

