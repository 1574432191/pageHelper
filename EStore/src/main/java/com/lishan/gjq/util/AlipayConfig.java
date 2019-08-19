package com.lishan.gjq.util;
/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */
 
public class AlipayConfig {

	//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
	 
	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
			public static String app_id = "2016092300576944";
			
			// 商户私钥(生成工具生成的应用私钥)，您的PKCS8格式RSA2私钥
		    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC4V3w5qxvZC2ywCV+1NS8iqPJaY7u/Xe6ZLg1yIRbiBY72w3c7LN456Z/SIvRRb3BiDdCwlZx+cM0YtduTzW92y+tMk26sHcEfv4NVQps3DjYAwTvSn01GZNe+NOjk4zvZr4c6E4OpglJYPEJyo3+fV7TsYOh2HJbsaQ2Bhcy+zkN7N8NEQeW5HqqF4KDgNdjyz1f4VsJGViL7ORHpSN2Cdxnt05uDFjM3lomZM2lYHuf/B/7Md2cT17zVT1yA9T+jHg7YkvYLejIKUsQw8I7hU1eOvCtJXxxaorY66NKZ6pspcY7MnNrS6+Q5kQ1xZukwFk4F23087CJFJAKf4LR/AgMBAAECggEBAKrSz1g1WwH/l0Ft/lXSqhJJUwQ2JZZJekBSr70SMr1Sf0/mhIe+pVQvTZ4SLCuGxDLpMHliuvlkmHqMk6Tcm60PfMWiXc17aSp9czvAFEupjJuYdVJRsu9HpbEqIKNye1TXVs2Xpcuf66S+eqj3H93ODed6ShChn64GD7D2B2zL7mAHDTc7cN3rwc1SgT9x0i2oLsAZbE4LE0SvWWDyv5e76Ns3AAO9dx4zvxfjJEOkphFue5jUXq7uL8+/Cxchv4PUHTFdXZFza1Xd7qMHjZtJuokDPfDdfqXt8DG6ymL48ftJ1xgmWHcvSXgDvQnaFtfBhbzRCODrxzH2xQ2F2JkCgYEA4I9N+2Cm2P2xL03Hwy6iejNIpn8Bqef2LCreXWEk3vLQi/ibTT7o9/EQtogpOdWq1Ov/Q+wSsv/wFew5EyNvhyajFEdm3n6y1tuk8VqKiSfUXMStxVPbaT1QqCnwwCGbo/UuFiw1XJeHMZW8s2jTndzHeCe5ci+qdUleZ3tPBkUCgYEA0iauZyaWoKEFNEMx2y1lWVRXiOz6jHKpWwaEuSAPUfnS3y6jJWD/u2nz+CM2BAeRrgqdIlK5sc8DvnDNxXNe+IXXBjHyLq4a4z4vnXWNDJrKT+w7D0d3eAkBJVCrvaaGEpTkUUBcXLFY4j3/10BCUtm0AUeeLDWoU5LZSHQ/TfMCgYBjO9CpMmfo4gsHrWaGgTg5qioDsYJps+DcWcFUIJarkz/HawAuHYvT7YqGLxuQvDQ2zWdLe6ozwdg1x+Lc6z7gyZktX/Q8hF7BheSY53rq61fz+tITrl/6XKck+Quzy+Y8iR9pmvWlyixrJBF0cvF5BFR9a4iOxjOciuSV9C7SxQKBgBAHoU/+8ohoH+R/p6LnUI7CzzaDlQz3hhGKar9QQbroCny5qvoj7v3VtCVeUjV2eldDOf8vPjjg6JEzO47vIPRmCSPQ1X9YCncA/FLPb6XhfMMh6tNciTFfxnWZNLBvrlRmhQ/pj+IGKRiA0C4UGbsGHiPm2ZrXsPJHBknvjBCfAoGAQto7/52tR2aXSNTCKPnjpL+lf1u7tEIiYPEQZ+mmdNwhSkgIZ1OpD3MBQzN5u2jYR8hgxCiZSfcoK6QQwKWUmvNajMUH7UtXXkPI4dtjXcoXleher/DWUIqkXBem2E7x6a0K4g1xWtvHjZDoYyZKK9Td9PXT5nVbjXxJWRPeqM4=";
			// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
		    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAweEaFYVS8j5IGyoyW8umggbw/N0SYqxCzXem1l/ZUYVduNX5vVJ4UuT2qfI45m5yClTES2qvqzC+BjFH4CTK22g7uJaaR7zl8A/H1/UrLBCpTvd13ZNOMs0oAnRVuZO5kTyXO6etJzYw+sRRhjOKlBYxaY7Rmqg4PSkekuU4OMnVD8J5jtdza+e4pvNBLnPIo3dIcGkBBkWAmH9zHwZXjCHdcAo6jsTHI+L7lcCjj25EdllzrN0YdbXitnMDgsOvn2aSH9RSpRs3lmNpyZbmTpqoIpXUq8rxTe/57RCUrUzNu14Pem4D6rlKT0tlXWOmUptbRqmIARTFnJBRcuUCYQIDAQAB";
		 
			// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
		public static String notify_url = "http://192.168.5.191:8080/Estore/order/notify_url.html";
	 
		// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问等同于支付成功的页面
		public static String return_url = "http://192.168.5.191:8080/Estore/order/data/update.do";
	 
		// 签名方式
		public static String sign_type = "RSA2";
		
		// 字符编码格式
		public static String charset = "utf-8";
		
		// 支付宝网关
		public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
}
