import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../provider/theme_provider.dart';

///描述:第二个页面控制主题样式
///功能介绍:
///创建者:翁益亨
///创建日期:2022/6/8 18:08
class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( S.of(context).title1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(builder: (context, ThemeProvider provider, child) {
              return ElevatedButton(onPressed: () {
                provider.setThemeMode(ThemeMode.dark);
              }, child:  Text( S.of(context).content4));
            },),
            Consumer(builder: (context, ThemeProvider provider, child) {
              return ElevatedButton(onPressed: () {
                provider.setThemeMode(ThemeMode.light);
              }, child:  Text( S.of(context).content5));
            },),
            Consumer(builder: (context, ThemeProvider provider, child) {
              return ElevatedButton(onPressed: () {
                //修改主题色
                //这里主题色要进行测试赋值，非dark模式对应的颜色不能太深，如果太深会变成白色
                //这里涉及的图片最好都使用本地图片渐变或者网络图片
                provider.setThemeColor(Colors.lime);
              }, child:  Text( S.of(context).content9));
            },),
          ],
        ),
      ),
    );
  }
}

