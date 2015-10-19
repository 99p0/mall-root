package cc.congyi.controller;

import cc.congyi.model.Dealer;
import cc.congyi.model.SysUser;
import cc.congyi.service.DealerService;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 经销商
 * <p>
 * Created by final.young@hotmail.com on 2015/8/12.
 */
@Controller
@RequestMapping("/dealer")
public class DealerController extends BaseController {

    @Autowired
    private DealerService dealerService;

    /**
     * 经销商管理页面
     *
     * @param request
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String execute(HttpServletRequest request) {
        SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUser");
        if(sysUser == null){ // 进入项目首页
            return "redirect:/frame";
        }
        return PATH_DEALER + "manage";
    }

    /**
     * 查询经销商
     *
     * @param request
     * @return
     */
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> queryDealersByPage(HttpServletRequest request) {
        SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUser");
        if(sysUser instanceof  SysUser){
            String offsetStr = request.getParameter("iDisplayStart");
            String limitStr = request.getParameter("iDisplayLength");
            String sEcho = request.getParameter("sEcho");
            Map<String, Object> retMap = new HashMap<>();
            int totalRecords = dealerService.queryDealerCountByCondition();
            retMap.put("aaData", dealerService.queryDealerListByConditionWithPage(Integer.parseInt(offsetStr), Integer.parseInt(limitStr)));
            retMap.put("iTotalRecords", totalRecords);
            retMap.put("iTotalDisplayRecords", totalRecords);
            retMap.put("sEcho", Integer.parseInt(sEcho)+1);
            return retMap;
        }
        return null;
    }

    /**
     * 查询全部经销商
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/all", method = RequestMethod.POST)
    @ResponseBody
    public List<Dealer> queryAllDealers(HttpServletRequest request) {
        SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUser");
        if(sysUser instanceof  SysUser){
            return dealerService.queryDealerListByConditionWithPage(null, null);
        }
        return null;
    }


    /**
     * 查询用户
     *
     * @param request
     * @param dealerId
     * @return
     */
    @RequestMapping(value = "/{dealerId:^[1-9]\\d*$}", method = RequestMethod.POST)
    @ResponseBody
    public Dealer queryDealerById(HttpServletRequest request, @PathVariable Integer dealerId){
        SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUser");
        if(sysUser instanceof SysUser){
            return dealerService.queryDealerById(dealerId);
        }
        return null;
    }

    /**
     * 删除用户
     *
     * @param request
     * @param dealerId
     * @return
     */
    @RequestMapping(value = "/delete/{dealerId:^[1-9]\\d*$}", method = RequestMethod.POST)
    @ResponseBody
    public String deleteDealerById(HttpServletRequest request, @PathVariable Integer dealerId){
        SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUser");
        if(sysUser == null){
            return "not-login";
        }
        if(dealerService.deleteDealerById(dealerId)){
            return "success";
        }
        return "error";
    }

    /**
     * 积分操作
     *
     * @param request
     * @param dealerId
     * @return
     */
    @RequestMapping(value = "/{dealerId:^[1-9]\\d*$}/integral", method = RequestMethod.POST)
    @ResponseBody
    public String integralAction(HttpServletRequest request, @PathVariable Integer dealerId){
        SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUser");
        if(sysUser == null){
            return "not-login";
        }
        String operator = request.getParameter("operator");
        String integralNumStr = request.getParameter("integralNum");
        int integralNum = NumberUtils.isNumber(integralNumStr) ? Integer.parseInt(integralNumStr) : 0;
        if(dealerService.integralAction(dealerId, operator, integralNum)){
            return "success";
        }
        return "error";
    }

    /**
     * 添加经销商的信息
     *
     * @param request
     * @param dealer
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public String addDealer(HttpServletRequest request, Dealer dealer){
        SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUser");
        if(sysUser == null) return "not-login";
        if(dealer instanceof Dealer){
            if(dealerService.addDealer(dealer))
                return "success";
            else
                return "error";
        }
        return "bugs";
    }

    /**
     * 修改经销商的信息
     *
     * @param request
     * @param dealer
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public String updateDealer(HttpServletRequest request, Dealer dealer){
        SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUser");
        if(sysUser == null) return "not-login";
        if(dealer instanceof Dealer && dealer.getId() != null){
            if(dealerService.updateDealerById(dealer))
                return "success";
            else
                return "error";
        }
        return "bugs";
    }


    /**
     * 更改账户状态
     *
     * @param request
     * @param dealerId
     * @return
     */
    @RequestMapping(value = "/change/{dealerId:^[1-9]\\d*$}", method = RequestMethod.POST)
    @ResponseBody
    public String changeAccountStateById(HttpServletRequest request, @PathVariable Integer dealerId){
        SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUser");
        if(sysUser == null) return "not-login";
        if(dealerService.changeAccountStateById(dealerId)) return "success";
        return "error";
    }

    /**
     * 增减用户积分
     *
     * @param request
     * @param dealerId
     * @return
     */
    @RequestMapping(value = "/sdfg/{dealerId:^[1-9]\\d*$}", method = RequestMethod.POST)
    @ResponseBody
    public String s(HttpServletRequest request, @PathVariable Integer dealerId){
        SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUser");
        if(sysUser == null) return "not-login";
        //
        return "error";
    }



}
