import 'package:jd_mall_flutter/http/http.dart';
import 'package:jd_mall_flutter/models/goods_page_info.dart';
import 'package:jd_mall_flutter/models/mine_menu_tab_info.dart';
import 'package:jd_mall_flutter/config/global_configs.dart';

class MineApi {
  static Future queryInfo() async {
    var res = await httpManager.get('${GlobalConfigs().get("host")}/mine/queryMineInfo');
    if (res?.code != '0') {
      return null;
    }
    return MineMenuTabInfo.fromJson(res?.data ?? {});
  }

  static Future queryRecommendList(int currentPage, int pageSize) async {
    var res = await httpManager
        .post('${GlobalConfigs().get("host")}/mine/queryRecommendList', params: {"currentPage": currentPage, "pageSize": pageSize});
    if (res?.code != '0') {
      return null;
    }
    return GoodsPageInfo.fromJson(res?.data ?? {});
  }
}
