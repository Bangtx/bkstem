CREATE
EXTENSION IF NOT EXISTS "uuid-ossp";

-- Item
INSERT INTO item(name, yomi, short_name, search_str, default_unit, uuid, size_group_id, quality_group_id)
VALUES ('アソート', 'あそーと', 'アソート', 'あそーとアソート', 1, uuid_generate_v4(), 1, 1),
       ('スプレー', 'すぷれー', 'スプレー', 'すぷれースプレー', 1, uuid_generate_v4(), 1, 1),
       ('カランコエ', 'からんこえ', 'カランコエ', 'からんこえカランコエ', 1, uuid_generate_v4(), 1, 1),
       ('サンティニ', 'さんてぃに', 'サンティニ', 'さんてぃにサンティニ', 1, uuid_generate_v4(), 1, 1),
       ('ポンポン', 'ぽんぽん', 'ポンポン', 'ぽんぽんポンポン', 1, uuid_generate_v4(), 1, 1),
       ('ケイトウ', 'けーとー', 'ケイトウ', 'けーとーケイトウ', 1, uuid_generate_v4(), 1, 1),
       ('マイクロポンポン', 'まいくろぽんぽん', 'マイクロポンポン', 'まいくろぽんぽんマイクロポンポン', 1, uuid_generate_v4(), 1, 1),
       ('ストック', 'すとっく', 'ストック', 'すとっくストック', 1, uuid_generate_v4(), 1, 1),
       ('ポンポン(小輪)', 'ぽんぽん(しょーりん)', 'ポンポン(小輪)', 'ぽんぽん(しょーりん)ポンポン(小輪)', 1, uuid_generate_v4(), 1, 1),
       ('ポンポン(大輪)', 'ぽんぽん(たいりん)', 'ポンポン(大輪)', 'ぽんぽん(たいりん)ポンポン(大輪)', 1, uuid_generate_v4(), 1, 1),
       ('小菊', 'こぎく', '小菊', 'こぎく小菊', 1, uuid_generate_v4(), 1, 1),
       ('輪菊', 'わきく', '輪菊', 'わきく輪菊', 1, uuid_generate_v4(), 1, 1),
       ('レギュラー', 'れぎゅらー', 'レギュラー', 'れぎゅらーレギュラー', 1, uuid_generate_v4(), 1, 1),
       ('野菜', 'やさい', '野菜', 'やさい野菜', 1, uuid_generate_v4(), 1, 1),
       ('加工輪菊', 'かこーりんきく', '加工輪菊', 'かこーりんきく加工輪菊', 1, uuid_generate_v4(), 1, 1),
       ('パック', 'ぱっく', 'パック', 'ぱっくパック', 1, uuid_generate_v4(), 1, 1),
       ('小田急', 'おだきゅー', '小田急', 'おだきゅー小田急', 1, uuid_generate_v4(), 1, 1),
       ('スプレー(定期)', 'すぷれー(てーき)', 'スプレー(定期)', 'すぷれー(てーき)スプレー(定期)', 1, uuid_generate_v4(), 1, 1),
       ('Disbud', 'Disbud', 'Disbud', 'Disbud', 1, uuid_generate_v4(), 1, 1),
       ('Disbud(特)', 'Disbud(とく)', 'Disbud(特)', 'Disbud(とく)Disbud(特)', 1, uuid_generate_v4(), 1, 1)
;

-- Variety: import by task + add missing varieties
INSERT INTO variety (id, uuid, item_id, name, name_eng, yomi, short_name, search_str, size_group_id, quality_group_id, created_at)
VALUES  (1346, uuid_generate_v4(), 2, 'エルナ', null, 'えるな', null, 'エルナえるな', 1, 1, now()),
        (7129, uuid_generate_v4(), 5, 'カーク', null, 'かーく', null, 'カークかーく', 1, 1, now()),
        (7085, uuid_generate_v4(), 5, 'ドリア イエロー', null, 'どりあいえろー', null, 'どりあいえろードリア イエロー', 1, 1, now()),
        (18215, uuid_generate_v4(), 19, 'ポンポン', null, 'ぽんぽん', null, 'ポンポンぽんぽん', 1, 1, now());

-- Set size group id of アソート マイクロポンポン to 太細
UPDATE variety set size_group_id = 3 where id = 20028;
-- Set item of ドリア オレンジ from ポンポン(大輪) to ポンポン
UPDATE variety set item_id = 5 where id = 7082;
-- restart sequence
SELECT setval('variety_id_seq', COALESCE((SELECT MAX(id)+1 FROM variety), 1), false);

