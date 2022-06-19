let postMessage = function (msg){
    // self.clients.matchAll({includeUncontrolled:true})
    //     .then(clientMatches => clientMatches[0].postMessage(msg));
    self.clients.matchAll({type:"window"})
        .then(clientMatches => clientMatches[0].postMessage(msg))
        .catch(e => {
            console.warn("a message can not be sent to the client :"+msg);
        })

}
self.oninstall = function (){
    postMessage("准备重定向");

}
self.onfetch = function (ev){
    let request = ev.request;
    let url = ev.request.url;
    let method = ev.request.method;
    postMessage("截取发送的路径: "+url);
    if(url.indexOf("handle.html") !== -1){
        if(url.indexOf("javascript",url.indexOf("course")) !== -1){
            postMessage("已经重定向到路径./javascript.html")
            ev.respondWith(fetch("./javascript.html"));
            return false;
        }
        if(url.indexOf("java",url.indexOf("course")) !== -1){
            postMessage("已经重定向到路径./java.html")
            ev.respondWith(fetch("./java.html"));
            return false;
        }
   }
    ev.respondWith(fetch(request));
}
