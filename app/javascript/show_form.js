function showForm(){
  const el = document.getElementById("myForm");
  if(el.classList.contains("myForm")){
    el.classList.remove("myForm");
  } else {
    el.classList.add("myForm");
  }
}