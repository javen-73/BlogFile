package com.javen;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

/**
 * 文件名:com.jk51.commons.date.DateUtils
 * 描述: JDK1.8 时间使用工具类，不建议使用java.util.Date相关再操作日期
 * 作者: wangzhengfei
 * 创建日期: 2017-01-16
 * 修改记录:
 */
public final class DateUtils {

    /**
     * 日志记录器
     */
    public static final Logger logger = LoggerFactory.getLogger(DateUtils.class);

    /**
     * 获取默认格式的当前时间
     * @return
     */
    public static String getCurrentTime(){
        return LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME);
    }

    /**
     * 获取默认格式的当前日期，格式如:2017-01-16
     * @return 日期字串
     */
    public static String getToday(){
        return LocalDate.now().format(DateTimeFormatter.ISO_LOCAL_DATE);
    }

    /**
     * 获取默认格式的当前日期，格式如:2017-01
     * @return 日期字串
     */
    public static String getMonth(){
        return LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM"));
    }


    /**
     * 获取默认格式的当前日期的下月日期，格式如:2017-01
     * @return 日期字串
     */
    public static String getNextMonth() {

        Calendar cal = Calendar.getInstance();
        cal.add(cal.MONTH, 1);
        SimpleDateFormat dft = new SimpleDateFormat("yyyy-MM");
        String preMonth = dft.format(cal.getTime());
        return preMonth;
    }

    /**
     * 日期格式化
     * @param source 日期字符串
     * @param format 日期格式
     * @return
     * @throws ParseException
     */
    public static Date parse(String source,String format) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.parse(source);
    }

    /**
     * 日期格式化
     * @param date 日期
     * @param format 格式
     * @return 格式化后的字符串
     */
    public static String toString(Date date,String format){
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(date);
    }

    /**
     * 获取当前时间SqlDate对象
     * @return
     */
    public static java.sql.Date getNowSqlDate(){
        return new java.sql.Date(Instant.now().toEpochMilli());
    }

    /**
     * 日期转换
     * @param date 日期字串
     * @param format 格式
     * @return
     */
    public static java.sql.Date convert(String date,String format) throws ParseException {
        Date d = parse(date,format);
        return new java.sql.Date(d.getTime());
    }

    /**
     * 日期转换
     * @param date
     * @return
     */
    public static java.sql.Date convert(Date date){
        return new java.sql.Date(date.getTime());
    }

    /**
     * 获得当前时间戳
     * @return
     */
    public static Timestamp getNowTimestamp(){
        return new Timestamp(Instant.now().toEpochMilli());
    }

    public static String formatDate(String format){
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(new Date());
    }

    public static String formatDate(Date date,String format){
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(date);
    }

    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");



    /**
     * 获取当前月每天的日期
     * @return
     */
    public static List getDayListOfMonth(int year , int month, int day) {
        List<String> fullDayList = new LinkedList<String>();
        if(day <= 0 ) day = 1;
        Calendar cal = Calendar.getInstance();// 获得当前日期对象
        cal.clear();// 清除信息
        cal.set(Calendar.YEAR, year);
        cal.set(Calendar.MONTH, month - 1);// 1月从0开始
        cal.set(Calendar.DAY_OF_MONTH, day);// 设置为1号,当前日期既为本月第一天
        int count = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
        for (int j = 0; j <= (count-1);) {
            if(sdf.format(cal.getTime()).equals(getLastDay(year, month)))
                break;
            cal.add(Calendar.DAY_OF_MONTH, j == 0 ? +0 : +1);
            j++;
            fullDayList.add(sdf.format(cal.getTime()));
        }
        return fullDayList;
    }

    /**
     * 获取当前月日期最大的一天
     */
    public static String getLastDay(int year,int month){
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR, year);
        cal.set(Calendar.MONTH, month);
        cal.set(Calendar.DAY_OF_MONTH, 0);
        return sdf.format(cal.getTime());
    }

    /**
     * 与现在的提起比较大小
     * @param  day  yyyy-MM-dd 00:00:00
     */
    public static int compareNow(String day){

        Date date = null;
        try {
            date =  parse(day+" 00:00:00","yyyy-MM-dd HH:mm:ss");
        } catch (ParseException e) {
            logger.error("解析时间报错",e);
        }

        Calendar c1 = Calendar.getInstance();
        Calendar c2 = Calendar.getInstance();

        c1.setTime(date);
        c2.setTime(new Date());

        int result =  c1.compareTo(c2);

        return result;
    }

    /***
     *时间比较
     * @param date1
     * @param date2
     */
    public static int compare(Date date1,Date date2){

        Calendar c1 = Calendar.getInstance();
        Calendar c2 = Calendar.getInstance();

        c1.setTime(date1);
        c2.setTime(date2);
        return c1.compareTo(c2);
    }

    /**
     *
     *获取当前周
     * 返回 0是星期日、1是星期一、2是星期二、3是星期三、4是星期四、5是星期五、6是星期六
     * */
    public static int getWeek(){
        Calendar cal = Calendar.getInstance();
        return cal.get(Calendar.DAY_OF_WEEK)-1;
    }
    /**
     *获取当前时间加或减指定天数的时间
     * @param num  num为正整数时为加指定天数，为负整数时为减指定天数
     * */
    public static Date getBeforeOrAfterDate(Date now,int num){

        Calendar calendar=Calendar.getInstance();
        calendar.setTime(now);
        calendar.add(Calendar.DAY_OF_MONTH,num);
        return calendar.getTime();
    }

    /**
     * 判断时间格式
     * 2004-2-30 是无效的
     * 2003-2-29 是无效的
     * @param str
     * @return
     */
    public static boolean isValidDate(String str,String format) {

        DateFormat formatter = new SimpleDateFormat(format);
        try{
            Date date = (Date)formatter.parse(str);
            return str.equals(formatter.format(date));
        }catch(Exception e){
            return false;
        }
    }
}
