package com.neu.shop.service.impl;

import com.neu.shop.dao.AccessTokenDao;
import com.neu.shop.pojo.AccessToken;
import com.neu.shop.pojo.TextMessage;
import com.neu.shop.service.WeChatService;
import com.neu.shop.util.MessageUtil;
import com.neu.shop.util.WeiXinUtil;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.TbkItemGetRequest;
import com.taobao.api.request.TbkUatmFavoritesGetRequest;
import com.taobao.api.request.WirelessShareTpwdCreateRequest;
import com.taobao.api.request.WirelessShareTpwdQueryRequest;
import com.taobao.api.response.TbkItemGetResponse;
import com.taobao.api.response.TbkUatmFavoritesGetResponse;
import com.taobao.api.response.WirelessShareTpwdCreateResponse;
import com.taobao.api.response.WirelessShareTpwdQueryResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;
@Service
public class WeChatServiceImpl implements WeChatService {


    /*    @Resource
        private MaintainCenterDao centerDao;*/
    @Autowired
    private AccessTokenDao accessTokenDao;

    @Override
    public AccessToken accessToken() {
        return accessTokenDao.getAccessToken();
    }

    /**
     * @param access_token
     */
    @Override
    public void updateAccessToken(AccessToken access_token) {
        accessTokenDao.updateAccessToken(access_token);
    }

    //获取access_token
    @Override
    public AccessToken getAccessToken() {
        long now = System.currentTimeMillis();//当前时间秒数
        AccessToken accessToken = accessToken();//先从数据库获取

        //若为空或者已过期，则重新获取，并更新数据库中access_token和access_token过期时间
        if (null == accessToken || accessToken.getFexpiresin() <= now) {
            accessToken = WeiXinUtil.getAccessToken();//调用微信接口，通过https 获取access_token
            accessToken.setFexpiresin(accessToken.getFexpiresin() * 1000 + now);//过期时间=(7200S*1000+当前时间毫秒数)
            updateAccessToken(accessToken);
        }
        return accessToken;
    }

    @Override
    public String processRequest(HttpServletRequest request) {
        try {
            String respMessage = "";
            String respContent = "";
            TextMessage textMessage = new TextMessage();
            Map<String, String> requestMap = MessageUtil.parseXml(request);
            // 发送方帐号（open_id）
            String fromUserName = requestMap.get("FromUserName");
            // JSONObject jsonobj = WeiXinUtil.getUserInfo(fromUserName,accessToken.getFaccesstoken());
            // 公众帐号
            String toUserName = requestMap.get("ToUserName");
            // 消息类型
            String msgType = requestMap.get("MsgType");
            //消息内容
            String message = requestMap.get("Content");
            System.out.println("========="+message);
            TaobaoClient client = new DefaultTaobaoClient("http://gw.api.taobao.com/router/rest", "24912482", "5b90fcb25f79cf5ac6e0e918bbe2b8f2");
            WirelessShareTpwdCreateRequest req = new WirelessShareTpwdCreateRequest();
            WirelessShareTpwdCreateRequest.GenPwdIsvParamDto obj1 = new WirelessShareTpwdCreateRequest.GenPwdIsvParamDto();
            obj1.setUrl("http://m.tb.cn/h.3ak0u3f");
            obj1.setText("超值活动，惊喜活动多多");
            req.setTpwdParam(obj1);
            WirelessShareTpwdCreateResponse rsp = client.execute(req);
            System.out.println(rsp.getBody());
                System.out.println("================="+rsp.getBody());
            respContent=rsp.getBody();
            //可以获取二维码
            String ticket = requestMap.get("Ticket");
            //判断是用户发的消息 ，不管是什么类型的消息
/*            if (MessageUtil.MSG_TYPE_TEXT.equals(msgType) || MessageUtil.MSG_TYPE_IMAGE.equals(msgType) || MessageUtil.MSG_TYPE_LINK.equals(msgType) || MessageUtil.MSG_TYPE_LOCATION.equals(msgType) || MessageUtil.MSG_TYPE_SHORTVIDEO.equals(msgType) || MessageUtil.MSG_TYPE_VIDEO.equals(msgType) || MessageUtil.MSG_TYPE_VOICE.equals(msgType)) {
                //消息类型
                respContent = "您好！这里是淘宝券券淘。";

            } else if (MessageUtil.REQ_MESSAGE_TYPE_EVENT.equals(msgType)) {
                // 事件类型
                String eventType = requestMap.get("Event");
                // 订阅
                if (MessageUtil.EVENT_TYPE_SUBSCRIBE.equals(eventType)) {
                    respContent = "您好！感谢您关注淘宝券券淘，希望能为您的生活服务提供帮助~";
                    if(null!=ticket && !"".equals(ticket)){
                        respContent= getMaintainCenterInfo(requestMap.get("EventKey").replace("qrscene_",""));
                    }
                }else if(eventType.equals(MessageUtil.EVENT_TYPE_SCAN)){
                    respContent=getMaintainCenterInfo(requestMap.get("EventKey"));
                }
            }
            // 回复文本消息*/
            textMessage.setToUserName(fromUserName);
            textMessage.setFromUserName(toUserName);
            textMessage.setCreateTime(System.currentTimeMillis());
            textMessage.setMsgType(MessageUtil.MSG_TYPE_TEXT);

            textMessage.setContent(respContent);
            respMessage = MessageUtil.textMessageToXml(textMessage);
            return respMessage;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    @Override
    public String getOpenId(String code) {
        return   WeiXinUtil.getOpenId(code);
    }

    public String getMaintainCenterInfo(String id) {

        return null;
    }
}