-- unit
INSERT INTO unit(name, yomi, search_str)
VALUES ('本', 'ほん', 'ほん本'),
       ('枚', 'ばい', 'ばい枚'),
       ('束', 'たば', 'たば束'),
       ('袋', 'ふくろ', 'ふくろ袋'),
       ('個', 'こ', 'こ個'),
       ('kg', 'kg', 'kg');
-- quality group
INSERT INTO quality_group(name, yomi, search_str, name_eng, short_name, is_default)
VALUES ('ディフォルト', 'でぃふぉると', 'ディフォルト', 'default', 'ディフォルト', true);

-- quality
INSERT INTO quality(name, yomi, short_name, search_str, quality_group_id)
VALUES ('秀', 'しゅー', '秀', 'しゅー秀', 1),
       ('優', 'ゆー', '優', 'ゆー優', 1),
       ('良', 'りょー', '良', 'りょー良', 1);

-- Size group
INSERT INTO size_group(name, yomi, search_str, name_eng, short_name, is_default)
VALUES  ('ディフォルト', 'でぃふぉると', 'ディフォルト', 'default', 'ディフォルト', true),
        ('cm', 'cm', 'cm', 'cm', 'cm', false),
        ('太細', 'ふとほそ', 'ふとほそ太細', '', '太細', false),
        ('加工', 'かこう', 'かこう加工', '', 'かこう', false);

-- Size
INSERT INTO size(name, yomi, search_str, size_group_id)
VALUES ('5', '5', '5', 1),
       ('20', '20', '20', 1),
       ('25', '25', '25', 1),
       ('30', '30', '30', 1),
       ('35', '35', '35', 1),
       ('40', '40', '40', 1),
       ('50', '50', '50', 1),
       ('60', '60', '60', 1),
       ('80', '80', '80', 1),
       ('100', '100', '100', 1),
       ('120', '120', '120', 1),
       ('加工', 'かこー', 'かこー加工', 1),
       ('細い', 'ほそい', 'ほそい細い', 1),
       ('太い', 'ふとい', 'ふとい太い', 1),
       ('2L', '2L', '2L', 1),
       ('2L/L', '2L/L', '2L/L', 1),
       ('2S', '2S', '2S', 1),
       ('3L', '3L', '3L', 1),
       ('4L', '4L', '4L', 1),
       ('5L', '5L', '5L', 1),
       ('L', 'L', 'L', 1),
       ('M', 'M', 'M', 1),
       ('S', 'S', 'S', 1),
       ('L/M/S', 'L/M/S', 'L/M/S', 1);

-- box type
INSERT INTO public.box_type (name, name_eng, yomi, bundle_size, search_str)
VALUES ('50', '50', '50', 1, '50'),
       ('100', '100', '100', 1, '100'),
       ('ハーフ箱', '', 'はーふばこ', 1, 'はーふばこハーフ箱'),
       ('レンタルバケツ', '', 'れんたるばけつ', 1, 'れんたるばけつレンタルバケツ'),
       ('ハーフ箱箱', '', 'はーふばこばこ', 1, 'はーふばこばこハーフ箱箱'),
       ('箱', '', 'ばこ', 1, 'ばこ箱'),
       ('大箱', '', 'おーばこ', 1, '大箱'),
       ('北海道縦箱', '', 'ほっかいどーたてばこ', 1, 'ほっかいどーたてばこ北海道縦箱'),
       ('縦箱', '', 'たてばこ', 1, 'たてばこ縦箱'),
       ('パック', '', 'ぱっく', 1, 'ぱっくパック'),
       ('小田急', '', 'おだきゅー', 1, 'おだきゅー小田急'),
       ('大箱2', '', 'おーばこ2', 1, 'おーばこ2大箱2'),
       ('北海道大箱', '', 'ほっかいどーおーばこ', 1, 'ほっかいどーおーばこ北海道大箱'),
       ('北海道箱', '', 'ほっかいどーばこ', 1, 'ほっかいどーばこ北海道箱'),
       ('ELF', 'ELF', 'ELF', 1, 'ELF')
;

-- color
INSERT INTO color(name, code)
VALUES ('white', '#ffffff'),
       ('black', '#000000'),
       ('red', '#ff0000'),
       ('blue', '#3988f7'),
       ('green', '#00ff6a'),
       ('pink', '#ed80c2'),
       ('yellow', '#fff936'),
       ('orange', '#ffad14');

