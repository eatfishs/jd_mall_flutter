import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:jd_mall_flutter/common/style/common_style.dart';
import 'package:jd_mall_flutter/redux/app_state.dart';
import 'package:jd_mall_flutter/page/mine/redux/mine_page_action.dart';
import 'package:jd_mall_flutter/common/widget/persistentHeader/sliver_header_builder.dart';

Widget tabList(BuildContext context) {
  return SliverPersistentHeader(
    pinned: true,
    delegate: SliverHeaderDelegate.fixedHeight(
        //固定高度
        height: 58,
        child: Container(
            color: CommonStyle.greyBgColor,
            child: StoreBuilder<AppState>(builder: (context, store) {
              var tabs = store.state.minePageState.menuTabInfo.tabList;
              String currentTab = store.state.minePageState.currentTab;
              int totalCount = tabs?.length ?? 0;

              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: totalCount,
                  itemExtent: 86.0,
                  itemBuilder: (BuildContext context, int index) {
                    bool isSelect = currentTab == tabs?[index].code;

                    return GestureDetector(
                        onTap: () => store.dispatch(SetCurrentTab(tabs![index].code!)),
                        child: Flex(
                          direction: Axis.vertical,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  width: 86,
                                  color: CommonStyle.greyBgColor,
                                  alignment: Alignment.bottomCenter,
                                  padding: const EdgeInsets.only(bottom: 6),
                                  child: Text(
                                    tabs?[index].name ?? "",
                                    style: TextStyle(color: isSelect ? CommonStyle.selectedTabColor : CommonStyle.unSelectedTabColor),
                                  ),
                                )),
                            Container(
                                width: 20,
                                height: 2,
                                decoration: BoxDecoration(
                                  color: isSelect ? CommonStyle.selectedTabColor : CommonStyle.greyBgColor,
                                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                                )),
                            Container(width: 20, height: 12, color: Colors.transparent),
                          ],
                        ));
                  });
            }))),
  );
}