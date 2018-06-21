<%@ Page Language="C#" %>
<%@ Import namespace="System" %>
<%@ Import namespace="System.Web" %>
<%@ Import namespace="System.Net" %>
<%@ Import namespace="System.Text" %>
<%@ Import namespace="System.IO" %>
<%@ Import namespace="System.Collections.Generic" %>
<%@ Import namespace="LLYTPay" %>


<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<title>连连支付</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<style>
.info {
	padding: 15px;
	background: #fff url(images/info_bg.png) left bottom repeat-x;
}

.table_ui {
	width: 100%;
	margin: 0 auto;
}

.table_ui td {
	line-height: 1.5em;
	padding-bottom: 10px;
	vertical-align: top;
}

.ft_gray {
	color: #999;
}

.slogan {
	overflow: hidden;
	width: 100%;
	height: 19px;
	position: relative;
	margin: 20px 0 5px 0;
}

.slogan h3 {
	font-size: 18px;
	line-height: 19px;
	padding-left: 1%;
	color: #4d4d4d;
	position: absolute;
	background: #f2f2f2;
	z-index: 100;
	padding: 0 0.215em;
	font-weight: normal;
	font-family: "微软雅黑";
}

.slogan span {
	height: 9px;
	border-bottom: 1px solid #cacaca;
	width: 100%;
	position: absolute
}

.warp {
	width: 95%;
	margin: 0 auto;
}

.footer {
	text-align: center;
	color: #999;
	padding: 2em 0 1em 0;
}

.footer img {
	height: 15px;
	vertical-align: middle;
}

.footer span {
	height: 15px;
	font-size: 0.8em;
	line-height: 0.8em;
}
</style>
<%
    String pri_key = "MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAMlGNh/WsyZSYnQcHd9t5qUkhcOhuQmozrAY9DM4+7fhpbJenmYee4chREW4RB3m95+vsz9DqCq61/dIOoLK940/XmhKkuVjfPqHJpoyHJsHcMYy2bXCd2fI++rERdXtYm0Yj2lFbq1aEAckciutyVZcAIHQoZsFwF8l6oS6DmZRAgMBAAECgYAApq1+JN+nfBS9c2nVUzGvzxJvs5I5qcYhY7NGhySpT52NmijBA9A6e60Q3Ku7vQeICLV3uuxMVxZjwmQOEEIEvXqauyYUYTPgqGGcwYXQFVI7raHa0fNMfVWLMHgtTScoKVXRoU3re6HaXB2z5nUR//NE2OLdGCv0ApaJWEJMwQJBAPWoD/Cm/2LpZdfh7oXkCH+JQ9LoSWGpBDEKkTTzIqU9USNHOKjth9vWagsR55aAn2ImG+EPS+wa9xFTVDk/+WUCQQDRv8B/lYZD43KPi8AJuQxUzibDhpzqUrAcu5Xr3KMvcM4Us7QVzXqP7sFc7FJjZSTWgn3mQqJg1X0pqpdkQSB9AkBFs2jKbGe8BeM6rMVDwh7TKPxQhE4F4rHoxEnND0t+PPafnt6pt7O7oYu3Fl5yao5Oh+eTJQbyt/fwN4eHMuqtAkBx/ob+UCNyjhDbFxa9sgaTqJ7EsUpix6HTW9f1IirGQ8ac1bXQC6bKxvXsLLvyLSxCMRV/qUNa4Wxu0roI0KR5AkAZqsY48Uf/XsacJqRgIvwODstC03fgbml890R0LIdhnwAvE4sGnC9LKySRKmEMo8PuDhI0dTzaV0AbvXnsfDfp";
    String oid_partner = "201306031000001013";
    String md5_key = "201306031000001013";

    StringBuilder strBuf = new StringBuilder();
    if (!YinTongUtil.isnull(Request["acct_name"]))
    {
        strBuf.Append("acct_name=");
        strBuf.Append(Request["acct_name"]);
        strBuf.Append("&app_request=3");
    } else
    {
        strBuf.Append("app_request=3");
    }
    if (!YinTongUtil.isnull(Request["bg_color"]))
    {
        strBuf.Append("&bg_color=");
        strBuf.Append(Request["bg_color"]);
    }
    strBuf.Append("&busi_partner=");
    strBuf.Append(Request["busi_partner"]);
    if (!YinTongUtil.isnull(Request["card_no"]))
    {
        strBuf.Append("&card_no=");
        strBuf.Append(Request["card_no"]);
    }
    strBuf.Append("&dt_order=");
    strBuf.Append(Request["dt_order"]);
    if (!YinTongUtil.isnull(Request["id_no"]))
    {
        strBuf.Append("&id_no=");
        strBuf.Append(Request["id_no"]);
    }
    if (!YinTongUtil.isnull(Request["info_order"]))
    {
        strBuf.Append("&info_order=");
        strBuf.Append(Request["info_order"]);
    }
    strBuf.Append("&money_order=");
    strBuf.Append(Request["money_order"]);
    if (!YinTongUtil.isnull(Request["name_goods"]))
    {
        strBuf.Append("&name_goods=");
        strBuf.Append(Request["name_goods"]);
    }
    if (!YinTongUtil.isnull(Request["no_agree"]))
    {
        strBuf.Append("&no_agree=");
        strBuf.Append(Request["no_agree"]);
    }
    strBuf.Append("&no_order=");
    strBuf.Append(Request["no_order"]);
    strBuf.Append("&notify_url=");
    strBuf.Append(Request["notify_url"]);
    strBuf.Append("&oid_partner=");
    strBuf.Append(Request["oid_partner"]);
    if (!YinTongUtil.isnull(Request["risk_item"]))
    {
        strBuf.Append("&risk_item=");
        strBuf.Append(Request["risk_item"]);
    }
    strBuf.Append("&sign_type=");
    strBuf.Append(Request["sign_type"]);
    if (!YinTongUtil.isnull(Request["url_return"]))
    {
        strBuf.Append("&url_return=");
        strBuf.Append(Request["url_return"]);
    }
    if (!YinTongUtil.isnull(Request["user_id"]))
    {
        strBuf.Append("&user_id=");
        strBuf.Append(Request["user_id"]);
    }
    if (!YinTongUtil.isnull(Request["valid_order"]))
    {
        strBuf.Append("&valid_order=");
        strBuf.Append(Request["valid_order"]);
    }
    String sign_src = strBuf.ToString();
    if (sign_src.StartsWith("&"))
    {
        sign_src = sign_src.Substring(1);
    }
    String sign = "";

    if ("RSA".Equals(Request["sign_type"]))
    {
        sign = RSAFromPkcs8.sign(sign_src,PartnerConfig.TRADER_PRI_KEY,"utf-8");
    } else
    {
        sign_src += "&key=" + PartnerConfig.MD5_KEY;
        sign = Md5Algorithm.getInstance().md5Digest(
					Encoding.UTF8.GetBytes (sign_src));
    }

	SortedDictionary<string, string> sParaTemp = new SortedDictionary<string, string>();

	sParaTemp.Add("app_request", Request["app_request"]);
	sParaTemp.Add("bg_color", Request["bg_color"]);
	sParaTemp.Add("busi_partner", Request["busi_partner"]);
	sParaTemp.Add("card_no", Request["card_no"]);
	sParaTemp.Add("dt_order", Request["dt_order"]);
	sParaTemp.Add("id_no", Request["id_no"]);
	sParaTemp.Add("info_order", Request["info_order"]);
	sParaTemp.Add("money_order", Request["money_order"]);
	sParaTemp.Add("name_goods", Request["name_goods"]);
	sParaTemp.Add("no_agree", Request["no_agree"]);
	sParaTemp.Add("no_order", Request["no_order"]);
	sParaTemp.Add("notify_url", Request["notify_url"]);
	sParaTemp.Add("oid_partner", Request["oid_partner"]);
	sParaTemp.Add("acct_name", Request["acct_name"]);
	sParaTemp.Add("risk_item", Request["risk_item"].Replace("\"" , "\\\""));
	sParaTemp.Add("sign_type", Request["sign_type"]);
	sParaTemp.Add("url_return", Request["url_return"]);
	sParaTemp.Add("user_id", Request["user_id"]);
	sParaTemp.Add("valid_order", Request["valid_order"]);
	sParaTemp.Add("sign", sign);

    string req_data = YinTongUtil.dictToJson(sParaTemp);




