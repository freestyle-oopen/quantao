package com.neu.shop.util;

import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import com.neu.shop.pojo.*;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import java.io.*;
import java.net.ConnectException;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;


public class WeiXinUtil {
   // public final static String wcappID = "wxb3f6011c1fd3ad70";
  //  public final static String wcappSecret = "b1abf5b1bb9094c647e83472053aa93c";
    public final static String wcappID = "wx7987fbe474912987";
    public final static String wcappSecret = "37368649ad92d76cb0ddfc6ec0e42ef1";
    //get access_token 200/day
    public final static String access_token_url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
   //get userinfo with openid
    public final static String user_info_url = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN ";
   //meun 100/day
    public final static String menu_create_url = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";
  //get access_token with code
   public final static String oauth_accesstoken_url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
   public final static String getqrcode_url="https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=ACCESS_TOKEN";
   public final static String qrcode_url="https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=TICKET";

   public final static String body="{\"expire_seconds\": 2592000,\"action_name\": \"QR_STR_SCENE\",\"action_info\": {\"scene\": {\"scene_str\": \"MESSAGE\"}}}";

   private static String getopenid="https://api.weixin.qq.com/sns/oauth2/access_token?appid="+wcappID+"&secret="+wcappSecret+"&code=CODE&grant_type=authorization_code";

   public static String book_home_url="http://renkai.imwork.net/book/index.jhtml";
    public static String book_bookshelf_url="http://renkai.imwork.net/user/userCenter.jhtml";


