package com.lishan.gjq.util;
 
import javax.servlet.http.HttpServletResponse;
 
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;

 
public class AlipayUtil {
 
	public static String pay(HttpServletResponse response,String money,String info,int uid,String orderId) throws Exception{
		//获得初始化的AlipayClient
		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
		
		//设置请求参数
		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
		alipayRequest.setReturnUrl(AlipayConfig.return_url);//同步请求url
		alipayRequest.setNotifyUrl(AlipayConfig.notify_url);//异步请求url
		
		alipayRequest.setBizContent("{\"out_trade_no\":\""+ orderId +"\"," 
				+ "\"total_amount\":\""+ money +"\"," 
				+ "\"subject\":\""+ uid +"\"," 
				+ "\"body\":\""+ info +"\"," 
				+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
		
		//请求
		String result = alipayClient.pageExecute(alipayRequest).getBody();
		//返回
		return result;
	}
}