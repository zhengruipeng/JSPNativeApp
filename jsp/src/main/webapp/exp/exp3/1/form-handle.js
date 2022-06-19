document.addEventListener("DOMContentLoaded",function (){
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
        let getPath = Array.from(form)
            .map((inputEle,i,arr) => {
                let value = inputEle.value;
                if(!value){
                    return "";
                }
                if((inputEle.type === "radio"||
                    inputEle.type === "checkbox")&&
                    inputEle.checked === false){
                    return "";
                }
                let name = inputEle.name;
                return name+"="+value+"&";
            })
            .join("");
        getPath = getPath.substring(0,getPath.length-1);
        console.log(getPath);
        let gotoPath = "male";
        if(getPath.indexOf("gender") !== -1){
            let gender = getPath.split("&").filter(v => v.indexOf("gender=") !== -1)[0];
            let reg = /gender=(.?)/;
            gender = gender.match(reg)[1];
            gotoPath = gender === "m"?"male":"female";
        }
        fetch("./"+gotoPath+".jsp?" + getPath)
            .then(response => response.text())
            .then(text => {
                cover.innerHTML = text;
                cover.style.zIndex = "1";
            })
            .catch(console.error)
    });
})