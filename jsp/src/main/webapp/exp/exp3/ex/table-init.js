import {MyApp} from "./config.js";
import {Student} from "./Student.js";
document.addEventListener("DOMContentLoaded",function (){
    const tbody = this.querySelector("table>tbody");
    const colgroup = this.querySelector("table>colgroup");
    let initTrWithStudentInfo = function (student){
        let tr = document.createElement("tr");
        let td1 = document.createElement("td");
        let td2 = document.createElement("td");
        let td3 = document.createElement("td");
        let td4 = document.createElement("td");
        let td5 = document.createElement("td");
        let td6 = document.createElement("td");
        let td7 = document.createElement("td");
        td1.appendChild(student.selected);
        td2.appendChild(document.createTextNode(student.id));
        td3.appendChild(document.createTextNode(student.name));
        td4.appendChild(document.createTextNode(student.age));
        td5.appendChild(document.createTextNode(student.score));
        td6.appendChild(student.operation[0]);
        td7.appendChild(student.operation[1]);

        tr.appendChild(td1);
        tr.appendChild(td2);
        tr.appendChild(td3);
        tr.appendChild(td4);
        tr.appendChild(td5);
        tr.appendChild(td6);
        tr.appendChild(td7);


        return tr;

    }
    let students = [];
    students.push(new Student("1","JavaScript权威指南第七版",101,0))
    students.push(new Student("2","JavaScript高级程序设计第四版",86,0))
    students.push(new Student("3","CSS权威指南第四版",110,0))
    students.push(new Student("4","SVG精髓",25,0))
    students.push(new Student("5","基于WebGL的互交式图形学",50,0))
    students.push(new Student("6","密码学101",0,0))
    students.push(new Student("7","WebRTC从入门到入土",-30,0))
    students.push(new Student("8","WebML：前端机械学习，卷死后端近在咫尺",-100,0))
    students.forEach(student => {
        let tr = initTrWithStudentInfo(student);
        tbody.appendChild(tr);
        tr.style.height = tr.getBoundingClientRect().height+"px";
    });
    // alert();
    MyApp.data.students = students;

    let col1 = document.createElement("col");
    let col2 = document.createElement("col");
    let col3 = document.createElement("col");
    let col4 = document.createElement("col");
    let col5 = document.createElement("col");
    let col6 = document.createElement("col");
    let col7 = document.createElement("col");

    colgroup.appendChild(col1);
    colgroup.appendChild(col2);
    colgroup.appendChild(col3);
    colgroup.appendChild(col4);
    colgroup.appendChild(col5);
    colgroup.appendChild(col6);
    colgroup.appendChild(col7);

});
