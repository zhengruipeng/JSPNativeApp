package pro.mysql;

import java.util.ArrayList;
import java.util.Map;

public class sqlEvent {
    public static String updateSQL(ArrayList<String> table_cols,
                                   Map<String,String> table_maps,
                                   String table_name, String key){
        StringBuilder list = new StringBuilder();
        for(int i=1;i<table_cols.size();i++){
            list.append(table_cols.get(i)).append("='").append(
                    table_maps.get(table_cols.get(i))
            ).append("',");
        }
        String listStr = list.toString();
        listStr = listStr.substring(0,listStr.length()-1);
        String sql = "update "+table_name+" set "+listStr+" where "+key+"='"+table_maps.get(key)+"'";
        return sql;
    }
    public static String deleteSQL(Map<String,String> table_maps,String table_name,String key){
        String sql = "delete from "+table_name+" where "+key+"='"+table_maps.get(key)+"'";
        return sql;
    }
    public static String insertSQL(ArrayList<String> table_cols,
                                   Map<String,String> table_maps,
                                   String table_name){
        StringBuilder list1 = new StringBuilder();
        StringBuilder list2 = new StringBuilder();
//        String list2 = "";
        for(int i=0;i<table_cols.size();i++){
//            $list1 .= $table_cols[$i] .",";
            list1.append(table_cols.get(i)).append(",");
        }
        String listStr1 = list1.toString();
        listStr1 = listStr1.substring(0,listStr1.length()-1);

        for(int i=0;i<table_cols.size();i++){
//            $list2 .= "'". $_POST[$table_cols[$i]] ."',";
            list2.append("'").append(table_maps.get(table_cols.get(i))).append("'").append(",");
        }
//        $list2 = substr($list2,0,strlen($list2)-1);
        String listStr2 = list2.toString();
        listStr2 = listStr2.substring(0,listStr2.length()-1);

        String sql = "INSERT INTO "+ table_name +" ("+ listStr1 +") VALUES ("+ listStr2 +")";
        return sql;
    }
}