-- order type
INSERT INTO order_type(name, name_eng, is_order)
VALUES ('セリ', 'auction', false),
       ('依頼', 'request', false),
       ('注文', 'order', true),
       ('FM', 'fm', true),
       ('定期', 'schedule', true),
       ('買取', 'buy', true);

-- customer
INSERT INTO customer(id, code, zip_code, address_1, address_2, name, short_name, yomi, search_str, tel, fax)
VALUES (1, '001', '4600017', '愛知県名古屋市中区松原1-16-25',  '','名古屋花き', '名古屋花き', 'なごやかき', 'なごやかき名古屋花き', '052-332-4187', '052-332-5184'),
       (2, '002', '5008232', '岐阜県岐阜市前一色3-6-10', '', '岐阜生花市場', '岐阜生花市場', 'ぎふせーかしじょー', 'ぎふせーかしじょー岐阜生花市場', '058-245-6201', '058-245-4102'),
       (3, '003', '5380031', '大阪府大阪市鶴見区茨田大宮2-7-10', '', 'なにわ花いちば', 'なにわ花いちば', 'なにわはないちば', 'なにわはないちばなにわ花いちば', '06-6914-2300', '06-6914-2070'),
       (4, '004', '1570074', '東京都世田谷区大蔵1-4-1', '', '世田谷花き', '世田谷花き', 'せたがやかき', 'せたがやかき世田谷花き', '03-5494-8811', '03-5494-8811'),
       (5, '005', '1430001', '東京都大田区東海2-2-1', '', 'FAJ', 'FAJ', 'FAJ', 'FAJ', '03-3799-5526', '03-3799-5444'),
       (6, '006', '6710231', '兵庫県姫路市御国野町深志野300', '', '姫路生花', '姫路生花', 'ひめじせーか', 'ひめじせーか姫路生花', '079-253-9600', '079-253-9950'),
       (7, '007', '9830036', '宮城県仙台市宮城野区原町苦竹4-1-20', '', '仙花', '仙花', 'せんか', 'せんか仙花', '022-232-84841', '022-232-8739'),
       (8, '008', '1210836', '東京都足立区入谷6-3-1', '', '東京花き', '東京花き', 'とーきょーかき', 'とーきょーかき東京花き', '03-3857-7600', '03-3857-7604'),
       (9, '009', '2080022',  '東京都武蔵村山市榎3-19-1', '', '立川生花', '立川生花', 'たちかわせーか', 'たちかわせーか立川生花', '042-583-2055', '042-583-0462'),
       (10, '010', '100802', '秋田県秋田市外旭川字待合28', '', '秋田生花', '秋田生花', 'あきたせーか', 'あきたせーか秋田生花', '018-869-5700', '018-868-6161'),
       (11, '011', '2360002', '神奈川県横浜市金沢区鳥浜町1-1', '', '横浜花き園芸', '横浜花き園芸', 'よこはまかきえんげー', 'よこはまかきえんげー横浜花き園芸', '045-779-2671', '045-779-2674'),
       (12, '012', '1028349', '東京都千代田区三番町８－１', '', 'オークネット', 'オークネット', 'おーくねっと', 'おーくねっとオークネット', '03-5216-9587', '03-5216-9582'),
       (13, '013', '4550027', '愛知県名古屋市港区船見町34-10', '', '名港フラワーブリッジ', '名港フラワーブリッジ', 'めーみなとふらわーぶりっじ', 'めーみなとふらわーぶりっじ名港フラワーブリッジ', '052-747-8701', '052-747-8702'),
       (14, '014', '3650071', '埼玉県鴻巣市寺谷125', '', '鴻巣花き', '鴻巣花き', 'こーのすかき', 'こーのすかき鴻巣花き', '048-597-5310', '048-597-5688'),
       (15, '015', '4701141', '愛知県豊明市阿野町三本木121', '', '豊明花き', '豊明花き', 'とよあけかき', 'とよあけかき豊明花き', '0562-96-1225', '0562-96-1226'),
       (16, '016', '2160014', '神奈川県川崎市宮前区水沢1-1-1', '', '川崎花き園芸', '川崎花き園芸', 'かわさきかきえんげー', 'かわさきかきえんげー川崎花き園芸', '449752714', '449752765'),
       (17, '017', '6110043', '京都府宇治市伊勢田町西遊田90-1', '', '大原総合花き市場', '大原総合花き市場', 'おーはらそーごーかきしじょー', 'おーはらそーごーかきしじょー大原総合花き市場', '0774-21-4118', '0774-20-4422'),
       (18, '018', '1900034', '東京都立川市西砂町5-8-2', '', '第一花き 立川支社', '第一花き 立川支社', 'だいいちかきたちかわししゃ', 'だいいちかきたちかわししゃ第一花き 立川支社', '042-520-5322', '042-520-5321'),
       (19, '019', '30030', '北海道札幌市白石区流通センター7-3-5', '', 'はまなす花き', 'はまなす花き', 'はまなすかき','はまなすかきはまなす花き', '011-893-4187', '011-893-7887'),
       (98, '098', '4910005', '愛知県一宮市西大道金底77-1', '', 'クリップス', 'クリップス', 'くりっぷす', 'くりっぷすクリップス', '0586-81-0090', '0586-81-0133'),
       (99, '099', '1060047', '東京都港区南麻布2-2-3', 'ｴｸﾚｰﾙ南麻布1F', 'フレネットHIBIYA', 'フレネットHIBIYA', 'ふれねっとHIBIYA', 'ふれねっとHIBIYAフレネットHIBIYA', '334565587', '334565585'),
       (100, '100', '', '', '', '業者破損補償', '業者破損補償', 'ぎょーしゃはそんほしょー', 'ぎょーしゃはそんほしょー業者破損補償', '', ''),
       (101, '101', '6048134', '京都府京都市中京区堂之前町254', '', 'オーシャン貿易 (株)', 'オーシャン貿易 (株)', 'おーしゃんぼーえき(かぶ)', 'おーしゃんぼーえき(かぶ)オーシャン貿易 (株)', '', ''),
       (102, '102', '30006', '北海道札幌市白石区東札幌6条2-1-3', '', 'ブランディア', 'ブランディア', 'ぶらんでぃあ', 'ぶらんでぃあブランディア', '011-816-8700', '011-816-7000'),
       (103, '103', '3860012', '長野県上田市中央2-16-10', '', 'オレンジマム', 'オレンジマム', 'おれんじまむ', 'おれんじまむオレンジマム', '268298577', '268298588'),
       (104, '104', '3006',	'北海道札幌市白石区東札幌6条2-1-3', '', 'ブランディア 農場買付分', 'ブランディア 農場買付分', 'ぶらんでぃあのーじょーかいつけぶん', 'ぶらんでぃあのーじょーかいつけぶんブランディア 農場買付分', '011-816-8700', '011-816-7000'),
       (105, '105', '', '', '', '大田花き', '大田花き', 'かぶしきかいしゃおーたかき', 'かぶしきかいしゃおーたかき大田花き', '', '')
