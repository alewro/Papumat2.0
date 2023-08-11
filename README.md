# Papumat 2.0

## About app

Papumat 2.0 is an app for managing recipes, creating meal plans and shopping list.

### Add your recipes
Add ***name***, ***description***, ***recipe category*** and ***products*** that are needed to make that recipe.
### Create MealPlan
Select ***start date*** and ***end date*** then choose ***recipes*** from the list. If number of recipes is not equal to numbers of selected days you will have to confirm your MealPlan before save.
### Shopping List
***Shopping list*** is automaticly created, based on products in recipes, after MealPlan is saved.\
You can also add your custom products to shopping list.

## Start
Clone repo with `gh repo clone alewro/Papumat2.0`\
Enter folder with `cd Papumat2.0`\
Migrate data base with `rails db:migrate`\
Create default product and recipe categories by enter `rails db:seed`

## Customize
You can add your recipe and product categories in rails console or you can also edit seed.rb file. However when you add or change default product categories you must add new file custom_category_name.png in app/assets/images to prevent error.