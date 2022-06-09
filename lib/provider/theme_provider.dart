import 'package:flutter/material.dart';

///描述:主题样式相关类
///功能介绍:当前全局主题样式设定
///themeData类 文件属性详解：https://wenku.baidu.com/view/984e26c21ae8b8f67c1cfad6195f312b3169eba3.html
///创建者:翁益亨
///创建日期:2022/6/6 17:37
extension ThemeModeExtension on ThemeMode {
  //相当于调用value的时候，index为当前枚举的index，这里做对应角标获取
  //例如：ThemeMode.system的index为0，每一个枚举信息都有自己的基本参数index就为自身角标，指定枚举类型，index也就确定了
  //主要是用来将枚举转化为字符串进行本地保存，用于下次进入保持主题样式
  String get value => <String>["System", "Light", "Dark"][index];
}

///在实现当前主题切换时，需要确定涉及修改的内容
///1.顶部状态栏的颜色（系统日期/wifi所在的一行）
///2.标题栏颜色（顶部信息）
///3.容器的背景色（标题栏下的整个容器信息）
///4.字体颜色
///5.图片（系统图片颜色设定或者图片信息替换）
///6.其他组件内部设置跟随主题色值需要遇到时再进行处理...（例如：tab指示器）
///7.所有页面自定义颜色适配的情况，就需要抽取出当前的色值，在对应的页面监听进行配置--》参考first_page.dart文件

///首先设定当前主题通知类，用于内容修改后及时通知相关的组件/容器重新渲染
class ThemeProvider extends ChangeNotifier {

  // 当前主题颜色(部分布局换肤功能)
  MaterialColor? _themeColor;

  //记录当前的主题
  ThemeMode? _themeMode;

  //当前主题匹配内容，需要存储到缓存中进行处理 todo
  //getThemeMode中获取  setThemeMode方法中存储
  String themeModeString = "System";

  //用来适配页面自定义属性中的区别
  //判断当前是否是dark模式
  bool isDarkMode(BuildContext context) {
    //默认亮度是跟随模式变化，黑夜/白天模式，所以这样匹配是否是暗夜模式
    return Theme.of(context).brightness == Brightness.dark;
  }

  //将当前的的主题进行转化处理
  ThemeMode getThemeMode() {
    //获取当前缓存的主题类型
    //默认设置为系统模式，实际上需要从缓存中读取
    switch (themeModeString) {
      case "System":
        //跟随系统
        _themeMode = ThemeMode.system;
        break;
      case "Dark":
        //暗夜模式
        _themeMode = ThemeMode.dark;
        break;
      default:
        //默认light模式
        _themeMode = ThemeMode.light;
        break;
    }

    return _themeMode!;
  }

  //外部点击替换当前的主题模式
  void setThemeMode(ThemeMode themeMode) {
    //更新整个相关的容器/组件内容

    themeModeString = themeMode.value;
    notifyListeners();
  }

  void setThemeColor(MaterialColor color) {
    //更新整个相关的容器/组件内容

    _themeColor = color;
    notifyListeners();
  }

  //当前对应的主题样式设定
  //使用时需要结合实际情况进行拓展属性，颜色属性根据当前设计风格设定
  ThemeData getTheme({bool isDarkMode = false}) {
    //应⽤整体主题的亮度
    var brightness = isDarkMode ? Brightness.dark : Brightness.light;

    // 定义⼀个单⼀的颜⾊以及⼗个⾊度的⾊块，设置主题theme的颜色。
    // 设置后影响范围等同于：primaryColor（决定导航与tabBar的颜色） + accentColor（组件的前景色）
    var primarySwatch = _themeColor ?? (isDarkMode ? Colors.blue : Colors.yellow);

    //Scaffold的默认颜⾊， 典型Material应⽤程序或应⽤程序内页⾯的背景颜⾊
    var scaffoldBackgroundColor = isDarkMode ? Colors.black : Colors.white;

    //⽤于提⽰⽂本或占位符⽂本的颜⾊
    var hintColor = isDarkMode ? Colors.white : Colors.black;

    //⽤于输⼊验证错误的颜⾊，例如在TextField中
    var errorColor = isDarkMode ? Colors.yellow : Colors.red;

    //选项卡中选定的选项卡指⽰器的颜⾊
    var indicatorColor = isDarkMode ? Colors.white : Colors.green;

    //⽤于突出显⽰Switch、Radio和Checkbox等可切换⼩部件的活动状态的颜⾊
    var toggleableActiveColor = isDarkMode ? Colors.black : Colors.white;

    //InputDecorator、TextField和TextFormField的默认InputDecoration值，默认主题样式
    var inputDecorationTheme = InputDecorationTheme(
      hintStyle: TextStyle(
          fontSize: 14, color: isDarkMode ? Colors.white : Colors.black),
    );

    //⽤于⾃定义Appbar的颜⾊、⾼度、亮度、iconTheme和textTheme的主题
    //重新绘制当前顶部的显示内容
    var appBarTheme = AppBarTheme(
        elevation: 0,
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        titleTextStyle: TextStyle(
          color: isDarkMode ? Colors.white : Colors.black,
        ));

    //选择⽂本控制器的主题样式
    var textSelectionTheme = TextSelectionThemeData(
      //光标颜色
      cursorColor: isDarkMode ? Colors.white : Colors.black,
      //文本字段选中文本颜色
      selectionColor: isDarkMode ? Colors.white : Colors.black,
      //调节当前文本中指定部分颜色
      selectionHandleColor: isDarkMode ? Colors.white : Colors.black,
    );

    ThemeData themeData = ThemeData(
        brightness: brightness,
        primarySwatch: primarySwatch,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        hintColor: hintColor,
        errorColor: errorColor,
        indicatorColor: indicatorColor,
        toggleableActiveColor: toggleableActiveColor,
        inputDecorationTheme: inputDecorationTheme,
        appBarTheme: appBarTheme,
        textSelectionTheme: textSelectionTheme,
        //当前字体样式设定，其中包括了title/body/button等其中的文字信息，需要设置对应的textStyle进行匹配
        textTheme: TextTheme(
          //当前设置全局主题样式可以通过Theme.of(context).textTheme.bodyMedium进行适配，对应不同页面需求的字体色值大小不同的情况
          //这里全局做封装处理
          //默认使用bodyMedium属性，系统字体可以设置对应大小
          bodyMedium: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ));

    return themeData;
  }
}
