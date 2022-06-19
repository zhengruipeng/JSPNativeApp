import {MyApp} from "./config.js";

document.addEventListener("DOMContentLoaded",function (){
    const tbody = this.querySelector("table>tbody");
    let selected = function (){
        let tbody = this.parentNode;
        for(let i = 0;i<tbody.children.length;i++){
            tbody.children[i].classList.remove("tr-selected");
        }
        this.classList.add("tr-selected");
    };
    let update = function (ev){
        ev.preventDefault();
        let tr = this.parentNode.parentNode;

        let id = tr.children[1].innerHTML;
        let name = tr.children[2].innerHTML;
        let price = tr.children[3].innerHTML;
        let num = tr.children[4].innerHTML;

        let db = MyApp.indexedDB;
        let IDBTransaction = db.transaction("books","readwrite");
        let IDBObjectStore = IDBTransaction.objectStore("books");
        let req = IDBObjectStore.put({id, name, price:price-0,num:num-0+1});
        req.onsuccess = function (ev){
            tr.children[4].innerHTML = num-0+1;
        }
    };
    let deleteItem = function (ev){
        ev.preventDefault();
        let tr = this.parentNode.parentNode;

        let id = tr.children[1].innerHTML;
        let name = tr.children[2].innerHTML;
        let price = tr.children[3].innerHTML;
        let num = tr.children[4].innerHTML;
        if(num-0 === 0){
            return false;
        }
        let db = MyApp.indexedDB;
        let IDBTransaction = db.transaction("books","readwrite");
        let IDBObjectStore = IDBTransaction.objectStore("books");
        let req = IDBObjectStore.put({id, name, price:price-0,num:num-1});
        req.onsuccess = function (ev){
            tr.children[4].innerHTML = num-1;
            // console.log(this.result);
        }
    };
    tbody.childNodes.forEach(function (tr){
        tr.onclick = selected;
    });
    tbody.querySelectorAll(".update").forEach(function (button){
        button.onclick = update;
    });
    tbody.querySelectorAll(".delete").forEach(function (button){
        button.onclick = deleteItem;

    });
    MyApp.eventFunctions.update = update;
    MyApp.eventFunctions.deleteItem = deleteItem;
    MyApp.eventFunctions.selected = selected;
})