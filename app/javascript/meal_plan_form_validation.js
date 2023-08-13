function validateform(e){
  const startDate = document.getElementById("start-date").value;
  const endDate = document.getElementById("end-date").value;
  const sub = (Date.parse(endDate)- Date.parse(startDate))/(3600*24*1000)+1;

  const recipeCheckboxes = [...document.querySelectorAll('.recipe-checkbox')];

  const selectedCheckboxes = {};
  for (const recipeCheckbox of recipeCheckboxes) {
    const category = recipeCheckbox.getAttribute('data-category');
    if (recipeCheckbox.checked) {
      const current = selectedCheckboxes[category] || [];
      current.push(recipeCheckbox);
      selectedCheckboxes[category] = current;
    }
  }

  if(sub < 0){
    return;
  };

  if(((Date.parse(startDate)-Date.now())/(1000*3600*24))< -1){
    return;
  };

  let confirmMessage = '';
  
  for (const category of Object.keys(selectedCheckboxes)) {
    const recipes = selectedCheckboxes[category];
    confirmMessage += `${recipes.length} ${category} recipes\n`;
  }

  if (Object.values(selectedCheckboxes).find((list) => list.length != sub)) {
    if (confirm(`You have ${sub} days selected and:\n${confirmMessage}\nDo you want to save meal plan anyway?`) === false) {
      e.preventDefault();
    }
  }
}
