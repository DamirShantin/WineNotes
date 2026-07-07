import SwiftUI

let sampleTastings: [Tasting] = [
    Tasting(id: "101", year: 2018, date: Date(), status: .tasted,
            characters: WineCharacteristics(acidity: 4, dryness: 4, richness: 3, density: 5),
            price: "12 400 ₽", shop: "Spb AM",
            desc: "Элегантное, с ароматом тёмных ягод и кедра. Шёлковые танины и очень долгое послевкусие."),
    Tasting(id: "102", year: 2015, date: Date(), status: .tasted,
            characters: WineCharacteristics(acidity: 4, dryness: 2, richness: 5, density: 1),
            price: "18 000 ₽", shop: "Italy",
            desc: "Более зрелое и сложное. Кожа, трюфель, сухофрукты. Танины полностью интегрированы.")
]

let sampleWines: [Wine] = [
    Wine(id: "1", name: "Château Margaux", country: "Франция", region: "Бордо",
         type: .red, grapes: [caberneGrape, merloGrape], tastings: sampleTastings, status: .tasted),
    Wine(id: "2", name: "Barolo Cannubi", country: "Италия", region: "Пьемонт",
         type: .red, grapes: [merloGrape],
         tastings: [Tasting(id: "201", year: 2017, date: Date(), status: .tasted,
                            characters: WineCharacteristics(acidity: 4, dryness: 4, richness: 3, density: 5),
                            price: "8 200 ₽",shop: "Russia", desc: "Монументальное вино. Роза и смола, бесконечное послевкусие.")], status: .tasted),
    Wine(id: "3", name: "Sancerre Blanc", country: "Франция", region: "Луара",
         type: .white, grapes: [chardonayGrape],
         tastings: [
            Tasting(id: "301", year: 2022, date: nil, status: .collection, rating: nil,
                    characters: nil, price: "3 200 ₽",shop: "Spb AM", desc: ""),
            Tasting(id: "302", year: 2021, date: Date(), status: .tasted,
                     rating: 3.8, characters: WineCharacteristics(acidity: 4, dryness: 4, richness: 2, density: 2),
                     price: "2 900 ₽",shop: "France ", desc: "Свежий, цитрусовый, с лёгкой минеральностью."),
         ], status: .tasted),
    Wine(id: "4", name: "Veuve Clicquot", country: "Франция", region: "Шампань",
         type: .sparkling, grapes: [chardonayGrape],
         tastings: [
            Tasting(id: "401", year: 2019, date: nil, status: .collection,
                            rating: nil, characters: nil,
                    price: "5 600 ₽",shop: "Spb AM", desc: "")
         ], status: .collection),
    Wine(id: "5", name: "Massandra Muscat", country: "Россия", region: "Крым",
         type: .fortified, grapes: [chardonayGrape],
         tastings: [
            Tasting(id: "501", year: 2020, date: Date(), status: .tasted,
                     rating: 4.0, characters: WineCharacteristics(acidity: 2, dryness: 1, richness: 3, density: 4),
                     price: "1 800 ₽", shop: "Russia", desc: "Медовый, ноты апельсиновой цедры и абрикоса."),
            Tasting(id: "502", year: 2018, date: Date(), status: .tasted,
                     rating: 4.2, characters: WineCharacteristics(acidity: 2, dryness: 4, richness: 1, density: 5),
                     price: "1 600 ₽", shop: "Russia", desc: "Более насыщенный и концентрированный."),
         ], status: .tasted),
    Wine(id: "6", name: "Plessie Duval", country: france.name, region: france.regions![1].name,
         type: .rose, grapes: [
        Grape(id: "11", name: "pino nuar", color: .red, countries: [france])
    ], tastings: [
        Tasting(id: "11", year: 2010, status: .collection, price: "720")
    ], status: .collection)
]

let sampleGrapes: [Grape] = [caberneGrape, merloGrape, chardonayGrape]

