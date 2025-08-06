import '../../../../generated/Assets.dart';

class BottomNavigationBarEntity {
  final String activeImage, inactiveImage;
  final String name;

  BottomNavigationBarEntity(
      {required this.activeImage,
      required this.inactiveImage,
      required this.name});}
  List<BottomNavigationBarEntity>get bottomNavigationBarItems => [
    BottomNavigationBarEntity(

      activeImage: Assets.boldHome,
      inactiveImage: Assets.outlineHome,
      name: 'الرئيسية',
    ),
    BottomNavigationBarEntity(
      activeImage: Assets.boldProducts,
      inactiveImage: Assets.outlineProducts,
      name: 'المنتجات',
    ),
    BottomNavigationBarEntity(
      activeImage: Assets.boldShoppingCart,
      inactiveImage: Assets.outlineShoppingCart,

      name: 'سله التسوق',
    ),
    BottomNavigationBarEntity(

      activeImage: Assets.boldUser,
      inactiveImage: Assets.outlineUser,
      name: 'حسابي',
    ),

  ];

