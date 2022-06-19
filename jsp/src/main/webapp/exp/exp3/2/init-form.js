document.addEventListener("DOMContentLoaded",function (){
    let name = sessionStorage.getItem('name');
    let gender = sessionStorage.getItem('gender');
    let hobby = sessionStorage.getItem('hobby');
    console.log(sessionStorage.getItem('name'));
    console.log(sessionStorage.getItem('gender'));
    console.log(sessionStorage.getItem('hobby'));
    const nameInput = this.querySelector("#username-container input");
    const genderInputs = this.querySelectorAll("#gender-container input");
    const hobbySelect = this.querySelector("#hobby-container select");

    // console.log(nameInput);
    if(name){
        nameInput.value = name;
    }
    if(gender) {
        gender === "male" ? genderInputs[0].checked = true : genderInputs[1].checked = true;
    }
    if(hobby) {
        let hobbyArr = hobby.split(",").filter(v => v !== "null");
        Array.from(hobbySelect.options).forEach(option => {
            if (hobbyArr.indexOf(option.innerHTML.trim()) !== -1) {
                option.selected = true;
            }
        })
    }
})