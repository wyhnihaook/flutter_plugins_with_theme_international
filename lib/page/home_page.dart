import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../provider/count_provider.dart';
import '../provider/locale_provider.dart';
import '../provider/theme_provider.dart';

///描述:主页
///功能介绍:
///创建者:翁益亨
///创建日期:2022/6/8 9:27
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( S.of(context).title2),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              S.of(context).content1,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium,
            ),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context,  "firstPage");
            }, child: Text(S.of(context).content8)),
            Consumer(builder: (context, CountProvider provider, child) {
              return Text("${provider.count}");
            },
              child:  Text(
                S.of(context).content2,
              ),),
            Consumer(builder: (context, CountProvider provider, child) {
              return ElevatedButton(onPressed: () {
                //模拟数据处理
                provider.autoincrement();
              }, child:  Text( S.of(context).content3));
            },),
            Consumer(builder: (context, LocaleProvider provider, child) {
              return ElevatedButton(onPressed: () {
                provider.switchLocale(2);
              }, child:  Text( S.of(context).content6));
            },),
            Consumer(builder: (context, LocaleProvider provider, child) {
              return ElevatedButton(onPressed: () {
                provider.switchLocale(1);
              }, child:  Text( S.of(context).content7));
            },),
          ],
        ),
      ),
    );
  }
}
