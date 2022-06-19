
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="pro.mysql.operation" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%
    String table = request.getParameter("table");
%>
import {MyApp} from "./javascript/config/config.js";
import {notify} from "./javascript/view/notification.js";
import {IndexedDBCurd} from "./javascript/config/indexedDB-curd.js";

(function (){
    let indexDBReq = indexedDB.open("managerDB",4);
    let db;
    let store;
    indexDBReq.onsuccess = async function (){
        db = this.result;
        MyApp.database = db;


        /*添加列信息*/
        <%
            ResultSet rs;
            ArrayList<String> columns = new ArrayList<String>();

            try {
                operation.connect();
                rs = operation.select("show columns from "+table+"");
//                System.out.print(table);
                while(rs.next()){
                    columns.add(rs.getString("Field"));
                    out.println("MyApp.tableCols.push('"+rs.getString("Field")+"');\n");
                }
                out.println("MyApp.tableKey = \""+columns.get(0)+"\";");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }catch (SQLException e){
                e.printStackTrace();
            }

        %>

        await new Promise(resolve1 => IndexedDBCurd.getAll(function (arr){
            let delPromises = [];
            arr.forEach(row => {
                let key = MyApp.tableCols[0];
                delPromises.push(new Promise(resolve2 =>
                    IndexedDBCurd.delete(row[key],resolve2)
                ));
            })
            Promise.all(delPromises).then(_ => resolve1());
        }));
        /*IDBObjectStore.put({
                <%
                    for(int i = 0;i<columns.size();i++){
                        out.println(columns.get(i)+":\""+columns.get(i)+"\",");
                    }
                %>
            });*/
        let putPromises = [];
        let IDBTransaction = db.transaction("<%=table%>","readwrite");
        let IDBObjectStore = IDBTransaction.objectStore("<%=table%>");
        <%
            try{
            ResultSet stmt = operation.select("select * from "+table);
            while(stmt.next()){
        %>
            /*输出信息，供测试*/

            <%
                StringBuilder output_str = new StringBuilder("console.log(\"");
                try {
                    for (int i=0;i<columns.size();i++){
                        output_str.append(columns.get(i)).append("=").append(stmt.getString(columns.get(i))).append("  ");
                    }
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                output_str.append("\");");
                out.println(output_str);
            %>
                /*插入信息*/
            putPromises.push(new Promise(resolve => {
                IDBObjectStore.put({
                /*动态生成数据*/
                <%
                    for(int i = 0;i<columns.size();i++){
                        out.println(columns.get(i)+":\""+stmt.getString(columns.get(i))+"\",");
                        //sname:"<?=$row['sname']
                    }
                %>
                }).onsuccess = function (){resolve()};
            }));

        <%
            }
            }catch (Exception e){

            }
        %>
        Promise.all(putPromises).then(arr => {
            notify.println("从云端同步数据成功");
            MyApp.customEvent.dispatchEvent("databaseOnSuccess");
        });
    };
    indexDBReq.onerror = function (){
        document.write("database open request error")
    }
    indexDBReq.onupgradeneeded = function (){
        db = this.result;
        store = db.createObjectStore("student",{keyPath:(`<%
                try {
                    rs = operation.select("show columns from student");
                    rs.next();
                    out.println(rs.getString("Field"));
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            %>
        `).trim()});
        store = db.createObjectStore("course",{keyPath:(`<%
            try {
                rs = operation.select("show columns from course");
                rs.next();
                out.println(rs.getString("Field"));
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        %>
        `).trim()});
        store = db.createObjectStore("studentgrade",{keyPath:(`<%
            try {
                rs = operation.select("show columns from studentgrade");
                rs.next();
                out.println(rs.getString("Field"));
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        %>
        `).trim()});
        store = db.createObjectStore("exp_view",{keyPath:(`<%
            try {
                rs = operation.select("show columns from exp_view");
                rs.next();
                out.println(rs.getString("Field"));
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        %>
        `).trim()});
        /* console.log("onupgradeneeded");*/
    };
    
})();
<%
    operation.closeAllStatus();
%>
