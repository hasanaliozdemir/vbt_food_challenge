// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:vbt_food_challange/features/homePage/model/foodModel.dart';

List<FoodModel> foodDataList = [
  FoodModel(
    id: 0,
    name: "Beyti",
    category: "Ana yemek",
    imageUrls: [
      "https://galeri13.uludagsozluk.com/624/sarma-beyti_1776232.jpg"
    ],
    recipe:
        """Köfte malzemeleri bir kaba alın, bütün malzemeleri yoğurun ve dolapta dinlendirin.
Dinlenen köfteleri resimde görüldüğü gibi şekil verip (köfteler biraz kalın olsun) yağlı kağıt serilmiş fırın tepsisine yerleştirin ve 10 dakika kadar biraz pişirin.
Köfteler pişerken tereyağı sos tenceresine koyup kızdırın
İçine salçaları ilave edip kavurun.
Suyu ekleyerek akıcı kıvamda olmasını sağlayın.
Yufkaları ya da lavaşı tezgaha serin.
Ortadan ikiye kesin, üzerine tereyağını fırça yardımı ile sürün.
Geniş kısmına köfteleri yerleştirin.
Sıkıca sarın.
Sardığınız dürümü verev şeklinde 3 parmak eninde kesin.
Tekrar tepsiye yerleştirip üzerleri kızarana kadar pişirin.
Daha sonra servis tabağına dizin. Üzerine salçalı sosu gezdirin. Afiyet bereketli olsun :)""",
    rating: "9.3",
    contestRef: "adamm",
    userRef: "adam2",
    commentList: [CommentModel(point: 6, user_uid: "ssss")],
    materials: [MaterialModel(name: "kıyma", amount: "2 kg")],
  )
];
