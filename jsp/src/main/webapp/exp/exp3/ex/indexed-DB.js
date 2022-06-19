import {MyApp} from "./config.js";

document.addEventListener("DOMContentLoaded",function (){
    const trs = Array.from(document.querySelectorAll("table>tbody>tr"));

    let indexDBReq = indexedDB.open("bookStoreDB",4);
    let db;
    let store;
    indexDBReq.onsuccess = async function (){
        console.log("database load successfully");
        db = this.result;
        MyApp.indexedDB = db;

        let iDBTransaction = db.transaction("books","readwrite");
        let iDBObjectStore = iDBTransaction.objectStore("books");
        let addP = [];
        MyApp.data.students.forEach(async function (book){
            if(iDBObjectStore.get(book.id)){
                // iDBObjectStore.put({id: book.id, name: book.name, price: book.age,num:0});
            }else {
                addP.push(
                    new Promise(resolve => {
                        iDBObjectStore.add({id: book.id, name: book.name, price: book.age,num:0});
                        resolve();
                    })
                )
            }
        });
        await Promise.all(addP);

        let idTds = trs.map(tr => [tr.children[1].innerHTML,tr.children[4]]);


        let idNumMap = new Map(idTds);
        let idbTransaction = db.transaction("books","readwrite");
        let idbOBJS = idbTransaction.objectStore("books");
        let openCursorIDBRequest = idbOBJS.openCursor();
        openCursorIDBRequest.onsuccess = function (){
            let cursor = this.result;
            if(cursor){
                idNumMap.get(cursor.key).innerHTML = cursor.value.num;
                cursor.continue();
            }
        }


    };
    indexDBReq.onerror = function (){
        document.write("database open request error")
    }
    indexDBReq.onupgradeneeded = function (){
        db = this.result;
        store = db.createObjectStore("books",{keyPath:"id"});
        console.log("onupgradeneeded");
    };
});
/*
window.onunload = function (){
    indexedDB.deleteDatabase("bookStoreDB");
};*/
