// BELES Holding — Барлық тұрғын үй кешендері
// Деректер: belesholding.kz, 2gis.kz, korter.kz, kapster.kz
// Координаттар: 2GIS арқылы тексерілген (2026-03-12)

const String kSalesPhone = '+7 (775) 007-47-15';
const String kSalesPhone2 = '+7 (775) 007-47-13';
const String kMainOffice = 'г. Астана, ул. Ақкемер, 14/1';
const String kSalesOffice2 = 'г. Астана, ул. Е 669, 27/1';
const String kWebsite = 'https://belesholding.kz';
const String kEmail = 'info_reception@belesholding.kz';
const String kDeveloper = 'Beles Holding';

class ApartmentType {
  final String type;       // "1 бөлмелі", "2 бөлмелі", etc.
  final String area;       // "35-50 м²"
  final String price;      // "18.9 млн ₸ бастап"

  const ApartmentType({
    required this.type,
    required this.area,
    required this.price,
  });
}

class BelesProperty {
  final String name;
  final String city;
  final String district;
  final String address;
  final double latitude;
  final double longitude;
  final String developer;
  final String yearCompleted;
  final String housingClass;
  final String floors;
  final String status;             // 'active' | 'completed'
  final bool isPremium;
  final String salesOffice;
  final String managerPhone;
  final String website;
  final String email;
  final String imagePath;          // asset image path

  // Full property details
  final List<ApartmentType> apartments;
  final List<String> advantages;
  final List<String> nearbyInfrastructure;
  final String description;

  const BelesProperty({
    required this.name,
    required this.city,
    required this.district,
    required this.address,
    required this.latitude,
    required this.longitude,
    this.developer = kDeveloper,
    required this.yearCompleted,
    required this.housingClass,
    required this.floors,
    this.status = 'active',
    this.isPremium = false,
    required this.salesOffice,
    required this.managerPhone,
    this.website = kWebsite,
    this.email = kEmail,
    this.imagePath = '',
    this.apartments = const [],
    this.advantages = const [],
    this.nearbyInfrastructure = const [],
    this.description = '',
  });
}

