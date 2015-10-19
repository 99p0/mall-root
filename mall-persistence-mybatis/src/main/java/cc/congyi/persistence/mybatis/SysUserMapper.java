package cc.congyi.persistence.mybatis;

import cc.congyi.model.SysUser;

import java.util.Map;

public interface SysUserMapper {
    int insert(SysUser record);

    int insertSelective(SysUser record);

    SysUser selectByPrimaryKey(Integer id);

    SysUser querySysUserByNameAndPwd(Map<String, Object> paramsMap);

    int updateByPrimaryKeySelective(SysUser record);

    int updateByPrimaryKey(SysUser record);

}