package com.zcz.util;

import com.auth0.jwt.JWTSigner;
import com.auth0.jwt.JWTVerifier;
import net.sf.json.JSONObject;
import org.codehaus.jackson.map.ObjectMapper;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * java web token
 * @author 郭刘帅
 */
public class JWTUtil {
/**
 * JWT标准的Token有三部分组成
 * 1：header  包括  type(token类型--如jwt)   alg("加密方法（HS256）")
 * 2：payload  载荷信息  里面是token的具体内容  常用的：exp:过期时间，详情见博客园--云端观云
 * 3：Signature 签名信息  有三部分组成 一：先是用 Base64 编码的 header.payload
 *                      二：再用加密算法加密一下，加密的时候要放进去一个 Secret ，
 *                      三：Secret  即相当于一个密码
 */
    /**
     * 加密签名
     */
    private static final String SECRET = "XX#$%()(#*!()!KL<><MQLMNQNQJQK sdfkjsdrow32234545fdf>?N<:{LWPW";

    /**
     * 加密，传入一个对象获取Token
     * @Param maxTime token有效期
     * @return
     */
    public static <T> String sign(T object,long maxTime){
        //获取JWT签署类
        final JWTSigner signer = new JWTSigner(SECRET);
        final Map<String,Object> claims = new HashMap<>();
        //JSONObject json = JSONObject.fromObject(object);//将对象转为JSON数据
        ObjectMapper mapper = new ObjectMapper();
        String jsonString = null;//将对象转为json形式，将其作为jwt载荷信息
        try {
            jsonString = mapper.writeValueAsString(object);
        } catch (IOException e) {
            e.printStackTrace();
        }
        claims.put("payload",jsonString);
        claims.put("exp",System.currentTimeMillis()+maxTime);//token设置有效期
        return signer.sign(claims);
    }

    /**
     * 将token解密为制定对象，传入要解密的Token和要转为的类型
     * @param token
     * @return
     */
    public static<T> T unsign(String token,Class<T> classT){
        //JWT检验者，可理解为解密类
        final JWTVerifier verifier = new JWTVerifier(SECRET);
        try {
            //Map里有payload -- JSON对象  和 exp 失效期
            final Map<String, Object> claims = verifier.verify(token);//将token解析为Map集合
            if (claims.containsKey("payload") && claims.containsKey("exp")) {
                Long exp = (Long) claims.get("exp");//获取token有效期
                Long currentTimeMillis = System.currentTimeMillis();//获取现在的时间
                if (exp > currentTimeMillis) {
                    String json = (String) claims.get("payload");
                    ObjectMapper mapper = new ObjectMapper();
//                    Map<String,Object> map = (Map<String, Object>) JSONObject.fromObject(json);
                    return mapper.readValue(json,classT);
                }
            }
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
        return null;
    }

    public static void main(String[] args){
        Map<String,Object> map = new HashMap<>();
        map.put("username","张三");
        map.put("password","123456");
        map.put("userId",199);
        Long l = 1000*60*60*24*30L;
        String token = JWTUtil.sign(map,l);
        System.out.println("token：\n"+token);
        System.out.println();
        Map<String,Object> resultMap = JWTUtil.unsign(token,Map.class);
        Set<Map.Entry<String, Object>> set = resultMap.entrySet();
        for (Map.Entry entry : set) {
            System.out.println(entry.getKey()+"："+entry.getValue());
        }
    }
}
