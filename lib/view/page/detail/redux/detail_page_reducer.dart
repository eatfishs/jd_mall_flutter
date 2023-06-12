import 'package:redux/redux.dart';
import 'package:jd_mall_flutter/view/page/detail/redux/detail_page_action.dart';
import 'package:jd_mall_flutter/view/page/detail/redux/detail_page_state.dart';
import 'package:jd_mall_flutter/models/goods_page_info.dart';

final detailPageReducer = combineReducers<DetailPageState>([
  //
  TypedReducer<DetailPageState, ChangeTopTabIndexAction>((state, action) => state..index = action.index),
  //商品详情
  TypedReducer<DetailPageState, InitCurrentGoodsInfoAction>((state, action) => state
    ..selectInfo = action.selectInfo
    ..goodsDetailRes = action.goodsDetailRes),

  //
  TypedReducer<DetailPageState, ChangeCurrentInfoAction>((state, action) => state..selectInfo = action.selectInfo),

  //初始化商品数据
  TypedReducer<DetailPageState, InitGoodsPageAction>((state, action) => state
    ..pageNum = action.pageNum
    ..goodsPageInfo = action.value),
  //加载更多
  TypedReducer<DetailPageState, MoreGoodsPageAction>((state, action) {
    List<GoodsList> goods = state.goodsPageInfo.goodsList ?? [];
    List<GoodsList>? goodsList = [...goods, ...?action.value.goodsList];

    return state
      ..pageNum = action.pageNum
      ..goodsPageInfo = GoodsPageInfo(
          goodsList: goodsList, totalCount: state.goodsPageInfo.totalCount, totalPageCount: state.goodsPageInfo.totalPageCount);
  }),
]);