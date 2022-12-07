class Disease {
  String diseaseName;
  String diseasePhoto;
  String description;
  String symptomps;
  String precaution;
  List<String> attacked;
  Disease(this.diseaseName, this.diseasePhoto, this.description, this.symptomps,
      this.precaution, this.attacked);

  static List<Disease> generateDiseases() {
    return [
      Disease(
          'Early Blight',
          'img/plant80.jpeg',
          'Early blight is a fungal disease caused by Alternaria solani. It mostly occurs any time during the growing season.',
          'Gray to brown spots appear on leaves and gradually grow in a concentric manner around a clear center. The lesions are surrounded by a bright yellow halo. As the disease progresses, entire leaves may turn chlorotic and shed, leading to significant defoliation.  When leaves die and fall, fruits become more vulnerable to sun scald.  The same type of spots with a clear center appears on stems and fruits.',
          'Gapping is done to replace ungerminated seeds immediately after germination is complete while thinning is done when maize has grown to height of about 15 cm by removing the weak and deformed seedlings to leave the desired number of seedlings per hole.',
          [
            'Potato',
            'Tomato',
            'Capsicum',
          ]),
      Disease(
          'Leaf Mold',
          'img/plant83.png',
          'Leaf mold is caused by the fungus Passalora fulva (previously called Fulvia fulva or Cladosporium fulvum). It is not known to be pathogenic on any plant other than tomato. There are many races of P. fulva.',
          'The oldest leaves are infected first. Pale greenish-yellow spots, usually less than 1/4 inch, with no definite margins, form on the upper sides of leaves. Olive-green to brown velvety mold forms on the lower leaf surface below leaf spots. Leaf spots grow together and turn brown. Leaves wither and die but often remain attached to the plant. Infected blossoms turn black and fall off.',
          'Gapping is done to replace ungerminated seeds immediately after germination is complete while thinning is done when maize has grown to height of about 15 cm by removing the weak and deformed seedlings to leave the desired number of seedlings per hole.',
          [
            'Potato',
            'Tomato',
            'Eggplant',
          ]),
      Disease(
          'Black Rot',
          'img/plant84.jpg',
          'Black rot is a disease caused by the fungus, Botryosphaeria obtusa, which can attack the fruit, leaves, and bark of any tree in the pomaceous family.',
          'The first signs of black rot are small, purple spots appearing on the upper surfaces of leaves and enlarging into circles 1/8 to 1/4 inch in diameter.  Infected leaves develop frog-eye leaf spot. The se are circular spots with purplish or reddish edges and light tan interiors. Infected areas of branches and limbs are reddish brown and are sunken slightly below the level of surrounding healthy bark.',
          'Gapping is done to replace ungerminated seeds immediately after germination is complete while thinning is done when maize has grown to height of about 15 cm by removing the weak and deformed seedlings to leave the desired number of seedlings per hole.',
          [
            'Apple',
            'Pear',
            'Quince',
          ]),
      Disease(
          'Late Blight',
          'img/lateb.jpg',
          'Late blight is caused by the fungus Phytophthora infestans and mostly occurs later in the growing season with symptoms often not appearing until after blossom.',
          'Dark brown spots develop on the leaves starting at the tip or the leaf margins. In humid climates, these spots become water-soaked lesions. A white fungal covering can be seen on the underside of the leaves. As the disease progresses, entire leaves become necrotic, turn brown and die off. Similar lesions develop on stems and petioles. The potato tubers have greyish-blue spots on their skin and their flesh also turns brown, making them inedible. The rotting of the infested fields emits a distinctive odor.',
          'Gapping is done to replace ungerminated seeds immediately after germination is complete while thinning is done when maize has grown to height of about 15 cm by removing the weak and deformed seedlings to leave the desired number of seedlings per hole.',
          [
            'Potato',
            'Tomato',
            'Eggplant',
          ]),
    ];
  }
}