    /*
         * @param requestUrl
         * @param requestMethod
         * @param outputStr
         * @return JSONObject
         */
    public static JSONObject httpRequest(String requestUrl, String requestMethod, String outputStr) {
        JSONObject jsonObject=null;
        StringBuffer sb=new StringBuffer();

        try {
            TrustManager[] tm={new MyX509TrustManager()};
            SSLContext sslContext= SSLContext.getInstance("SSL", "SunJSSE");
            sslContext.init(null, tm, new SecureRandom());

            SSLSocketFactory ssf=sslContext.getSocketFactory();

            URL url=new URL(requestUrl);
            HttpsURLConnection conn=(HttpsURLConnection) url.openConnection();
            conn.setSSLSocketFactory(ssf);

            conn.setDoInput(true);
            conn.setDoOutput(true);
            conn.setUseCaches(false);
            conn.setRequestMethod(requestMethod);

            if(requestMethod.equals("GET")){
                conn.connect();
            }
            if(outputStr!=null){
                OutputStream os=conn.getOutputStream();
                os.write(outputStr.getBytes("utf-8"));
                os.close();
            }

            InputStream is=conn.getInputStream();
            InputStreamReader isr=new InputStreamReader(is,"utf-8");
            BufferedReader br=new BufferedReader(isr);

            String str=null;
            while((str=br.readLine())!=null){
                sb.append(str);
            }
            br.close();
            isr.close();
            is.close();
            is=null;
            conn.disconnect();
            jsonObject= JSONObject.parseObject(sb.toString());

        } catch (ConnectException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return jsonObject;

    }

    /**
     * get access_token
     *
     * @return
     */
    public static AccessToken getAccessToken() {
        AccessToken accessToken = null;
        String requestUrl = access_token_url.replace("APPID", wcappID).replace("APPSECRET", wcappSecret);
        JSONObject jsonObject = httpRequest(requestUrl, "GET", null);
        if (null != jsonObject) {
            try {
                accessToken = new AccessToken();
                accessToken.setFaccesstoken(jsonObject.getString("access_token"));
                accessToken.setFexpiresin(jsonObject.getLong("expires_in"));
            } catch (JSONException e) {
                accessToken = null;
               System.out.println("???token??? errcode:{"+jsonObject.getIntValue("errcode")+"} errmsg:{"+jsonObject.getString("errmsg")+"}");
            }
        }
        return accessToken;
    }

    /**
     * create menu
     *
     * @param menu
     * @param accessToken
     * @return 0 success
     */
    public static int createMenu(Menu menu, String accessToken) {
        int result = -1;

        String url = menu_create_url.replace("ACCESS_TOKEN", accessToken);
        String jsonMenu = JSONObject.toJSONString(menu);
        JSONObject jsonObject = httpRequest(url, "POST", jsonMenu);
        if (null != jsonObject) {
            if (0 == jsonObject.getIntValue("errcode")) {
                result = jsonObject.getIntValue("errcode");
            }else{
                System.out.println("?????????? errcode:{"+jsonObject.getIntValue("errcode")+"} errmsg:{"+jsonObject.getString("errmsg")+"}");
            }
        }
        return result;
    }

    public static JSONObject getQRcodeUrl(String access_token, String id){
        String url = getqrcode_url.replace("ACCESS_TOKEN", access_token);
        String requestBody = body.replace("MESSAGE", id);
        JSONObject post = httpRequest(url, "POST", requestBody);
       if(null!=post){
          if(0!=post.getIntValue("errcode")){
            return null;
          }else{
              return post;
          }
       }
        return null;
    }

    /**
     * get userinfo with openid
     */

    public static JSONObject getUserInfo(String openid, String accessToken){
        String requestUrl = user_info_url.replace("OPENID",openid).replace("ACCESS_TOKEN", accessToken);
        return httpRequest(requestUrl, "GET", null);
    }

    /**
     * @return
     */
  /*  public static OAuthToken  getOAuth2AccessToken(String appid, String appSecret, String code){
        OAuthToken authToken = null;
        String requestUrl = oauth_accesstoken_url.replace("APPID", appid).replace("SECRET",appSecret).replace("CODE",code);
        JSONObject jsonObject = httpRequest(requestUrl, "GET", null);
        if(jsonObject!=null){
            try{
            authToken = new OAuthToken();
            authToken.setAccessToken(jsonObject.getString("access_token"));
            authToken.setExpiresIn(jsonObject.getInteger("expires_in"));
            authToken.setOpenId(jsonObject.getString("openid"));
            authToken.setRefreshToken(jsonObject.getString("refresh_token"));
            authToken.setScope(jsonObject.getString("socpe"));
            }catch (Exception e){
                int errorCode= jsonObject.getInteger("errorcode");
                String errorMsg = jsonObject.getString("errmsg");
            }
        }
        return authToken;
    }*/
    public static Menu getMenu() {
        Menu menu = new Menu();
        ViewButton btn11 = new ViewButton();
        btn11.setName("???");
        btn11.setType("view");

        ViewButton btn12 = new ViewButton();
        btn12.setName("??????");
        btn12.setType("view");


        ViewButton btn13 = new ViewButton();
        btn13.setName("????????");
        btn13.setType("view");
        btn13.setUrl("http://wap.yesky.com/book/user/");

        ViewButton btn14 = new ViewButton();
        btn14.setName("???????");
        btn14.setType("view");
        btn14.setUrl("http://wap.yesky.com/book/user/");
        //  btn14.setUrl("http://maintain.yesky.com/jsp/coupon/list.jsp");
        ViewButton btn15 = new ViewButton();
        btn15.setName("????�b");
        btn15.setType("view");
        btn15.setUrl("http://wap.yesky.com/book/user/");

        ViewButton btn16 = new ViewButton();
        btn16.setName("??");
        btn16.setType("view");
        btn16.setUrl("http://wap.yesky.com/book/user/");
        try {
            btn11.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid="+WeiXinUtil.wcappID+"&redirect_uri="+ URLEncoder.encode(book_home_url,"UTF-8")+"&response_type=code&scope=snsapi_base&state=1#wechat_redirect");
            btn12.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid="+WeiXinUtil.wcappID+"&redirect_uri="+ URLEncoder.encode(book_bookshelf_url,"UTF-8")+"&response_type=code&scope=snsapi_base&state=1#wechat_redirect");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        FirstButton firstButton = new FirstButton();
        ViewButton[] viewButtons={btn13,btn14,btn15,btn16};
        firstButton.setSub_button(viewButtons);
        firstButton.setName("????");
        menu.setButton(new Button[] { btn11,btn12, firstButton});
      return menu;
    }

    public static String getOpenId(String code) {
        String urlStr=WeiXinUtil.book_home_url;
        String url = getopenid.replace("CODE", code);
        JSONObject result = httpRequest(url, "GET", null);
        String openid = result.getString("openid");
        if(openid!=null){
            return urlStr+"?openid="+openid;
        }
        return urlStr;
    }
}
