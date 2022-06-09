import 'package:flutter/material.dart';

///描述:首页点击自增数据提供
///功能介绍:首页点击自增数据提供
///******测试当前是否为局部响应式渲染
///创建者:翁益亨
///创建日期:2022/6/7 15:18
class CountProvider extends ChangeNotifier{

  int _count = 0;

  int get count =>_count;

  void autoincrement(){
    _count++;
    notifyListeners();
  }
}