let caberneGrape = Grape(id: "1", name: "Каберне Совиньон", latin: "Cabernet Sauvignon",
                         color: .red, origin: "Франция", aliases: ["Каберне"],
                         countries: [
                           GrapeCountry(id: "1", name: "Франция", regions: [
                                 GrapeRegion(id: "1", name: "Бордо", note: "Родина сорта. Купажируется с Мерло и Каберне Фран.", knownAs: "Cabernet Sauvignon"),
                                 GrapeRegion(id: "2", name: "Пессак-Леоньян", note: "Топовые апелласьоны Бордо.", knownAs: "Cabernet Sauvignon"),
                             ]),
                             GrapeCountry(id: "2", name: "США", regions: [
                                 GrapeRegion(id: "3", name: "Напа Валли", note: "Мощный фруктовый стиль, высокий алкоголь.", knownAs: "Cabernet Sauvignon",),
                             ]),
                         ],
                         aromas: "Чёрная смородина, кедр, табак, мята",
                         desc: "Самый популярный красный сорт в мире. Толстокожий, с высокой танинностью.")

let merloGrape = Grape(id: "2", name: "Мерло", latin: "Merlot",
                       color: .red, origin: "Франция", aliases: [],
                       countries: [
                           GrapeCountry(id: "3", name: "Франция", regions: [
                               GrapeRegion(id: "4", name: "Помероль (Бордо)", note: "Pétrus — почти 100% Мерло.", knownAs: "Merlot"),
                           ]),
                       ],
                       aromas: "Слива, шоколад, вишня, травы",
                       desc: "Мягкий, округлый красный сорт с низкими танинами.")

let chardonayGrape = Grape(id: "3", name: "Шардоне", latin: "Chardonnay",
                           color: .white, origin: "Франция", aliases: [],
                           countries: [
                               GrapeCountry(id: "4", name: "Франция", regions: [
                                   GrapeRegion(id: "5", name: "Мёрсо (Бургундия)", note: "Масляный, ореховый, долгое послевкусие.", knownAs: nil),
                                   GrapeRegion(id: "6", name: "Шабли", note: "Стальной, минеральный, без дуба.", knownAs: "Chardonnay",),
                               ]),
                           ],
                           aromas: "Яблоко, груша, ваниль, масло",
                           desc: "Самый популярный белый сорт. Нейтральный вкус ярко выражает терруар.")
// MARK: - Wines
let roseDAnju = Wine(id: "6", name: "Plessie Duval", country: france.name, region: france.regions![1].name, type: .rose, grapes: [
    Grape(id: "11", name: "pino nuar", color: .red, countries: [france])
], tastings: [
    Tasting(id: "11", year: 2010, status: .collection, price: "720")
], status: .collection)


// MARK: - Country

let france = GrapeCountry(id: "1", name: "Франция", regions: [bordo, luara, champan, chablis, burgundia, pomerol])

// MARK: - Regions
// France
let bordo = GrapeRegion(id: "1", name: "Бордо")
let luara = GrapeRegion(id: "2", name: "Луара")
let champan = GrapeRegion(id: "4", name: "Шампань")
let chablis = GrapeRegion(id: "6", name: "Шабли", note: "Стальной, минеральный, без дуба.", knownAs: "Chardonnay")
let burgundia = GrapeRegion(id: "7", name: "Мёрсо (Бургундия)", note: "Масляный, ореховый, долгое послевкусие.", knownAs: nil)
let pomerol = GrapeRegion(id: "8", name: "Помероль (Бордо)", note: "Pétrus — почти 100% Мерло.", knownAs: "Merlot")


// Italy
let peemont = GrapeRegion(id: "3", name: "Пьемонт")

//Russia
let krym = GrapeRegion(id: "5", name: "Крым")

//USA
let napa = GrapeRegion(id: "9", name: "Напа Валли", note: "Мощный фруктовый стиль, высокий алкоголь.", knownAs: "Cabernet Sauvignon",)


