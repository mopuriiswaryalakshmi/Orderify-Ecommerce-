
var subCategoryDisplayHandle = document.getElementById('subCategoryId'); // for the whole div
var categoryHandle = document.getElementById('product_category_id');
var subCategoryHandle = document.getElementById('product_subcategory_id'); // for the drop down 
var categoryId; 

categoryHandle.onchange = function(){
   categoryId = categoryHandle.options[categoryHandle.selectedIndex].value; 
  if (categoryId == ""){
    subCategoryDisplayHandle.style.display = "none";
  } else{
    var request = new XMLHttpRequest();
    request.open('GET','/categories/get_subcategories.json?category_id=' + categoryId , true);
    request.onreadystatechange = function(){
      var subCategories = JSON.parse(request.responseText);
     // var output = "";
     subCategoryHandle.innerHTML = "";

      subCategories.forEach(function(subCategory){
     // output += '<option value="' + subCategory.id + '">' + //subCategory.name + '</option>';
     var option = document.createElement('option')
     option.setAttribute('value',subCategory.id);
     var optionText = document.createTextNode(subCategory.name);
     option.appendChild(optionText);
     subCategoryHandle.appendChild(option);
    });
     //subCategoryHandle.innerHTML = output;
    }
    request.send();
    subCategoryDisplayHandle.style.display = "block";
  }
};
if((categoryId === undefined) || (categoryId === "")){
  subCategoryDisplayHandle.style.display = "none";
};
/*
var subCategoryDisplayHandle = document.getElementById('subCategoryId'); // for the whole div
var categoryHandle = document.getElementById('product_category_id');
var subCategoryHandle = document.getElementById('product_subcategory_id'); // for the drop down
var categoryId;

categoryHandle.onload = function(){
  categoryId = categoryHandle.options[categoryHandle.selectedIndex].value;
  if(categoryId == ""){
    subCategoryDisplayHandle.style.display = "none";

  }else{
      subCategoryDisplayHandle.style.display = "none";
  }
};*/