## Rails Shoppe

### Overview
This is a multi-day, agile development challenge that was built using Rails. We worked in frequent, small iterations.

### Requirements
- Use HAML to construct views and SCSS or SASS for stylesheets.
- Challenge is limited to basic Javascript and jQuery only.  No JS Frameworks.

### Iteration 1
- User can view all products
- User can add products to shopping cart
- User can have multiple products in shopping cart
- User can view the shopping cart at any time
- User can checkout shopping cart
- Shop owner can add products
- Shop owner can view products
- Shop owner can edit/delete products

### MVP
- Schema
- Wireframe
- RSpec for controllers, models and views
- HAML and SASS
- Create rails app with all of the above
- Deploy to Heroku with every feature

### Schema
![Rails Shop Schema](doc/rails-shop-schema.png)

### Wireframe
![Rails Shop Wireframe](doc/rails-shop-proper.png)

### Iteration 2
- Quantity and price ($99.95)
- Add `/admin` for administration 
- Use `http_basic_authenticate_with_name` (admin, secret)
- Create tabular inventory view
- Hide admin features (edit, delete, etc)
- Add style (SASS, Bootstrap)
- Add flash error (green and red)

### Iteration 3
- Add users and login with secure passwords
- Add products and categories many to many associations
- Show categories in products show page
- Replace HTTP authentication with session authentication
- Update tests for categories and authentication
- Add ActionMailer to send email when a new user signs up
- Add a user named "Tom" and an admin named "Tim"

### Iteration 4
- Each product should have an ‘Add to cart’ button which will load a view through AJAX that shows the shopping cart for that user
- Users can add a certain quantity of products to the cart, as long as the quantity in stock is not exceeded. Users can remove items from the cart
- Calculate the total price of items in the cart and have that update with JavaScript when items are added or removed
- When the user clicks checkout, the number of items in stock should be reduced by the amount that was purchased.
- When a user clicks checkout, they should receive an email detailing the purchase.
- Upon checkout, redirect the user to a thank you page that indicates what they purchased and how much they spent
- Any items which are out of stock should be indicated as such on the product page and have their ‘Add to cart’ button greyed out.
- Maintain an order history for each user and have an “order history” page which shows previous orders, including the date and time the order occurred
- Add tests to ensure the behavior above e.g., when an item is out of stock, the ‘Add to cart’ button is disabled.
- Add feature tests for the shopping cart itself and tests for any new models created

### Iteration 5
- Include a button on the order history view to generate a PDF of all order history. The PDF should be viewable via link or emailed to the customer as an attachment.
