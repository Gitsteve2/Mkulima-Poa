class Plant {
  String plantName;
  String plantPhoto;
  String plantTemp;
  String plantSoil;
  String condition;
  List<String> req;
  Plant(this.plantName, this.plantPhoto, this.plantTemp, this.plantSoil,
      this.condition, this.req);

  static List<Plant> generatePlants() {
    return [
      Plant('Maize', 'img/maize.png', '15-30 deg', 'Loam Soil', 'rainy', [
        'The crop can flourish in regions with different rainfall ranges. For instance, a high rainfall of 1200- 2500mm, at times 600-1150mm and can also adapt to regions receiving rainfall total of 400mm. Rainfall requirements vary with different varieties but should be evenly distributed during the growing period, especially during the first five weeks after planting and at flowering stage.',
        'Maize crop prefers a well-drained light loam or alluvial soil with a pH of between 5.5-7.0. However, it also tolerates a wide range of soils found in most parts of Kenya but it is not tolerant to waterlogged soils.',
        'Warm temperatures of between 15-30 0C are fit for the growth and development of this crop. Cold conditions extend the maturity period.',
        'The crop grows in a wide range of zones with altitude ranging from 100-2900M ASL. This however depends on the maize variety.',
        'It should be done early to allow for weeds to dry and decompose before planting. First plough is best done after harvesting the previous crop. Procedure',
      ]),
      Plant('Tomato', 'img/tomato.png', '18-27 deg', 'Volcanic Soil', 'warm', [
        'Tomatoes are warm-season crops and sensitive to frost at any stage of growth. If subject to temperatures below 10˚C, crops suffer from delayed seed germination and slow early growth.',
        'Cold will also reduce fruit set and delay maturity. Similarly, temperature extremes of over 35˚C will reduce fruit set and restrict red coloration. If water stress and high temperatures occur together the plant will produce soft fruit.',
        'The optimum temperature range for tomatoes is between 18 and 27˚C. Above 27˚C, flower formation is adversely affected. For this reason, most outdoor crops are grown in temperate climates, between the 30th and 40th parallels in both the northern and southern hemisphere. However, with the introduction of modern varieties, tomatoes are increasingly grown in higher temperature, tropical conditions. Optimum relative humidities in glasshouse crops range from 60 - 80%. Under hydroponics, 75% and 85% respectively are typical night and daytime relative humidities. ',
        'Maturity dates range from around 60 - 70 days for determinate varieties grown in more northerly latitudes to more than 95 days where a longer, single season harvest period is used.',
      ]),
      Plant('Grapes', 'img/grapes.png', '15-30 deg', 'Loam Soil', 'sunny', [
        'Grapes thrive and produce well under full sunlight. Since Kenya is placed in the equatorial region, grape farming in Kenya is a success due to sufficient year-round sunlight in most parts of the country. However, it would help establish your vineyard where the plants can receive ample sunlight, majorly in the morning hours.',
        'Vegetative propagation is the best choice for reproducing grapes. The seed propagation does not portray the mother plants actual characteristics, and it is also time-consuming since you will need to wait for over three years to obtain seeds for propagation.',
        'The climatic condition within your locality will determine the variety you need to go for. Keep in mind that the different types bear fruits of various sizes, colors, textures, and flavors. Some of the varieties are suited for wines, juices, and jellies, whereas others are sweet and are best for the table.'
      ]),
      Plant('Apple', 'img/apple.png', '10-18 deg', 'Drained Soils', 'frost', [
        'Apples thrives well in the highland areas surrounding Mount Kenya with the Wambugu apple being the preferred and most adopted variety.',
        'Fertile and well drained soils are necessary to obtain a good crop of an apple plant. It is also important to feed your apple plant as it grows.  Apples tolerate pH range of 6.0-7.0 but prefer a pH range of 6.5-6.8.',
        'Areas with average temperature range of 10-18 Degrees Celsius are good for apple.',
      ]),
    ];
  }
}
