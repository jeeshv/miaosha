package com.imooc.miaosha.redis;

public class GoodsKey extends BasePrefix{

	private GoodsKey(int expireSeconds, String prefix) {
		super(expireSeconds, prefix);
	}
	public static GoodsKey getGoodsList = new GoodsKey(60, "gl");
	public static GoodsKey getGoodsDetail = new GoodsKey(60, "gd");
	//秒杀的商品数量，0 代表缓存永久有效
	public static GoodsKey getMiaoshaGoodsStock= new GoodsKey(0, "gs");
}
