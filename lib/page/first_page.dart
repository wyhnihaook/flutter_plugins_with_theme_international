import 'package:flutter/material.dart';
import 'package:flutter_plugins_with_theme_mode/provider/theme_provider.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../util/color_util.dart';

///描述:第一个页面显示tab和自定义的view样式，通过监听样式变更改变
///功能介绍:
///创建者:翁益亨
///创建日期:2022/6/9 9:40
class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    //当前需要额外进行数据颜色匹配
    //在这里使用context.watch进行当前状态的监听
    var themeProvider = context.watch<ThemeProvider>();
    //将当前主题进行对应匹配
    bool isDarkMode = themeProvider.isDarkMode(context);
    Color textColor = getThemeCorrespondingTextColor(
        isDarkMode, ThemeTextColor.textColor);

    //当前图标跟随主题色设置
    var iconColor = Theme.of(context).colorScheme.secondary;

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const TabBar(
              tabs: [
                Tab(
                  text: "1",
                ),
                Tab(
                  text: "2",
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
               Row(
                children: [
                  const Text("1"),
                  Icon(Icons.home,color: iconColor,),
                ],
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //这里指定当前的字体颜色之后就不会跟随主题颜色修改，所以需要手动监听当前修改的内
                    //改成当前需要适配的颜色
                    Text(
                      S.of(context).content10,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 30,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "secondPage");
                        },
                        child: Text(S.of(context).content8)),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
