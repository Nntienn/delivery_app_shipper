import 'package:flutter/material.dart';

class Product {
  final String image, title, description, rate;
  final int price, size, id;
  final Color color;
  final List<String> images;
  Product({
    @required this.images,
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
    this.rate,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "CLAYMATION",
      price: 23,
      size: 2,
      description: "This high caliber styling product will always work with you, never against you. Incredible “Clay-Wax” hybrid made with a touch of QUICKSAND. CLAYMATION contains all natural ingredients, which means it’s actually good for your hair while providing powerful, “all-day” nourishment from roots to ends. ",
      image: "assets/images/wax_1.png",
      images: [
        "assets/images/wax_1.png",
      ],
      color: Color(0xFF3D82AE),
      rate: "4.5"),
  Product(
      id: 2,
      title: "QUICKSAND",
      price: 23,
      size: 2,
      description: "This high-hold product is one part styling wax and one part dry shampoo. The gritty formula contains diatomaceous earth, a soft granular rock similar to pumice that sucks up excess oil on the hair and scalp. ",
      image: "assets/images/wax_2.png",
      images: [
        "assets/images/wax_2.png",
      ],
      color: Color(0xFFD3A984),
      rate: "4.8"
  ),
  Product(
      id: 3,
      title: "GOLD DIGGER",
      price: 22,
      size: 3,
      description: "There will be limitless possibilities in front of you due to the fantastic product behind you. The By Vilain Gold Digger offers incredible hold and a matte finish thanks to our unique and protected formula. The qualities of our product allow us to make what we believe is one of the best waxes ever made. The Gold Digger is made with By Vilain’s own perfume formula and it has become the signature scent of our products ever since.",
      image: "assets/images/wax_3.png",
      images: [
        "assets/images/wax_3.png",
      ],
      color: Color(0xFF989493),
      rate: "4.3"
  ),
  Product(
      id: 4,
      title: "DYNAMITE CLAY",
      price: 22,
      size: 3,
      description: "The Dynamite Clay is one of the most powerful and exclusive products in the By Vilain range. Its high-end design, innovative formula and dynamic texture make it a unique masterpiece that will push your imagination of what’s possible with a wax beyond boundaries. Dynamite Clay provides the messy look that makes even the nicest gentleman look like a bad boy.",
      image: "assets/images/wax_4.png",
      images: [
        "assets/images/wax_4.png",
      ],
      color: Color(0xFFE6B398),
      rate: "4.5"
  ),
  Product(
      id: 5,
      title: "Night Rider",
      price: 31,
      size: 4,
      description: "Buckle-up for a tough ride with NIGHT.RIDER, the strongest of our hardworking moulding pastes. Designed to deliver rough, matte texture to enhance short or choppy looks, our state-of-the-art paste helps seal in moisture to prevent hair breakage, and helps hair appear healthier and full of shine.",
      image: "assets/images/wax_5.png",
      images: [
        "assets/images/wax_5.png",
      ],
      color: Color(0xFFFB7883),
      rate: "4.6"
  ),
  Product(
    id: 6,
    title: "Volcanic",
    price: 18,
    size: 2,
    description: dummyText,
    image: "assets/images/wax_6.png",
      images: [
        "assets/images/wax_6.png",
      ],
    color: Color(0xFFAEAEAE),
      rate: "4.6"
  ),
  Product(
      id: 7,
      title: "CLAYMATION",
      price: 23,
      size: 2,
      description: "This high caliber styling product will always work with you, never against you. Incredible “Clay-Wax” hybrid made with a touch of QUICKSAND. CLAYMATION contains all natural ingredients, which means it’s actually good for your hair while providing powerful, “all-day” nourishment from roots to ends. ",
      image: "assets/images/wax_1.png",
      images: [
        "assets/images/wax_1.png",
      ],
      color: Color(0xFF3D82AE),
      rate: "4.5"),
  Product(
      id: 8,
      title: "CLAYMATION",
      price: 23,
      size: 2,
      description: "This high caliber styling product will always work with you, never against you. Incredible “Clay-Wax” hybrid made with a touch of QUICKSAND. CLAYMATION contains all natural ingredients, which means it’s actually good for your hair while providing powerful, “all-day” nourishment from roots to ends. ",
      image: "assets/images/wax_1.png",
      images: [
        "assets/images/wax_1.png",
      ],
      color: Color(0xFF3D82AE),
      rate: "4.5"),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
