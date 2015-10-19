package cc.congyi.service;

import cc.congyi.model.SysUser;
import cc.congyi.persistence.mybatis.SysUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * ϵͳ�û�
 * Created by final.young@hotmail.com on 2015/8/12.
 */
@Service
public class SysUserService extends BaseService {

     @Autowired
     private SysUserMapper sysUserMapper;

    /**
     * 根据用户名和密码查询用户信息
     *
     * @param loginName
     * @param loginPwd
     * @return
     */
    public SysUser querySysUserByNameAndPwd(String loginName, String loginPwd){
        Map<String, Object> paramsMap = new HashMap<>();
        paramsMap.put("loginName", loginName);
        paramsMap.put("loginPwd", loginPwd);
        return sysUserMapper.querySysUserByNameAndPwd(paramsMap);
    }



}
