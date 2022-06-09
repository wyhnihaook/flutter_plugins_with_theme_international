import 'package:flutter_plugins_with_theme_mode/provider/locale_provider.dart';
import 'package:flutter_plugins_with_theme_mode/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'count_provider.dart';

///描述:状态管理类
///功能介绍:整合所有需要被管理的状态信息
///最明显，也是使用的原因，是全局状态管理、触发后局部刷新页面
///创建者:翁益亨
///创建日期:2022/6/7 14:52

List<SingleChildWidget> providers = [
  //BuildContext context缺省参数

  ChangeNotifierProvider(create: (_)=>ThemeProvider()),
  ChangeNotifierProvider(create: (_)=>CountProvider()),
  ChangeNotifierProvider(create: (_)=>LocaleProvider()),

];
