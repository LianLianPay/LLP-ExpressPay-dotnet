﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.IO;
using Newtonsoft.Json.Linq;
using LLYTPay;
using System.Net;

/// <summary>
/// 功能：普通接入
/// 说明：
/// 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。

/// </summary>
public partial class plainPay : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{

	}



	public void button1Clicked(object sender, EventArgs args)
	{
		//组织参数
		SortedDictionary<string, string> sParaTemp = getBaseParamDict ();

		//加签
		string sign = YinTongUtil.addSign(sParaTemp, PartnerConfig.TRADER_PRI_KEY, PartnerConfig.MD5_KEY);
		sParaTemp.Add("sign", sign);

		StringBuilder sbHtml = new StringBuilder();

		sbHtml.Append("<form id='payBillForm' action='"+ServerURLConfig.PAY_URL+"' method='post'>");

		foreach (KeyValuePair<string, string> temp in sParaTemp)
		{
			sbHtml.Append("<input type='hidden' name='" + temp.Key + "' value='" + temp.Value + "'/>");
		}
		//submit按钮控件请不要含有name属性
		sbHtml.Append("<input type='submit' value='tijiao' style='display:none;'></form>");
		sbHtml.Append("<script>document.forms['payBillForm'].submit();</script>");
		string sHtmlText = sbHtml.ToString();
		Response.Write(sHtmlText);

	}

	/**
     * 基本参数字典
     */
	private SortedDictionary<string, string> getBaseParamDict()
	{
		/**订单信息**/
		// 商户唯一订单号
		string no_order = YinTongUtil.getCurrentDateTimeStr();
		// 商户订单时间
		string dt_order = YinTongUtil.getCurrentDateTimeStr();
		// 交易金额 单位为RMB-元
		string money_order = WIDmoney_order.Text.Trim();
		// 商品名称
		string name_goods = WIDname_goods.Text.Trim();
		// 订单描述
		string info_order = "用户购买" + name_goods;

		/** 商户提交参数**/
		string version = PartnerConfig.VERSION;						//接口版本号
		string oid_partner = LLYTPay.PartnerConfig.OID_PARTNER;		//商户编号
		string user_id = Request ["user_id"].Trim ();				//用户ID
		string sign_type = PartnerConfig.SIGN_TYPE;					//签名类型：RSA/MD5
		string busi_partner = PartnerConfig.BUSI_PARTNER; 			//业务类型 虚拟商品销售
		string notify_url = PartnerConfig.NOTIFY_URL;				//接收异步通知地
		string url_return = PartnerConfig.URL_RETURN;				//支付结束后返回地址
		string userreq_ip = Request.UserHostAddress;        		//IP *
		string url_order = "";
		string valid_order = "10080";								// 订单有效期 单位分钟，可以为空，默认7天
		string timestamp = YinTongUtil.getCurrentDateTimeStr();		//时间戳

		SortedDictionary<string, string> sParaTemp = new SortedDictionary<string, string>();
		sParaTemp.Add("version", version);
		sParaTemp.Add("oid_partner", oid_partner);
		sParaTemp.Add("user_id", user_id);
		sParaTemp.Add("sign_type", sign_type);
		sParaTemp.Add("busi_partner", busi_partner);
		sParaTemp.Add("no_order", no_order);
		sParaTemp.Add("dt_order", dt_order);
		sParaTemp.Add("name_goods", name_goods);
		sParaTemp.Add("info_order", info_order);
		sParaTemp.Add("money_order", money_order);
		sParaTemp.Add("notify_url", notify_url);
		sParaTemp.Add("url_return", url_return);
		sParaTemp.Add("userreq_ip", userreq_ip);
		sParaTemp.Add("url_order", url_order);
		sParaTemp.Add("valid_order", valid_order);
		sParaTemp.Add("timestamp", timestamp);
		sParaTemp.Add("risk_item", createRiskItem());

		return sParaTemp;
	}

	/**
     * 根据连连支付风控部门要求的参数进行构造风控参数
     * @return
     */
	private String createRiskItem()
	{
		return "{\"frms_ware_category\":\"1999\",\"user_info_full_name\":\"你好\"}";
	}


}