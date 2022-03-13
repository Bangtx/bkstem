CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

INSERT INTO unit(name, search_str)
VALUES ('本', '本'), ('枚', '枚'), ('束', '束'), ('袋', '袋'), ('個', '個'), ('kg', 'kg');

INSERT INTO item(name, search_str, default_unit, uuid, size_group_id, quality_group_id)
VALUES ('アソート', 'アソート', 1, uuid_generate_v4(), 1, 1),
       ('スプレー', 'スプレー', 1, uuid_generate_v4(), 1, 1),
       ('カランコエ', 'カランコエ', 1, uuid_generate_v4(), 1, 1),
       ('サンティニ', 'サンティニ', 1, uuid_generate_v4(), 1, 1),
       ('ポンポン', 'ポンポン', 1, uuid_generate_v4(), 1, 1),
       ('ケイトウ', 'ケイトウ', 1, uuid_generate_v4(), 1, 1),
       ('マイクロポンポン', 'マイクロポンポン', 1, uuid_generate_v4(), 1, 1),
       ('ストック', 'ストック', 1, uuid_generate_v4(), 1, 1),
       ('ポンポン(小輪)', 'ポンポン(小輪)', 1, uuid_generate_v4(), 1, 1);

INSERT INTO variety(name, search_str, item_id, uuid, size_group_id, quality_group_id)
VALUES ('DIS アソート アナスタシア', 'DIS アソート アナスタシア', 1, uuid_generate_v4(), 1, 1),
       ('DIS アソート アネシー', 'DIS アソート アネシー', 1, uuid_generate_v4(), 1, 1),
       ('DIS アソート スパイダー', 'DIS アソート スパイダー', 1, uuid_generate_v4(), 1, 1),
       ('DIS アソート 新花', 'DIS アソート 新花', 1, uuid_generate_v4(), 1, 1),
       ('アソート EX(夏系)', 'アソート EX(夏系)', 1, uuid_generate_v4(), 1, 1),
       ('アクイラ', 'アクイラ', 2, uuid_generate_v4(), 1, 1),
       ('アドリア', 'アドリア', 2, uuid_generate_v4(), 1, 1),
       ('アナベル', 'アナベル', 2, uuid_generate_v4(), 1, 1),
       ('アネシー 3MIX', 'アネシー 3MIX', 2, uuid_generate_v4(), 1, 1),
       ('アネシー イエロー', 'アネシー イエロー', 2, uuid_generate_v4(), 1, 1),
       ('アソート カランコエ 35cmUP', 'アソート カランコエ 35cmUP', 3, uuid_generate_v4(), 1, 1),
       ('アソート カランコエ 40cmUP', 'アソート カランコエ 40cmUP', 3, uuid_generate_v4(), 1, 1),
       ('アソート カランコエ 45cmUP', 'アソート カランコエ 45cmUP', 3, uuid_generate_v4(), 1, 1),
       ('アソート カランコエ 50cmUP', 'アソート カランコエ 50cmUP', 3, uuid_generate_v4(), 1, 1),
       ('アソート カランコエ 55cmUP', 'アソート カランコエ 55cmUP', 3, uuid_generate_v4(), 1, 1),
       ('アミアータ', 'アミアータ', 4, uuid_generate_v4(), 1, 1),
       ('アメリ', 'アメリ', 4, uuid_generate_v4(), 1, 1),
       ('アメリ サーモン', 'アメリ サーモン', 4, uuid_generate_v4(), 1, 1),
       ('アメリ ピンク', 'アメリ ピンク', 4, uuid_generate_v4(), 1, 1),
       ('イルミ', 'イルミ', 5, uuid_generate_v4(), 1, 1),
       ('ウィレット', 'ウィレット', 5, uuid_generate_v4(), 1, 1),
       ('ウォーク', 'ウォーク', 5, uuid_generate_v4(), 1, 1),
       ('エッジ', 'エッジ', 5, uuid_generate_v4(), 1, 1),
       ('エッジ イエロー', 'エッジ イエロー', 5, uuid_generate_v4(), 1, 1),
       ('キャッスル ピンク', 'キャッスル ピンク', 6, uuid_generate_v4(), 1, 1),
       ('スカーレット マスコット', 'スカーレット マスコット', 6, uuid_generate_v4(), 1, 1),
       ('センチュリー アプリコットブランデー', 'センチュリー アプリコットブランデー', 6, uuid_generate_v4(), 1, 1),
       ('センチュリー イエロー', 'センチュリー イエロー', 6, uuid_generate_v4(), 1, 1),
       ('マイクロポンポン 3MIX', 'マイクロポンポン 3MIX', 7, uuid_generate_v4(), 1, 1),
       ('マイクロポンポン 4MIX', 'マイクロポンポン 4MIX', 7, uuid_generate_v4(), 1, 1),
       ('マイクロポンポン イエロー', 'マイクロポンポン イエロー', 7, uuid_generate_v4(), 1, 1),
       ('マイクロポンポン オレンジ', 'マイクロポンポン オレンジ', 7, uuid_generate_v4(), 1, 1),
       ('アイアン(P)八重 70cm', 'アイアン(P)八重 70cm', 8, uuid_generate_v4(), 1, 1),
       ('アイアン(W)八重 70cm', 'アイアン(W)八重 70cm', 8, uuid_generate_v4(), 1, 1),
       ('アイアンMIX 八重 70cm', 'アイアンMIX 八重 70cm', 8, uuid_generate_v4(), 1, 1),
       ('エッジ イエロー', 'エッジ イエロー', 9, uuid_generate_v4(), 1, 1),
       ('エッジ ホワイト', 'エッジ ホワイト', 9, uuid_generate_v4(), 1, 1),
       ('オリーブ', 'オリーブ', 9, uuid_generate_v4(), 1, 1),
       ('カントリー', 'カントリー', 9, uuid_generate_v4(), 1, 1),
       ('サンプル(ポンポン)', 'サンプル(ポンポン)', 9, uuid_generate_v4(), 1, 1);

