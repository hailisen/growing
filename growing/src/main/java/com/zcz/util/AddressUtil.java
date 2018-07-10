package com.zcz.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import com.zcz.util.Operate;
//注意：在进行备份和还原操作时，要查看自己是否有配置好mysql的配置。即在命令行中输入这行命令是否可以执行
public class AddressUtil {

    public static String time = "";// 存放时间
    public static String address = "";// 存放地址
    /*
     * 可以备份一个单独的表，也可以备份整个库
     * @param val 代表的是"结构"或"数据"
     * @param addressname 代表的是文件名
     * @param userName mysql登录名
     * @param password登录密码
     * @param dbName 要备份的数据库名称
     * @return
     */
    public static boolean save(Operate operate, String userName,String password, String dbName, String table) {
        String pathSql = findPath(operate.getAddressname());// 备份文件存放的路径
        System.out.println(pathSql);
        address = pathSql;
        boolean flag = false;
        try {
            File fileSql = new File(pathSql);
            // 判断文件是否存在
            if (!fileSql.exists()) {
                fileSql.createNewFile();
            }
            StringBuffer sbs = new StringBuffer();
            sbs.append("mysqldump ");
            sbs.append("-h localhost");
            sbs.append(" -u");
            sbs.append(userName + " ");
            sbs.append("-p" + password + " ");
            sbs.append(dbName);
            Runtime runtime = Runtime.getRuntime();
            String str = sbs.toString();
            // 调用 mysql 的 cmd:
            Process child = runtime.exec("C:/Program Files/MySQL/MySQL Server 5.7/bin/"+str);
            //把进程执行中的控制台输出信息写入.sql文件，即生成了备份文件。注：如果不对控制台信息进行读出，则会导致进程堵塞无法运行
            InputStream in = child.getInputStream();// 控制台的输出信息作为输入流
            InputStreamReader xx = new InputStreamReader(in, "utf-8");// 设置输出流编码为utf8。这里必须是utf8，否则从流中读入的是乱码
            String inStr;
            StringBuffer sb = new StringBuffer("");
            String outStr;
            // 组合控制台输出信息字符串
            BufferedReader br = new BufferedReader(xx);
            while ((inStr = br.readLine()) != null) {
                sb.append(inStr + "\r\n");
            }
            outStr = sb.toString();
            // 要用来做导入用的sql目标文件：
            FileOutputStream fout = new FileOutputStream(pathSql);
            OutputStreamWriter writer = new OutputStreamWriter(fout, "utf-8");
            writer.write(outStr);
            // 注：这里如果用缓冲方式写入文件的话，会导致中文乱码，用flush()方法则可以避免
            writer.flush();
            //别忘记关闭输入输出流
            in.close();
            xx.close();
            br.close();
            writer.close();
            fout.close();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    /**
     * 备份文件存放的路径
     * @return
     */
    public static String findPath(String addressname) {
        String pathSql = System.getProperty("user.home") + File.separator;// C:\Users\
        pathSql+="数据库备份\\";
        //判断文件夹是否存在，如不存在新创建一个
        File file = new File(pathSql);
        if(!file.exists()){
            file.mkdirs();
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        String date = sdf.format(new Date());// 获取当前的时间，以此来以时间进行命名
        time = date;
        if (addressname == null || "".equals(addressname)) {
            pathSql += (date + ".sql");
        } else {
            pathSql += (addressname + ".sql");
        }
        return pathSql;
    }

    /**
     * 还原操作
     * @param operate
     * @return
     */
    public static boolean rollback(Operate operate, String userName, String password, String dbName) {
        boolean flag = false;
        try {
            String fPath = operate.getAddress();
            Runtime rt = Runtime.getRuntime();
            // 调用 mysql 的 cmd:
            StringBuffer sbs = new StringBuffer();
            sbs.append("mysql ");
            sbs.append(" -u ");
            sbs.append(userName + " ");
            sbs.append("-p" + password + " ");
            sbs.append("--default-character-set=utf8 ");
            sbs.append(dbName);
            // Process child = rt.exec("cmd /c "+sbs.toString());
            Process child = rt.exec("C:/Program Files/MySQL/MySQL Server 5.7/bin/"+sbs.toString());
            OutputStream out = child.getOutputStream();// 控制台的输入信息作为输出流
            String inStr;
            StringBuffer sb = new StringBuffer("");
            String outStr;
            BufferedReader br = new BufferedReader(new InputStreamReader(
                    new FileInputStream(fPath), "utf-8"));
            while ((inStr = br.readLine()) != null) {
                sb.append(inStr + "\r\n");
            }
            outStr = sb.toString();
            OutputStreamWriter writer = new OutputStreamWriter(out, "utf-8");
            writer.write(outStr);
            // 注：这里如果用缓冲方式写入文件的话，会导致中文乱码，用flush()方法则可以避免
            writer.flush();
            // 别忘记关闭输入输出流
            out.close();
            br.close();
            writer.close();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
}