import {MyApp} from "./config.js";
import {Student} from "./Student.js";
document.addEventListener("DOMContentLoaded",function (){
    const table = this.querySelector("table");
    const tbody = table.querySelector("tbody");
    const asideLogoBtn = this.querySelector("#aside-logo");
    const deleteSelectedBtn = this.querySelector("#delete-selected");
    const addStudentBtn = this.querySelector("#add-student");
    const selectAllBtn = this.querySelector("#select-all");
    const aside = this.querySelector("aside");
    const menu = this.querySelector(".menu");
    const informationForm = this.querySelector(".information-form");
    const main = this.querySelector("main");
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

    };
    let db = null;
    asideLogoBtn.onclick = function (){
        this.onmouseout.call(this,null);
        if(MyApp.asideMode){
            MyApp.asideMode = false;
            asideLogoBtn.className = "aside-logo-close";
            aside.className = "aside-close";
            main.style.filter = "blur(0)";
        }else {
            MyApp.asideMode = true;
            asideLogoBtn.className = "aside-logo-open";
            aside.className = "aside-open";
            main.style.filter = "blur(10px)";
        }
    };
    deleteSelectedBtn.onclick = function (){
        let rows = Array.from(table.rows);
        rows.forEach((row,index) => {
            if(index === 0)return false;
            let selectedCell = row.cells[0];
            let deleteBtnInRow = row.cells[5].children[0];
            let selectedSpan = selectedCell.children[0];
            let ifSelected = selectedSpan.classList.contains("select-justify-ensure");
            if(ifSelected){
                deleteBtnInRow.click();
            }
        });
        asideLogoBtn.click();

    };
    addStudentBtn.onclick = function (){
        db = MyApp.indexedDB;

        informationForm.classList.remove("information-form-close");
        informationForm.classList.add("information-form-open");
        menu.classList.remove("menu-open");
        menu.classList.add("menu-close");
        informationForm.innerHTML = "";

        let idbTransaction = db.transaction("books","readwrite");
        let idbOBJS = idbTransaction.objectStore("books");
        let openCursorIDBRequest = idbOBJS.openCursor();
        openCursorIDBRequest.onsuccess = function (){
            let cursor = this.result;
            if(cursor){
                let bookItem = document.createElement("li");
                bookItem.className = "information-form-item";
                bookItem.innerHTML = `${cursor.key}:${cursor.value.name} ${cursor.value.price}$ ${cursor.value.num}个`;
                informationForm.appendChild(bookItem);
                cursor.continue();
            }
        }


        let cancelBtn = document.createElement("button");
        let submitBtn = document.createElement("button");
        cancelBtn.innerHTML = "取消";
        submitBtn.innerHTML = "确定";
        cancelBtn.onclick = function (){
            informationForm.classList.remove("information-form-open");
            informationForm.classList.add("information-form-close");
            menu.classList.remove("menu-close");
            menu.classList.add("menu-open");
        };
        submitBtn.onclick = function (){
            let sum = 0;
            let idbTransaction = db.transaction("books","readwrite");
            let idbOBJS = idbTransaction.objectStore("books");
            let openCursorIDBRequest = idbOBJS.openCursor();
            openCursorIDBRequest.onsuccess = function (){
                let cursor = this.result;
                if(cursor){
                    // bookItem.innerHTML = `${cursor.key}:${cursor.value.name} ${cursor.value.price}$ ${}个`;
                    sum += cursor.value.price * cursor.value.num
                    cursor.continue();
                }else{
                    alert("一共"+sum+"元");
                }
            }
            cancelBtn.click();
            asideLogoBtn.click();
        }
        informationForm.appendChild(cancelBtn);
        informationForm.appendChild(submitBtn);
    };
    asideLogoBtn.onmouseover = function (){
        if(aside.classList.contains("aside-close")){
            this.style.left = "4%";
        }
    };
    asideLogoBtn.onmouseout = function (){
        this.style.left = "";
    };
    selectAllBtn.onclick = function (){
        if(this.dataset.select === "none"){
            this.dataset.select = "all";
            this.innerHTML = "全不选";
            Array.from(tbody.rows).forEach(tr => {
                let selectedSpan = tr.cells[0].children[0];
                selectedSpan.classList.add("select-justify-ensure");
            })
        }else if(this.dataset.select === "all"){
            this.dataset.select = "none";
            this.innerHTML = "全选";
            Array.from(tbody.rows).forEach(tr => {
                let selectedSpan = tr.cells[0].children[0];
                selectedSpan.classList.remove("select-justify-ensure");
            })
        }
        asideLogoBtn.click();


    };
})