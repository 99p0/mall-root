package cc.congyi.controller;

import cc.congyi.model.SysUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by final.young@hotmail.com on 2015/8/12.
 */
@Controller
public class HomeController extends BaseController{

    /**
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/frame")
    public String home(HttpServletRequest request){
        SysUser sysUser = (SysUser) request.getSession().getAttribute("sysUser");
        if(sysUser instanceof  SysUser){
            // 不需要加载菜单
            return PATH + "frame";
        }else{
            return PATH + "login";
        }
    }

}
