-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 30 2022 г., 18:32
-- Версия сервера: 8.0.24
-- Версия PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `blog`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `title`, `created_at`, `updated_at`) VALUES
(2, 'Автомобилы', '2022-01-22 14:12:27', '2022-01-22 14:48:40'),
(3, 'Животные', '2022-01-23 06:11:26', '2022-01-23 06:11:26'),
(4, 'Природа', '2022-01-23 06:11:45', '2022-01-23 06:11:45'),
(6, 'Наука', '2022-01-23 06:12:12', '2022-01-23 06:12:12'),
(8, 'Бизнес', '2022-01-23 06:12:36', '2022-01-23 06:12:36'),
(9, 'Экономика', '2022-01-23 06:12:49', '2022-01-23 06:12:49'),
(10, 'Культура', NULL, NULL),
(11, 'Спорт\r\n', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(6, '2014_10_12_000000_create_users_table', 1),
(7, '2014_10_12_100000_create_password_resets_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2022_01_21_110556_create_categories_table', 1),
(12, '2022_01_22_180529_add_soft_deletes_to_users_table', 2),
(23, '2022_01_22_195619_create_roles_table', 3),
(27, '2022_01_22_200504_add_column_role_to_users_table', 4),
(29, '2022_01_23_084153_create_jobs_table', 5),
(31, '2022_01_23_092450_create_posts_table', 6),
(37, '2022_01_23_180252_create_post_user_likes_table', 7),
(39, '2022_01_24_092241_create_comments_table', 8);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `preview_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `main_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `category_id`, `preview_image`, `main_image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(17, 'На сцене театра Дашогуза поставлена пьеса Киноситы Дзюндзи «Журавлиные перья»', '<p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">На сцене Дашогузского государственного музыкально-драматического театра им. Нурмухаммеда Андалиба осуществлена постановка спектакля по пьесе известного японского драматурга Киноситы Дзюндзи «Журавлиные перья», сообщает издание «Туркменистан: Золотой век».</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">В основу сюжета легло японское народное сказание в литературной обработке драматурга. Это сказка о женщине-журавле. Спасенная бедняком-крестьянином, выходит за него замуж и ткет на продажу белоснежные ткани изумительной красоты. Ее муж, поддавшись корысти, требует от нее ткать больше и больше полтона. Но он не догадывается о том, что жена создает ткани из своих журавлиных перьев… Его корысть и предательство приводят к тому, что он теряет свою красавицу-жену навсегда – журавль улетает от неблагодарного человека.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Сценография нового спектакля лаконично-условна, построена на смысловых акцентах. Здесь важен синтез музыки, света и актерской пластики.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Постановка японской сказки на туркменском языке несколько отличается от классического сюжета, отмечает источник. За основу спектакля был взят перевод пьесы Анна Меляева.</p><blockquote style=\"padding: 0px 0px 0px 20px; margin: 0px 0px 20px 25px; border-left-width: 4px; border-left-color: rgba(167, 31, 31, 0.64); position: relative; border-top: none; border-right: none; border-bottom: none; border-image: initial; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif;\"><p style=\"margin-right: 0px; margin-left: 0px; font-weight: bolder; line-height: 30px; font-style: italic; word-break: break-word; text-align: justify;\">- Общий посыл спектакля понятен и прост: богатство – это не самое главное в жизни. Нужно ценить то, что имеешь, а не гнаться за выгодой в урон тем, кто тебя любит и ценит, – рассказывает режиссёр-постановщик Гуванч Баймедов. - Главный герой, имея своё счастье, совершенно забыл о нём, не оценил того, что было дано ему Богом свыше. Ведь на Востоке журавль считается посредником между миром богов и людей.</p><div><br></div></blockquote>', 10, 'images/OCPnEBvfgTSOfXvmIcsYXj47HDxggovoIjArmbP4.jpg', 'images/FNsyEFgUZsvOtclLFdJ2YEhnx4zU6d60JW51kQVO.jpg', '2022-01-30 09:27:02', '2022-01-30 09:27:02', NULL),
(18, 'Баскетболисту Коби Брайанту и его дочери установили памятник', '<p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">В городе Калабасас, штат Калифорния, США, был установлен памятник баскетболисту Коби Брайанту и его дочери. Монумент установили на месте крушения вертолета, в котором в январе 2020 года Коби Брайант погиб вместе с дочерью. Жертвами катастрофы стали тогда еще семь человек.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Как было установлено в ходе расследования, частный вертолет Sikorsky S-76, в котором баскетболист направлялся на спортивное состязание, попал в густой туман, после чего врезался в горный склон, сообщает euronews.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Коби Брайант был известен своей сверхрезультативной игрой. Выступая в Национальной баскетбольной ассоциации в течение 20 сезонов за команду «Лос-Анджелес Лейкерс», Брайант завоевал пять чемпионских титулов.</p>', 11, 'images/egN2so2Vv7jlKmkszLfkfc1iQkV4h8yZklvZCIJ8.jpg', 'images/eNWZfMmz2MnRGEoiIacUI8bZvKUaAvontbE11GUF.jpg', '2022-01-30 09:29:15', '2022-01-30 09:29:15', NULL),
(19, 'На Netflix вышел сериал про спутницу Криштиану Роналду – «Я Джорджина»', '<p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">27 января на Netflix вышел сериал «Я – Джорджина» про спутницу Криштиану Роналду Джорджину Родригес. В нем испанская модель рассказала о своем детстве, карьерном пути и, конечно, о встрече с возлюбленным, одним из самых успешных и популярных футболистов в мире, передает sport24.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">В трейлере проекта Джорджина рассказала, что знакомство с Криштиану кардинально изменило ее жизнь: «Я мечтала о том, чтобы рядом со мной был очаровательный принц – и теперь он у меня есть. Благодаря его любви моя жизнь превратилась в сказочный сон».</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Впрочем, по словам Родригес, в самом начале отношений ей было непросто: она стеснялась своей бедности и с трудом смогла адаптироваться к образу жизни футболиста. «В первый раз, когда я пришла в дом Криштиану, то потерялась в нем, особенно сложно было найти кухню. Мне потребовалось полчаса, чтобы вернуться, потому что я не могла найти дорогу. Дом был такой большой! А я с детства жила в маленькой квартире», — отметила Джорджина.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Напомним, что Роналду начал встречаться с испанской моделью Джорджиной Родригес в 2016-м, а уже через год у пары родилась дочь Алана Мартина, которой сейчас 4 года. Влюбленные также воспитывают троих детей Роналду от суррогатных матерей: 11-летнего Криштиану-младшего, а также четырехлетних Эву и Матео. В октябре прошлого года стало известно, что в семье португальского футболиста Криштиану Роналду ожидается пополнение. Спортсмен и его возлюбленная ждут двойняшек — мальчика и девочку.</p>', 11, 'images/1LHG59InT9yE5MAU78THSUJ7vO3XLXAgiuOFanPR.jpg', 'images/PtaPKjVaTlrHMLKgZjV5mztSeelqskuwHa4glTum.jpg', '2022-01-30 09:30:37', '2022-01-30 09:30:37', NULL),
(20, 'ФФТ увеличила лимит на легионеров в чемпионате Таджикистана', '<p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">С сезона-2022 высшей лиги Таджикистана футбольные клубы смогут вносить в заявку на сезон не 6, а 7 легионеров. Соответствующее решение было принято в четверг на заседании Исполнительного комитета Федерации футбола Таджикистана, сообщает&nbsp;<a href=\"http://fft.tj/ispolkom-fft-utverdil-novuyu-formulu-provedeniya-chempionata-tadzhikistana/\" target=\"_blank\" style=\"color: rgb(66, 139, 202);\">официальный сайт</a>&nbsp;организации.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Если раньше клубы высшей лиги могли внести в свою заявку 6 иностранных игроков, то с 2022 года каждая команда чемпионата Таджикистана будет иметь право внести в заявку на сезон максимум 7 легионеров, при этом на поле одновременно могут находиться 5 иностранных игроков.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Отметим, что в ноябре 2021 года Комитет соревнований АФК принял решение&nbsp;<a href=\"https://sports.tj/afk-otmenil-limit-na-legionerov-v-klubnom-sezone/\" target=\"_blank\" style=\"color: rgb(66, 139, 202);\">отменить лимит</a>&nbsp;на легионеров в азиатских клубных соревнованиях. Клубы смогут заявлять столько иностранных футболистов, сколько разрешает внутренний регламент соревнований. Но в заявку на матч клубы смогут включать только 3+1 иностранцев.</p>', 11, 'images/S5E6cNjcQNtlmyd3xzLB7U7mYomD76HEXwcHOZeo.jpg', 'images/l38jU1fic32SOEEXcBxFqY0R0IIqsZbBIPeAVrZQ.jpg', '2022-01-30 09:32:30', '2022-01-30 09:32:30', NULL),
(21, 'Определился победитель чемпионата Центральной Азии по футзалу-2022 среди женщин', '<p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Женская национальная сборная Ирана досрочно за тур до финиша чемпионата Центрально-Азиатской футбольной Ассоциации (CAFA) по футзалу выиграла золотые медали. Об этом сообщает&nbsp;<a href=\"http://fft.tj/zhenskaya-sbornaya-irana-dosrochno-stala-pobeditelem-chempionata-cafa-2022-po-futzalu-v-dushanbe/\" target=\"_blank\" style=\"color: rgb(66, 139, 202);\">официальный сайт</a>&nbsp;Федерации футбола Таджикистана.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">В главном матче 5-го тура чемпионата CAFA-2022 по футзалу сошлись женские сборные Ирана и Узбекистана. Встреча прошла в равной и упорной борьбе и завершилась результативной ничьей — 2:2.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">В другом поединке 5-го игрового дня женская сборная Таджикистана уступила команде Кыргызстана со счетом 1:4 и потеряла все шансы на попадание в призовую тройку чемпионата CAFA-2022 по футзалу.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Таким образом, за тур до завершения турнира женская сборная Ирана досрочно выиграла золотые медали. «Серебро» досталось команде Узбекистана, а у сборной Кыргызстана — «бронза».</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Матчи заключительно тура будут сыграны в пятницу, 28 января. В этот день состоятся встречи Узбекистан — Кыргызстан и Таджикистан — Иран.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Первый в истории чемпионат CAFA по футзалу среди женских национальных сборных проходит в Душанбе (Таджикистан).</p>', 11, 'images/TgqpoExSMl1AkP0GNKhSolIBXOZZrMvRqwjulgRO.jpg', 'images/bB6E5iHZ6nAUccHxJS01e4Ku5czr1LXqodwBntnp.jpg', '2022-01-30 09:33:58', '2022-01-30 09:33:58', NULL),
(22, 'Азиатская квалификация ЧМ-2022: расписание матчей 8-го тура', '<p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">1 февраля 2022 года пройдут матчи 8-го тура третьего раунда азиатской квалификации на чемпионат мира по футболу 2022 года в Катаре.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Третий раунд АФК квалификации ЧМ-2022 года проходит со 2 сентября 2021 года и завершится 29 марта 2022 года.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">В третьем отборочном раунде 12 сильнейших команд, поделённые на две равные группы, борются за 4 прямые путёвки в Катар. Ещё одна команда будет участвовать в межконтинентальных стыковых матчах. Команде, занявшей 3-е место в своей группе, сначала надо будет выиграть двухматчевое противостояние с аналогичной командой из соседней группы.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Мундиаль пройдет в Катаре с 21 ноября по 18 декабря.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Напомним, накануне сборная Ирана&nbsp;<a href=\"https://turkmenportal.com/blog/43742/sbornaya-irana-bez-azmuna-oformila-vyhod-na-chm2022\" target=\"_blank\" style=\"color: rgb(66, 139, 202);\">досрочно вышла на чемпионат мира</a>. Иранцы минимально одолели Ирак (1:0) и гарантировали себе путевку в Катар.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">На другие путевки от Азии претендуют Республика Корея, Австралия, Япония, Саудовская Аравия и ОАЭ.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Ранее на ЧМ-2022 вышли Катар (хозяин), Германия, Дания, Франция, Бельгия, Хорватия, Испания, Сербия, Англия, Швейцария, Нидерланды, Бразилия и Аргентина.</p>', 11, 'images/CVOBbAtnGdo07IMYqlCC5ANwM6f4Pf9z3H2NXFxb.jpg', 'images/nOrQ8RHmp4d5w2WckeSCrfkrVRKa6nOQw9t2pjtF.jpg', '2022-01-30 09:35:22', '2022-01-30 09:35:22', NULL),
(23, 'Компания Beýik ýüpek ýoly: удерживая лидерские позиции, обновляя «Дорожную карту»', '<p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Начало года для компании&nbsp;<a href=\"https://www.greatsilkroad.tm/ru/whoweare\" target=\"_blank\" style=\"color: rgb(66, 139, 202);\">Beýik ýüpek ýoly</a>&nbsp;традиционно является временем подведения итогов, оценки достижений и определения новых высот для реализации стратегических целей.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Очередным фактом успешности деятельности компании в 2021 году стало получение статуса официального дилера «Тойота» в Туркменистане, который позволил скорректировать планы и провести ряд значимых мероприятий для продвижения популярного бренда.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Туркменским автолюбителям также была представлена модель «Toyota Prado» с новым дизельным двигателем. Презентация автомобиля, проведённая с акцентом на высокое качество и надежность его внедорожных характеристик, позволила повысить спрос на данную модель.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">В числе достижений минувшего года - открытие таможенного склада на территории дилерского центра, где созданы соответствующие условия для идеального хранения и содержания автомобилей, а также эффективного управления процессом их поставки.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Поддерживая политику активного продвижения Toyota, компания участвовала в международном конкурсе, организованном для юных художников - «Toyota Автомобиль мечты».</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Расширение делового партнерства – одна из целей Beýik ýüpek ýoly, успешно сотрудничающей как с государственными структурами, так и отечественными частными предприятиями, а также диппредставительствами и зарубежными компаниями, в числе которых такие тяжеловесы международного бизнеса как Zeppelin, Dragon Oil, Yug Neftegaz и другие.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">В планах&nbsp;<a href=\"https://instagram.com/toyotamerkezibyy?utm_medium=copy_link\" target=\"_blank\" style=\"color: rgb(66, 139, 202);\">Beýik ýüpek ýoly</a>, входящей в консорциум компаний Great Silk Road Group, - удерживать лидерские позиции, уверенно продвигаясь по пути достижения стратегических целей.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">В текущем 2022 году компания планирует официально представить на отечественном автомобильном рынке модель Toyota Highlander с гибридным двигателем, а также открыть сервисный центр и организовать продажу запасных частей для автомобилей «Тойота».</p>', 8, 'images/ZCNPHKdabSkKh4WSQOZQEG0kcZvXI8fjiFFsoQIx.jpg', 'images/b4dwFMDnHe4kmnQgxXDZsLsewXTjDwHTcZxPkFWZ.jpg', '2022-01-30 09:37:56', '2022-01-30 09:37:56', NULL),
(24, 'В Ашхабаде состоится бизнес-ланч на тему межличностных конфликтов в компании', '<p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\"><strong style=\"font-weight: bold;\">10 февраля</strong>&nbsp;МБА в Ашхабаде приглашает предпринимателей, собственников бизнеса и ТОП-менеджеров принять участие в бизнес-ланче на тему: «Причины возникновения межличностных конфликтов в компании и пути их предотвращения».</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Спикером выступит Мая Эсенова - сертифицированный психолог, консультант личностного роста и член Профессиональной психотерапевтической лиги Российской Федерации.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Безусловно, в современном бизнесе существует четкий регламент по решению бизнес-процессов и рабочих задач. Но стоит помнить, что рабочие отношения - это коммуникация взрослых совершенно разных людей, из-за чего могут возникать различные разногласия. Повод для конфликта может быть любой, от расхождения во взглядах до потребностей и желаний. Если вы не знаете, как разрешить данную ситуацию в трудовом коллективе, то стоит записаться на участие в бизнес-ланче.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Спикер расскажет о потребностях, эмоциях и нарушениях во взаимодействии между людьми, которые приводят к конфликтным ситуациям. Участников ждёт глубокая работа над собой при помощи МАК - метафорических ассоциативных карт.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Место проведения: улица Алишера Навои, здание «Алтын Заман», 2 этаж ресторан «Терраса».</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\"><u>Начало&nbsp;</u>в 12:00.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\"><u>Стоимость участия</u>: 400 манат.</p>', 8, 'images/S6gIOStKP14eBOEUaNPwxv3c87z8WTVvi7avoFK6.jpg', 'images/H1p29OspKWhxmQlfZ84TIyXm9NOF6cn8Zoo3DMRN.jpg', '2022-01-30 09:52:30', '2022-01-30 09:52:30', NULL),
(25, 'В магазине Zemmhome представлен большой ассортимент ярких ковров в детскую комнату', '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">В магазине&nbsp;</span><a href=\"https://zemmhome.com/ru/39-kovry-kovriki\" target=\"_blank\" style=\"color: rgb(66, 139, 202); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify; background-color: rgb(255, 255, 255);\">Zemmhome</a><span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">&nbsp;можно приобрести экологически безопасные, гипоаллергенные и качественные коврики для детской комнаты, которые придутся по душе и взрослым, и детям.</span></p><p><span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Модели детских ковров, представленные в магазине различны по размеру, текстуре и дизайну, но все одинаково подарят приятные тактильные ощущения, которые так важны в развитии малыша. Интересные и красочные изображения, заинтересуют как девочек, так и мальчиков.</span><span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\"><br></span></p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Ознакомиться и приобрести детские коврики и другие товары для дома можно как на&nbsp;<a href=\"https://zemmhome.com/ru/\" target=\"_blank\" style=\"color: rgb(66, 139, 202);\">сайте</a>&nbsp;магазина Zemmhome, так и по адресу г. Анау, ул. Ахалская, 27/1.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Zemmhome сотрудничает только с проверенными и надёжными мировыми производителями, чья продукция пользуется высоким спросом на мировом рынке.</p><p><br></p>', 8, 'images/YvvGEG9qrvoqBdnzrOPDbcPr9nF7Ib7rG2S5XG4b.jpg', 'images/2O57itFQMc7DNpldMMTLn6MbGaZrOpGyOKRn7f8P.jpg', '2022-01-30 09:54:56', '2022-01-30 09:54:56', NULL),
(26, 'ИП Röwşen демонстрирует свою продукцию на международной виртуальной выставке', '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Крупнейший в нашей стране производитель обуви из натуральной кожи&nbsp;</span><a href=\"https://rowshen.com.tm/\" target=\"_blank\" style=\"color: rgb(66, 139, 202); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify; background-color: rgb(255, 255, 255);\">ИП Röwşen</a><span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">&nbsp;является одним из представителей Туркменистана, на стартовавшей 17 января 2022 года 2-й виртуальной выставке&nbsp;</span><a href=\"https://www.cavex2.rotobo.or.jp/ru/turkmenistan/\" target=\"_blank\" style=\"color: rgb(66, 139, 202); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify; background-color: rgb(255, 255, 255);\">«Центральная Азия - Виртуальная EXPO (CAVEX)»</a><span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">, организованной Японской ассоциацией по торговле с Россией и новыми независимыми государствами и Министерством экономики, торговли и промышленности Японии.</span></p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Демонстрация экономических достижений Туркменистана на этой выставке пройдет в специально отведенные для этого дни – с 14 по18 февраля. На это время запланировано проведение серии вебинаров, посвященных развитию туркмено-японского сотрудничества в торговой и инвестиционной сферах.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Röwşen aýakgap в специальном виртуальном «павильоне» продемонстрирует гостям выставки образцы своей продукции – стильную и качественную кожаную обувь для взрослых и детей. Изделия от Röwşen пользуются популярностью не только в Туркменистане – их качество оценили также покупатели в странах ближнего зарубежья.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Выставка завершит свою работу 4 марта 2022 года.</p><p><br></p>', 8, 'images/9yiHUoEf4wa8uE5ciCFHcMeOcaqQqR7Ov1kqUDjP.jpg', 'images/20ZBzD1ASquq5guws7HXZE0imPxnr5miScscioJq.jpg', '2022-01-30 09:56:57', '2022-01-30 09:56:57', NULL),
(27, 'Бердымухамедов поручил доработать Инвестиционную программу Туркменистана на 2022 год', '<p>Доработать Инвестиционную программу Туркменистана на 2022 год поручил сегодня на заседании Правительства Президент Гурбангулы Бердымухамедов.</p><p><br></p><p>Как сообщает Государственное информагентство, проект Программы, разработанный Министерством строительства и архитектуры, Министерством финансов и экономики Туркменистана, а также отраслевыми ведомствами, совместно с хякимликами велаятов и Ашхабада, на рассмотрение главы государства представил вице-премьер Чарымырат Пурчеков.</p><p><br></p><p>Программа предусматривает направление значительных инвестиций на строительство жилых домов, Домов и центров здоровья, школ и детских садов, автомобильных дорог, водоводов, газо- и электропроводов, систем связи, а также водоочистных сооружений.</p><p><br></p><p>В рамках этой программы также предусматривается реализация проектов международного и регионального значения, в том числе строительство газопровода Туркменистан–Афганистан–Пакистан–Индия и прокладка линии электропередачи Туркменистан–Афганистан–Пакистан, завершить первую очередь строительства нового сов­ременного административного центра Ахалского велаята.</p><p><br></p><p>Заслушав отчёт и рассмотрев представленный проект, глав государства отметил, что «грамотная, тщательно продуманная инвестиционная политика предопределяет успех всех грандиозных начинаний».</p><p><br></p><p>Туркменский лидер подчёркнул, что значительная часть инвестиций должна по-прежнему направляться на развитие социальной сферы.</p><p><br></p><p>- Инвестиционная программа на 2022 год должна отражать положительное решение задач, призванных обеспечить будущий рост всех отраслей национальной экономики, - сказал Президент страны.</p><p><br></p><p>Напомним, подготовить Инвестиционную программу на 2022 год, большинство средств которой пойдёт на развитие строительства, Президент Гурбангулы Бердымухамедов поручил в сентябре 2021 года. Тогда же он дал распоряжение по изысканию и привлечению как можно большего объёма инвестиций в строительную и промышленную отрасли.</p><div><br></div>', 9, 'images/I8P0c21hR3vl7jc92hW5lYKe3a6rFmzWr48WIf03.jpg', 'images/6vFET7HaZhvH1bGzoqPS8ZOO1BiTJkhshN8eCAhH.jpg', '2022-01-30 09:59:10', '2022-01-30 09:59:10', NULL),
(28, 'Разработаны бренды для продукции новых текстильных комплексов', '<p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Образцы новых брендов «Мяне» и «Джейтун» для изделий, выпускаемых на текстильных комплексах в Каахкинском и Бабадайханском этрапах (районах) Ахалского региона, продемонстрировал Президенту Бердымухамедову сегодня на заседании Правительства вице-премьер Чары Гылыджов, сообщила информационная программа «Ватан» туркменского телевидения.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Вице-премьер доложил, что на современных текстильных комплексах в Каахкинском и Бабадайханском этрапах производятся различные виды тканей, и мощность этих предприятий позволяет выпускать соответственно 1 миллион 200 тонн и 3 миллиона 300 тысяч единиц готовой швейной продукции в год.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Говоря о представленных образцах новых брендовых знаков, туркменский лидер дал указание разрабатывать и запускать в производство новые линии одежды и другие товары с учётом запросов внутреннего рынка, ориентируясь на сезонные потребности населения.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Президент Гурбангулы Бердымухамедов подчеркнул, что экологически чистый туркменский текстиль, благодаря внедрению в производство передовых технологий, применению лучшего отечественного и мирового опыта, неуклонно повышает свою конкурентоспособность не только на внутреннем рынке, но и за рубежом.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Текстильные комплексы в Каахкинском и Бабадайханском этрапах были открыты в 2021 году, пополнив перечень производственных объектов Ахала, являющегося одним из значимых промышленных регионов. Они обладают огромным потенциалом для производства изделий из натурального сырья – хлопка и шёлка. Здесь также действуют уникальные по своему технологическому процессу и объёмам выпуска продукции Геоктепинский, Кипчакский, Рухабатский текстильные комплексы, ряд инновационных прядильных и ткацких предприятий.</p>', 9, 'images/f7NUVPmp0GE9cDq7Om0MwKrNclaPHYdBPVWsNNXv.jpg', 'images/gAruSTgbyxxo1S1ZQKujvHHxTttLOGCKFhG423QP.jpg', '2022-01-30 10:01:47', '2022-01-30 10:01:47', NULL),
(29, 'В Туркменистане учреждён новый творческий конкурс', '<p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Новый творческий конкурс «Çalsana, bagşy!» («Играй, бахши!») учредили в Туркменистане. Творческое состязание среди бахши-музыкантов будет проводиться в рамках ежегодного конкурса Президента Туркменистана «Türkmeniň Altyn asyry» («Золотой век туркмен»). Соответствующее постановление Президент Гурбангулы Бердымухамедов подписал сегодня в ходе заседания Правительства, сообщила информационная программа «Ватан» туркменского телевидения.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Докладывая о проведённой работе в этом направлении, вице-премьер Мяхриджемал Маммедова сообщила, что новый конкурс нацелен на широкую популяризацию в мире ремесла изготовления дутара, исполнения на дутаре и искусства бахши, внесённых в Список нематериального культурного наследия ЮНЕСКО. Подведение его итогов и награждение победителей планируется провести в сентябре 2022 года.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Туркменский лидер поручил развивать музыкальные традиции предков, возвратить к жизни всё многообразие старинных музыкальных инструментов, расширить тематику проводимых конкурсов и организовывать новые творческие состязания, вовлекать в них как можно больше молодежи, выявлять новые таланты, а также укреплять традиции наставничества.</p><blockquote style=\"padding: 0px 0px 0px 20px; margin: 0px 0px 20px 25px; border-left-width: 4px; border-left-color: rgba(167, 31, 31, 0.64); position: relative; border-top: none; border-right: none; border-bottom: none; border-image: initial; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif;\"><p style=\"margin-right: 0px; margin-left: 0px; font-weight: bolder; line-height: 30px; font-style: italic; word-break: break-word; text-align: justify;\">«Для туркмен музыка – это сама жизнь, способ существования и самовыражения. Наш народ создал 72 музыкальных инструмента. Вдохновенные мелодии этих музыкальных инструментов воодушевляют людей на великие победы», – сказал Бердымухамедов.</p></blockquote>', 10, 'images/1a7mrMAUgq5YwoqtVZGknHTmvQE95Khqji7LfxP5.jpg', 'images/w2U46Nr2g0dg6VM3PFq4eUZS3cAKvog1DjM4LGkI.jpg', '2022-01-30 10:03:10', '2022-01-30 10:03:10', NULL),
(30, 'В Ашхабаде открылась художественная выставка по случаю Дня защитника Отечества', '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">В Музее изобразительных искусств Туркменистана по случаю&nbsp;</span><a href=\"https://turkmenportal.com/blog/43719/prezident-turkmenistana-pozdravil-voennosluzhashchih-i-sotrudnikov-silovyh-vedomstv-s-dnem-zashchitnikov-otechestva\" target=\"_blank\" style=\"color: rgb(167, 31, 31); outline: none medium; outline-offset: -2px; font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify; background-color: rgb(255, 255, 255);\">Дня защитника Отечества</a><span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">&nbsp;развернулась передвижная выставка работ туркменских художников. Об этом сообщает \"Туркменистан: Золотой век\".</span></p><p><span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Посетители выставки смогут ознакомиться с полотнами Ивана Черинко, Азата Джуманиязова, Аширджума Нурыева, Владимира Павлоцкого, Дурды Байрамова, Чары Овваева и других живописцев.</span><span style=\"color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\"><br></span><br></p>', 10, 'images/G6kj0t9pCuz3BqPNUGZ4cBXKuuYWF8z9ggvpsBdh.jpg', 'images/4jXzlWMPxQZQjRgwiVq2MQLjiKSsIVG6wdscMwZx.jpg', '2022-01-30 10:06:12', '2022-01-30 10:06:12', NULL),
(31, 'Сарагт Бабаев: «Алабай - тема творчества и источник энергии»', '<p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Народный художник Туркменистана, дважды лауреат Международной премии имени Махтумкули, почётный старейшина народа, ведущий скульптор страны дал интервью «Туркменпорталу».</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\"><em><strong style=\"font-weight: bold;\">Вы принимаете участие в международной конференции «Туркменская земля – очаг прославленных в мире культурных ценностей», в центре внимания которой туркменский алабай, насколько актуальна эта тема?</strong></em></p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">- Международная конференция посвящена сохранению культурного наследия, а алабай, также как великолепные ахалтекинские скакуны, является частью самобытной культуры нашего народа, его отношения к окружающему миру. Нынешняя встреча учёных, кинологов, всех, кто имеет отношение к этой теме, будет содействовать приумножению всемирной славы туркменского алабая, изу­чению исторических следов этой древней породы собак и обогащению знаний молодёжи в области национального наследия.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Достаточно напомнить, что при раскопках древней Маргианы были найдены свидетельства ритуальных погребений алабаев, которых хоронили как героев, так как жители Маргианы причисляли их к классу воинов.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Вместе с тем, о любви к этому животному свидетельствуют творческие работы наших предков. Терракотовые фигурки собак с купированными ушами и хвостом были обнаружены в разные годы в городищах бронзового века Алтын-Депе и Гонур-депе. Маленькая фаянсовая статуэтка щенка алабая найдена в средневековом поселении Данданакан, расположенном на территории Марыйского велаята. В музейных коллекциях Ашхабада и велаятов хранятся и другие скульптурные изображения собак местной породы, созданные в разные века и в разных ремесленных центрах. А совсем недавно археологи обнаружили изображения алабая в орнаментах древних туркменских ковров, в росписях посуды.</p>', 10, 'images/O7ShuUbnIzeX9L6q1YS29035G4O113R0kC10YNth.jpg', 'images/jtpRgpZeK5roNwSI2Ttou8A9u8y1XsN40BqeNYFQ.jpg', '2022-01-30 10:09:45', '2022-01-30 10:09:45', NULL),
(32, 'В Ашхабаде открылась выставка, посвященная культурному наследию', '<p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Видеоролик, рассказывающий о многоаспектной деятельности по сохранению, изучению и широкой популяризации в мире уникальной породы туркменских алабаев и тазы, как важной составляющей национального культурного наследия, стал своеобразным прологом к вернисажу, развёрнутому на площадке Экспоцентра. О масштабах проводимых в этом направлении работ можно судить по организации выставочного пространства.Свои павильоны представили организатор выставки - Международная ассоциация «Туркменские алабаи», отраслевые министерства и ведомства, творческие организации, профильные вузы и учреждения.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Национальный колорит подчеркивают, установленные здесь пять белых юрт, в которых можно почерпнуть информацию о работе региональных центров туркменского алабая.</p>', 10, 'images/jf0K5wXQHBcKOkE0qRavQgnLT8mZfFCtr2JF4L9Z.jpg', 'images/bQnfdbrXiQcYKrg9UlaPvHjryT3Ja01tElNIet8m.jpg', '2022-01-30 10:10:54', '2022-01-30 10:10:54', NULL),
(33, 'Пункт техосмотра транспортных средств открылся в Керки', '<p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">В городе Керки Лебапского велаята в торжественной обстановке сдали в эксплуатацию новое здание пункта технического осмотра автотранспортных средств при отделении дорожного надзора отдела полиции Керкинского этрапа, сообщает газета «Нейтральный Туркменистан».</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">В новом здании созданы все условия для определения технического состояния автомобилей. При прохождении технического осмотра транспорт будет диагностирован с помощью специальных компьютеров, что позволит быстро и наиболее полно выявлять его состояние. Установленные здесь современные устройства за считанные минуты могут выдавать информацию о техническом состоянии двигателей, ходовых частей, электрической системы, глушителя и других частей автотранспорта. Если выявится какой-то дефект, специалисты будут давать соответствующие рекомендации по его устранению.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Это второй подобный современный объект в Лебапском велаяте. Несколько лет назад был сдан в эксплуатацию пункт технического осмотра при отделе дорожного надзора Управления полиции Лебапского велаята, оснащённый современной технологией диагностирования.</p>', 2, 'images/aSXEFLjRliCIDSQh2JdLSfHSMDj3axcUr6rQZB1T.jpg', 'images/qEC9N8O5zWigTJrS3Z5ImzyugdLgGmfci4TtHPWu.jpg', '2022-01-30 10:13:08', '2022-01-30 10:13:08', NULL),
(34, 'В Туркменбаши открыта новая станция техосмотра автомобилей', '<p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">В субботу в этрапе Кенар города Туркменбаши состоялось открытие станции технического осмотра автомобилей, сообщает газета «Нейтральный Туркменистан».</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Станция технического осмотра возведена Строительно-монтажным управлением № 6 Управления строительства МВД Туркменистана на территории в 5000 м². Станция представляет собой высокопотолочный корпус полезной площадью 450 м². Она имеет два дифференцированных бокса со сквозными въездами для раздельного тестирования легковых и грузовых машин на осмотровых ямах. В здании расположены служебные кабинеты для специалистов, осуществляющих автомобильную инспекцию с исполь­зованием высокоточного немецкого оборудования и дистанционного кон­троля.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Объект оснащён необходимой инженерной инфраструк­турой для поддержания бесперебойной работы. Прилегающая к станции территория благоустроена и озеленена.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">В торжественной церемонии приняли участие работники администрации города и велаята, городского отдела полиции, сотрудники городской службы безопасности дорожного движения, представители общественности, старейшины и молодёжь.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">За качество работ и выполнение в срок контрак­тных обязательств отличившимся на стройке строителям вручены ценные подарки.</p>', 2, 'images/m2AfTW0mHE8EzGbHBtDI9tfe1Usc0h7Nke2VAnF7.jpg', 'images/y9skYSe6MNYTqebXbyZVvbPjTSMzpq19HGqmTyQI.jpg', '2022-01-30 10:15:08', '2022-01-30 10:15:08', NULL),
(35, 'Президент Туркменистана утвердил Программу развития транспортной дипломатии на 2022-2025 годы', '<p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Программу развития транспортной дипломатии на 2022-2025 годы утвердил Президент Туркменистана Гурбангулы Бердымухамедов, подписав сегодня соответствующий документ в ходе заседания правительства. Об этом сообщила информационная программа «Ватан» туркменского телевидения.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Как сообщил на заседании вице-премьер, министр иностранных дел Рашид Мередов, в программе предусмотрены стратегически важные меры, нацеленные на комплексную модернизацию материально-технической базы всех видов транспорта в Туркменистане, формирование современной профильной инфраструктуры, дальнейшее укрепление позиций Туркменистана в качестве регионального центра международных транспортно-транзитных коридоров.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Программа включает такие направления, как развитие правовой базы данной сферы и международного сотрудничества в этой области, подготовка Дорожно-транспортного кодекса Туркменистана, эффективное продолжение взаимовыгодного сотрудничества с международными организациями, в том числе с ООН и её региональными Комиссиями, Международной федерацией экспедиторских ассоциаций, Международной ассоциацией воздушного транспорта, Международной организацией гражданской авиации, Международным союзом автомобильного транспорта, Организацией сотрудничества железных дорог, Международной морской организацией и др.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; word-break: break-word; color: rgb(0, 0, 0); font-family: &quot;PT Root UI&quot;, sans-serif; text-align: justify;\">Также намечено проведение работы по присоединению Туркменистана к Межправительственной комиссии Международного транспортного коридора «Европа-Кавказ-Азия» (ТРАСЕКА), изучение возможностей использования универсального цифрового решения в развитии мультимодальных перевозок – Глобального Транзитного Документа.</p><div><br></div>', 2, 'images/HRaQA9LAEqx5BzS804FFX2QM6iYjLNxnyKzoQlGR.jpg', 'images/RIuY6iWlVbpVybwSOqJFU7ahzoUMpPawDZzXcLMd.jpg', '2022-01-30 10:16:37', '2022-01-30 10:16:37', NULL),
(36, 'Гендиректор ПАО \"Камаз\" заявил о намерении наращивать выпуск электробусов', '<p>Согласно бизнес-плану ПАО \"Камаз\" в 2022 году будет произведено 450 электробусов, и это только для Москвы. Об этом сообщает сайт kamaz.ru, ссылаясь на слова генерального директора «Камаза» Сергея Когогина.</p><p><br></p><p>Тенденция наращивания объемов производства электробусов исходит из высокой заинтересованности в экологическом транспорте многих регионов России, в том числе таких городов, как Казань, Белгород, Сочи, Сахалин, Санкт-Петербург.</p><p><br></p><p>«Тестовая эксплуатация даёт очень позитивную реакцию населения», - подчеркнул гендиректор.</p><p><br></p><p>Напомним, что в 2022 году электробусы \"Камаза\" будут поставлены для тестовой эксплуатации и в Туркменистан. Ожидается, что этот вид транспорта в дальнейшем будет обслуживать \"Ашхабад-сити\".</p><p><br></p>', 2, 'images/KkJxhneKOTYOQskoZsiMguzAYDioVThRurUsOQBl.jpg', 'images/RtXEhyYDty1Ug9BCFizg2gyiS8jtFi0X5mhuyP1U.jpg', '2022-01-30 10:17:55', '2022-01-30 10:17:55', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `post_user_likes`
--

CREATE TABLE `post_user_likes` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `post_user_likes`
--

INSERT INTO `post_user_likes` (`id`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(28, 1, 27, NULL, NULL),
(29, 1, 33, NULL, NULL),
(30, 1, 36, NULL, NULL),
(31, 1, 22, NULL, NULL),
(32, 1, 23, NULL, NULL),
(42, 1, 25, NULL, NULL),
(43, 1, 20, NULL, NULL),
(52, 2, 22, NULL, NULL),
(53, 2, 23, NULL, NULL),
(54, 2, 19, NULL, NULL),
(55, 2, 26, NULL, NULL),
(56, 3, 22, NULL, NULL),
(57, 3, 23, NULL, NULL),
(58, 3, 19, NULL, NULL),
(59, 3, 17, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, NULL),
(2, 'moderator', NULL, NULL),
(3, 'user', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint UNSIGNED NOT NULL DEFAULT '3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `role_id`) VALUES
(1, 'admin', 'admin', 'admin@mail.ru', '2022-01-22 18:36:15', '$2y$10$8W02DzE9FlsaF5G3w77nFO5MDvr4lprMFow6o8GIeDxUgapxZyTv6', 'i42tdHS2ycgvFZjrpz5m33zJc7Ig3lmOwEQvbhEVjCeeEmR5vDIEs3GH27LN', '2022-01-22 18:36:07', '2022-01-26 11:17:26', NULL, 1),
(2, 'moderator', 'moderator', 'moderator@mail.ru', '2022-01-22 19:51:58', '$2y$10$vebeVwoYh0DWcI5hSMEutOVq5i94uJQADvLpSGcrthH3.voUCzaR6', NULL, '2022-01-22 19:50:34', '2022-01-22 19:51:58', NULL, 2),
(3, 'user', 'user', 'user@mail.ru', '2022-01-22 20:12:17', '$2y$10$ViEb25VaHY3E3bmkVSRBs.7pIOWtZBuogsHFOTmtyhZ1GXHURc8za', NULL, '2022-01-22 20:09:47', '2022-01-22 20:12:17', NULL, 3),
(4, 'Irene', 'Barron', 'pigi@mailinator.com', '2022-01-23 05:58:26', '$2y$10$y9yYKYpviFahMGG4Th1hLO8e4a8YphxQl8sOJtbwBIvXBRsaQvgMe', NULL, '2022-01-23 05:54:40', '2022-01-23 06:02:17', NULL, 3),
(5, 'Hilary', 'Willis', 'xabaty@mailinator.com', '2022-01-04 18:00:06', '$2y$10$dAH5Z/tMsKIHRAooY.Kk0uVNS1TYg2iew4DM2N7h27ig6gdhon4Ru', NULL, '2022-01-23 06:01:06', '2022-01-23 06:01:06', NULL, 2),
(6, 'Jasmine', 'Greene', 'nywicuquva@mailinator.com', '2022-01-30 09:08:37', '$2y$10$ryyGanfcV6IwqAfK2BZMde53W4MDAQv7h8Z0IKAkcG0DC/RqZeLHu', NULL, '2022-01-30 09:03:23', '2022-01-30 09:08:37', NULL, 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_idx` (`user_id`),
  ADD KEY `comments_post_idx` (`post_id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_categories_idx` (`category_id`);

--
-- Индексы таблицы `post_user_likes`
--
ALTER TABLE `post_user_likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_user_likes_user_id_post_id_unique` (`user_id`,`post_id`),
  ADD KEY `post_user_likes_users_idx` (`user_id`),
  ADD KEY `post_user_likes_post_idx` (`post_id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_roles_idx` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT для таблицы `post_user_likes`
--
ALTER TABLE `post_user_likes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comment_post_fk` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `comment_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_categories_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Ограничения внешнего ключа таблицы `post_user_likes`
--
ALTER TABLE `post_user_likes`
  ADD CONSTRAINT `post_user_likes_post_fk` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `post_user_likes_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_roles_fk` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
