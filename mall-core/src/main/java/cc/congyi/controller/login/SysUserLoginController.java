package cc.congyi.controller.login;

import cc.congyi.controller.BaseController;
import cc.congyi.model.SysUser;
import cc.congyi.service.SysUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;

/**
 * 系统管理员 登录相关
 * Created by final.young@hotmail.com on 2015/8/11.
 */
@Controller
public class SysUserLoginController extends BaseController {

    @Autowired
    private SysUserService sysUserService;

    /**
     * 进入登录页面
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/login/sys")
    public String login(HttpServletRequest request){
        SysUser sysUser = (SysUser) request.getSession().getAttribute("sysUser");
        if(sysUser instanceof  SysUser){
            return "redirect:/frame";
        }
        return PATH + "login";
    }

    /**
     * 登录
     * @param request
     * @return
     */
    @RequestMapping(value = "/sign-in/sys", method = RequestMethod.POST)
    public String signIn(HttpServletRequest request){
        String loginName = request.getParameter("name");
        String loginPwd = request.getParameter("pwd");
        if(StringUtils.isBlank(loginName) || StringUtils.isBlank(loginPwd)){
            request.setAttribute("callMsg", "用户名和密码不能为空");
            return PATH + "login";
        }
        SysUser sysUser = sysUserService.querySysUserByNameAndPwd(loginName, loginPwd);
        if(sysUser instanceof SysUser){
            request.getSession().setAttribute("sysUser" , sysUser);
            return "redirect:/frame";
        }else{
            request.setAttribute("callMsg", "用户名或密码错误");
            return PATH + "login";
        }
    }

    /**
     * 登出系统
     * @param session
     * @return
     */
    @RequestMapping(value = "/logout/sys", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        Enumeration<?> em = session.getAttributeNames();
        while(em.hasMoreElements()){
            session.removeAttribute(em.nextElement().toString());
        }
        session.invalidate();
        return "redirect:/frame"; // 进入项目首页
    }


}

