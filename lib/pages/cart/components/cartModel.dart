import 'package:flutter/material.dart';
import 'productmodel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartModel extends ChangeNotifier{

  //LISTS
  final List<Product> _cartItems = [

  ];

  final List<Product> _wishList = [];

  final List<Product> _accessoryItems = [
    Product(pictureUrl: 'icons/smartwatch.jpg',name:  'Smart Watch', price:  '300', color:  'Black', quantity: 1,),
    Product(pictureUrl: 'icons/headphones.jpg',name:  'Headphones', price:  '20',color: 'Yellow',quantity: 1,),
    Product(pictureUrl: 'icons/mouse.jpg', name: 'Mouse', price: '5', color: 'Black',quantity: 1,),
    Product(pictureUrl: 'icons/fitband.jpg', name: 'Fit Band', price: '200', color: 'Black',quantity: 1,),
    Product(pictureUrl: 'icons/product_popsocket.jpg', name: 'Socket', price: '300',color:  'white',quantity: 1,),
    Product(pictureUrl: 'icons/smartwatch.jpg',name:  'Smart Watch', price:  '300', color:  'Black', quantity: 1,),
    Product(pictureUrl: 'icons/headphones.jpg',name:  'Headphones', price:  '20',color: 'Yellow',quantity: 1,),
    Product(pictureUrl: 'icons/mouse.jpg', name: 'Mouse', price: '5', color: 'Black',quantity: 1,),
    Product(pictureUrl: 'icons/fitband.jpg', name: 'Fit Band', price: '200', color: 'Black',quantity: 1,),
    Product(pictureUrl: 'icons/product_popsocket.jpg', name: 'Socket', price: '300',color:  'white',quantity: 1,),
    Product(pictureUrl: 'icons/smartwatch.jpg',name:  'Smart Watch', price:  '300', color:  'Black', quantity: 1,),
    Product(pictureUrl: 'icons/headphones.jpg',name:  'Headphones', price:  '20',color: 'Yellow',quantity: 1,),
    Product(pictureUrl: 'icons/mouse.jpg', name: 'Mouse', price: '5', color: 'Black',quantity: 1,),
    Product(pictureUrl: 'icons/fitband.jpg', name: 'Fit Band', price: '200', color: 'Black',quantity: 1,),
    Product(pictureUrl: 'icons/product_popsocket.jpg', name: 'Socket', price: '300',color:  'white',quantity: 1,),
  ];

  final List<Product> _consoleItems = [
    Product( pictureUrl: 'icons/xbox1.jpg', color: 'White', name: 'Xbox One', price: '300',),
    Product(pictureUrl: 'icons/switch.jpg', color: 'Red and Blue', name: 'Nintendo', price: '150',),
    Product( pictureUrl: 'icons/ps4.jpg', color: 'Black', name: 'PS4', price: '250',),
    Product(pictureUrl: 'icons/xbox360.jpg', color: 'Black', name: 'Xbox 360', price: '250',),
    Product( pictureUrl: 'icons/xbox1.jpg', color: 'White', name: 'Xbox One', price: '300',),
    Product(pictureUrl: 'icons/switch.jpg', color: 'Red and Blue', name: 'Nintendo', price: '150',),
    Product( pictureUrl: 'icons/ps4.jpg', color: 'Black', name: 'PS4', price: '250',),
    Product(pictureUrl: 'icons/xbox360.jpg', color: 'Black', name: 'Xbox 360', price: '250',),
    Product( pictureUrl: 'icons/xbox1.jpg', color: 'White', name: 'Xbox One', price: '300',),
    Product(pictureUrl: 'icons/switch.jpg', color: 'Red and Blue', name: 'Nintendo', price: '150',),
    Product( pictureUrl: 'icons/ps4.jpg', color: 'Black', name: 'PS4', price: '250',),
    Product(pictureUrl: 'icons/xbox360.jpg', color: 'Black', name: 'Xbox 360', price: '250',),
    Product( pictureUrl: 'icons/xbox1.jpg', color: 'White', name: 'Xbox One', price: '300',),
    Product(pictureUrl: 'icons/switch.jpg', color: 'Red and Blue', name: 'Nintendo', price: '150',),
    Product( pictureUrl: 'icons/ps4.jpg', color: 'Black', name: 'PS4', price: '250',),
    Product(pictureUrl: 'icons/xbox360.jpg', color: 'Black', name: 'Xbox 360', price: '250',),
  ];

  final List<Product> _deskItems = [
    Product(pictureUrl: 'icons/laptopdesk.jpg',color: 'Brown',name: 'Laptop Desk',price: '400',),
    Product(pictureUrl: 'icons/officedesk.jpg', price: '200', name: 'Office Desk', color: 'Teal',),
    Product(pictureUrl: 'icons/standingdesk.png', color: 'Brown', name: 'Standing Desk', price: '500',),
    Product(pictureUrl: 'icons/laptopdesk.jpg',color: 'Brown',name: 'Laptop Desk',price: '400',),
    Product(pictureUrl: 'icons/officedesk.jpg', price: '200', name: 'Office Desk', color: 'Teal',),
    Product(pictureUrl: 'icons/standingdesk.png', color: 'Brown', name: 'Standing Desk', price: '500',),
    Product(pictureUrl: 'icons/laptopdesk.jpg',color: 'Brown',name: 'Laptop Desk',price: '400',),
    Product(pictureUrl: 'icons/officedesk.jpg', price: '200', name: 'Office Desk', color: 'Teal',),
    Product(pictureUrl: 'icons/standingdesk.png', color: 'Brown', name: 'Standing Desk', price: '500',),
    Product(pictureUrl: 'icons/officedesk.jpg', price: '200', name: 'Office Desk', color: 'Teal',),
    Product(pictureUrl: 'icons/standingdesk.png', color: 'Brown', name: 'Standing Desk', price: '500',),
    Product(pictureUrl: 'icons/officedesk.jpg', price: '200', name: 'Office Desk', color: 'Teal',),
    Product(pictureUrl: 'icons/standingdesk.png', color: 'Brown', name: 'Standing Desk', price: '500',),
  ];

  final List<Product> _laptopItems = [
    Product( pictureUrl: 'icons/macbook.jpg',color: 'Silver', name: 'Mac', price: '1800',),
    Product(pictureUrl: 'icons/acer.jpg', name: 'Acer', price: '500', color: 'White',),
    Product(pictureUrl: 'icons/hp.jpg', name: 'HP',color: 'Grey', price: '600',),
    Product(pictureUrl: 'icons/dell.jpg', name: 'Dell', color: 'Black', price: '900',),
    Product( pictureUrl: 'icons/macbook.jpg',color: 'Silver', name: 'Mac', price: '1800',),
    Product(pictureUrl: 'icons/acer.jpg', name: 'Acer', price: '500', color: 'White',),
    Product(pictureUrl: 'icons/hp.jpg', name: 'HP',color: 'Grey', price: '600',),
    Product(pictureUrl: 'icons/dell.jpg', name: 'Dell', color: 'Black', price: '900',),
    Product( pictureUrl: 'icons/macbook.jpg',color: 'Silver', name: 'Mac', price: '1800',),
    Product(pictureUrl: 'icons/acer.jpg', name: 'Acer', price: '500', color: 'White',),
    Product(pictureUrl: 'icons/hp.jpg', name: 'HP',color: 'Grey', price: '600',),
    Product(pictureUrl: 'icons/dell.jpg', name: 'Dell', color: 'Black', price: '900',),
  ];

  final List<Product> _monitorItems = [
    Product(pictureUrl: 'icons/gamingmonitor.jpg', color: 'Black', name: 'Gaming Monitor', price: '700',),
    Product(pictureUrl: 'icons/samsungmonitor.jpg', color: 'Black', name: 'Samsung Monitor', price: '300',),
    Product(pictureUrl: 'icons/studiodisplay.jpg', color: 'Silver', name: 'Studio Display', price: '3000',),
    Product(pictureUrl: 'icons/sonymonitor.jpg', color: 'Grey', name: 'Sony Monitor', price: '200',),
    Product(pictureUrl: 'icons/gamingmonitor.jpg', color: 'Black', name: 'Gaming Monitor', price: '700',),
    Product(pictureUrl: 'icons/samsungmonitor.jpg', color: 'Black', name: 'Samsung Monitor', price: '300',),
    Product(pictureUrl: 'icons/studiodisplay.jpg', color: 'Silver', name: 'Studio Display', price: '3000',),
    Product(pictureUrl: 'icons/sonymonitor.jpg', color: 'Grey', name: 'Sony Monitor', price: '200',),
    Product(pictureUrl: 'icons/gamingmonitor.jpg', color: 'Black', name: 'Gaming Monitor', price: '700',),
    Product(pictureUrl: 'icons/samsungmonitor.jpg', color: 'Black', name: 'Samsung Monitor', price: '300',),
    Product(pictureUrl: 'icons/studiodisplay.jpg', color: 'Silver', name: 'Studio Display', price: '3000',),
    Product(pictureUrl: 'icons/sonymonitor.jpg', color: 'Grey', name: 'Sony Monitor', price: '200',),
    Product(pictureUrl: 'icons/gamingmonitor.jpg', color: 'Black', name: 'Gaming Monitor', price: '700',),
    Product(pictureUrl: 'icons/samsungmonitor.jpg', color: 'Black', name: 'Samsung Monitor', price: '300',),
    Product(pictureUrl: 'icons/studiodisplay.jpg', color: 'Silver', name: 'Studio Display', price: '3000',),
    Product(pictureUrl: 'icons/sonymonitor.jpg', color: 'Grey', name: 'Sony Monitor', price: '200',),
  ];

  final List<Product> _phoneItems = [
    Product(pictureUrl:'icons/iphone.jpg' , name: 'iPhone', color: 'Blue', price: '1200',),
    Product(pictureUrl: 'icons/samsung.jpg', name: 'Samsung', color: 'Green', price: '1400',),
    Product(pictureUrl: 'icons/pixel.jpg', name: 'Pixel', color: 'Graphite', price: '400',),
    Product(pictureUrl: 'icons/redmi.jpg', name: 'Redmi', color: 'Blue', price: '200',),
    Product(pictureUrl:'icons/iphone.jpg' , name: 'iPhone', color: 'Blue', price: '1200',),
    Product(pictureUrl: 'icons/samsung.jpg', name: 'Samsung', color: 'Green', price: '1400',),
    Product(pictureUrl: 'icons/pixel.jpg', name: 'Pixel', color: 'Graphite', price: '400',),
    Product(pictureUrl: 'icons/redmi.jpg', name: 'Redmi', color: 'Blue', price: '200',),
    Product(pictureUrl:'icons/iphone.jpg' , name: 'iPhone', color: 'Blue', price: '1200',),
    Product(pictureUrl: 'icons/samsung.jpg', name: 'Samsung', color: 'Green', price: '1400',),
    Product(pictureUrl: 'icons/pixel.jpg', name: 'Pixel', color: 'Graphite', price: '400',),
    Product(pictureUrl: 'icons/redmi.jpg', name: 'Redmi', color: 'Blue', price: '200',),
    Product(pictureUrl:'icons/iphone.jpg' , name: 'iPhone', color: 'Blue', price: '1200',),
    Product(pictureUrl: 'icons/samsung.jpg', name: 'Samsung', color: 'Green', price: '1400',),
    Product(pictureUrl: 'icons/pixel.jpg', name: 'Pixel', color: 'Graphite', price: '400',),
    Product(pictureUrl: 'icons/redmi.jpg', name: 'Redmi', color: 'Blue', price: '200',),
    Product(pictureUrl:'icons/iphone.jpg' , name: 'iPhone', color: 'Blue', price: '1200',),
    Product(pictureUrl: 'icons/samsung.jpg', name: 'Samsung', color: 'Green', price: '1400',),
    Product(pictureUrl: 'icons/pixel.jpg', name: 'Pixel', color: 'Graphite', price: '400',),
    Product(pictureUrl: 'icons/redmi.jpg', name: 'Redmi', color: 'Blue', price: '200',),
  ];


  //GETTERS
  List<Product> get cartItems => _cartItems;

  List<Product> get wishList => _wishList;

  List<Product> get accessoryItems => _accessoryItems;

  List<Product> get consoleItems => _consoleItems;

  List<Product> get deskItems => _deskItems;

  List<Product> get laptopItems => _laptopItems;

  List<Product> get monitorItems => _monitorItems;

  List<Product> get phoneItems => _phoneItems;



  //FUNCTIONS
  //add items to cart functions
  void addAccessoryItemToCart(int index){
    _cartItems.add(accessoryItems[index]);
    Fluttertoast.showToast(
      msg: 'added to cart',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(0xFF765F65),
      textColor: Colors.white,
      fontSize: 16.0,
    );
    notifyListeners();
  }

  void addConsoleItemToCart(int index){
    _cartItems.add(consoleItems[index]);
    Fluttertoast.showToast(
      msg: 'added to cart',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(0xFF765F65),
      textColor: Colors.white,
      fontSize: 16.0,
    );
    notifyListeners();
  }

  void addDeskItemToCart(int index){
    _cartItems.add(deskItems[index]);
    Fluttertoast.showToast(
      msg: 'added to cart',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(0xFF765F65),
      textColor: Colors.white,
      fontSize: 16.0,
    );
    notifyListeners();
  }

  void addLaptopItemToCart(int index){
    _cartItems.add(laptopItems[index]);
    Fluttertoast.showToast(
      msg: 'added to cart',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(0xFF765F65),
      textColor: Colors.white,
      fontSize: 16.0,
    );
    notifyListeners();
  }

  void addMonitorItemToCart(int index){
    _cartItems.add(monitorItems[index]);
    Fluttertoast.showToast(
      msg: 'added to cart',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(0xFF765F65),
      textColor: Colors.white,
      fontSize: 16.0,
    );
    notifyListeners();
  }

  void addPhoneItemToCart(int index){
    _cartItems.add(phoneItems[index]);
    Fluttertoast.showToast(
      msg: 'added to cart',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(0xFF765F65),
      textColor: Colors.white,
      fontSize: 16.0,
    );
    notifyListeners();
  }

  //wishlist functions
  addAccessoryItemToWishlist(int index){
    _wishList.add(accessoryItems[index]);
    Fluttertoast.showToast(
      msg: 'added to wishlist',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(0xFF765F65),
      textColor: Colors.white,
      fontSize: 16.0,
    );
    notifyListeners();
  }

  addConsoleItemToWishlist(int index){
    _wishList.add(consoleItems[index]);
    Fluttertoast.showToast(
      msg: 'added to wishlist',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(0xFF765F65),
      textColor: Colors.white,
      fontSize: 16.0,
    );
    notifyListeners();
  }

  addDeskItemToWishlist(int index){
    _wishList.add(deskItems[index]);
    Fluttertoast.showToast(
      msg: 'added to wishlist',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(0xFF765F65),
      textColor: Colors.white,
      fontSize: 16.0,
    );
    notifyListeners();
  }

  addLaptopItemToWishlist(int index){
    _wishList.add(laptopItems[index]);
    Fluttertoast.showToast(
      msg: 'added to wishlist',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(0xFF765F65),
      textColor: Colors.white,
      fontSize: 16.0,
    );
    notifyListeners();
  }

  void addMonitorItemToWishlist(int index){
    _wishList.add(monitorItems[index]);
    Fluttertoast.showToast(
      msg: 'added to wishlist',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(0xFF765F65),
      textColor: Colors.white,
      fontSize: 16.0,
    );
    notifyListeners();
  }

  addPhoneItemToWishlist(int index){
    _wishList.add(phoneItems[index]);
    Fluttertoast.showToast(
      msg: 'added to wishlist',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(0xFF765F65),
      textColor: Colors.white,
      fontSize: 16.0,
    );
    notifyListeners();
  }


  //remove items from cart
  void removeItemFromCart(int index,){
    // _cartItems.remove([index]);
    // notifyListeners();
    if (index >= 0 && index < _cartItems.length) {
      _cartItems.removeAt(index); // Use removeAt to remove an item by index
      Fluttertoast.showToast(
        msg: 'removed from cart',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color(0xFF765F65),
        textColor: Colors.white,
        fontSize: 16.0,
      );
      notifyListeners();
    }
  }


  void removeItemFromWishlist(int index,){
    // _cartItems.remove([index]);
    // notifyListeners();
    if (index >= 0 && index < _cartItems.length) {
      _wishList.removeAt(index); // Use removeAt to remove an item by index
      Fluttertoast.showToast(
        msg: 'removed from wishlist',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color(0xFF765F65),
        textColor: Colors.white,
        fontSize: 16.0,
      );
      notifyListeners();
    }
  }

  //calculate total price
  String calculateTotal(){
    double totalPrice = 0;
    for(int i = 0; i < _cartItems.length; i++){
      if (_cartItems[i].price != null) {
        // totalPrice += double.tryParse(_cartItems[i].price! ) ?? 0.0;
        double itemPrice = double.tryParse(_cartItems[i].price!) ?? 0.0;
        int itemQuantity = _cartItems[i].quantity ?? 0;
        totalPrice += itemPrice * itemQuantity;
      }
    }
    return totalPrice.toStringAsFixed(2);
  }


}