;
-- restart sequence
SELECT setval('customer_id_seq', COALESCE((SELECT MAX(id)+1 FROM customer), 1), false);

-- member
INSERT INTO public.member (email, setting)
VALUES ('fmbiz@test.com', '{"home": {"calendar_mode": "month", "value_type": "order"}, "states": {}}');

update box_type
set search_str = concat(name, case
                                  when name_eng is not null and length(name_eng) > 0 and
                                       NOT (name_eng = ANY (array [name])) then concat('|', name_eng) end, case
                                                                                                               when yomi is not null and
                                                                                                                    length(yomi) > 0 and
                                                                                                                    NOT (yomi = ANY (array [name, name_eng]))
                                                                                                                   then concat('|', yomi) end,
                        case
                            when short_name is not null and length(short_name) > 0 and
                                 NOT (short_name = ANY (array [name, name_eng, yomi])) then concat('|', short_name) end)
where true;
update customer
set search_str = concat(name, case
                                  when yomi is not null and length(yomi) > 0 and NOT (yomi = ANY (array [name]))
                                      then concat('|', yomi) end, case
                                                                      when short_name is not null and
                                                                           length(short_name) > 0 and
                                                                           NOT (short_name = ANY (array [name, yomi]))
                                                                          then concat('|', short_name) end, case
                                                                                                                when tel is not null and
                                                                                                                     length(tel) > 0 and
                                                                                                                     NOT (tel = ANY (array [name, yomi, short_name]))
                                                                                                                    then concat('|', tel) end,
                        case
                            when fax is not null and length(fax) > 0 and
                                 NOT (fax = ANY (array [name, yomi, short_name, tel])) then concat('|', fax) end, case
                                                                                                                      when email is not null and
                                                                                                                           length(email) > 0 and
                                                                                                                           NOT (email = ANY (array [name, yomi, short_name, tel, fax]))
                                                                                                                          then concat('|', email) end,
                        case
                            when code is not null and length(code) > 0 and
                                 NOT (code = ANY (array [name, yomi, short_name, tel, fax, email]))
                                then concat('|', code) end)