INSERT INTO size_group(name, search_str, name_eng, short_name, is_default)
VALUES ('default', 'default', 'default', 'default', true);

INSERT INTO size(name, search_str, size_group_id)
VALUES ('加工', '加工', 1), ('50', '50', 1), ('60', '60', 1), ('80', '80', 1), ('20', '20', 1), ('2L', '2L', 1), ('3L', '3L', 1), ('L/M/S', 'L/M/S', 1);

INSERT INTO customer(code, name, search_str, tel, fax)
VALUES ('001','岐阜生花市場', '岐阜生花市場', '058-245-6201', '058-245-4102'),
       ('002','なにわ花いちば', 'なにわ花いちば', '06-6914-2300', '06-6914-2070'),
       ('003','世田谷花き', '世田谷花き', '03-5494-8811', '03-5494-8811'),
       ('004','FAJ', 'FAJ', '03-3799-5526', '03-3799-5444'),
       ('005','姫路生花', '姫路生花', '079-253-9600', '079-253-9950'),
       ('006','名古屋花き', '名古屋花き', '052-332-4187', '052-332-5184'),
       ('007','仙花', '仙花', '022-232-84841', '022-232-8739'),
       ('008','東京花き', '東京花き', '03-3857-7600', '03-3857-7604'),
       ('009','立川生花', '立川生花', '042-583-2055', '042-583-0462');

INSERT INTO order_type(name, name_eng, is_order)
VALUES ('セリ', 'auction', false),
       ('依頼', 'request', false),
       ('注文', 'order', true),
       ('FM', 'fm', true),
       ('定期', 'schedule', true),
       ('買取', 'buy', true);

INSERT INTO color(name, code)
VALUES ('white', '#ffffff'),
       ('black', '#000000'),
       ('red', '#ff0000'),
       ('blue', '#3988f7'),
       ('green', '#00ff6a'),
       ('pink', '#ed80c2'),
       ('yellow', '#fff936'),
       ('orange', '#ffad14');

INSERT INTO quality_group(name, search_str, name_eng, short_name, is_default)
VALUES ('default', 'default', 'default', 'default', true);

INSERT INTO quality(name, short_name, search_str, quality_group_id)
VALUES  ('秀', '秀', '秀', 1),
        ('優', '優', '優', 1),
        ('良', '良', '良', 1);

INSERT INTO public.box_type (name, name_eng, yomi, bundle_size, search_str) VALUES ('S', 'S', 'S', 5, 's');
INSERT INTO public.box_type (name, name_eng, yomi, bundle_size, search_str) VALUES ('M', 'M', 'M', 10, 'm');
INSERT INTO public.box_type (name, name_eng, yomi, bundle_size, search_str) VALUES ('L', 'L', 'L', 15, 'l');
INSERT INTO public.box_type (name, name_eng, yomi, bundle_size, search_str) VALUES ('XL', 'XL', 'XL', 20, 'xl');

INSERT INTO public.member (email, setting) VALUES ('fmbiz@test.com', '{"home": {"calendar_mode": "days", "value_type": "order"}}');