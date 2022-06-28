(function (){
    const formEle = document.querySelector("form");
    const inputContainer = Array.from(document.querySelectorAll(".input-container"));
    const buttons = Array.from(document.querySelectorAll(".button"));

    window.onmousemove = function (e){
        let x = e.x,y = e.y;
        formEle.style.borderImageSource = `radial-gradient(300px 300px at ${x-formEle.offsetLeft}px calc(${y-formEle.offsetTop}px),var(--sec-color),var(--main-color))`;
        inputContainer.forEach(function (ele){
            ele.style.borderImageSource = `radial-gradient(300px 300px at ${x-ele.offsetLeft}px calc(${y-ele.offsetTop}px),var(--sec-color),var(--main-color))`;
        });
        buttons.forEach(function (ele){
            ele.style.borderImageSource = `radial-gradient(300px 300px at ${x-ele.offsetLeft}px calc(${y-ele.offsetTop}px),var(--sec-color),var(--main-color))`;
        });
    };
    inputContainer.forEach(ele => {
        ele.onmouseover = function (){
            const label = this.querySelector("label");
            // const inputEle = this.querySelector("div[contenteditable]");
            const inputEle = this.querySelector("div");
            label.style.left = "10%";
            label.style.opacity = "0";
            inputEle.style.opacity = "1";
            inputEle.style.minWidth = "80%";
            inputEle.style.left = "10%";
            inputEle.focus();

            // let maxheight = parseFloat(this.style.height) || this.getBoundingClientRect().height;
            // console.log(maxheight)
/*
            Array.from(inputEle.children).forEach(child => {
                let rects = child.getBoundingClientRect[0];
                maxheight = Math.max(rects.height,maxheight);
            })*/
            // this.style.height = maxheight + "px";

        };
        ele.onmouseout = function (){
            const label = this.querySelector("label");
            // const inputEle = this.querySelector("div[contenteditable]");
            const inputEle = this.querySelector("div");
            label.style.left = "calc(50% - 2rem)";
            label.style.opacity = "1";
            inputEle.style.opacity = "0";
            // inputEle.style.minWidth = "1px";
            inputEle.style.left = "100%";

            // let maxheight = parseFloat(this.style.height) || this.getClientRects()[0].height;
            // console.log(maxheight)
            // this.style.height = "100%";
        };
        ele.onselectstart = e => e.preventDefault();

    });


})();