package com.zcz.realm;


import com.zcz.bean.User;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import java.util.List;
import java.util.Set;

public class UserRealm extends AuthorizingRealm {


    /**
     * 用户权限注入
     * @param principals
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String userName = (String) principals.getPrimaryPrincipal();
        try {
            SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
            //获取角色
            //设置角色
            //authorizationInfo.setRoles(roles);
            //获取权限
            //List<String> pers = mapper.getPerssions(userName);
            //设置权限
//            authorizationInfo.setStringPermissions(perssions);
            return authorizationInfo;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 登陆身份认证
     * @param token
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String username = (String) token.getPrincipal();
//        User user = mapper.findByUsername(username);根据用户名查询用户
        User user = new User();
//        try{
//            if(user !=null){
//                AuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(),this.getName());
//                return authenticationInfo;
//            }
//        }catch(Exception e){
//            e.printStackTrace();
//            return null;
//        }
        return null;
    }
}
