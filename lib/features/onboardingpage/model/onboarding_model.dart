class OnBoardModel {
  String title;
  String description;
  String image;
  OnBoardModel({
    required this.title,
    required this.description,
    required this.image,
  });
}

List<OnBoardModel> models = [
  OnBoardModel(
      title: 'YEMEK YARISMALARI',
      description:
          'Yaptiginiz yemek görselleri ve tariflerinizi paylasarak yarismalara katilabilir ve rozetler kazanabilirsiniz. Ayrica ödüllü yarismalara katilarak birbirinden güzel hediyeler kazanabilirsiniz.',
      image: 'assets/images/onboarding1.svg'),
  OnBoardModel(
      title: 'BUGUN NE PISIRSEM ?',
      description:
          'Yediginiz yemeklerden yaptigimiz cikarimlarla bugun ne pisirsem secenegiyle sevebileceginiz ve belki de hic denemediginiz yemekleri deneyeceksiniz.',
      image: 'assets/images/onboarding2.svg'),
  OnBoardModel(
      title: 'ELIMDEKILERLE NELER YAPABILIRIM ?',
      description:
          'İstediginiz ürünüleri yazin ve onlarla hangi yemekleri yapabildiginizi görün. ',
      image: 'assets/images/onboarding3.svg')
];
