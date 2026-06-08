let sampleTastings: [Tasting] = [
    Tasting(id: "101", year: 2018, date: "12 апр 2024", status: .tasted,
            character: WineCharacteristics(acidity: 4, dryness: 4, richness: 3, density: 5),
            price: "12 400 ₽", shop: "Spb AM",
            notes: "Элегантное, с ароматом тёмных ягод и кедра. Шёлковые танины и очень долгое послевкусие."),
    Tasting(id: "102", year: 2015, date: "5 фев 2023", status: .tasted,
            character: WineCharacteristics(acidity: 4, dryness: 2, richness: 5, density: 1),
            price: "18 000 ₽", shop: "Italy",
            notes: "Более зрелое и сложное. Кожа, трюфель, сухофрукты. Танины полностью интегрированы.")
]

let sampleWines: [Wine] = [
    Wine(id: "1", name: "Château Margaux", country: "Франция", region: "Бордо",
         type: .red, grapes: ["Каберне Совиньон", "Мерло"], tastings: sampleTastings, status: .tasted),
    Wine(id: "2", name: "Barolo Cannubi", country: "Италия", region: "Пьемонт",
         type: .red, grapes: ["Неббиоло"],
         tastings: [Tasting(id: "201", year: 2017, date: "25 янв 2024", status: .tasted,
                            character: WineCharacteristics(acidity: 4, dryness: 4, richness: 3, density: 5),
                            price: "8 200 ₽",shop: "Russia", notes: "Монументальное вино. Роза и смола, бесконечное послевкусие.")], status: .tasted),
    Wine(id: "3", name: "Sancerre Blanc", country: "Франция", region: "Луара",
         type: .white, grapes: ["Совиньон Блан"],
         tastings: [
            Tasting(id: "301", year: 2022, date: nil, status: .collection, rating: nil,
                    character: nil, price: "3 200 ₽",shop: "Spb AM", notes: ""),
             Tasting(id: "302", year: 2021, date: "10 май 2023", status: .tasted,
                     rating: 3.8, character: WineCharacteristics(acidity: 4, dryness: 4, richness: 2, density: 2),
                     price: "2 900 ₽",shop: "France ", notes: "Свежий, цитрусовый, с лёгкой минеральностью."),
         ], status: .tasted),
    Wine(id: "4", name: "Veuve Clicquot", country: "Франция", region: "Шампань",
         type: .sparkling, grapes: ["Шардоне", "Пино Нуар"],
         tastings: [Tasting(id: "401", year: 2019, date: nil, status: .collection,
                             rating: nil, character: nil,
                            price: "5 600 ₽",shop: "Spb AM", notes: "")], status: .collection),
    Wine(id: "5", name: "Massandra Muscat", country: "Россия", region: "Крым",
         type: .fortified, grapes: ["Мускат белый"],
         tastings: [
            Tasting(id: "501", year: 2020, date: "3 мар 2024", status: .tasted,
                     rating: 4.0, character: WineCharacteristics(acidity: 2, dryness: 1, richness: 3, density: 4),
                     price: "1 800 ₽", shop: "Russia", notes: "Медовый, ноты апельсиновой цедры и абрикоса."),
            Tasting(id: "502", year: 2018, date: "12 дек 2022", status: .tasted,
                     rating: 4.2, character: WineCharacteristics(acidity: 2, dryness: 4, richness: 1, density: 5),
                     price: "1 600 ₽", shop: "Russia", notes: "Более насыщенный и концентрированный."),
         ], status: .tasted)
]

let sampleGrapes: [Grape] = [
    Grape(id: "1", name: "Каберне Совиньон", latin: "Cabernet Sauvignon",
          color: .red, origin: "Франция", aliases: ["Каберне"],
          countries: [
            GrapeCountry(id: "1", country: "Франция", knownAs: "Cabernet Sauvignon", regions: [
                  GrapeRegion(id: "1", name: "Бордо", note: "Родина сорта. Купажируется с Мерло и Каберне Фран."),
                  GrapeRegion(id: "2", name: "Пессак-Леоньян", note: "Топовые апелласьоны Бордо."),
              ]),
              GrapeCountry(id: "2", country: "США", knownAs: "Cabernet Sauvignon", regions: [
                  GrapeRegion(id: "3", name: "Напа Валли", note: "Мощный фруктовый стиль, высокий алкоголь."),
              ]),
          ],
          aromas: "Чёрная смородина, кедр, табак, мята",
          desc: "Самый популярный красный сорт в мире. Толстокожий, с высокой танинностью."),
    Grape(id: "2", name: "Мерло", latin: "Merlot",
          color: .red, origin: "Франция", aliases: [],
          countries: [
              GrapeCountry(id: "3", country: "Франция", knownAs: "Merlot", regions: [
                  GrapeRegion(id: "4", name: "Помероль (Бордо)", note: "Pétrus — почти 100% Мерло."),
              ]),
          ],
          aromas: "Слива, шоколад, вишня, травы",
          desc: "Мягкий, округлый красный сорт с низкими танинами."),
    Grape(id: "3", name: "Шардоне", latin: "Chardonnay",
          color: .white, origin: "Франция", aliases: [],
          countries: [
              GrapeCountry(id: "4", country: "Франция", knownAs: "Chardonnay", regions: [
                  GrapeRegion(id: "5", name: "Мёрсо (Бургундия)", note: "Масляный, ореховый, долгое послевкусие."),
                  GrapeRegion(id: "6", name: "Шабли", note: "Стальной, минеральный, без дуба."),
              ]),
          ],
          aromas: "Яблоко, груша, ваниль, масло",
          desc: "Самый популярный белый сорт. Нейтральный вкус ярко выражает терруар.")
]