%>
</head>
<body>
	<div class="header">
		<a href="javascript:history.go(-1);" class="back">返回</a>
		<h1 class="logo">银行卡支付</h1>
		<a href="#" class="about">关于</a>
	</div>

	<section class="info">
		<table border="0" cellspacing="0" cellpadding="0" class="table_ui">
			<tr>
				<td width="200"><span class="ft_gray">维多利亚丽佳酒店(杭州)</span></td>
				<td style="text-align: right"></td>
			</tr>
			<tr>
				<td><span class="ft_gray">房型：</span></td>
				<td style="text-align: right">高级套房</td>
			</tr>
			<tr>
				<td width="100"><span class="ft_gray">房间面积：</span></td>
				<td style="text-align: right">50</td>
			</tr>
			<tr>
				<td width="100"><span class="ft_gray">楼层：</span></td>
				<td style="text-align: right">2-5</td>
			</tr>
			<tr>
				<td width="100"><span class="ft_gray">早餐：</span></td>
				<td style="text-align: right">含双早</td>
			</tr>
			<tr>
				<td width="100"><span class="ft_gray">宽带：</span></td>
				<td style="text-align: right">免费</td>
			</tr>
			<tr>
				<td width="100"><span class="ft_gray">到店时间：</span></td>
				<td style="text-align: right">2013-07-25</td>
			</tr>
		</table>
	</section>

	<section class="slogan">
		<h3>
			请仔细阅读<a href="javascript:void(0)">《网上订购须知》</a>
		</h3>
		<span class="line"></span>
	</section>
	<section>
		<div class="form_warp">
			<form action="https://wap.lianlianpay.com/payment.htm"
				method="post">
				<ul>
					<li><input type="hidden" name="req_data" value='<%=req_data%>' />
						<button name="next_btn" class="btn" type="submit" id="next_btn">连连支付</button></li>
				</ul>
			</form>
		</div>

	</section>
	<footer class="warp footer">
		<img src="images/logo.png" /> <span>连连支付版权所有 2004-2017
			浙B2-20080148</span>
	</footer>
</body>
</html>

