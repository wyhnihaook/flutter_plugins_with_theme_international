import 'package:flutter/material.dart';

import '../generated/l10n.dart';

///描述:语言本地化处理
///功能介绍:响应切换语言
///创建者:翁益亨
///创建日期:2022/6/7 17:32
class LocaleProvider extends ChangeNotifier{

  //语言类型支持，跟随系统、中文、英文
  static const localeList = ['','zh','en'];

  //当前记录切换的角标，需要缓存，使下次打开保持当前选中的情况 todo
  int _localeIndex = 0;//默认选中跟随系统，参考localName转化内容

  int get localeIndex => _localeIndex;

  //根据当前的名称检索对应的 intl_语言类型.arb，如果返回null就会去检索系统的语言再回来匹配
  dynamic get locale{
    if(localeIndex>0){
      var language = localeList[localeIndex];
      //Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans')指定对应的地址
      //有需求再实现，使用分割符号截取就可获取，例如：定义名称zh-HK，分隔符为-   zh_HK，分隔符为_
      return Locale(language);
    }

    //跟随系统模式
    return null;
  }

  //切换当前语言
  switchLocale(int index){
    _localeIndex = index;
    notifyListeners();
  }

  //本地名称转化，用于显示切换功能显示列表
  static String localName(index,context){
    switch(index){
      case 0:
        return S.of(context).autoBySystem;
      case 1:
        return '中文';
      case 2:
        return "English";
      default:
        return "";
    }
  }
}