// =======================================================
// КАРТАҒА БАРЛЫҚ ЖОБАЛАР (ВСЕ ОБЪЕКТЫ)
// =======================================================
const List<BelesProperty> allProperties = [
  // ── БЕЛСЕНДІ ЖОБАЛАР ──────────────────────────────────
  BelesProperty(
    name: 'BELES CITY',
    city: 'Астана',
    district: 'Есіл ауданы',
    address: 'ул. Е 118, 2',
    latitude: 51.091733,
    longitude: 71.489605,
    yearCompleted: 'II-IV кв. 2026',
    housingClass: 'Комфорт+ / Бизнес / Премиум',
    floors: '7',
    status: 'active',
    isPremium: true,
    salesOffice: kSalesOffice2,
    managerPhone: kSalesPhone,
    imagePath: 'assets/images/beles_city.png',
    description:
        'BELES CITY — Астана қаласының Есіл ауданындағы ірі тұрғын үй кешені. Заманауи сәулеті, жасыл ауласы және комфортты инфрақұрылымымен ерекшеленеді.',
    apartments: [
      ApartmentType(type: '1 бөлмелі', area: '40-55 м²', price: '18.9 млн ₸ бастап'),
      ApartmentType(type: '2 бөлмелі', area: '60-80 м²', price: '28.5 млн ₸ бастап'),
      ApartmentType(type: '3 бөлмелі', area: '90-120 м²', price: '40.0 млн ₸ бастап'),
      ApartmentType(type: '4 бөлмелі', area: '130-150 м²', price: '55.0 млн ₸ бастап'),
    ],
    advantages: [
      'Жабық және күзетілетін аула',
      'Балалар ойын алаңы',
      'Жер асты паркингі',
      'Жылдам лифтілер',
      'Заманауи монолитті-кірпіш технология',
      'Энергия тиімді терезелер',
      'Коммерциялық бірінші қабат',
    ],
    nearbyInfrastructure: [
      'Үлкен Есіл саябағы — 300 м',
      'Жалпы білім беру мектебі — 500 м',
      'Балабақша — 400 м',
      'MEGA Silk Way сауда орталығы — 1.5 км',
      'Дәріхана — 100 м',
      'ЕСІЛ дарияның жиегі — 1 км',
    ],
  ),
  BelesProperty(
    name: 'BaQ Sarai',
    city: 'Астана',
    district: 'Есіл ауданы',
    address: 'ул. Е 118, 2',
    latitude: 51.091900,
    longitude: 71.489400,
    yearCompleted: 'II кв. 2026',
    housingClass: 'Комфорт+',
    floors: '2-7',
    status: 'active',
    salesOffice: kSalesOffice2,
    managerPhone: kSalesPhone,
    imagePath: 'assets/images/beles_city.png',
    description:
        'BaQ Sarai — BELES CITY құрамындағы Комфорт+ класты кешен. Ыңғайлы жоспарлары мен жасыл ауласымен отбасы тұрмысы үшін ең қолайлы таңдау.',
    apartments: [
      ApartmentType(type: '1 бөлмелі', area: '35-48 м²', price: '16.5 млн ₸ бастап'),
      ApartmentType(type: '2 бөлмелі', area: '58-72 м²', price: '24.0 млн ₸ бастап'),
      ApartmentType(type: '3 бөлмелі', area: '80-90 м²', price: '34.0 млн ₸ бастап'),
    ],
    advantages: [
      'Жабық күзетілетін аула',
      'Балалар ойын алаңы',
      'Паркинг орындары',
      'Жылдам лифтілер',
      'Монолитті-кірпіш технология',
    ],
    nearbyInfrastructure: [
      'Мектеп — 500 м',
      'Балабақша — 400 м',
      'Саябақ аймағы — 300 м',
      'Дүкен — 150 м',
    ],
  ),
  BelesProperty(
    name: 'AQ Sarai',
    city: 'Астана',
    district: 'Есіл ауданы',
    address: 'ул. Е 118, 2',
    latitude: 51.091600,
    longitude: 71.489800,
    yearCompleted: 'IV кв. 2026',
    housingClass: 'Бизнес',
    floors: '1-7',
    status: 'active',
    isPremium: true,
    salesOffice: kSalesOffice2,
    managerPhone: kSalesPhone,
    imagePath: 'assets/images/khan_sarai.png',
    description:
        'AQ Sarai — бизнес-класты тұрғын үй кешені. Кең жоспарлар, жоғары сапалы инженерлік жабдықтар мен жоғары деңгейлі аула инфрақұрылымы.',
    apartments: [
      ApartmentType(type: '2 бөлмелі', area: '65-85 м²', price: '32.0 млн ₸ бастап'),
      ApartmentType(type: '3 бөлмелі', area: '95-115 м²', price: '46.0 млн ₸ бастап'),
      ApartmentType(type: '4 бөлмелі', area: '120-150 м²', price: '60.0 млн ₸ бастап'),
    ],
    advantages: [
      'Жабық күзетілетін аула',
      'Балалар ойын алаңы',
      'Жер асты паркингі',
      'Консьерж қызметі',
      'Жоғары сапалы сәулет',
    ],
    nearbyInfrastructure: [
      'Мектеп — 500 м',
      'Балабақша — 400 м',
      'Саябақ — 300 м',
      'MEGA Silk Way — 1.5 км',
    ],
  ),
  BelesProperty(
    name: 'Khan Sarai',
    city: 'Астана',
    district: 'Есіл ауданы',
    address: 'ул. Е 118, 2',
    latitude: 51.091400,
    longitude: 71.490000,
    yearCompleted: 'I кв. 2027',
    housingClass: 'Премиум',
    floors: '1-7',
    status: 'active',
    isPremium: true,
    salesOffice: kSalesOffice2,
    managerPhone: kSalesPhone,
    imagePath: 'assets/images/khan_sarai.png',
    description:
        'Khan Sarai — BELES-тің флагмандық Премиум класты кешені. Ксклюзивті сауда аймағы, авторлық дизайн, панорамалық терезелер және VIP деңгейлі қызмет.',
    apartments: [
      ApartmentType(type: '2 бөлмелі', area: '80-100 м²', price: '45.0 млн ₸ бастап'),
      ApartmentType(type: '3 бөлмелі', area: '120-160 м²', price: '68.0 млн ₸ бастап'),
      ApartmentType(type: 'Пентхаус', area: '180-200 м²', price: '110.0 млн ₸ бастап'),
    ],
    advantages: [
      'VIP жабық аула',
      'Балалар алаңы мен демалыс аймағы',
      'Жер асты паркингі (2 деңгей)',
      '24/7 күзет',
      'Авторлық дизайн лобби',
      'Панорамалық терезелер',
      'Консьерж қызметі',
    ],
    nearbyInfrastructure: [
      'Есіл өзені жиегі — 1 км',
      'Үкімет үйі — 2 км',
      'Халықаралық мектеп — 1.2 км',
      'Ритц-Карлтон қонақ үйі — 2 км',
      'Khan Shatyr сауда орталығы — 2.5 км',
    ],
  ),
  BelesProperty(
    name: 'NAMYS',
    city: 'Астана',
    district: 'Есіл ауданы',
    address: 'ул. С. Шаймерденов, 1',
    latitude: 51.116147,
    longitude: 71.536160,
    yearCompleted: 'II кв. 2026',
    housingClass: 'Комфорт+',
    floors: '2-16',
    status: 'active',
    salesOffice: kMainOffice,
    managerPhone: kSalesPhone,
    imagePath: 'assets/images/namys.png',
    description:
        'NAMYS — Есіл ауданындағы Комфорт+ класты биік кешен. Жасыл аулалы, балалар алаңды, 16 қабатқа дейін баратын заманауи тұрғын үй.',
    apartments: [
      ApartmentType(type: '1 бөлмелі', area: '35-50 м²', price: '15.5 млн ₸ бастап'),
      ApartmentType(type: '2 бөлмелі', area: '60-75 м²', price: '23.0 млн ₸ бастап'),
      ApartmentType(type: '3 бөлмелі', area: '80-95 м²', price: '32.0 млн ₸ бастап'),
    ],
    advantages: [
      'Жасыл аула',
      'Балалар ойын алаңы',
      'Паркинг',
      'Жылдам лифтілер',
      'Монолитті-кірпіш технология',
    ],
    nearbyInfrastructure: [
      'Мектеп — 600 м',
      'Балабақша — 400 м',
      'Сауда орталығы — 800 м',
      'Парк — 500 м',
    ],
  ),
  BelesProperty(
    name: 'MUZ-TAU',
    city: 'Астана',
    district: 'Есіл ауданы',
    address: 'ул. Ахмет Байтурсынұлы, 16/3',
    latitude: 51.116075,
    longitude: 71.510460,
    yearCompleted: 'III кв. 2025',
    housingClass: 'Комфорт+',
    floors: '2-15',
    status: 'active',
    salesOffice: kMainOffice,
    managerPhone: kSalesPhone,
    imagePath: 'assets/images/namys.png',
    description:
        'MUZ-TAU — тауды еске түсіретін монументальды сәулеті бар, 15 қабатты Комфорт+ класс кешені. Есіл өзенінің жанында орналасқан.',
    apartments: [
      ApartmentType(type: '1 бөлмелі', area: '40-52 м²', price: '17.0 млн ₸ бастап'),
      ApartmentType(type: '2 бөлмелі', area: '62-78 м²', price: '25.5 млн ₸ бастап'),
      ApartmentType(type: '3 бөлмелі', area: '85-100 м²', price: '36.0 млн ₸ бастап'),
    ],
    advantages: [
      'Жабық аула',
      'Балалар алаңы',
      'Паркинг',
      'Жылдам лифт',
      'Монолит технология',
    ],
    nearbyInfrastructure: [
      'Есіл өзені — 800 м',
      'Мектеп — 700 м',
      'Аурухана — 1 км',
      'Дүкен — 200 м',
    ],
  ),
  BelesProperty(
    name: 'TASTY',
    city: 'Астана',
    district: 'Есіл ауданы',
    address: 'ул. Мухамеджан Тынышбайулы, 6',
    latitude: 51.114770,
    longitude: 71.535627,
    yearCompleted: 'III кв. 2025',
    housingClass: 'Комфорт',
    floors: '2-13',
    status: 'active',
    salesOffice: kMainOffice,
    managerPhone: kSalesPhone,
    imagePath: 'assets/images/namys.png',
    description:
        'TASTY — жатын ауданда орналасқан, отбасылар үшін ыңғайлы Комфорт класты кешен. Мектеп пен балабақша жанында.',
    apartments: [
      ApartmentType(type: '1 бөлмелі', area: '35-45 м²', price: '14.0 млн ₸ бастап'),
      ApartmentType(type: '2 бөлмелі', area: '55-70 м²', price: '21.0 млн ₸ бастап'),
      ApartmentType(type: '3 бөлмелі', area: '75-90 м²', price: '29.0 млн ₸ бастап'),
    ],
    advantages: [
      'Аула',
      'Балалар алаңы',
      'Паркинг',
      'Лифт',
    ],
    nearbyInfrastructure: [
      'Мектеп — 300 м',
      'Балабақша — 250 м',
      'Дүкен — 150 м',
      'Парк — 400 м',
    ],
  ),
  BelesProperty(
    name: 'SAFUAN',
    city: 'Астана',
    district: 'Есіл ауданы',
    address: 'ул. Ақкемер, 14/1',
    latitude: 51.091997,
    longitude: 71.491066,
    yearCompleted: 'III кв. 2025',
    housingClass: 'Комфорт',
    floors: '1-5',
    status: 'active',
    salesOffice: kMainOffice,
    managerPhone: kSalesPhone,
    imagePath: 'assets/images/beles_city.png',
    description:
        'SAFUAN — Ботаникалық бақ пен Есіл жиегінің жанындағы жайлы, аз қабатты Комфорт класты тұрғын үй кешені.',
    apartments: [
      ApartmentType(type: '1 бөлмелі', area: '30-42 м²', price: '13.0 млн ₸ бастап'),
      ApartmentType(type: '2 бөлмелі', area: '50-65 м²', price: '19.5 млн ₸ бастап'),
      ApartmentType(type: '3 бөлмелі', area: '70-80 м²', price: '26.0 млн ₸ бастап'),
    ],
    advantages: [
      'Аз қабатты (тыныш)',
      'Аула',
      'Балалар алаңы',
      'Паркинг',
    ],
    nearbyInfrastructure: [
      'Ботаникалық бақ — 500 м',
      'Есіл жиегі — 700 м',
      'Балабақша — 300 м',
      'Дүкен — 100 м',
    ],
  ),

  // ── АЯҚТАЛҒАН ЖОБАЛАР ─────────────────────────────────
  BelesProperty(
    name: 'GIMALAY',
    city: 'Астана',
    district: 'Есіл ауданы',
    address: 'ул. Жумекен Нажимеденов, 15',
    latitude: 51.114309,
    longitude: 71.511799,
    yearCompleted: 'III кв. 2024',
    housingClass: 'Комфорт',
    floors: '2-11',
    status: 'completed',
    salesOffice: kMainOffice,
    managerPhone: kSalesPhone,
    imagePath: 'assets/images/beles_city.png',
    description: 'GIMALAY — тапсырылған, заманауи Комфорт класты кешен. Ыңғайлы орналасуы мен дамыған инфрақұрылымы бар.',
    apartments: [
      ApartmentType(type: '1 бөлмелі', area: '35-48 м²', price: 'Сатылды'),
      ApartmentType(type: '2 бөлмелі', area: '58-75 м²', price: 'Сатылды'),
      ApartmentType(type: '3 бөлмелі', area: '80-95 м²', price: 'Сатылды'),
    ],
    advantages: ['Жабық аула', 'Балалар алаңы', 'Паркинг', 'Лифт'],
    nearbyInfrastructure: ['Мектеп — 400 м', 'Балабақша — 300 м', 'Дүкен — 200 м'],
  ),
  BelesProperty(
    name: 'SOZAQ',
    city: 'Астана',
    district: 'Есіл ауданы',
    address: 'пр. Тәуелсіздік, 34/10',
    latitude: 51.140619,
    longitude: 71.471071,
    yearCompleted: '2023',
    housingClass: 'Комфорт',
    floors: '9',
    status: 'completed',
    salesOffice: kMainOffice,
    managerPhone: kSalesPhone,
    imagePath: 'assets/images/namys.png',
    description: 'SOZAQ — Тәуелсіздік даңғылындағы тапсырылған 9 қабатты Комфорт класты кешен.',
    apartments: [
      ApartmentType(type: '1 бөлмелі', area: '40-55 м²', price: 'Сатылды'),
      ApartmentType(type: '2 бөлмелі', area: '60-80 м²', price: 'Сатылды'),
    ],
    advantages: ['Аула', 'Паркинг', 'Лифт'],
    nearbyInfrastructure: ['Тәуелсіздік даңғылы', 'Мектеп — 600 м', 'Сауда орталығы — 1 км'],
  ),
  BelesProperty(
    name: 'TENIZ',
    city: 'Астана',
    district: 'Есіл ауданы',
    address: 'пр. Тәуелсіздік, 34/10',
    latitude: 51.140700,
    longitude: 71.471200,
    yearCompleted: '2023',
    housingClass: 'Комфорт',
    floors: '9',
    status: 'completed',
    salesOffice: kMainOffice,
    managerPhone: kSalesPhone,
    imagePath: 'assets/images/namys.png',
    description: 'TENIZ — Тәуелсіздік даңғылындағы тапсырылған 9 қабатты кешен.',
    apartments: [
      ApartmentType(type: '1 бөлмелі', area: '40-55 м²', price: 'Сатылды'),
      ApartmentType(type: '2 бөлмелі', area: '60-80 м²', price: 'Сатылды'),
    ],
    advantages: ['Аула', 'Паркинг', 'Лифт'],
    nearbyInfrastructure: ['Тәуелсіздік даңғылы', 'Мектеп — 600 м'],
  ),
  BelesProperty(
    name: 'FIRDAUS',
    city: 'Астана',
    district: 'Есіл ауданы',
    address: 'ул. Ахмет Байтурсынұлы, 18',
    latitude: 51.117485,
    longitude: 71.512370,
    yearCompleted: '2022',
    housingClass: 'Комфорт',
    floors: '9',
    status: 'completed',
    salesOffice: kMainOffice,
    managerPhone: kSalesPhone,
    imagePath: 'assets/images/namys.png',
    description: 'FIRDAUS — тапсырылған тұрғын үй кешені. Есіл ауданында орналасқан.',
    apartments: [
      ApartmentType(type: '1 бөлмелі', area: '35-50 м²', price: 'Сатылды'),
      ApartmentType(type: '2 бөлмелі', area: '55-72 м²', price: 'Сатылды'),
    ],
    advantages: ['Аула', 'Паркинг', 'Лифт'],
    nearbyInfrastructure: ['Мектеп — 500 м', 'Балабақша — 400 м'],
  ),
  BelesProperty(
    name: 'BADANA',
    city: 'Астана',
    district: 'Есіл ауданы',
    address: 'ул. Кордай, 99',
    latitude: 51.121620,
    longitude: 71.510810,
    yearCompleted: '2021',
    housingClass: 'Комфорт',
    floors: '9',
    status: 'completed',
    salesOffice: kMainOffice,
    managerPhone: kSalesPhone,
    imagePath: 'assets/images/beles_city.png',
    description: 'BADANA — 2021 жылы тапсырылған, ыңғайлы Комфорт класты кешен.',
    apartments: [
      ApartmentType(type: '1 бөлмелі', area: '35-48 м²', price: 'Сатылды'),
      ApartmentType(type: '2 бөлмелі', area: '55-68 м²', price: 'Сатылды'),
    ],
    advantages: ['Аула', 'Паркинг', 'Лифт'],
    nearbyInfrastructure: ['Мектеп — 600 м', 'Дүкен — 300 м'],
  ),
  BelesProperty(
    name: 'AIBIKE',
    city: 'Астана',
    district: 'Алматы ауданы',
    address: 'ул. Аманжол Болекпаев, 22',
    latitude: 51.120977,
    longitude: 71.510529,
    yearCompleted: '2020',
    housingClass: 'Комфорт',
    floors: '9',
    status: 'completed',
    salesOffice: kMainOffice,
    managerPhone: kSalesPhone,
    imagePath: 'assets/images/beles_city.png',
    description: 'AIBIKE — BELES Holding компаниясының Алматы ауданындағы тапсырылған алғашқы жобаларының бірі.',
    apartments: [
      ApartmentType(type: '1 бөлмелі', area: '35-45 м²', price: 'Сатылды'),
      ApartmentType(type: '2 бөлмелі', area: '55-70 м²', price: 'Сатылды'),
    ],
    advantages: ['Аула', 'Паркинг', 'Лифт'],
    nearbyInfrastructure: ['Мектеп — 400 м', 'Балабақша — 300 м'],
  ),
  BelesProperty(
    name: 'KEREI',
    city: 'Астана',
    district: 'Алматы ауданы',
    address: 'ул. Мустафа Шокай, 105',
    latitude: 51.122989,
    longitude: 71.510681,
    yearCompleted: '2020',
    housingClass: 'Комфорт',
    floors: '9',
    status: 'completed',
    salesOffice: kMainOffice,
    managerPhone: kSalesPhone,
    imagePath: 'assets/images/namys.png',
    description: 'KEREI — Алматы ауданындағы тапсырылған Комфорт класты кешен.',
    apartments: [
      ApartmentType(type: '1 бөлмелі', area: '40-52 м²', price: 'Сатылды'),
      ApartmentType(type: '2 бөлмелі', area: '60-78 м²', price: 'Сатылды'),
    ],
    advantages: ['Аула', 'Паркинг', 'Лифт'],
    nearbyInfrastructure: ['Мектеп — 500 м', 'Дүкен — 200 м'],
  ),
];

// Filtered views
List<BelesProperty> get astanaActive =>
    allProperties.where((p) => p.status == 'active').toList();

List<BelesProperty> get astanaCompleted =>
    allProperties.where((p) => p.status == 'completed').toList();
