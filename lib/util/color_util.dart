import 'package:flutter/material.dart';

///描述:颜色工具类
///功能介绍:主要针对界面颜色处理
///创建者:翁益亨
///创建日期:2022/6/9 14:43

///创建对应颜色的枚举,当前涵盖所有的小范围的主题色
enum ThemeTextColor{
  //适应背景色
 background(darkColor: Colors.green, lightColor : Colors.yellow),

 //将所有自定义颜色分类在这里定义
 textColor(darkColor: Colors.orange, lightColor : Colors.red)

  ;

  final Color? darkColor;
  final Color? lightColor;

  const ThemeTextColor({this.darkColor,this.lightColor});
}

///获取主题色对应的颜色，区分黑夜模式/白天模式，返回对应的颜色
Color getThemeCorrespondingTextColor(bool isDarkMode,ThemeTextColor textColor){

  if(isDarkMode){
    return textColor.darkColor!;
  }

  return textColor.lightColor!;
}

