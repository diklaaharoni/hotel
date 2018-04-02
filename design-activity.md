1. What classes does each implementation include? Are the lists the same?
  answer: Each implementation include three classes: CartEntry, ShoppingCart, Order.
  in implementation A the total price is calculated only in order class and in implementation B the total price is calculated for each class in separate

2. Write down a sentence to describe each class.
  answer:
  Implementation A:
  class CartEntry: Store the unit price and quantity
  class ShoppingCart: Store an array of entries
  class  Order: Store an instant of ShoppingCart and calculate order (price * quantity) after adding Tax
  Implementation B:
  class CartEntry: Store the unit price and quantity and calculate (price * quantity)
  class ShoppingCart: Store an array of entries and calculate prices for all the entries
  class  Order: Adding Tax for what was already calculate in ShoppingCart class

3. How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or   piece of paper.
answer: class CartEntry store the unit price and quantity, class ShoppingCart store array of entries and class Order store ShoppingCart object and add Tax

4. What data does each class store? How (if at all) does this differ between the two implementations?
answer:
Implementation A:
class CartEntry: Store the unit price and quantity
class ShoppingCart: Store an array of entries
class  Order: Store an instant of ShoppingCart and calculate order (price * quantity) after adding Tax
Implementation B:
class CartEntry: Store the unit price and quantity and calculate (price * quantity)
class ShoppingCart: Store an array of entries and calculate prices for all the entries
class  Order: Adding Tax for what was already calculate in ShoppingCart class

5. What methods does each class have? How (if at all) does this differ between the two implementations?
  answer:
  Implementation A:
  class CartEntry: initialize
  class ShoppingCart: initialize
  class  Order: initialize, total_price
  Implementation B:
  class CartEntry: initialize, price
  class ShoppingCart: initialize, price
  class  Order: initialize, total_price

6. Consider the Order#total_price method. In each implementation:
  - Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order?
  - Does total_price directly manipulate the instance variables of other classes?

7. If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?
  answer: We will need to use an if statement and it will be easier to modify implementation A

8. Which implementation better adheres to the single responsibility principle?
  answer: Implementation B is better

9. Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled?
