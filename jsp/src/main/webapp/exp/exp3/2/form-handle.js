document.addEventListener("DOMContentLoaded",function (){
    // sessionStorage.clear();

    const form = this.forms[0];
    const resetBtn = this.getElementById("reset");
    const submitBtn = this.getElementById("submit");
    const cover = this.getElementById("cover");
    resetBtn.addEventListener("click",function (ev){
        ev.preventDefault();
        location = location;
    });
    submitBtn.addEventListener("click",async function (ev){
        ev.preventDefault();
        let formData = new FormData(form);
        if(!formData.get("name")){
            document.getElementById("username-container").style.boxShadow = "0 0 15px var(--sec-color)";
            return false;
        }
        document.getElementById("username-container").style.boxShadow = "0 0 0 var(--sec-color)";

        sessionStorage.clear();
        for(let val of formData.entries()){
            if(val[0] === "hobby"){
                sessionStorage.setItem(val[0],sessionStorage.getItem(val[0])+","+val[1]);
            }else
                sessionStorage.setItem(val[0],val[1]);
        }
        console.log(sessionStorage.getItem('name'));
        console.log(sessionStorage.getItem('gender'));
        console.log(sessionStorage.getItem('hobby'));
        location = "handle.html";
    });
})