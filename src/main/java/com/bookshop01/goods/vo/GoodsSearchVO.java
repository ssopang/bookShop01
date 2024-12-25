package com.bookshop01.goods.vo;

public class GoodsSearchVO extends GoodsVO{
    private String searchWord;
    private String goods_sort;
    private String goods_sort_type;

    public String getSearchWord() {
        return searchWord;
    }

    public void setSearchWord(String searchWord) {
        this.searchWord = searchWord;
    }

    public String getGoods_sort() {
        return goods_sort;
    }

    public void setGoods_sort(String goods_sort) {
        this.goods_sort = goods_sort;
    }

    public String getGoods_sort_type() {
        return goods_sort_type;
    }

    public void setGoods_sort_type(String goods_sort_type) {
        this.goods_sort_type = goods_sort_type;
    }

}