where true;
update item
set search_str = concat(name, case
                                  when name_eng is not null and length(name_eng) > 0 and
                                       NOT (name_eng = ANY (array [name])) then concat('|', name_eng) end, case
                                                                                                               when yomi is not null and
                                                                                                                    length(yomi) > 0 and
                                                                                                                    NOT (yomi = ANY (array [name, name_eng]))
                                                                                                                   then concat('|', yomi) end,
                        case
                            when short_name is not null and length(short_name) > 0 and
                                 NOT (short_name = ANY (array [name, name_eng, yomi])) then concat('|', short_name) end)
where true;
update quality
set search_str = concat(name, case
                                  when name_eng is not null and length(name_eng) > 0 and
                                       NOT (name_eng = ANY (array [name])) then concat('|', name_eng) end, case
                                                                                                               when yomi is not null and
                                                                                                                    length(yomi) > 0 and
                                                                                                                    NOT (yomi = ANY (array [name]))
                                                                                                                   then concat('|', yomi) end,
                        case
                            when short_name is not null and length(short_name) > 0 and
                                 NOT (short_name = ANY (array [name, yomi])) then concat('|', short_name) end)
where true;
update quality_group
set search_str = concat(name, case
                                  when name_eng is not null and length(name_eng) > 0 and
                                       NOT (name_eng = ANY (array [name])) then concat('|', name_eng) end, case
                                                                                                               when yomi is not null and
                                                                                                                    length(yomi) > 0 and
                                                                                                                    NOT (yomi = ANY (array [name, name_eng]))
                                                                                                                   then concat('|', yomi) end,
                        case
                            when short_name is not null and length(short_name) > 0 and
                                 NOT (short_name = ANY (array [name, name_eng, yomi])) then concat('|', short_name) end)
where true;
update size
set search_str = concat(name, case
                                  when name_eng is not null and length(name_eng) > 0 and
                                       NOT (name_eng = ANY (array [name])) then concat('|', name_eng) end, case
                                                                                                               when yomi is not null and
                                                                                                                    length(yomi) > 0 and
                                                                                                                    NOT (yomi = ANY (array [name]))
                                                                                                                   then concat('|', yomi) end,
                        case
                            when short_name is not null and length(short_name) > 0 and
                                 NOT (short_name = ANY (array [name, yomi])) then concat('|', short_name) end)
where true;
update size_group
set search_str = concat(name, case
                                  when name_eng is not null and length(name_eng) > 0 and
                                       NOT (name_eng = ANY (array [name])) then concat('|', name_eng) end, case
                                                                                                               when yomi is not null and
                                                                                                                    length(yomi) > 0 and
                                                                                                                    NOT (yomi = ANY (array [name, name_eng]))
                                                                                                                   then concat('|', yomi) end,
                        case
                            when short_name is not null and length(short_name) > 0 and
                                 NOT (short_name = ANY (array [name,name_eng, yomi])) then concat('|', short_name) end)
where true;
update unit
set search_str = concat(name, case
                                  when yomi is not null and length(yomi) > 0 and NOT (yomi = ANY (array [name]))
                                      then concat('|', yomi) end, case
                                                                      when short_name is not null and
                                                                           length(short_name) > 0 and
                                                                           NOT (short_name = ANY (array [name, yomi]))
                                                                          then concat('|', short_name) end)
where true;
update variety
set search_str = concat(name, case
                                  when name_eng is not null and length(name_eng) > 0 and
                                       NOT (name_eng = ANY (array [name])) then concat('|', name_eng) end, case
                                                                                                               when yomi is not null and
                                                                                                                    length(yomi) > 0 and
                                                                                                                    NOT (yomi = ANY (array [name]))
                                                                                                                   then concat('|', yomi) end,
                        case
                            when short_name is not null and length(short_name) > 0 and
                                 NOT (short_name = ANY (array [name, yomi])) then concat('|', short_name) end)
where true;