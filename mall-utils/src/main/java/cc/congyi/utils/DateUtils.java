package cc.congyi.utils;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * Created by final.young@hotmail.com on 2015/8/11.
 */
public class DateUtils {

    private static Logger logger = LogManager.getLogger(DateUtils.class);

    /** 日期格式yyyy-MM-dd HH:mm:ss字符串常量 */
    private static final String DATETIME_FORMAT = "yyyy-MM-dd HH:mm:ss";

    private static SimpleDateFormat sdf_datetime_format = new SimpleDateFormat(DATETIME_FORMAT);

    public DateUtils() {
    }

    /**
     * 获得服务器当前日期及时间，以格式为：yyyy-MM-dd HH:mm:ss的日期字符串形式返回
     *
     * @author dylan_xu
     * @date Mar 11, 2012
     * @return
     */
    public static String getCurrentDateStr() {
        try {
            Calendar cale = Calendar.getInstance();
            return sdf_datetime_format.format(cale.getTime());
        } catch (Exception e) {
            logger.debug("DateUtil.getDateTime():" + e.getMessage());
            return "";
        }
    }

}
