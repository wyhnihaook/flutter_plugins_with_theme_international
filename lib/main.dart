import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_plugins_with_theme_mode/page/first_page.dart';
import 'package:flutter_plugins_with_theme_mode/page/home_page.dart';
import 'package:flutter_plugins_with_theme_mode/page/second_page.dart';
import 'package:flutter_plugins_with_theme_mode/provider/locale_provider.dart';
import 'package:flutter_plugins_with_theme_mode/provider/theme_provider.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';
import 'provider/provider_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

///目标：主题切换，换肤颜色，国际化（切换语言）

void main() {
  runApp(const MyApp());
  // Android状态栏透明 splash为白色,所以调整状态栏文字为黑色
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //路由信息
  Route<dynamic>? onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case "secondPage":
        return MaterialPageRoute(builder: (_)=> SecondPage());
      case "firstPage":
        return MaterialPageRoute(builder: (_)=> FirstPage());
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      //需要监听两个响应，使用Consumer2，只有一个的使用Consumer
      //这里要特殊注意：使用S.of(context).<key值>方法时
      //必须不在main.dart中使用，获取的为main的context会导致Localizations.of<S>(context, S)方法返回null
      child: Consumer2<ThemeProvider, LocaleProvider>(
        builder: (context, provider, localeProvider,child){
          return MaterialApp(
            //隐藏debug右侧标记
            onGenerateRoute: onGenerateRoute,
            debugShowCheckedModeBanner: false,
            theme: provider.getTheme(),
            darkTheme: provider.getTheme(isDarkMode: true),
            themeMode: provider.getThemeMode(),
            home:const HomePage(),
            //当前本地的语言类型声明
            locale: localeProvider.locale,
            //本地化代理指定
            localizationsDelegates:const [
              S.delegate,

              //需要手动添加依赖 package:flutter_localizations/flutter_localizations.dart
              // 指定本地化的字符串
              GlobalCupertinoLocalizations.delegate,
              // 对应的Cupertino风格
              GlobalMaterialLocalizations.delegate,
              // 指定默认的文本排列方向, 由左到右或由右到左
              GlobalWidgetsLocalizations.delegate
            ],
            //支持语言切换指定
            //const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans')指定对应的地址
            supportedLocales: S.delegate.supportedLocales,
          );
        },
      ),
    );
  }
}

