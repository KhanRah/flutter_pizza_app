class pizza
{
  Map<String,bool> toppings = new Map<String,bool>();
  pizza()
  {
    toppings.putIfAbsent('Pepproni', ()=>false);
    toppings.putIfAbsent('Cheese', ()=>false);
    toppings.putIfAbsent('Chicken Sausage', ()=>false);
    toppings.putIfAbsent('Pineapple', ()=>false);
    toppings.putIfAbsent('Onions', ()=>false);
    toppings.putIfAbsent('Garlic', ()=>false);
    toppings.putIfAbsent('Olives', ()=>false);
    toppings.putIfAbsent('Banana', ()=>false);
    toppings.putIfAbsent('Mushrooms', ()=>false);
  }
}