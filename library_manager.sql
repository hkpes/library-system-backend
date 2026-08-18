/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : library_manager

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 21/07/2026 16:40:26
*/
SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;
-- ----------------------------
-- Table structure for borrow_book
-- ----------------------------
DROP TABLE IF EXISTS `borrow_book`;
CREATE TABLE `borrow_book`  (
  `borrow_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '編號',
  `book_id` int(0) NULL DEFAULT NULL COMMENT '書本序號',
  `reader_id` int(0) NULL DEFAULT NULL COMMENT '會員編號',
  `borrow_time` datetime NULL DEFAULT NULL COMMENT '借書時間',
  `return_time` datetime NULL DEFAULT NULL COMMENT '還書時間',
  `apply_status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '0: 待審核 1： 已審核  2：拒絕',
  `borrow_status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '0：審核中 1:在借中  2：已還  3：拒絕',
  `return_status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '1: 正常還書 2：異常還書 3：丟失',
  `excepion_text` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '異常還書備註',
  `apply_text` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '審核拒絕備註',
  PRIMARY KEY (`borrow_id`) USING BTREE,
  INDEX `book_id`(`book_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrow_book
-- ----------------------------
INSERT INTO `borrow_book` VALUES (1, 2, 1, '2024-03-24 16:08:08', '2024-07-31 00:00:00', '1', '1', NULL, NULL, NULL);
INSERT INTO `borrow_book` VALUES (2, 3, 2, '2024-03-24 16:35:43', '2024-03-31 00:00:00', '0', '0', NULL, NULL, NULL);
INSERT INTO `borrow_book` VALUES (3, 4, 3, '2024-03-24 16:35:43', '2024-03-31 00:00:00', '0', '0', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_books
-- ----------------------------
DROP TABLE IF EXISTS `sys_books`;
CREATE TABLE `sys_books`  (
  `book_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '書本序號',
  `category_id` int(0) NULL DEFAULT NULL COMMENT '分類編號',
  `book_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '書本名稱',
  `book_place_num` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '書本編號',
  `book_auther` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '作者',
  `book_product` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '出版社',
  `book_store` int(0) NULL DEFAULT 0 COMMENT '庫存',
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 564 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_books
-- ----------------------------
INSERT INTO `sys_books` VALUES ('1', '1', '北上十年', 'CD0001C', '紀文鳳', '經濟日報出版社', 1);
INSERT INTO `sys_books` VALUES ('2', '1', '天職 - 美國員工創業精神培訓讀本', 'CD0002C', '馬克斯‧韋伯著 曼麗 編譯', '中央編譯出版社', 2);
INSERT INTO `sys_books` VALUES ('3', '1', '內地創業一點通', 'CD0003C', '林華偉著', '三聯‧法律', 1);
INSERT INTO `sys_books` VALUES ('4', '1', '北上營商秘要', 'CD0004C', '劉銳紹著', '星島出版', 1);
INSERT INTO `sys_books` VALUES ('5', '1', '職場生存智慧 - 求職、交際與創業技巧', 'CD0005C', '張小小 編著', '內蒙古文化出版社', 1);
INSERT INTO `sys_books` VALUES ('6', '1', '工作自由人', 'CD0006C', '周淑屏著', '更新資源', 1);
INSERT INTO `sys_books` VALUES ('7', '1', '職場啟奏 - 基督徒的事業路', 'CD0007C', '時代論壇主編', '基道', 1);
INSERT INTO `sys_books` VALUES ('8', '1', '打贏人生上半場', 'CD0008C', '余漢傑 述 王一平 撰', '迎欣出版社', 1);
INSERT INTO `sys_books` VALUES ('9', '1', '創路達人之從零開始', 'CD0009C', '鄧淑英、梁裕宏、黃嘉儀、李潔卿 合著', '突破出版社', 1);
INSERT INTO `sys_books` VALUES ('10', '1', '平凡創傳奇 社會企業妙點子', 'CD0010C', '詹姆士．魯波特 賈斯汀．羅 著', '商務印書館', 1);
INSERT INTO `sys_books` VALUES ('11', '1', '職場魅力高手', 'CD0011C', '蘇珊．馬歇爾 著 李金梅 譯', '經濟新潮社', 1);
INSERT INTO `sys_books` VALUES ('12', '1', '職場達人', 'CD0012C', '司徒永富', '雅歌出版社', 1);
INSERT INTO `sys_books` VALUES ('13', '1', '卓越人生 創新與力行的百貨業之王', 'CD0013C', '全光著; 劉中淑譯', '雅歌出版', 1);
INSERT INTO `sys_books` VALUES ('14', '1', '公益创业 青年创业与中年转业的新选择', 'CD0014C', 'Ka-kui Tse', '商务印书馆有限公司', 1);
INSERT INTO `sys_books` VALUES ('15', '1', '香港社會企業妙點子', 'CD0015C', '謝家駒', '商務印書館(香港)有限公司', 1);
INSERT INTO `sys_books` VALUES ('16', '1', '落力退休', 'CD0016C', '鍾普', '快樂書房有限公司', 1);
INSERT INTO `sys_books` VALUES ('17', '1', '新愚公移山：十個社會企業創業者的故事', 'CD0017C', '謝家駒博士', '社企創業者論壇出版', 1);
INSERT INTO `sys_books` VALUES ('18', '1', '創業逼我想通的賺錢道理', 'CD0018C', '萊行樂', '大寫出版', 1);
INSERT INTO `sys_books` VALUES ('19', '1', '筆跡心理分析之職涯規劃篇：你找到合適的工作嗎？', 'CD0019C', '林婉雯', '三聯書店（香港）有限公司', 1);
INSERT INTO `sys_books` VALUES ('20', '1', '職涯履歷進化論', 'CD0020C', '黃于真 Heiyu', '博碩文化', 1);
INSERT INTO `sys_books` VALUES ('21', '1', '做自己的生命設計師', 'CD0021C', '比爾•柏內特; 戴夫•埃文斯', '大塊文化', 1);
INSERT INTO `sys_books` VALUES ('22', '1', '10歲開始自己做生涯規畫', 'CD0022C', '寶槻泰伸', '小熊', 1);
INSERT INTO `sys_books` VALUES ('23', '1', '陪你找出路：生涯規劃工作者手冊', 'CD0024C', '何玉芬', '突破', 1);
INSERT INTO `sys_books` VALUES ('24', '1', '成人生涯發展-概念、議題及實務', 'CD0025C', 'Spencer G. Niles', '心理', 1);
INSERT INTO `sys_books` VALUES ('25', '1', '生涯規劃與職涯管理', 'CD0026C', '魏郁禎', '五南', 1);
INSERT INTO `sys_books` VALUES ('26', '1', '生涯規劃(4版)', 'CD0027C', '陳澤義', '五南', 1);
INSERT INTO `sys_books` VALUES ('27', '1', '生涯規劃與職涯發展', 'CD0028C', '王淑俐', '三民', 1);
INSERT INTO `sys_books` VALUES ('28', '1', '做自己的生涯規劃師', 'CD0029C', '張文彪 (Robin Cheung)', '突破', 1);
INSERT INTO `sys_books` VALUES ('29', '2', '商場聖徒 商界信徒的掙扎與出路', 'CE0001C', '羅拉．Ｌ．納舒 著 張國棟 譯', '基道出版社', 2);
INSERT INTO `sys_books` VALUES ('30', '2', '商界高手 － 基督徒商業倫理縱橫', 'CE0002C', '希爾著 張國楝 葉妙玲譯', '宣道出版社', 1);
INSERT INTO `sys_books` VALUES ('31', '2', '基督教與中國倫理道德', 'CE0003C', '陳建明、何除 主編', '四川大學出版社', 1);
INSERT INTO `sys_books` VALUES ('32', '2', '情理相依－基督徒倫理學', 'CE0004C', '方鎮明', '浸信會出版社', 1);
INSERT INTO `sys_books` VALUES ('33', '2', '經濟商業生活與基督教倫理', 'CE0005C', '許寶強、羅秉祥等著 張國棟編', '學生福音團契出版社', 2);
INSERT INTO `sys_books` VALUES ('34', '2', '別為鬥心抓狂', 'CE0006C', '紀士芬、安道文、胡世安著 鄭智嘉 譯', '學生福音團契出版社', 1);
INSERT INTO `sys_books` VALUES ('35', '2', '身在江湖由得你 - 保持敏銳的倫理知覺', 'CE0007C', '薛門、韓立克著 陳貞吟譯', '校園書房出版社', 1);
INSERT INTO `sys_books` VALUES ('36', '2', '公共政策的事實與謊言之泡沫與失誤', 'CE0008C', '林本利著', '壹出版', 1);
INSERT INTO `sys_books` VALUES ('37', '2', '操守的兩難', 'CE0009C', '紀士芬、安道文、胡世安著 郭智嘉譯', '學生福音團契出版社', 1);
INSERT INTO `sys_books` VALUES ('38', '2', '決斷的時刻 - 基督徒倫理思想的操練', 'CE0010C', '羅史提夫婦合著 陳吟貞譯', '校園書房出版社', 1);
INSERT INTO `sys_books` VALUES ('39', '2', '自由社會的道德底線', 'CE0011C', '羅秉祥', '基道出版社', 1);
INSERT INTO `sys_books` VALUES ('40', '2', '進退兩難－職場倫理探討', 'CE0012C', '班史龐格著 楊香芸譯', '橄欖文化事業基金會', 3);
INSERT INTO `sys_books` VALUES ('41', '2', '職場倫理學', 'CE0013C', '賈詩勒、道格拉斯著 紀榮神譯', '天道書樓有限公司', 2);
INSERT INTO `sys_books` VALUES ('42', '2', '企業管治-原則與商德', 'CE0014C', '司徒永富、鄭治洪 著', '匯智出版', 1);
INSERT INTO `sys_books` VALUES ('43', '2', '認識舊約倫理學', 'CE0015C', '萊特著 王仁芬譯', '校園書房出版社', 1);
INSERT INTO `sys_books` VALUES ('44', '2', '和平的角度-基督教倫理學獻議', 'CE0016C', '侯活士著 紀榮智譯 鄧紹光學術校閱', '基道出版', 1);
INSERT INTO `sys_books` VALUES ('45', '2', '最低工資何所依？', 'CE0017C', '麥尤美韶、羅佩珊、李靜敏、余少甫、江貴生 編輯', '香港天主教勞工事務委員會', 1);
INSERT INTO `sys_books` VALUES ('46', '2', '榆理常在－市井讀經', 'CE0018C', '陳榆-陳榆紀念系列', '香港基督徒畢業生團契', 1);
INSERT INTO `sys_books` VALUES ('47', '2', '職場解決－12案件重組', 'CE0019C', NULL, '宣道出版社', 1);
INSERT INTO `sys_books` VALUES ('48', '2', '鳴動的信仰', 'CE0020C', '古斌 著', '基道出版', 1);
INSERT INTO `sys_books` VALUES ('49', '2', '異類 僑居者', 'CE0021C', '侯活士, 韋利蒙著 曾景恒譯', '基道出版', 1);
INSERT INTO `sys_books` VALUES ('50', '2', '黑白分明－基督教倫理縱橫談', 'CE0022C', '羅秉祥 著', '宣道出版社', 1);
INSERT INTO `sys_books` VALUES ('51', '2', '天理人情－基督教倫理解碼', 'CE0023C', '鄭順佳 著', '三聯書店(香港)有限公司', 1);
INSERT INTO `sys_books` VALUES ('52', '2', '公理婆理話倫理', 'CE0024C', '羅秉祥 著', '更新資源(香港)有限公司', 1);
INSERT INTO `sys_books` VALUES ('53', '2', '基督教新約倫理學', 'CE0025C', '海斯(Richard B. Hays)作; 白陳毓華譯', '校園書房出版社', 2);
INSERT INTO `sys_books` VALUES ('54', '2', '基督教舊約倫理學', 'CE0026C', 'Christopher J. H. Wright', '校園書房出版社', 1);
INSERT INTO `sys_books` VALUES ('55', '2', '氣質，是你最重要的價值', 'CE0027C', '塞繆爾‧斯邁爾斯', '海鴿', 1);
INSERT INTO `sys_books` VALUES ('56', '2', '基督教倫理學', 'CE0028C', '賈詩勒 (Norman L. Geisler)著 李永明譯', '天道書樓', 1);
INSERT INTO `sys_books` VALUES ('57', '2', '基督教倫理學要點指南', 'CE0029C', '羅文 (Robin W. Lovin)著 董俐元譯', '聖經資源中心', 1);
INSERT INTO `sys_books` VALUES ('58', '2', '基督徒倫理要義', 'CE0030C', '黃耀銓', '種籽', 1);
INSERT INTO `sys_books` VALUES ('59', '2', '21世紀教牧倫理學', 'CE0031C', '陳尚仁', '校園書房', 1);
INSERT INTO `sys_books` VALUES ('60', '2', '市井‧罪人‧被罪者（修訂版）', 'CE0032C', '馮煒文', '香港基督徒畢業生團契', 1);
INSERT INTO `sys_books` VALUES ('61', '3', '長子名份 - 當代基督徒召命的反省', 'CL0001C', '唐崇懷博士著', '新加坡逐家文字佈道會', 1);
INSERT INTO `sys_books` VALUES ('62', '3', '歡天喜地星期一：職場事奉的召命', 'CL0002C', '馬可．格林著 曾淑儀譯', '學生福音團契出版社', 1);
INSERT INTO `sys_books` VALUES ('63', '3', '做你愛做，而不是你該做的工作', 'CL0003C', '查理．Ｊ．萊德、戴維．Ａ．沙匹羅著 胡洲賢譯', '奧林文化', 1);
INSERT INTO `sys_books` VALUES ('64', '3', '上帝@工作 基督徒生命中的聖召', 'CL0004C', '韋真爾著 劉思潔譯', '雅歌出版社', 1);
INSERT INTO `sys_books` VALUES ('65', '3', '呼召與勇氣', 'CL0005C', '高登．史密思著 劉思潔譯', '雅歌出版社', 2);
INSERT INTO `sys_books` VALUES ('66', '3', '人生下半場', 'CL0006C', '鮑伯．班福德著 楊曼如譯', '雅歌', 1);
INSERT INTO `sys_books` VALUES ('67', '3', '尋求神的旨意- 豈有此理', 'CL0007C', '華爾基著 顧樂翔譯', 'Vocatio Creation', 1);
INSERT INTO `sys_books` VALUES ('68', '3', '敢夢想飛：你也可以計劃人生', 'CL0008C', '蔡元雲', '突破', 1);
INSERT INTO `sys_books` VALUES ('69', '3', '21世紀使命門徒', 'CL0009C', '董家驊', '校園書房', 1);
INSERT INTO `sys_books` VALUES ('70', '4', '香港中產階級處境觀察', 'FM0001C', '呂大樂、王志錚著', '三聯書店', 1);
INSERT INTO `sys_books` VALUES ('71', '4', '迫你花錢', 'FM0002C', '林行止著', '遠景', 1);
INSERT INTO `sys_books` VALUES ('72', '4', '香港房地產市場：事實與政策', 'FM0003C', '周應峰、梁嘉銳、鄭顯輝、殷偉憲、黃志輝 等著', '明報出版社', 1);
INSERT INTO `sys_books` VALUES ('73', '4', '終極投資', 'FM0004C', '韓費思著 伍鳳媚譯', '天道書樓、香港專業人才服務機構', 2);
INSERT INTO `sys_books` VALUES ('74', '4', '天國與財利 - 葛霖論金融市場', 'FM0005C', 'Stephen Green著 楊志業譯', 'Vocatio Creation', 1);
INSERT INTO `sys_books` VALUES ('75', '4', '後現代拜物教', 'FM0006C', '駱穎佳', '學生福音團契出版社', 1);
INSERT INTO `sys_books` VALUES ('76', '4', '保險企業家－全方位壽險行銷人員指南', 'FM0007C', '謝冠南', '天恩出版社', 1);
INSERT INTO `sys_books` VALUES ('77', '4', '與錢共舞 － 廿一世紀的金錢智慧觀', 'FM0008C', '約翰魯廸著 劉公典譯', '橄欖文化事業基金會', 1);
INSERT INTO `sys_books` VALUES ('78', '4', '向書中之書聖經學習理財智慧', 'FM0009C', 'L. 柏康德著 童亦暢譯', '海天書樓', 1);
INSERT INTO `sys_books` VALUES ('79', '4', '錢宜義見 - 基督徒理財智慧', 'FM0010C', '李少秋 著', '基道', 1);
INSERT INTO `sys_books` VALUES ('80', '4', '普世教會運動對政治經濟的反省', 'FM0011C', '穆賀蘭編 黃洛文譯', '香港基督徒學會出版', 1);
INSERT INTO `sys_books` VALUES ('81', '4', '基督教信仰與今日的世界經濟', 'FM0012C', '李倩儀 譯', '香港基督徒學會出版', 1);
INSERT INTO `sys_books` VALUES ('82', '4', '信仰臨界 - 消費社會的信仰新想像', 'FM0013C', '古斌 著', '基道', 1);
INSERT INTO `sys_books` VALUES ('83', '4', '貨幣戰爭 - 誰掌握了貨幣，誰就能主宰這個世界', 'FM0014C', '宋鴻兵 編著', '遠流出版', 1);
INSERT INTO `sys_books` VALUES ('84', '4', '聖經中的土地經濟學', 'FM0015C', '戴天德 著', '橄欖文化事業基金會', 1);
INSERT INTO `sys_books` VALUES ('85', '4', '捐獻的恩典 - 基督徒捐獻的十個原則', 'FM0016C', '約翰．斯托德 著', '國際基督徒學生福音團契', 1);
INSERT INTO `sys_books` VALUES ('86', '4', '雙曽對話之與熊共武', 'FM0017C', '曾淵滄 曾志英 合著', 'Great Yield (Asia Pacific) Limited', 1);
INSERT INTO `sys_books` VALUES ('87', '4', '理財有道 金融海嘯的反思', 'FM0018C', '林本利著', '天道書樓有限公司', 1);
INSERT INTO `sys_books` VALUES ('88', '4', '貨幣戰爭 2- 金權天下', 'FM0019C', '宋鴻兵 編著', '中華工商聯合出版社', 1);
INSERT INTO `sys_books` VALUES ('89', '4', 'FQ测试与职场把脉', 'FM0020C', '易修平; 马建青', '汉语大词典出版社', 1);
INSERT INTO `sys_books` VALUES ('90', '4', '投資香港房地產', 'FM0021C', '香港地產學會', '明報出版社', 1);
INSERT INTO `sys_books` VALUES ('91', '4', '財職兼收', 'FM0022C', '止凡', '亮光文化', 1);
INSERT INTO `sys_books` VALUES ('92', '5', '溝通@工作 - 克服人際隔閡的溝通寶典', 'IR0001C', '賴諾曼著 劉如青譯', '雅歌', 1);
INSERT INTO `sys_books` VALUES ('93', '5', '女男大不同', 'IR0002C', '珍．荷倫斯著 吳幸玲譯', '美商麥格羅．希爾國際股份有限公司', 1);
INSERT INTO `sys_books` VALUES ('94', '5', '你想好型嗎？- 九型人學說 工作愛情應用篇', 'IR0003C', '陳淑慧 著及繪圖', '藍天圖書', 1);
INSERT INTO `sys_books` VALUES ('95', '5', '八面玲瓏社交術', 'IR0004C', '林柏松 編', '滿庭芳出版社', 1);
INSERT INTO `sys_books` VALUES ('96', '5', '把對手變成幫手', 'IR0005C', '海蓮娜．柯尼利斯、蘇珊娜．費爾合著 王明華譯', '世茂出版社', 1);
INSERT INTO `sys_books` VALUES ('97', '5', '工作中的人際溝通', 'IR0006C', 'Robert J. Edelmann著 曾憲才教授譯', '商務印書館 (香港) 有限公司', 1);
INSERT INTO `sys_books` VALUES ('98', '5', '必勝口才學', 'IR0007C', '將門文物出版有限公司編輯部', '將門文物出版有限公司', 1);
INSERT INTO `sys_books` VALUES ('99', '5', '戀愛防腐學', 'IR0008C', '杜婉霞', '升出版有限公司', 1);
INSERT INTO `sys_books` VALUES ('100', '5', '真誠的關係 發掘失落了的互為肢體之道', 'IR0009C', 'Wayne Jacobsen', '基道出版社', 1);
INSERT INTO `sys_books` VALUES ('101', '5', '職場和諧人際攻略', 'IR0010C', '陳一華 (Chan Yut-wah)', '宣道', 1);
INSERT INTO `sys_books` VALUES ('102', '5', '人際關係的藝術', 'IR0011C', '劉式湄 著', '突破出版社', 1);
INSERT INTO `sys_books` VALUES ('103', '5', '泛自閉症者的社交能力訓練', 'IR0012C', '劉萌容', '書泉出版', 1);
INSERT INTO `sys_books` VALUES ('104', '5', '說話全能養成指南', 'IR0013C', '愛麗絲．雪登 (Alice Sheldon)', '拾青文化', 1);
INSERT INTO `sys_books` VALUES ('105', '5', '職場必修課: 職場溝通病的神奇處方箋', 'IR0014C', '王淑俐著', '三民', 1);
INSERT INTO `sys_books` VALUES ('106', '5', '優質人際學堂', 'IR0015C', '陳一華', '宣道', 1);
INSERT INTO `sys_books` VALUES ('107', '5', '愛的語言練習本：非暴力溝通實作手冊', 'IR0016C', '呂靖安 (Lucy Leu)著 黃女玲譯', '光啟文化', 1);
INSERT INTO `sys_books` VALUES ('108', '6', '中國神學研究院期刊．第二十期 - 經濟與財富', 'J0001C', '余達心 主編', '中國神學研究院', 1);
INSERT INTO `sys_books` VALUES ('109', '6', '中國神學研究院期刊．第四十六期 - 工作神學', 'J0002C', '鄭順佳 主編', '中國神學研究院', 1);
INSERT INTO `sys_books` VALUES ('110', '6', '正義道中尋 - 天主教社會訓導文獻簡易本', 'J0003C', '葉麗珊、阮美賢 執行編輯', '香港天主教正義和平委員會', 1);
INSERT INTO `sys_books` VALUES ('111', '7', '北上求職 Complete Guide', 'JS0001C', '蔡富春 主編', '經濟日報出版社', 1);
INSERT INTO `sys_books` VALUES ('112', '8', '僕人 - 修道院的領導啟示錄', 'LD0001C', '詹姆士‧杭特著 張沛文譯', '商周出版', 2);
INSERT INTO `sys_books` VALUES ('113', '8', '牧羊人領導', 'LD0002C', '布雷恩‧麥考米克、大衛‧戴文波合著 葛窈君譯', '啟示出版', 1);
INSERT INTO `sys_books` VALUES ('114', '8', '成功領袖塑造', 'LD0003C', '柯迪爾著 朱玲億、呂政耾譯', '以琳', 1);
INSERT INTO `sys_books` VALUES ('115', '8', '成功領袖塑造- 知己知彼', 'LD0003C1', '柯迪爾著 朱玲億、呂政耾譯', '以琳', 1);
INSERT INTO `sys_books` VALUES ('116', '8', '成功領袖塑造- 敬神益人', 'LD0003C2', '柯迪爾著 朱玲億、呂政耾譯', '以琳', 1);
INSERT INTO `sys_books` VALUES ('117', '8', '成功領袖塑造- 慎思明辨', 'LD0003C3', '柯迪爾著 朱玲億、呂政耾譯', '以琳', 1);
INSERT INTO `sys_books` VALUES ('118', '8', '成功領袖塑造- 真知灼見', 'LD0003C4', '柯迪爾著 朱玲億、呂政耾譯', '以琳', 1);
INSERT INTO `sys_books` VALUES ('119', '8', '成功領袖塑造- 開發潛力', 'LD0003C5', '柯迪爾著 朱玲億、呂政耾譯', '以琳', 1);
INSERT INTO `sys_books` VALUES ('120', '8', '僕人領導學', 'LD0004C', '羅伯．格林里夫著 胡愈寧、周慧貞譯', '啟示出版社', 1);
INSERT INTO `sys_books` VALUES ('121', '8', '栽培領袖 - 耶穌會的人才學', 'LD0005C', '克里斯．勞尼著 陳曉夫譯', '啟示出版', 2);
INSERT INTO `sys_books` VALUES ('122', '8', '聖經領導學', 'LD0006C', '貝克特著 顧瓊華譯', '校園書房出版社', 1);
INSERT INTO `sys_books` VALUES ('123', '8', '中國國情第一課 - 解構胡溫新思維', 'LD0007C', '曾仲榮 著', '經濟日報出版社', 1);
INSERT INTO `sys_books` VALUES ('124', '8', '中國國情新一課 - 民富．國強．盛世夢', 'LD0008C', '曾仲榮 著', '經濟日報出版社', 1);
INSERT INTO `sys_books` VALUES ('125', '8', '把難處變為優勢：作蹣跚的領袖（習作本）', 'LD0009C', '艾倫德、鮑爾著 陳永財譯', '基道', 1);
INSERT INTO `sys_books` VALUES ('126', '8', '商業領袖的核心領導力', 'LD0010C', '聖座促進人類整體發展部', '明窗', 1);
INSERT INTO `sys_books` VALUES ('127', '8', '你也能帶領小組', 'LD0011C', '史蒂夫‧巴克', '校園書房出版社', 1);
INSERT INTO `sys_books` VALUES ('128', '8', '百大企業御用教練陳煥庭帶人的技術', 'LD0012C', '陳煥庭', '布克文化', 1);
INSERT INTO `sys_books` VALUES ('129', '10', '亦師亦友 － 雕琢生命師徒關係', 'MC0001C', '侯活．肯特勒斯、威廉．肯特勒斯', '學生福音團契出版社', 1);
INSERT INTO `sys_books` VALUES ('130', '10', '展翅上騰 - 教練入門', 'MC0002C', '勞根、趙錦德合著', '香港教會更新運動出版', 1);
INSERT INTO `sys_books` VALUES ('131', '10', '輔中有道 - 心理輔導與基督教信仰的整合', 'MC0003C', '區祥江、陳幼莉', '亮光文化有限公司', 1);
INSERT INTO `sys_books` VALUES ('132', '10', '基督徒也可以說不', 'MC0004C', '郁尼科', '宣道', 1);
INSERT INTO `sys_books` VALUES ('133', '10', '從聖經看如何處理失敗、羞愧、罪咎', 'MC0005C', '鄺炳釗', '天道書樓', 1);
INSERT INTO `sys_books` VALUES ('134', '10', 'EQ合夥人', 'MC0006C', '余德淳博士', '迎欣出版社', 1);
INSERT INTO `sys_books` VALUES ('135', '9', '你想要怎樣的工作', 'CC0001C', '吉竹伸介', '三采文化', 1);
INSERT INTO `sys_books` VALUES ('136', '9', '如何找到你真正想做的事', 'CC0002C', '池上彰', '親子天下', 1);
INSERT INTO `sys_books` VALUES ('137', '9', 'Mbti，你的職業性格是什麼？', 'CC0003C', '唐娜．鄧寧（Donna Dunning）', '日出出版／大雁出版基地', 1);
INSERT INTO `sys_books` VALUES ('138', '9', '你的CareerDNA', 'CC0004C', '施华兹', '电子工业出版社', 1);
INSERT INTO `sys_books` VALUES ('139', '9', '刻意練習', 'CC0005C', '安德斯.艾瑞克森, 羅伯特.普爾著; 陳繪茹譯', '方智', 1);
INSERT INTO `sys_books` VALUES ('140', '9', '完美練習', 'CC0006C', '道格.勒莫夫, 艾麗卡.伍爾維, 凱蒂.葉次作; 陳繪茹譯', '方智', 1);
INSERT INTO `sys_books` VALUES ('141', '9', '禮貌的力量', 'CC0007C', '克莉絲汀．波拉斯', '一起來出版', 1);
INSERT INTO `sys_books` VALUES ('142', '9', '我每天都想離職', 'CC0008C', '朴英祿作; 黃子玲譯', '麥田', 1);
INSERT INTO `sys_books` VALUES ('143', '9', 'MBTI人格分類', 'CC0009C', '伊莎貝爾.布里格斯.邁爾斯, 彼得.邁爾斯著; 鍾榕芳, 張芸禎譯', '遠流', 1);
INSERT INTO `sys_books` VALUES ('144', '9', '做自己的工作設計師', 'CC0010C', '比爾.柏內特, 戴夫.埃文斯著; 許恬寧譯', '大塊文化', 1);
INSERT INTO `sys_books` VALUES ('145', '9', '掌握人心的MBTI職場溝通術', 'CC0011C', '白種和(Baek Jonghwa)著; 張雅眉譯', '境好出版', 1);
INSERT INTO `sys_books` VALUES ('146', '9', '沒人看見的時候,就要過得舒舒服服', 'CC0012C', '內藤誼人著; 劉格安譯', '大牌', 1);
INSERT INTO `sys_books` VALUES ('147', '9', '成功人士都在做!鍛鍊大腦的超呼吸法', 'CC0013C', '關根朝之著; 白濱龍太郎監修; 涂紋凰譯', '時報文化', 1);
INSERT INTO `sys_books` VALUES ('148', '9', '拆解職場困局27招', 'CC0014C', '司徒永富,香港專業人才服務機構', '皇冠出版社(香港)有限公司', 1);
INSERT INTO `sys_books` VALUES ('149', '9', '反思．協作：神學教育新想像', 'CC0015C', '黃國維、黎高穎怡 編', '中國神學研究院', 2);
INSERT INTO `sys_books` VALUES ('150', '9', '中場新起點：走出迷惘，邁向614有意思自助式人生', 'CC0016C', '黃德芳, 謝宜汝', '格子外面', 1);
INSERT INTO `sys_books` VALUES ('151', '9', '提問力實踐指南：掌握學習設計新思維', 'CC0017C', '藍偉瑩', '親子天下', 1);
INSERT INTO `sys_books` VALUES ('152', '9', '領導者的蛻變', 'CC0018C', 'Jennifer Garvey Berge著 陳穎堅譯', '喝采多媒體有限公司', 1);
INSERT INTO `sys_books` VALUES ('153', '9', '隨身遊戲', 'CC0019C', '卓王詠詩、鍾樹森', '小魚亮光', 1);
INSERT INTO `sys_books` VALUES ('154', '9', '正向教育火伴師：青少年成夢12傳奇', 'CC0020C', '束濟良 編著', '領導力培訓學院', 1);
INSERT INTO `sys_books` VALUES ('155', '10', 'A True Guide To ADHD Coaching for Kids and Adults', 'CN0001C', 'Craig Peckham MD', 'Independently Published', 1);
INSERT INTO `sys_books` VALUES ('156', '10', '依然真摯與忠誠：談成人亞斯伯格症與自閉症', 'CN0002C', '簡意玲', '心靈工坊', 1);
INSERT INTO `sys_books` VALUES ('157', '10', '精神病臨床個案管理', 'CN0003C', '黃富強 著/ 黃富強、喻慧敏 譯', '中文大學出版社', 1);
INSERT INTO `sys_books` VALUES ('158', '10', '職場優升學: 25個自我優化、能力躍遷的長勝法則', 'CN0004C', '方植永 (小安老師)', '平安文化有限公司', 1);
INSERT INTO `sys_books` VALUES ('159', '10', 'DSM-5®精神疾病鑑別診斷手冊', 'CN0005C', 'Michael B. First', '合記圖書出版社', 1);
INSERT INTO `sys_books` VALUES ('160', '10', '情緒大飯店', 'CN0006C', '莉迪亞．布蘭科維琪', '小典藏出版', 1);
INSERT INTO `sys_books` VALUES ('161', '10', '曲「哲」離奇 : 一位哲學家的復元旅程', 'CN0007C', '陳麗珊', '香港心理衛生會', 1);
INSERT INTO `sys_books` VALUES ('162', '10', '冒牌者症候群', 'CN0008C', '潔薩米．希伯德', '商周出版', 1);
INSERT INTO `sys_books` VALUES ('163', '10', '治療導航 心靈輔導5堂課', 'CN0009C', '周若琦', '香港青年協會', 1);
INSERT INTO `sys_books` VALUES ('164', '10', '別跟內心怪獸拔河', 'CN0010C', '湯國鈞; 黃志明', '突破出版社', 1);
INSERT INTO `sys_books` VALUES ('165', '10', '氣質，是你最重要的價值', 'CN0011C', '塞繆爾‧斯邁爾斯', '海鴿', 1);
INSERT INTO `sys_books` VALUES ('166', '10', '習慣改變命運', 'CN0012C', '區祥江教授', '亮光文化', 1);
INSERT INTO `sys_books` VALUES ('167', '10', '慣習Habitus', 'CN0013C', '朵莉絲.馬爾汀(Doris Märtin)著; 劉于怡譯', '先覺', 1);
INSERT INTO `sys_books` VALUES ('168', '10', '如果害怕上班,呼叫MBTI', 'CN0014C', '曹受妍著; 莊曼淳譯', '方舟文化', 1);
INSERT INTO `sys_books` VALUES ('169', '10', '我為何會這樣?', 'CN0015C', '王凱琳著', '商周', 1);
INSERT INTO `sys_books` VALUES ('170', '10', '從聽故事開始療癒', 'CN0016C', '胡嘉琪著', '張老師', 1);
INSERT INTO `sys_books` VALUES ('171', '10', '做最好的自己——十五堂女性情商課', 'CN0017C', '楊文利', '非凡出版', 1);
INSERT INTO `sys_books` VALUES ('172', '10', '20位心理學大師的人生必修課', 'CN0018C', '遲毓凱著', '幸福文化', 1);
INSERT INTO `sys_books` VALUES ('173', '10', '我們在照顧中相伴', 'CN0019C', '盧家詠', '信報出版社', 1);
INSERT INTO `sys_books` VALUES ('174', '10', '別讓原生定義餘生', 'CN0020C', '吳芷嫣; 黃沛霖博士', '蜂鳥出版', 1);
INSERT INTO `sys_books` VALUES ('175', '10', '教牧研討系列6：教牧心靈健康的危機與建立', 'CN0021C', '林榮樹 主編', '崇基學院神學院', 1);
INSERT INTO `sys_books` VALUES ('176', '10', '圖解情緒教育與管理', 'CN0022C', '邱珍琬', '五南圖書', 1);
INSERT INTO `sys_books` VALUES ('177', '10', '過猶不及：如何建立你的心理界線', 'CN0023C', '亨利．克勞德、約翰．湯森德', '道聲', 1);
INSERT INTO `sys_books` VALUES ('178', '10', '處理壓力與情緒', 'CN0024C', '蘇劉君玉', '香港基督徒畢業生團契', 1);
INSERT INTO `sys_books` VALUES ('179', '10', '我們都有小憂鬱', 'CN0025C', 'Hossy', '時報文化', 1);
INSERT INTO `sys_books` VALUES ('180', '10', '與祢相遇', 'CN0026C', '梁秀珊', '宗教教育中心', 1);
INSERT INTO `sys_books` VALUES ('181', '10', '生涯諮商：優勢、多元、全方位', 'CN0028C', 'Norman C. Gysbers, Mary J. Heppner, Joseph A. Johnston', '心理', 1);
INSERT INTO `sys_books` VALUES ('182', '10', '華人生涯理論與實踐', 'CN0029C', '台灣生涯發展與諮詢學會策劃, 金樹人, 黃素菲', '心理', 1);
INSERT INTO `sys_books` VALUES ('183', '10', '生涯諮商與輔導(重修版)(2版)', 'CN0030C', '金樹人', '東華', 1);
INSERT INTO `sys_books` VALUES ('184', '10', '生涯諮商與輔導 (1版)', 'CN0031C', '田秀蘭 著', '學富文化', 1);
INSERT INTO `sys_books` VALUES ('185', '10', '職業生涯規劃與輔導', 'CN0032C', '呂厚超 主編', '崧燁文化', 1);
INSERT INTO `sys_books` VALUES ('186', '10', '生涯理論與實務工作：案例學習', 'CN0033C', 'Jane L. Swanson,Nadya A. Fouad', '巨流圖書公司', 1);
INSERT INTO `sys_books` VALUES ('187', '11', '攰了，躺躺吧——為超載心靈減重', 'MH0001C', '伍詠光', '突破出版社', 1);
INSERT INTO `sys_books` VALUES ('188', '11', '接納與承諾：重建心理彈性．活出意義人生', 'MH0002C', '湯國鈞', '突破出版社', 1);
INSERT INTO `sys_books` VALUES ('189', '11', '伊莫的心靈感冒：101個療鬱處方箋', 'MH0003C', '所長任有病', '時報出版', 1);
INSERT INTO `sys_books` VALUES ('190', '11', '100 個香港青年人的故事', 'MH0004C', '陳友凱 陸志文 王名彥 蘇以晴', '匯智出版', 1);
INSERT INTO `sys_books` VALUES ('191', '11', '走過黑暗幽谷', 'MH0005C', '曾繁光', '花千樹', 1);
INSERT INTO `sys_books` VALUES ('192', '11', '別踩過界！', 'MH0006C', '吳崇欣', '信報出版社', 1);
INSERT INTO `sys_books` VALUES ('193', '11', '青年精神醫學', 'MH0007C', '陳友凱,黃德興', '匯智出版有限公司', 1);
INSERT INTO `sys_books` VALUES ('194', '11', '輔導與心理治療', 'MH0008C', '林孟平著', '商務印書館(香港)有限公司', 1);
INSERT INTO `sys_books` VALUES ('195', '12', '中國各地商人性格特徵調查報告', 'MG0001C', '陳冠任', '當代中國出版社', 1);
INSERT INTO `sys_books` VALUES ('196', '12', '上有政策，下有對策', 'MG0002C', '史考特‧亞當斯著 伍憲譯', '中國工商出版社', 1);
INSERT INTO `sys_books` VALUES ('197', '12', '影響你一生的158個商業寓言', 'MG0003C', '高銘 編著', '中國商業出版社', 1);
INSERT INTO `sys_books` VALUES ('198', '12', '溫家寶治國新班子', 'MG0004C', '陳昊、羅皓 合著', '香港新華彩印出版社', 1);
INSERT INTO `sys_books` VALUES ('199', '12', '聖經管理解碼', 'MG0005C', '賴瑞‧巴克著 黃莉莉、談清華譯', '團結出版社', 1);
INSERT INTO `sys_books` VALUES ('200', '12', '頂尖猶太商法 - 22：78', 'MG0006C', '司馬舜著 石沅朋譯', '時代文藝出版社', 1);
INSERT INTO `sys_books` VALUES ('201', '12', '魚 : 一種提高士氣和改善業績的奇妙方法', 'MG0007C', '斯蒂芬‧倫丁、哈里‧保羅、約翰‧克里斯坦森等著 秦玉熙譯', '中信出版社', 1);
INSERT INTO `sys_books` VALUES ('202', '12', '卓越背後的力量', 'MG0008C', '吉姆‧安德伍德著 曹建海、楊有志譯', '中信出版社', 1);
INSERT INTO `sys_books` VALUES ('203', '12', '解讀中國營銷', 'MG0009C', '盧泰宏著', '中國社會科學出版社', 1);
INSERT INTO `sys_books` VALUES ('204', '12', '經理人管理培訓遊戲全案', 'MG0010C', '經理人培訓項目編寫組', '機械工業出版社', 1);
INSERT INTO `sys_books` VALUES ('205', '12', '戶外培訓遊戲大全', 'MG0011C', '盖瑞凱朗特著', '企業管理出版社', 1);
INSERT INTO `sys_books` VALUES ('206', '12', '激蕩三十年 - 中國企業1978-2008 上', 'MG0012C', '吳曉波 著', '中信出版社/浙江人民出版社', 1);
INSERT INTO `sys_books` VALUES ('207', '12', '激蕩三十年 - 中國企業1978-2008 下', 'MG0013C', '吳曉波 著', '中信出版社/浙江人民出版社', 1);
INSERT INTO `sys_books` VALUES ('208', '12', '管理箴言-聖經智慧活用於現代職場', 'MG0014C', '薛迦里著 江森譯', '福音證主協會', 2);
INSERT INTO `sys_books` VALUES ('209', '12', '一位基督徒的企業營運哲學', 'MG0015C', '李培康著', '海天書樓', 2);
INSERT INTO `sys_books` VALUES ('210', '12', '你的管理神奇寶貝 - Power Tools', 'MG0016C', 'Sam Deep、Lyle Sussman合著 王詠心譯', '臉譜出版', 1);
INSERT INTO `sys_books` VALUES ('211', '12', '商場真君子 － 作個成功的商人', 'MG0017C', '尹潤芳 編譯', '宗教教育中心', 3);
INSERT INTO `sys_books` VALUES ('212', '12', '企業贏家－工商人充電５２要訣 (1)', 'MG0018C', '惠特．柯里斯威爾著 馬長生／陳昱臻譯', '天恩出版社', 1);
INSERT INTO `sys_books` VALUES ('213', '12', '企業贏家－工商人充電５２要訣 (2)', 'MG0019C', 'CRISWELL Whit', '國際基督徒工商人員協會中華民國總會', 1);
INSERT INTO `sys_books` VALUES ('214', '12', '一分鐘激勵', 'MG0020C', '肯．布蘭查著 阮貞樺譯', '晨星出版', 1);
INSERT INTO `sys_books` VALUES ('215', '12', '營商有道 企業管治新思維', 'MG0021C', '司徒永富 鄭治洪著', '匯智出版', 1);
INSERT INTO `sys_books` VALUES ('216', '12', '教會行政管理學', 'MG0022C', '蘇文隆 著', '華神出版社', 1);
INSERT INTO `sys_books` VALUES ('217', '12', '上帝的企管學', 'MG0023C', '保羅．史蒂文斯著 何明珠譯', '校園書房出版社', 2);
INSERT INTO `sys_books` VALUES ('218', '12', '社企營商二十式', 'MG0024C', NULL, '香港特別行政區政府民政事務局', 1);
INSERT INTO `sys_books` VALUES ('219', '12', '以神為本的概念', 'MG0025C', '汪善儀', '祚顧問公司', 2);
INSERT INTO `sys_books` VALUES ('220', '12', '受託僕人(一)', 'MG0026C', '汪善儀', '祚顧問公司', 1);
INSERT INTO `sys_books` VALUES ('221', '12', '研磨商業力', 'MG0027C', '大前研一著; 陳柏誠譯', '天下雜誌', 1);
INSERT INTO `sys_books` VALUES ('222', '12', '教曉員工高飛', 'MG0028C', '司徒永富 著', 'Enrich Publishing Limited', 1);
INSERT INTO `sys_books` VALUES ('223', '12', '工作樂透學', 'MG0029C', '丹尼斯・傑夫,辛亞西・史考特, 葛倫・托比作; 劉蘊芳譯', '經典傳訊文化', 1);
INSERT INTO `sys_books` VALUES ('224', '12', '摩托車修理店的未來工作哲學', 'MG0030C', 'Matthew B. Crawford著; 林茂昌譯', '大塊文化', 1);
INSERT INTO `sys_books` VALUES ('225', '12', '管理有道生活優遊', 'MG0031C', '張金城', '福音證主協會', 1);
INSERT INTO `sys_books` VALUES ('226', '12', '道出管理', 'MG0032C', '李志剛、張金城主編', '福音證主協會', 1);
INSERT INTO `sys_books` VALUES ('227', '12', '營商能耐可以改變社會', 'MG0033C', '紀治興', '思網絡', 1);
INSERT INTO `sys_books` VALUES ('228', '12', '彼得・杜拉克送給管理者的 12 堂課', 'MG0034C', 'Daniel Brian', '悦讀名品文化出版社', 1);
INSERT INTO `sys_books` VALUES ('229', '12', '圖說彼得.杜拉克的管理學', 'MG0035C', '津田太愚', '臺灣東販', 1);
INSERT INTO `sys_books` VALUES ('230', '12', '玫琳凱談人的管理', 'MG0036C', '艾施(Mary Kay Ash)著,陳淑琴,范麗娟合譯', '台北市長河民', 1);
INSERT INTO `sys_books` VALUES ('231', '12', '傳承者們．接力印記', 'MG0037C', '李志誠博士、林志成、許嘉明聯合撰寫', '華人家族傳承研究所出版社', 1);
INSERT INTO `sys_books` VALUES ('232', '12', '少年錢滋味－－花錢X賺錢', 'MG0038C', '李志誠博士、關顯彬校長、曾敏儀女士及陳惠妍小姐聯合撰寫', '華人家族傳承研究所出版社', 1);
INSERT INTO `sys_books` VALUES ('233', '13', '笑傲職場', 'MM0001C', '司徒永富、袁海柏、林志輝、曾雪瑩、郭鴻標、龔立人等著', '天道書樓', 1);
INSERT INTO `sys_books` VALUES ('234', '13', '職場即禾場', 'MM0002C', '翁麗玉 著', '道聲出版社', 1);
INSERT INTO `sys_books` VALUES ('235', '13', '轉變中的成長 : 香港教會研究 2006', 'MM0003C', '胡志偉、霍安琪 編輯', '香港教會更新運動出版', 1);
INSERT INTO `sys_books` VALUES ('236', '13', '教會回應 全球化的外國經驗', 'MM0004C', '阮美賢 著', '信義宗神學院、香港基督徒學會', 1);
INSERT INTO `sys_books` VALUES ('237', '13', '職場事奉與恩膏', 'MM0005C', '里奇．馬歇爾著 國度編譯小組譯', '國度雜誌社', 1);
INSERT INTO `sys_books` VALUES ('238', '13', '紅筆生涯', 'MM0006C', '林來慰 著', '宣道出版社', 1);
INSERT INTO `sys_books` VALUES ('239', '13', '從警察故事看職場事奉', 'MM0007C', '龔柏成 著', '天道書樓出版', 1);
INSERT INTO `sys_books` VALUES ('240', '13', '學會講，學會學', 'MM0008C', '錢北斗 著', '宣道出版社', 1);
INSERT INTO `sys_books` VALUES ('241', '13', '青蛙與蜥蝪 - 市場牧養事工的反思', 'MM0009C', 'Gordon Preece, Timothy Liu, Wong Siew Li著 婁志翔、龍仕華譯', 'William Carey Library', 1);
INSERT INTO `sys_books` VALUES ('242', '13', '縱橫職場秘笈', 'MM0010C', '司徒永富', '道声出版社', 1);
INSERT INTO `sys_books` VALUES ('243', '13', '牧養新契機-開展職場牡養新一頁', 'MM0011C', '馬可．格林著 伍鳳媚譯', '香港專業人才服務機構（HKPES）', 8);
INSERT INTO `sys_books` VALUES ('244', '13', '教會在職場 信徒轉化社會的祕訣', 'MM0012C', 'C. Peter Wagner; 魏格納', '基督教以琳書房', 1);
INSERT INTO `sys_books` VALUES ('245', '13', '職場優升學: 25個自我優化、能力躍遷的長勝法則', 'MM0013C', '方植永 (小安老師)', '平安文化有限公司', 1);
INSERT INTO `sys_books` VALUES ('246', '13', '職場會傷人', 'MM0014C', '方植永（小安老師）', '采實文化', 1);
INSERT INTO `sys_books` VALUES ('247', '13', '不一样的工作：职场探讨22课', 'MM0015C', '刘汉中', '证主', 1);
INSERT INTO `sys_books` VALUES ('248', '13', '厭世代的工作成長學', 'MM0016C', '毛樂祈', '校園書房出版社', 1);
INSERT INTO `sys_books` VALUES ('249', '13', '工作真重要 向聖經人物學工作', 'MM0017C', '史蒂文斯', '校園書房', 1);
INSERT INTO `sys_books` VALUES ('250', '13', '用你的工作轉動世界', 'MM0018C', 'Lee Hardy', '校園書房', 1);
INSERT INTO `sys_books` VALUES ('251', '13', '工作魅力 連結你的工作與上帝的工作', 'MM0019C', '提摩太．凱勒; 凱薩琳．李芮．阿斯多夫', '希望之聲文化有限公司', 1);
INSERT INTO `sys_books` VALUES ('252', '13', '職場大嬴家', 'MM0020C', '薛門，韓立克', '橄欖', 1);
INSERT INTO `sys_books` VALUES ('253', '13', '職場牧者訴心聲', 'MM0021C', '陳啟興', '浸信會', 1);
INSERT INTO `sys_books` VALUES ('254', '13', 'iFollow: 門徒成長手冊', 'MM0023C', '校園同工團隊著', '校園書房', 1);
INSERT INTO `sys_books` VALUES ('255', '13', '被陶造成前鋒的後衛', 'MM0024C', '蔡志森', '明光社', 1);
INSERT INTO `sys_books` VALUES ('256', '13', '藝術、信仰、人生', 'MM0025C', '陳若愚', '中國神學研究院', 1);
INSERT INTO `sys_books` VALUES ('257', '13', '幸福的果子 19個教會轉化社區幸福故事', 'MM0026C', '馬秀娟', '教會關懷貧窮網絡', 1);
INSERT INTO `sys_books` VALUES ('258', '13', '醫學、人生、愛', 'MM0027C', '香港基督徒醫生及牙醫團契', '環球天道傳基協會', 1);
INSERT INTO `sys_books` VALUES ('259', '13', '教會．空間．轉型', 'MM0028C', '王緯彬', '印象文字 Inpress', 1);
INSERT INTO `sys_books` VALUES ('260', '13', '神學．轉化．行動', 'MM0029C', '陳敏斯 主編', '柏祺城巿轉化中心、基道', 1);
INSERT INTO `sys_books` VALUES ('261', '13', '聖經觀點的經濟學', 'MM0030C', '維克多．克雷爾，羅賓．柯雷著 陳英譯', '校園書房', 1);
INSERT INTO `sys_books` VALUES ('262', '13', '基督教商業倫理導論', 'MM0031C', '何建宇、林志成', '播道會文字部', 1);
INSERT INTO `sys_books` VALUES ('263', '13', '21世紀教會成長學', 'MM0032C', '提摩太．凱勒著 何明珠譯', '校園書房', 1);
INSERT INTO `sys_books` VALUES ('264', '14', '不一樣的人生: 糊口, 樂業, 從聖經看工作', 'MT0001C', '劉志雄', '提比哩亞出版社', 1);
INSERT INTO `sys_books` VALUES ('265', '14', '顧客就是上帝－開心寫意的工作觀', 'MT0002C', '葉松茂 著', '天道出版社', 3);
INSERT INTO `sys_books` VALUES ('266', '14', '為誰辛苦為誰忙 基督徒工作觀的探討', 'MT0003C', '楊世禮 著', '宣道出版社', 1);
INSERT INTO `sys_books` VALUES ('267', '14', '理想你想工作此中尋', 'MT0004C', '史蒂文斯 蕭伯格 合著', '天道書樓有限公司 HKPES', 1);
INSERT INTO `sys_books` VALUES ('268', '14', '朝向職場神學的建構', 'MT0005C', '郭鴻標 著', '德慧文化', 1);
INSERT INTO `sys_books` VALUES ('269', '14', '培靈講道', 'MT0006C', '78屆港九培靈研經會出版', NULL, 1);
INSERT INTO `sys_books` VALUES ('270', '14', '工作哲學圖鑑', 'MT0007C', '村山昇著 陳亦苓譯', '悅之文化', 1);
INSERT INTO `sys_books` VALUES ('271', '14', '「以神為本」的管理與行政：理論及整合', 'MT0008C', '汪善儀; 福音證主協會', 'Christian Communications Limited', 1);
INSERT INTO `sys_books` VALUES ('272', '14', '基督教文化的挑戰 登山寶訓精研', 'MT0009C', 'John R. W. Stott', '宣道出版社', 1);
INSERT INTO `sys_books` VALUES ('273', '14', '轉向 聖經+公共', 'MT0010C', '謝品然', '研道社有限公司聖經研究及應用中心', 1);
INSERT INTO `sys_books` VALUES ('274', '14', '紛擾世情中的信仰立場', 'MT0011C', '張慕皚、蕭壽華等', '宣道', 1);
INSERT INTO `sys_books` VALUES ('275', '14', '權力與激情：六個追尋復活的人物', 'MT0012C', '韋爾斯 (Samuel Wells)', '基道', 1);
INSERT INTO `sys_books` VALUES ('276', '14', '憑你恩言 實用基督徒手冊', 'MT0013C', '郭鴻標; Simon S. M. Wong', '基道出版社', 1);
INSERT INTO `sys_books` VALUES ('277', '14', '市場聖約：神學與經濟學的對話', 'MT0014C', '李適清', '基道、中國神學研究院', 1);
INSERT INTO `sys_books` VALUES ('278', '14', '主場經濟學', 'MT0015C', '王澤基/ 潘凱媛', '天窗出版社有限公司', 1);
INSERT INTO `sys_books` VALUES ('279', '14', 'The Pleasures and Sorrows of Work', 'MT0016C', 'Alain De Botton', 'Hamish Hamilton', 1);
INSERT INTO `sys_books` VALUES ('280', '14', '應對職場衝突句式聖經', 'MT0017C', '凱琳‧赫特, 大衛‧戴伊', '橡實文化', 1);
INSERT INTO `sys_books` VALUES ('281', '14', '邊緣上的神學反思', 'MT0018C', '賴品超', '基督教文藝出版社', 1);
INSERT INTO `sys_books` VALUES ('282', '15', '傳教與教育 - 基督教與中國近現代教育', 'OS0001C', '王忠欣著', '加拿大福音證主協會', 1);
INSERT INTO `sys_books` VALUES ('283', '15', '相思華西垻 - 華西協合大學', 'OS0002C', '張麗萍 編著', '河北教育出版社', 1);
INSERT INTO `sys_books` VALUES ('284', '15', '認識中國宗教政策', 'OS0003C', '廉正明著', '明報出版社', 1);
INSERT INTO `sys_books` VALUES ('285', '15', '當代中國社會階層研究報告', 'OS0004C', '陸學藝 主編', '社會科學文獻出版社', 1);
INSERT INTO `sys_books` VALUES ('286', '15', '基督教在華出版事業 (1912-1949)', 'OS0005C', '何凱立著 陳建明、王再興 譯', '四川大學出版社', 1);
INSERT INTO `sys_books` VALUES ('287', '15', '神州拾穗', 'OS0006C', '招梁碧冕 著', '浸信會出版社', 1);
INSERT INTO `sys_books` VALUES ('288', '15', '中國文化新視域:從基督教觀點看中國文化', 'OS0007C', '楊慶球 著', '聯合出版集團', 1);
INSERT INTO `sys_books` VALUES ('289', '15', '堂會確是一間有限公司', 'OS0008C', '馬保羅 著', '基道出版社', 1);
INSERT INTO `sys_books` VALUES ('290', '15', '職青逆溯: 與職青信徒共闖新出路', 'OS0009C', '王德福 著', '匯美書社', 1);
INSERT INTO `sys_books` VALUES ('291', '15', '奇異恩典在中年', 'OS0010C', '王志學 著', '基道出版社', 1);
INSERT INTO `sys_books` VALUES ('292', '15', '心意更新的教會', 'OS0011C', '斯托得著 譚達峰譯', '校園書房出版社', 1);
INSERT INTO `sys_books` VALUES ('293', '15', '神秘文明啟示錄', 'OS0012C', 'Dr. Donald E. Chittick著 楊信成編譯', '宣道出版社', 1);
INSERT INTO `sys_books` VALUES ('294', '15', '耶利米書析續 -愛的審判生命的應許', 'OS0013C', '熊潤榮 著', '基道出版社', 1);
INSERT INTO `sys_books` VALUES ('295', '15', '教會 不成教會', 'OS0014C', '鄧紹光 主編', '基道出版社', 1);
INSERT INTO `sys_books` VALUES ('296', '15', '開放的文本 聖經學和公共神學的初探', 'OS0015C', '謝品然 著', '研道社有限公司', 1);
INSERT INTO `sys_books` VALUES ('297', '15', '上帝與公共生活 神學的全球公共視域', 'OS0016C', '謝品然、曾慶豹 著', '研道社有限公司', 1);
INSERT INTO `sys_books` VALUES ('298', '15', '教牧心靈健康的危機與建立', 'OS0017C', '林榮樹 主編', '崇基學院神學院', 1);
INSERT INTO `sys_books` VALUES ('299', '15', '用消費改變世界：公平貿易@新社會經濟運動', 'OS0018C', '鄒崇銘; 韓江雪; 楊夢瑩', '印象文字、香港公平貿易動力', 1);
INSERT INTO `sys_books` VALUES ('300', '15', '神秘文明啟示錄：上古人＝原始人？', 'OS0019C', 'Donald E. Chittick', '楊信成', 1);
INSERT INTO `sys_books` VALUES ('301', '15', '大學歧途 高尚學府變貪腐王國', 'OS0020C', '林本利', '藍天圖書', 1);
INSERT INTO `sys_books` VALUES ('302', '15', '鹹魚也發夢', 'OS0021C', '陳杰博士', '升出版有限公司', 1);
INSERT INTO `sys_books` VALUES ('303', '15', '城市思', 'OS0022C', '古斌', '天道書樓', 1);
INSERT INTO `sys_books` VALUES ('304', '15', '聖道精華：馬丁路德小問答略解附註', 'OS0023C', '馬丁路德 (Martin Luther)', '中華福音道路德會', 1);
INSERT INTO `sys_books` VALUES ('305', '15', '50歲後', 'OS0024C', '蔡東豪', '天窗', 1);
INSERT INTO `sys_books` VALUES ('306', '15', '開爐 超越味蕾蛋撻王', 'OS0025C', '李志誠博士', '華人家族傳承研究所', 1);
INSERT INTO `sys_books` VALUES ('307', '15', '退休乐逍遥', 'OS0026C', '卫生署长者健康服务; 香港长者健康服务', '天地图书有限公司', 1);
INSERT INTO `sys_books` VALUES ('308', '15', '圖解社會學', 'OS0028C', '吳逸驊', '易博士出版社', 1);
INSERT INTO `sys_books` VALUES ('309', '15', '供不得其所：香港長遠房屋策略新視野', 'OS0029C', '本土研究社', '本土研究社', 1);
INSERT INTO `sys_books` VALUES ('310', '16', '喜悅在自心 - 一個基督徒的認信', 'SF0001C', '吳思源', '次文化堂', 1);
INSERT INTO `sys_books` VALUES ('311', '16', '天天瀟灑工作', 'SF0002C', 'Odette Pollar著 G.M. TEAM譯', '精美出版', 1);
INSERT INTO `sys_books` VALUES ('312', '16', '主管的禱告大有功效', 'SF0003C', '歐榮均譯', '香港亞洲歸主協會', 2);
INSERT INTO `sys_books` VALUES ('313', '16', '別留上帝在Reception', 'SF0004C', '林永強著', '商區福音使團', 2);
INSERT INTO `sys_books` VALUES ('314', '16', '標竿人生', 'SF0005C', '華理克著 楊高俐理譯', '基督使者協會', 1);
INSERT INTO `sys_books` VALUES ('315', '16', '男人真面目 - 作個成熟的男人', 'SF0006C', '陳國林編譯', '宗教教育中心', 1);
INSERT INTO `sys_books` VALUES ('316', '16', '教堂以外的信仰', 'SF0007C', '蘇穎睿、蘇劉君玉 合著', '全心出版社', 1);
INSERT INTO `sys_books` VALUES ('317', '16', '當工作遇上安息', 'SF0008C', '趙崇明、邵樟平 合編', '基道', 1);
INSERT INTO `sys_books` VALUES ('318', '16', '愛上星期一', 'SF0009C', '貝克特著 徐中緒譯', '校園書房出版社', 1);
INSERT INTO `sys_books` VALUES ('319', '16', '布衣神僕－在你的職業上建立祭壇', 'SF0010C', '陳天賜', '更新資源', 1);
INSERT INTO `sys_books` VALUES ('320', '16', '工作夢飛翔－穿越逆境的屬靈智慧', 'SF0011C', '李錦洪', '阿湯圖書', 1);
INSERT INTO `sys_books` VALUES ('321', '16', '恩賜好管家 － 善用天賦的才幹', 'SF0012C', '李愛雲 編譯', '宗教教育中心', 1);
INSERT INTO `sys_books` VALUES ('322', '16', '馳騁職場中', 'SF0013C', '李力斯著 鄺偉文譯', '道聲出版社', 1);
INSERT INTO `sys_books` VALUES ('323', '16', '你能不能不工作', 'SF0014C', '厄尼．J．澤林斯基著 吳婷、姚藝桑譯', '中信出版', 1);
INSERT INTO `sys_books` VALUES ('324', '16', '你能不能不工作', 'SF0015C', '吳思源', '福音證主協會', 1);
INSERT INTO `sys_books` VALUES ('325', '16', '如何邁向真成功', 'SF0016C', '鄺炳釗 著', '天道出版社', 1);
INSERT INTO `sys_books` VALUES ('326', '16', '生命贏家 - 得勝生活50要訣', 'SF0017C', 'MATTOX Rober', '國際基督徒工商人員協會中華民國總會', 1);
INSERT INTO `sys_books` VALUES ('327', '16', '目的人生系列 － 職場特工', 'SF0018C', '林榮樹 著', '福音證主協會', 1);
INSERT INTO `sys_books` VALUES ('328', '16', '行動中的默觀者', 'SF0019C', '貝瑞、杜赫提合著 張令憙、曾玉琴合譯', '光啟文化', 1);
INSERT INTO `sys_books` VALUES ('329', '16', '尋求美好人生的自我理解', 'SF0020C', '鄭漢文、鄧雪貞、吳玉樹 合著', '學生福音團契出版社', 1);
INSERT INTO `sys_books` VALUES ('330', '16', '事奉生命的建立', 'SF0021C', '郭鴻標 著', '基道出版社', 1);
INSERT INTO `sys_books` VALUES ('331', '16', '信心飛揚 - 讀雅各書與靈命復修', 'SF0022C', '楊世禮 著', '宣道出版社', 1);
INSERT INTO `sys_books` VALUES ('332', '16', '愛主優先', 'SF0023C', '梁家麟 著', '建道神學院', 1);
INSERT INTO `sys_books` VALUES ('333', '16', '情深的基因 - 一位科學家的成長路', 'SF0024C', '徐國榮 著', '浸信會出版社', 1);
INSERT INTO `sys_books` VALUES ('334', '16', '轉化的心', 'SF0026C', '楊其輝 著', '迎欣出版社', 1);
INSERT INTO `sys_books` VALUES ('335', '16', '工作是一份禮物', 'SF0027C', '海特利著 陳曉微譯', '校園書房出版社', 1);
INSERT INTO `sys_books` VALUES ('336', '16', '隱藏的整全-朝向不再分割的生命', 'SF0028C', 'Parker J. Palmer著 陳永財譯', '基道出版社', 1);
INSERT INTO `sys_books` VALUES ('337', '16', '生命成長17課─學習聖靈果子和八福', 'SF0029C', '羅慶才 著', '基道出版社', 1);
INSERT INTO `sys_books` VALUES ('338', '16', '與潘霍華一同默想主的降生', 'SF0030C', '潘霍華著 陳永財譯', '基道出版社', 1);
INSERT INTO `sys_books` VALUES ('339', '16', '基督徒靜觀靈修', 'SF0031C', '譚沛泉 著', '基督教靜觀靈修學會', 1);
INSERT INTO `sys_books` VALUES ('340', '16', '個人職業心理分析─不想上錯班', 'SF0032C', '區祥江 著', '亮光文化', 1);
INSERT INTO `sys_books` VALUES ('341', '16', '翱翔工作間', 'SF0033C', '區祥江 著', '突破出版社', 1);
INSERT INTO `sys_books` VALUES ('342', '16', '從永富到永富 做個聰明的生命投資者', 'SF0034C', '司徒永富', '福音證主協會', 1);
INSERT INTO `sys_books` VALUES ('343', '16', '不再一樣的工作間', 'SF0035C', 'Mike C. Rogers', '浸信會出版社(國際)有限公司', 1);
INSERT INTO `sys_books` VALUES ('344', '16', '迎向苦難的呼召', 'SF0036C', '楊錫鏘; 關韻韶', '香港基督徒學生福音團契', 1);
INSERT INTO `sys_books` VALUES ('345', '16', '市井聖徒II (修訂五刷)', 'SF0037C', '何盛華 主編', '香港基督徒學生福音團契 (FES) 出版', 1);
INSERT INTO `sys_books` VALUES ('346', '16', '穿起西裝不會變高層, 返了教會不會變好人', 'SF0038C', '關嘉亮', '街坊出版', 1);
INSERT INTO `sys_books` VALUES ('347', '16', 'Happier, No Matter What', 'SF0040C', 'Tal Ben-Shahar', 'The Experiment', 1);
INSERT INTO `sys_books` VALUES ('348', '16', '心境，決定你的處境', 'SF0041C', '何權峰', '高寶', 1);
INSERT INTO `sys_books` VALUES ('349', '16', '基督是餐桌之主：飲食神學小革命', 'SF0042C', '瑞秋．史東著 秦蘊璞譯', '校園書房', 1);
INSERT INTO `sys_books` VALUES ('350', '16', '迎向光明：靈修版', 'SF0043C', '紐頓 (Joseph Fort Newton)', '基督教文藝', 1);
INSERT INTO `sys_books` VALUES ('351', '16', '神．經．遊戲：上帝，經驗與遊戲', 'SF0044C', '鍾樹森', '德慧文化', 1);
INSERT INTO `sys_books` VALUES ('352', '16', '隱藏的整全：朝向不再分割的生命', 'SF0046C', '帕克．帕爾默著 陳永財譯', '基道', 1);
INSERT INTO `sys_books` VALUES ('353', '16', '讓心意可以更新的勇氣', 'SF0047C', '區祥江', '亮光文化', 1);
INSERT INTO `sys_books` VALUES ('354', '16', '讓心意可以更新', 'SF0048C', '區祥江', '亮光文化', 1);
INSERT INTO `sys_books` VALUES ('355', '16', '願心轉化', 'SF0049C', '區祥江', '亮光文化', 1);
INSERT INTO `sys_books` VALUES ('356', '17', '辦公室政治', 'WC0001C', '陳謙遜 編著', '當代世界出版社', 1);
INSERT INTO `sys_books` VALUES ('357', '17', '阿爾伯特‧哈伯德的職場智慧', 'WC0002C', '阿爾伯特‧哈伯德著 夏基山編譯', '九角文化', 1);
INSERT INTO `sys_books` VALUES ('358', '17', '辦公室EQ政治', 'WC0003C', '何燕萍 編', '新成圖書貿易公司', 1);
INSERT INTO `sys_books` VALUES ('359', '17', '與智慧飛翔', 'WC0004C', '李錦洪 著', '學生福音團契', 1);
INSERT INTO `sys_books` VALUES ('360', '17', '從NO到GO', 'WC0005C', '大衞．麥肯納著 葛窈君譯', '啟示出版', 1);
INSERT INTO `sys_books` VALUES ('361', '17', '七日全職信仰', 'WC0006C', '史蒂文斯著 陳永財譯', '天道書樓有限公司', 1);
INSERT INTO `sys_books` VALUES ('362', '17', '敬業 - 美國員工職業精神培訓手冊', 'WC0007C', '詹姆斯‧H‧羅賓斯著 曼麗譯', '世界圖書出版公司', 1);
INSERT INTO `sys_books` VALUES ('363', '17', '辦公室通勝', 'WC0008C', '草日', 'Direct Concept Int''l Ltd.', 1);
INSERT INTO `sys_books` VALUES ('364', '17', '企業變革與文化', 'WC0009C', '余世雄著', '北京大學出版社', 1);
INSERT INTO `sys_books` VALUES ('365', '17', '上班不必耍心機', 'WC0010C', '布蘭．巴鐸著 陳美岑譯', '商業週刊出版股份有限公司', 1);
INSERT INTO `sys_books` VALUES ('366', '17', '辦公室政治家', 'WC0011C', '簡．克拉克 著', '經濟日報出版社', 1);
INSERT INTO `sys_books` VALUES ('367', '17', '工作大解放-這樣做事反而更成功', 'WC0012C', '福萊德、漢森著 胡瑋珊譯', '天下遠見出版股份有限公司', 1);
INSERT INTO `sys_books` VALUES ('368', '17', '他們仍在說話－辦公室小組見證集', 'WC0013C', NULL, '商區福音使團', 1);
INSERT INTO `sys_books` VALUES ('369', '17', '上班族系列(1)上班族的人際關係', 'WC0014C', '夏忠堅 著', '中華基督教福音協進會', 1);
INSERT INTO `sys_books` VALUES ('370', '17', '上班族系列(3)上班族的人際關係', 'WC0015C', '夏忠堅 著', '中華基督教福音協進會', 1);
INSERT INTO `sys_books` VALUES ('371', '17', '上班族系列(4)上班族的人際關係', 'WC0016C', '夏忠堅 著', '中華基督教福音協進會', 1);
INSERT INTO `sys_books` VALUES ('372', '17', '上班族系列(5)上班族的人際關係', 'WC0017C', '夏忠堅 著', '中華基督教福音協進會', 1);
INSERT INTO `sys_books` VALUES ('373', '17', '上班族系列(6)上班族的人際關係', 'WC0018C', '夏忠堅 著', '中華基督教福音協進會', 1);
INSERT INTO `sys_books` VALUES ('374', '17', '工，唔係咁打', 'WC0019C', '伍永光 著', '突破出版社', 1);
INSERT INTO `sys_books` VALUES ('375', '17', '拆解職場困局27招', 'WC0020C', '司徒永富 著', '皇冠叢書', 1);
INSERT INTO `sys_books` VALUES ('376', '17', 'PK職場：10個職場經典個案的思考', 'WC0021C', '伍競存 著', '思道平台有限公司', 1);
INSERT INTO `sys_books` VALUES ('377', '18', '整裝迎壓力 - 應付生活的壓力', 'WL0001C', '徐玉蓮譯', '宗教教育中心', 1);
INSERT INTO `sys_books` VALUES ('378', '18', '從容工作小書', 'WL0002C', 'Paul Wilson著 沈曉鈺譯', '臉譜出版', 1);
INSERT INTO `sys_books` VALUES ('379', '18', '平靜工作', 'WL0003C', '保羅．威爾森著 張立芬、陳智文譯', '臉譜出版', 1);
INSERT INTO `sys_books` VALUES ('380', '18', '反轉腦，樂在工作', 'WL0004C', '王舜清 著', '匡邦文化', 1);
INSERT INTO `sys_books` VALUES ('381', '18', '享受工作的10個態度', 'WL0005C', '杰克斯著 晴天譯', '啟示出版', 1);
INSERT INTO `sys_books` VALUES ('382', '18', '壓力緩解遊戲', 'WL0006C', '羅伯特‧愛潑斯坦著 朱晨海譯', '上海科學技術出版社', 1);
INSERT INTO `sys_books` VALUES ('383', '18', '我不是故意的！成人也有ADHD', 'WL0007C', '黃隆正', '聯經出版公司', 1);
INSERT INTO `sys_books` VALUES ('384', '18', '工作與休閒', 'WL0008C', '張慕皚', '光恩應用神學研究社有限公司', 1);
INSERT INTO `sys_books` VALUES ('385', '18', '為工作立界線', 'WL0009C', '亨利．克勞德著 平山譯', '校園書房', 1);
INSERT INTO `sys_books` VALUES ('386', '1', 'Loving Your Work Ever After - a spiritual guide to career choice and change', 'CD0001E', 'Phyllis M. Taufen Marianne T. Wilkinson', 'Doubleday', 1);
INSERT INTO `sys_books` VALUES ('387', '1', 'Loving Your Job, Finding Your Passion - work and the spiritual life', 'CD0002E', 'Joseph G. Allegretti', 'Paulist Press', 1);
INSERT INTO `sys_books` VALUES ('388', '1', 'Game Plan - winning strategies for the second half of your life', 'CD0003E', 'Bob Buford', 'Zondervan', 1);
INSERT INTO `sys_books` VALUES ('389', '1', 'Half Time - changing your game plan form success to significance', 'CD0004E', 'Bob Buford', 'Zondervan', 1);
INSERT INTO `sys_books` VALUES ('390', '1', 'Creating You & Co. - learn to think like the CEO of your own career', 'CD0005E', 'William Bridges', 'Perseus Books', 1);
INSERT INTO `sys_books` VALUES ('391', '1', 'The 80/20 Individual', 'CD0007E', 'RICHARD Koch', 'Doubleday', 1);
INSERT INTO `sys_books` VALUES ('392', '1', 'Integrity-the courage to meet the demands of reality', 'CD0008E', 'Dr. Henry Cloud', 'Harper Collins Publisher', 1);
INSERT INTO `sys_books` VALUES ('393', '1', 'The Heart of Business Rediscovering America''s Ultimate Competitive Weapon in the Global Marketplace', 'CD0009E', 'Herman Suryoutomo', 'Innova Pub.', 1);
INSERT INTO `sys_books` VALUES ('394', '1', 'How Why How We Do Anything Means Everything...in Business (and in Life)', 'CD0010E', 'Dov Seidman', 'Wiley', 1);
INSERT INTO `sys_books` VALUES ('395', '1', 'Career Coaching Your Kids Guiding Your Child Through the Process of Career Discovery', 'CD0011E', 'David H. Montross; Theresa E. Kane; Robert Jay Ginn', 'Nicholas Brealey Publishing', 1);
INSERT INTO `sys_books` VALUES ('396', '1', 'Career, Work, and Mental Health Integrating Career and Personal Counseling', 'CD0012E', 'Vernon Zunker', 'SAGE', 1);
INSERT INTO `sys_books` VALUES ('397', '1', 'The Pathfinder How to Choose Or Change Your Career for a Lifetime of Satisfaction and Success', 'CD0013E', 'Nicholas Lore', 'Simon and Schuster', 1);
INSERT INTO `sys_books` VALUES ('398', '1', 'The Career Counselor''s Handbook, Second Edition', 'CD0014E', 'Howard Figler; Richard N. Bolles', 'Clarkson Potter/Ten Speed', 1);
INSERT INTO `sys_books` VALUES ('399', '1', 'Impact of Job Characteristic Model on Employee Performance', 'CD0016E', 'Ifrah Munir', 'LAP LAMBERT Academic Publishing', 1);
INSERT INTO `sys_books` VALUES ('400', '1', 'Do what You are Discover the Perfect Career for You Through the Secrets of Personality Type', 'CD0017E', 'Paul D. Tieger; Barbara Barron-Tieger; Kelly Tieger', 'Little, Brown Spark', 0);
INSERT INTO `sys_books` VALUES ('401', '1', 'HBR Guide to Your Professional Growth', 'CD0018E', 'Harvard Business Review (COR)', 'Harvard Business Review Press', 0);
INSERT INTO `sys_books` VALUES ('402', '1', 'HBR Guide to Changing Tour Career', 'CD0019E', 'Harvard Business Review (COR)', 'Harvard Business Review Press', 0);
INSERT INTO `sys_books` VALUES ('403', '1', 'HBR Guide to Better Mental Health at Work', 'CD0020E', 'Harvard Business Review (COR)', 'Harvard Business Review Press', 0);
INSERT INTO `sys_books` VALUES ('404', '1', 'HBR Guide to Managing Stress at Work', 'CD0021E', 'Harvard Business Review (COR)', 'Harvard Business Review Press', 0);
INSERT INTO `sys_books` VALUES ('405', '1', 'HBR Guide to Work-life Balance', 'CD0022E', 'Harvard Business Review (COR)', 'Harvard Business Review Press', 0);
INSERT INTO `sys_books` VALUES ('406', '1', 'What Color Is Your Parachute? for College Pave Your Path from Major to Meaningful Work', 'CD0023E', 'Katharine Brooks, EdD', 'Clarkson Potter/Ten Speed', 0);
INSERT INTO `sys_books` VALUES ('407', '1', 'Ultimate Guide to Career Planning for Teens', 'CD0024E', 'Ella Bradley', 'Teilingen Press', 0);
INSERT INTO `sys_books` VALUES ('408', '2', 'Just Business - Christian Ethics for the Marketplace', 'CE0001E', 'HILL Alexander', 'Intervarsity Press', 1);
INSERT INTO `sys_books` VALUES ('409', '2', 'Christian Ethics - Options and Issues', 'CE0002E', 'GEISLER Norman L.', 'Baker Book House', 1);
INSERT INTO `sys_books` VALUES ('410', '2', 'Good Work When Excellence and Ethics Meet', 'CE0003E', 'GARDNER Howard CSIKSZENTMIHALYI Mihaly DAMON William', 'Basic Books', 1);
INSERT INTO `sys_books` VALUES ('411', '2', 'Living as the people of God The relevance of Old Testament ethics', 'CE0004E', 'WRIGHT Christopher JH', 'Intervarsity Press', 1);
INSERT INTO `sys_books` VALUES ('412', '2', 'God is my CEO Following God''s Principles in a Bottom-Line World', 'CE0005E', 'JULIAN Larry S.', 'Adams Media Corporation', 1);
INSERT INTO `sys_books` VALUES ('413', '2', 'Church on Sunday, Work on Monday', 'CE0006E', 'Laura Nash Scotty McLennan', 'Jossey-Bass', 1);
INSERT INTO `sys_books` VALUES ('414', '2', 'How To Be An Up Person In A Down World', 'CE0007E', 'Honor Books', 'Honor Books', 1);
INSERT INTO `sys_books` VALUES ('415', '2', 'God''s Little Instruction Book on Success', 'CE0008E', 'Honor Books', 'Honor Books', 1);
INSERT INTO `sys_books` VALUES ('416', '2', 'God''s Little Instruction Book for the WorkPlace', 'CE0009E', 'Honor Books', 'Honor Books', 1);
INSERT INTO `sys_books` VALUES ('417', '2', 'Bribery and Corruption', 'CE0016E', 'Hwa Yung', 'Graceworks Private Limitied', 1);
INSERT INTO `sys_books` VALUES ('418', '2', 'Women''s Lives Women''s Legacies', 'CE0017E', 'Rachael Freed', 'Fairview Press', 1);
INSERT INTO `sys_books` VALUES ('419', '2', 'Where''s God on Monday?', 'CE0018E', 'Alistair Mackenzie Wayne Kirkland', 'Navpress NZ Ltd', 1);
INSERT INTO `sys_books` VALUES ('420', '2', 'Just Decisions - Christian Ethics Go to Work', 'CE0019E', 'Alistair Mackenzie Wayne Kirkland', 'Navpress NZ Ltd', 1);
INSERT INTO `sys_books` VALUES ('421', '2', 'Christ and Business Culture', 'CE0020E', 'Kam-hon Lee Dennis McCann MaryAnn Ching Yuen', 'Centre for the Study of Religion and Chinese Society, Chung Chi College, The Chinese University of Hong Kong', 1);
INSERT INTO `sys_books` VALUES ('422', '2', 'Ethics in Management - A Practical Guide for Professional Accountants', '/', 'HK Society of Accountants (HKSA) and HK Ehtics Development Centre (HKEDC)', 1);
INSERT INTO `sys_books` VALUES ('423', '2', 'Dirty Hands Christian Ethics in a Morally Ambiguous World', 'CE0022E', 'Garth Kasimu Baker-Fletcher', 'Fortress Press', 1);
INSERT INTO `sys_books` VALUES ('424', '2', 'Ethics In Business Faith at Work', 'CE0023E', 'James M. Childs Jr.', 'Fortress Press Minneapolis', 1);
INSERT INTO `sys_books` VALUES ('425', '2', 'On Moral Business Classical and Contemporary Resources for Ethics in Economic Life', 'CE0024E', 'Max L. Stackhouse', 'Wm. B. Eerdmans Publishing', 2);
INSERT INTO `sys_books` VALUES ('426', '2', 'Old Testament Ethics For The People Of God', 'CE0025E', 'Wright, Chris', 'Inter-Varsity Press', 1);
INSERT INTO `sys_books` VALUES ('427', '2', 'Biblical Principles and Business The Foundations', 'CE0026E', 'Richard C. Chewning', 'NavPress', 1);
INSERT INTO `sys_books` VALUES ('428', '2', 'Biblical Principles and Business The Practice', 'CE0027E', 'Richard C. Chewning', 'NavPress', 1);
INSERT INTO `sys_books` VALUES ('429', '2', 'Eight Theories of Ethics', 'CE0028E', 'Gordon Graham', 'Routledge', 1);
INSERT INTO `sys_books` VALUES ('430', '2', 'The Business Corporation and Productive Justice', 'CE0029E', 'David A. Krueger; Donald Woods Shriver (Jr.); Laura L. Nash', 'Abingdon Press', 1);
INSERT INTO `sys_books` VALUES ('431', '2', 'Issues Facing Christians Today', 'CE0031E', 'John R. W. Stott', 'Marshall Pickering', 1);
INSERT INTO `sys_books` VALUES ('432', '2', 'Resurrection and Moral Order An Outline for Evangelical Ethics', 'CE0032E', 'Oliver O''Donovan', 'Wm. B. Eerdmans Publishing', 1);
INSERT INTO `sys_books` VALUES ('433', '3', 'The Marketplace Annotated Bibliography', 'CL0001E', 'HAMMOND Pete STEVENS R. Paul SVANOE Todd', 'InterVarsity Press', 1);
INSERT INTO `sys_books` VALUES ('434', '3', 'Faith & Work: Do they mix?', 'CL0002E', 'HILLMAN Os', 'Aslan Group Pubishing', 1);
INSERT INTO `sys_books` VALUES ('435', '3', 'The Fabric of This World', 'CL0003E', 'Lee Hardy', 'William B. Eedrmans Publishing Company', 1);
INSERT INTO `sys_books` VALUES ('436', '3', 'The OTHER six Days', 'CL0004E', 'R. Paul Stevens', 'Eerdmans', 1);
INSERT INTO `sys_books` VALUES ('437', '3', 'Finding the Will of God - a pagan notion?', 'CL0005E', 'Bruce K. Waltke', 'Eerdmans', 1);
INSERT INTO `sys_books` VALUES ('438', '3', 'Courage And Calling: The Study Guide', 'CL0006E', 'Soo-Inn Tan and Gordan T. Smith', 'Graceworks Private Limitied', 1);
INSERT INTO `sys_books` VALUES ('439', '4', 'Where Your Treasure Is', 'FM0001E', 'James Reapsome Martha Reapsome', 'WaterBrook Press', 1);
INSERT INTO `sys_books` VALUES ('440', '4', 'Economic Parables', 'FM0002E', 'David Cowan', 'Paternoster', 1);
INSERT INTO `sys_books` VALUES ('441', '4', 'Sort Your Career Out And Make More Money', 'FM0003E', 'Shelley Johnson; Glen James', 'John Wiley & Sons', 0);
INSERT INTO `sys_books` VALUES ('442', '5', 'Coping with Difficult People', 'IR0001E', 'Robert M. Bramson, Ph.D.', 'Dell Publishing', 1);
INSERT INTO `sys_books` VALUES ('443', '5', 'Winning with Difficult People', 'IR0002E', 'Arthur Henry Bell; Dayle M. Smith', 'Barron''s Educational Series', 1);
INSERT INTO `sys_books` VALUES ('444', '5', 'The Peacemaker', 'IR0003E', 'Ken Sande', 'Baker Books', 1);
INSERT INTO `sys_books` VALUES ('445', '5', 'Connecting With The Autism Spectrum', 'IR0004E', 'Casey Remrov Vormer', 'Callisto Publishing', 0);
INSERT INTO `sys_books` VALUES ('446', '7', 'What Color is Your Parachute? (2001 Edition)', 'JS0001E', 'BOLLES Richard N.', 'Ten Speed Press', 1);
INSERT INTO `sys_books` VALUES ('447', '7', 'What Color is Your Parachute? (2005 Edition)', 'JS0002E', 'BOLLES Richard N.', 'Ten Speed Press', 1);
INSERT INTO `sys_books` VALUES ('448', '7', 'Ultimate Job Search', 'JS0003E', 'Lynn Williams', 'KoganPage', 0);
INSERT INTO `sys_books` VALUES ('449', '7', 'What Color Is Your Parachute? 2022', 'JS0004E', 'Richard N. Bolles', 'Random House Digital Inc.', 0);
INSERT INTO `sys_books` VALUES ('450', '8', 'Christian Reflections on The Leadership Challenge', 'LD0001E', 'KOUZES & POSNER', 'Jossey-Bass A Wiley Company', 1);
INSERT INTO `sys_books` VALUES ('451', '8', 'Jesus on Leadership', 'LD0002E', 'WILKES C. Gene', 'Tyndale House Publishers, Inc.', 1);
INSERT INTO `sys_books` VALUES ('452', '8', 'Servant Leadership', 'LD0003E', 'GREENLEAF Robert K.', 'Paulist Press', 1);
INSERT INTO `sys_books` VALUES ('453', '8', 'Leader''s Guide for Be a Motivational Leader', 'LD0004E', 'LeRoy Elims', 'Victor Books', 1);
INSERT INTO `sys_books` VALUES ('454', '8', 'The Equipping Pastor', 'LD0005E', 'R. Paul Stevens Phil Collins', 'The Alban Institute', 1);
INSERT INTO `sys_books` VALUES ('455', '8', 'Leadership is an Art (Published at 1990)', 'LD0006E', 'Max De Pree', 'Dell Publishing', 1);
INSERT INTO `sys_books` VALUES ('456', '8', 'Naming the Elephant - Worldview As A Concept', 'LD0007E', 'GREENLEAF Robert K.', 'Paulist Press', 1);
INSERT INTO `sys_books` VALUES ('457', '8', 'Jesus CEO', 'LD0008E', 'Laurie Beth Jones', 'Hyperion', 1);
INSERT INTO `sys_books` VALUES ('458', '8', 'The Servant', 'LD0009E', 'James C. Hunter', 'Crown Business', 1);
INSERT INTO `sys_books` VALUES ('459', '8', 'Leadership is an Art (Published at 2004)', 'LD0010E', 'Max De Pree', 'Currency , Doubleday', 1);
INSERT INTO `sys_books` VALUES ('460', '8', 'The CEO and the Monk', 'LD0011E', 'Robert B. Catell and Kenny Moore with Glenn Rifkin', 'John Wiley & Sons, Inc.', 1);
INSERT INTO `sys_books` VALUES ('461', '8', 'The Making of a Christian Leader', 'LD0012E', 'Ted Engstrom', 'Zondervan', 1);
INSERT INTO `sys_books` VALUES ('462', '8', 'The 8th Habit From Effectiveness to Greatness', 'LD0013E', 'Stephen R. Covey', 'Free Press', 1);
INSERT INTO `sys_books` VALUES ('463', '10', 'Pathways : the Road to Mentoring', 'MC0001E', 'Florence Tan', 'Int''l Bible Society', 1);
INSERT INTO `sys_books` VALUES ('464', '10', '[Our] Wise Counselor', 'MC0002E', 'Phyllis Bennett', 'Navpress', 1);
INSERT INTO `sys_books` VALUES ('465', '10', 'The Career Counselor''s Handbook', 'MC0003E', 'Howard Figler Richard N. Bolles', 'Ten Speed Press', 1);
INSERT INTO `sys_books` VALUES ('466', '10', 'Faith Coaching', 'MC0004E', 'Chad Hall Bill Copper Kathryn Mcelveen', 'Coach Approach Ministries', 1);
INSERT INTO `sys_books` VALUES ('467', '10', 'The Mentored Life', 'MC0005E', 'James Macintosh Houston', 'NavPress', 1);
INSERT INTO `sys_books` VALUES ('468', '10', 'Help for Helpers', 'MC0006E', 'Fireside Books', 'Simon & Schuster', 1);
INSERT INTO `sys_books` VALUES ('469', '9', 'Mentoring Paradigms', 'CC0001E', 'Edmund Chan', 'Convenant Evangelical Free Church', 1);
INSERT INTO `sys_books` VALUES ('470', '9', 'Be Your Own Career Coach', 'CC0002E', 'Slater, Rus', 'Pearson International Content', 1);
INSERT INTO `sys_books` VALUES ('471', '9', 'Coaching Plain and Simple', 'CC0003E', 'Peter Szabo; Daniel Meier', 'W. W. Norton & Company', 1);
INSERT INTO `sys_books` VALUES ('472', '10', 'The Manager''s Guide to Counselling at Work', 'CN0001E', 'Michael Reddy', 'Wiley', 1);
INSERT INTO `sys_books` VALUES ('473', '10', 'Work and Disability (Third Edition)', 'CN0002E', 'Edna Szymanski, Randall M. Parker', 'Pro-Ed', 1);
INSERT INTO `sys_books` VALUES ('474', '10', 'Understanding Autistic Behaviors', 'CN0003E', 'Theresa M. Regan', 'IndieGo Publishing LLC', 1);
INSERT INTO `sys_books` VALUES ('475', '10', 'Understanding Autism in Adults and Aging Adults 2nd Edition', 'CN0004E', 'Theresa Regan', 'Indiego Publishing LLC', 1);
INSERT INTO `sys_books` VALUES ('476', '10', 'An Adult with an Autism Diagnosis', 'CN0005E', 'Gillan Drew', 'Jessica Kingsley Publishers', 1);
INSERT INTO `sys_books` VALUES ('477', '10', 'Adult ADHD Solution', 'CN0006E', 'Gillan Drew', 'Jessica Kingsley Publishers', 1);
INSERT INTO `sys_books` VALUES ('478', '10', 'The Mindfulness Prescription for Adult ADHD', 'CN0007E', 'Lidia Zylowska, MD', 'Shambhala', 1);
INSERT INTO `sys_books` VALUES ('479', '10', 'Succeeding with Adult ADHD', 'CN0009E', 'Abigail Levrini; Frances F. Prevatt', 'American Psychological Association', 1);
INSERT INTO `sys_books` VALUES ('480', '10', 'Career Counseling: A Holistic Approach', 'CN0010E', 'Vernon G. Zunker', 'Cengage Learning', 1);
INSERT INTO `sys_books` VALUES ('481', '10', 'Career Assessment', 'CN0011E', 'Rodney L. Lowman', 'American Psychological Association', 1);
INSERT INTO `sys_books` VALUES ('482', '12', 'Executive Influence', 'MG0001E', 'CRANE Christopher A. HAMEL Mike', 'NavPress', 1);
INSERT INTO `sys_books` VALUES ('483', '12', 'Power Pack', 'MG0002E', 'Bob Moffett''s', 'Scripture Union', 1);
INSERT INTO `sys_books` VALUES ('484', '12', 'Power Pack 2', 'MG0003E', 'Bob Moffett''s', 'Scripture Union', 1);
INSERT INTO `sys_books` VALUES ('485', '12', 'The 8th Habit - From Effectiveness to Greatness', 'MG0004E', 'Stephen R. Covey', 'Free Press', 1);
INSERT INTO `sys_books` VALUES ('486', '12', 'Globalization and The Good', 'MG0005E', 'Peter Heslam', 'Bookmarque Ltd.', 1);
INSERT INTO `sys_books` VALUES ('487', '12', 'Called to Serve', 'MG0006E', 'Max De Pree', 'Wm. B. Eerdmans Publishing Co.', 1);
INSERT INTO `sys_books` VALUES ('488', '12', 'There''s Room at the Top', 'MG0007E', 'Matthew G. Rekers; George Alan Rekers', 'Uxbridge', 1);
INSERT INTO `sys_books` VALUES ('489', '12', 'God-centered Management and Administration', 'MG0008E', 'Annisa Sin-Yi Wong', 'Nation-Blessings Consultancy Company', 1);
INSERT INTO `sys_books` VALUES ('490', '12', 'Workplace Wellness that Works', 'MG0009E', 'Laura Putnam', 'John Wiley & Sons', 1);
INSERT INTO `sys_books` VALUES ('491', '13', 'Anointed for Business', 'MM0001E', 'SILVOSO Ed', 'Regal Books', 1);
INSERT INTO `sys_books` VALUES ('492', '13', 'Anointed For Business - Study Guide', 'MM0002E', 'Ed Silvoso', 'Regal Books', 1);
INSERT INTO `sys_books` VALUES ('493', '13', 'Lasting Investments', 'MM0003E', 'HUMPHREYS Kent', 'NavPress', 1);
INSERT INTO `sys_books` VALUES ('494', '13', 'Faith @ Work', 'MM0004E', 'HILLMAN Os', 'Aslan Group Pubishing', 1);
INSERT INTO `sys_books` VALUES ('495', '13', 'The Marketplace Ministry Handbook', 'MM0005E', 'STEVENS Paul R. BANKS Robert', 'Regent College Publishing', 1);
INSERT INTO `sys_books` VALUES ('496', '13', 'Transforming Society', 'MM0006E', 'Charles Colson', 'Navpress', 1);
INSERT INTO `sys_books` VALUES ('497', '13', 'A Holy Meal', 'MM0007E', 'Gordon T. Smith', 'Baker Academic', 1);
INSERT INTO `sys_books` VALUES ('498', '13', 'Liberating the Laity', 'MM0008E', 'R. Paul Stevens', 'Regent College Publishing', 1);
INSERT INTO `sys_books` VALUES ('499', '13', 'The Practice of the Presence of God', 'MM0009E', 'Brother Lawrence', 'Bridge-Logos', 1);
INSERT INTO `sys_books` VALUES ('500', '13', 'Marketplace Ministry - Occasional Paper No. 40', 'MM0010E', 'Gordon Preece', 'William Carey Library', 1);
INSERT INTO `sys_books` VALUES ('501', '13', 'Transformation - Change the Market Place and You Change the World', 'MM0011E', 'Ed Silvoso', 'William Carey Library', 1);
INSERT INTO `sys_books` VALUES ('502', '13', 'How the Church Fails Businesspeople', 'MM0012E', 'John C. Knapp', 'William B. Eerdmans Publishing Company', 1);
INSERT INTO `sys_books` VALUES ('503', '13', 'My Father''s Business', 'MM0013E', 'Peter Tsukahira', 'Cohens, Hong Kong', 1);
INSERT INTO `sys_books` VALUES ('504', '13', 'Doing God''s Business', 'MM0014E', 'R. Paul Stevens', 'Wm. B. Eerdmans Publishing', 1);
INSERT INTO `sys_books` VALUES ('505', '13', 'Courage and Calling', 'MM0015E', 'Gordon T. Smith', 'InterVarsity Press', 1);
INSERT INTO `sys_books` VALUES ('506', '14', 'The Abolition of the Laity', 'MT0001E', 'STEVENS Paul R.', 'Paternoster Press', 1);
INSERT INTO `sys_books` VALUES ('507', '14', 'The Fourth Frontier', 'MT0002E', 'GRAVES Stephen R. ADDINGTON Thomas G.', 'World Publishing', 1);
INSERT INTO `sys_books` VALUES ('508', '14', 'The Transforming Vision', 'MT0003E', 'WALSH Brian J. MIDDLETON J. Richard', 'Intervarsity Press', 1);
INSERT INTO `sys_books` VALUES ('509', '14', 'The Way of Life', 'MT0004E', 'BADCOCK Gary D.', 'Wm. B. Eerdmans Publishing', 1);
INSERT INTO `sys_books` VALUES ('510', '14', 'After Sunday', 'MT0005E', 'Armand Larive', 'The Continum Int''l Publishing Group Inc.', 1);
INSERT INTO `sys_books` VALUES ('511', '14', 'The Gathered and Scattered Church', 'MT0006E', 'Edward H. Hammett', 'Smyth & Helwys Publishing, Inc.', 1);
INSERT INTO `sys_books` VALUES ('512', '14', 'The Knowledge Of The Holy', 'MT0007E', 'A.W.TOZER', 'OM', 1);
INSERT INTO `sys_books` VALUES ('513', '14', 'The Heavenly Good Of Earthly Work', 'MT0008E', 'Darrell Cosden', 'Hendrickson', 1);
INSERT INTO `sys_books` VALUES ('514', '14', 'Faith Dilemmas for Marketplace Christians', 'MT0009E', 'Ben Sprunger; Carol J. Suter; Wally Kroeker', 'Herald Press', 1);
INSERT INTO `sys_books` VALUES ('515', '14', 'The On-Purpose Business', 'MT0010E', 'Kevin W. McCarthy', 'NavPress Publishing Group', 1);
INSERT INTO `sys_books` VALUES ('516', '14', 'Work A Kingdom Perspective on Labor', 'MT0011E', 'Ben Witherington III; Ben Witherington', 'Wm. B. Eerdmans Publishing', 1);
INSERT INTO `sys_books` VALUES ('517', '14', 'Business Through the Eyes of Faith', 'MT0012E', 'Richard C. Chewning; John Wilmer Eby; Shirley J. Roels', 'Harper Collins', 1);
INSERT INTO `sys_books` VALUES ('518', '14', 'God Is My CEO', 'MT0013E', 'Larry S. Julian', 'Adams Media', 1);
INSERT INTO `sys_books` VALUES ('519', '14', 'Marketplace Ministry: Occasional Paper No. 40', 'MT0014E', 'Dr. Gordon Preece', 'Lausanne Committee for World Evangelization', 2);
INSERT INTO `sys_books` VALUES ('520', '15', 'Convergence', 'OS0001E', 'JOHNSON Brett', 'The Institute Press, Inc.', 1);
INSERT INTO `sys_books` VALUES ('521', '15', 'How to Read the Bible for All Its Worth', 'OS0002E', 'Gordon D. Fee Douglas Stuart', 'Zondervan', 1);
INSERT INTO `sys_books` VALUES ('522', '15', 'Meltdown', 'OS0003E', 'Marcus Honeysett', 'Inter - Varsity Press', 1);
INSERT INTO `sys_books` VALUES ('523', '15', 'Naming the Elephant - Worldview As A Concept', 'OS0004E', 'James W. Sire', 'Inter - Varsity Press', 1);
INSERT INTO `sys_books` VALUES ('524', '15', 'Know What You Believe', 'OS0005E', 'Paul E. Little', 'InterVarsity Press', 1);
INSERT INTO `sys_books` VALUES ('525', '15', 'A Fundamental Practical Theology', 'OS0006E', 'Don S. Browning', 'Fortress Press', 1);
INSERT INTO `sys_books` VALUES ('526', '15', 'Adult Psychopathology and Diagnosis (2nd Edition)', 'OS0007E', 'Michel Hersen; Samuel M. Turner', 'Wiley', 1);
INSERT INTO `sys_books` VALUES ('527', '15', 'Synopsis of Psychiatry', 'OS0008E', 'Harold I. Kaplan', 'Williams & Wilkins', 1);
INSERT INTO `sys_books` VALUES ('528', '15', 'Handbook Of Structured Techniques In Marriage And Family Therapy', 'OS0009E', 'Robert Sherman, Norman Fredman', 'Routledge', 1);
INSERT INTO `sys_books` VALUES ('529', '15', 'Approaches to Family Therapy', 'OS0010E', 'Hansen, James C.', 'Macmillan Pub Co', 1);
INSERT INTO `sys_books` VALUES ('530', '16', 'Following Jesus in the Real World', 'SF0001E', 'LAMB Richard', 'Intervarsity Press', 1);
INSERT INTO `sys_books` VALUES ('531', '16', 'The Monday Connection', 'SF0002E', 'DIEHL William E.', 'Harper Collins Publisher', 1);
INSERT INTO `sys_books` VALUES ('532', '16', 'Jesus in Beijing', 'SF0003E', 'AIKMAN David', 'Regnery Publising', 1);
INSERT INTO `sys_books` VALUES ('533', '16', 'Today God is First (4-Minute Meditations)', 'SF0004E', 'HILLMAN Os', 'Destiny Image Publishers, Inc.', 1);
INSERT INTO `sys_books` VALUES ('534', '16', 'Today God is First (365 Meditations)', 'SF0005E', 'HILLMAN Os', 'Destiny Image Publishers, Inc.', 1);
INSERT INTO `sys_books` VALUES ('535', '16', 'Today God is First Small Group Bible Study', 'SF0006E', 'HILLMAN Os', 'Aslan Group Pubishing', 1);
INSERT INTO `sys_books` VALUES ('536', '16', 'The Soul of the Firm', 'SF0007E', 'POLLARD C. William', 'The ServiceMaster Foundation', 1);
INSERT INTO `sys_books` VALUES ('537', '16', 'The Shape of Living', 'SF0008E', 'FORD David F.', 'Baker Books', 1);
INSERT INTO `sys_books` VALUES ('538', '16', 'Pocket Prayers for Teachers', 'SF0009E', 'LANKSHEAR David W.', 'Church House Publishing', 1);
INSERT INTO `sys_books` VALUES ('539', '16', 'Pocket Prayers for Work', 'SF0010E', 'LANKSHEAR David W.', 'Church House Publishing', 1);
INSERT INTO `sys_books` VALUES ('540', '16', 'Show and then Tell', 'SF0011E', 'HUMPHREYS Kent & Davidene', 'Moody Press', 1);
INSERT INTO `sys_books` VALUES ('541', '16', 'The Man In The Mirror', 'SF0012E', 'Patrick Morley', 'Zondervan', 1);
INSERT INTO `sys_books` VALUES ('542', '16', 'Promise Builders Study Series', 'SF0013E', 'Horner, Ralston, Sunde', 'World Publishing', 1);
INSERT INTO `sys_books` VALUES ('543', '16', 'Thank God It''s Monday!', 'SF0014E', 'Rick Heeren', 'Harvestevan Evangelism, Inc', 1);
INSERT INTO `sys_books` VALUES ('544', '16', 'An Official Follow-up To The Alpha Course', 'SF0015E', 'Nicky Gumbel', 'Kingsway Communications Ltd.', 1);
INSERT INTO `sys_books` VALUES ('545', '16', 'Living the Story', 'SF0016E', 'R. Paul Stevens Michael Green', 'Eerdmans, Regent', 1);
INSERT INTO `sys_books` VALUES ('546', '16', 'Down-to-Earth Spirituality', 'SF0017E', 'R. Paul Stevens', 'IVP', 1);
INSERT INTO `sys_books` VALUES ('547', '16', 'Small group leadership as spiritual direction', 'SF0018E', 'Heather Webb', 'Zondervan', 1);
INSERT INTO `sys_books` VALUES ('548', '16', 'The Soul of The Firm', 'SF0019E', 'C. William Pollard', 'Zondervan', 1);
INSERT INTO `sys_books` VALUES ('549', '16', 'Jesus in Blue Jeans', 'SF0020E', 'Laurie Beth Jones', 'Hyperion', 1);
INSERT INTO `sys_books` VALUES ('550', '16', 'The Soul of the Firm (Hard cover)', 'SF0021E', 'POLLARD C. William', 'The ServiceMaster Foundation', 1);
INSERT INTO `sys_books` VALUES ('551', '16', 'Spiritual Hunger and other sermons', 'SF0022E', 'Dr. John G. Lake', 'Christ For The Nations, INC', 1);
INSERT INTO `sys_books` VALUES ('552', '16', 'The Desert in the City', 'SF0023E', 'Carlo Carretto', 'Crossroad New Yourk', 1);
INSERT INTO `sys_books` VALUES ('553', '16', 'Soul Purpose', 'SF0024E', 'Alistair Mackenzie Wayne Kirkland Annette Dunham', 'Navpress NZ Ltd', 1);
INSERT INTO `sys_books` VALUES ('554', '16', 'Subversive Spirituality', 'SF0025E', 'Eugene H. Peterson', 'W.B. Eerdmans Publishing Company ; Recent College', 1);
INSERT INTO `sys_books` VALUES ('555', '16', 'Seven Days of Faith', 'SF0026E', 'R. Paul Stevens', 'NavPress', 1);
INSERT INTO `sys_books` VALUES ('556', '16', 'Active Spirituality', 'SF0028E', 'Kent Ira Groff', 'Bloomsbury Academic', 1);
INSERT INTO `sys_books` VALUES ('557', '17', 'Good Work', 'WC0001E', 'Bruce Hiebert', 'Northstone', 1);
INSERT INTO `sys_books` VALUES ('558', '17', 'The Way We Work', 'WC0002E', 'Cynthia Ulrich Tobias', 'Broadman & Holman', 1);
INSERT INTO `sys_books` VALUES ('559', '17', 'Transformation', 'WC0003E', 'Ed. Silvoso', 'Regal Books', 1);
INSERT INTO `sys_books` VALUES ('560', '18', 'Life Matters', 'WL0001E', 'A. Roger Merrill Rebecca R. Merrill', 'McGraw-Hill', 1);
INSERT INTO `sys_books` VALUES ('561', '18', 'Balancing Work & Life', 'WL0002E', 'Robert Holden Ben Renshaw', 'Dorling Kindersley', 1);
INSERT INTO `sys_books` VALUES ('562', '18', 'Praying Round the Clock', 'WL0003E', 'Richard Harries', 'A.R. Mowbray & Co. Ltd', 1);
INSERT INTO `sys_books` VALUES ('563', '18', 'Designing Your New Work Life', 'WL0004E', 'Bill Burnett', 'Vintage', 1);
-- ----------------------------
-- Table structure for sys_category
-- ----------------------------
DROP TABLE IF EXISTS `sys_category`;
CREATE TABLE `sys_category`  (
  `category_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '分類編號',
  `category_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '分類名稱',
  `order_num` int(0) NULL DEFAULT NULL COMMENT '序號',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_category
-- ----------------------------
INSERT INTO `sys_category` VALUES (1, '職涯發展/創業 Career/Business Development', 1);
INSERT INTO `sys_category` VALUES (2, '職場倫理 Christian Ethics', 2);
INSERT INTO `sys_category` VALUES (3, '工作與召命 Calling', 3);
INSERT INTO `sys_category` VALUES (4, '財務/金錢//投資管理 Financial Management, Money matters & Investment', 4);
INSERT INTO `sys_category` VALUES (5, '人際闢係與溝通 Interpersonal Relationship & Communication', 5);
INSERT INTO `sys_category` VALUES (6, '期刊 Journal', 6);
INSERT INTO `sys_category` VALUES (7, '求職技巧 Job Search', 7);
INSERT INTO `sys_category` VALUES (8, '領導學 Leadership', 8);
INSERT INTO `sys_category` VALUES (9, '職業輔導 Career Coaching', 9);
INSERT INTO `sys_category` VALUES (10, '諮詢 Counselling', 10);
INSERT INTO `sys_category` VALUES (11, '心理健康 Mental Health', 11);
INSERT INTO `sys_category` VALUES (12, '管理學 Management', 12);
INSERT INTO `sys_category` VALUES (13, '職場事工 Marketplace Ministry', 13);
INSERT INTO `sys_category` VALUES (14, '職場神學 Marketplace Theology', 14);
INSERT INTO `sys_category` VALUES (15, '其他 Others', 15);
INSERT INTO `sys_category` VALUES (16, '職場靈命 Spirituality/Spiritual Formation', 16);
INSERT INTO `sys_category` VALUES (17, '辦公室文化/政冶 Work Culture/Politics', 17);
INSERT INTO `sys_category` VALUES (18, '工作生活平衡 Work Life Balance', 18);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '選單編號',
  `parent_id` int(0) NULL DEFAULT NULL COMMENT '上層選單編號',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '選單名稱',
  `code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '權限字段',
  `name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '路由name',
  `path` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '路由path',
  `url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '組件路徑',
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '類型(0 目錄 1選單，2按鈕)',
  `icon` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '選單圖標',
  `parent_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '上層選單名稱',
  `order_num` int(0) NULL DEFAULT NULL COMMENT '序號',
  `create_time` datetime NULL DEFAULT NULL COMMENT '創建時間',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新時間',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系統設定', 'sys:menu:setting', 'system', '/system', '', '0', 'iconfont icon-r-setting', '主選單', 1, '2021-12-02 19:19:28', NULL);
INSERT INTO `sys_menu` VALUES (2, 1, '帳戶管理', 'sys:useList:index', 'sysUserList', '/sysUserList', '/system/sysUserList', '1', 'iconfont icon-r-user1', '系統設定', 2, '2021-12-02 19:25:31', '2022-02-11 11:45:15');
INSERT INTO `sys_menu` VALUES (3, 1, '身份管理', 'sys:sysRoleList:index', 'sysRoleList', '/sysRoleList', '/system/sysRoleList', '1', 'iconfont icon-r-user2', '系統設定', 3, '2021-12-02 19:27:25', '2022-02-11 14:09:18');
INSERT INTO `sys_menu` VALUES (4, 1, '選單管理', 'sys:menu:index', 'sysMenuList', '/sysMenuList', '/system/sysMenuList', '1', 'iconfont icon-r-edit', '系統設定', 3, '2022-01-02 13:20:44', NULL);
INSERT INTO `sys_menu` VALUES (5, 2, '新增', 'sys:user:add', '', '', '', '2', '', '帳戶管理', 1, '2022-01-02 13:21:15', NULL);
INSERT INTO `sys_menu` VALUES (6, 2, '編輯', 'sys:user:edit', '', '', '', '2', '', '帳戶管理', 2, '2022-01-02 13:21:36', '2022-01-08 20:37:50');
INSERT INTO `sys_menu` VALUES (7, 2, '刪除', 'sys:user:delete', '', '', '', '2', '', '帳戶管理', 3, '2022-01-02 13:21:55', '2022-01-08 20:38:11');
INSERT INTO `sys_menu` VALUES (8, 3, '新增', 'sys:role:add', '', '', '', '2', '', '身份管理', 1, '2022-01-02 13:22:21', NULL);
INSERT INTO `sys_menu` VALUES (9, 3, '編輯', 'sys:role:edit', '', '', '', '2', '', '身份管理', 2, '2022-01-02 13:22:38', NULL);
INSERT INTO `sys_menu` VALUES (10, 3, '刪除', 'sys:role:delete', '', '', '', '2', '', '身份管理', 3, '2022-01-02 13:22:56', NULL);
INSERT INTO `sys_menu` VALUES (11, 4, '新增', 'sys:menu:add', '', '', '', '2', '', '選單管理', 1, '2022-01-02 13:23:17', NULL);
INSERT INTO `sys_menu` VALUES (14, 0, '會員管理', 'sys:reader:root', 'reader', '/reader', '', '0', 'iconfont icon-r-team', '主選單', 2, '2022-01-02 13:24:42', '2022-02-11 14:21:56');
INSERT INTO `sys_menu` VALUES (15, 14, '會員名單', 'sys:reader:list', 'readerList', '/readerList', '/reader/readerList', '1', 'iconfont icon-r-team', '會員管理', 1, '2022-01-02 13:25:29', '2022-02-11 14:22:29');
INSERT INTO `sys_menu` VALUES (16, 15, '新增', 'sys:reader:add', '', '', '', '2', '', '會員名單', 1, '2022-01-02 13:25:47', NULL);
INSERT INTO `sys_menu` VALUES (17, 15, '編輯', 'sys:reader:edit', '', '', '', '2', '', '會員名單', 2, '2022-01-02 13:26:06', NULL);
INSERT INTO `sys_menu` VALUES (18, 15, '刪除', 'sys:reader:delete', '', '', '', '2', '', '會員名單', 3, '2022-01-02 13:26:25', NULL);
INSERT INTO `sys_menu` VALUES (19, 0, '書本管理', 'sys:book:index', 'book', '/book', '', '0', 'iconfont icon-r-paper', '主選單', 3, '2022-01-02 13:27:11', '2022-02-11 14:11:59');
INSERT INTO `sys_menu` VALUES (20, 19, '書本分類', 'sys:bookCategory:index', 'bookCategory', '/bookCategory', '/book/bookCategory', '1', 'iconfont icon-r-paper', '書本管理', 1, '2022-01-02 13:28:10', '2022-02-11 14:13:53');
INSERT INTO `sys_menu` VALUES (21, 19, '書本名單', 'sys:bookList:list', 'bookList', '/bookList', '/book/bookList', '1', 'iconfont icon-r-list', '書本管理', 2, '2022-01-02 13:28:59', '2022-02-11 14:22:48');
INSERT INTO `sys_menu` VALUES (22, 20, '新增', 'sys:bookCategory:add', '', '', '', '2', '', '書本分類', 1, '2022-01-02 13:29:31', NULL);
INSERT INTO `sys_menu` VALUES (23, 20, '編輯', 'sys:bookCategory:edit', '', '', '', '2', '', '書本分類', 2, '2022-01-02 13:29:52', NULL);
INSERT INTO `sys_menu` VALUES (24, 20, '刪除', 'sys:bookCategory:delete', '', '', '', '2', '', '書本分類', 3, '2022-01-02 13:30:12', NULL);
INSERT INTO `sys_menu` VALUES (25, 21, '新增', 'sys:bookList:add', '', '', '', '2', '', '書本名單', 1, '2022-01-02 13:30:42', NULL);
INSERT INTO `sys_menu` VALUES (26, 21, '編輯', 'sys:bookList:edit', '', '', '', '2', '', '書本名單', 2, '2022-01-02 13:30:56', NULL);
INSERT INTO `sys_menu` VALUES (27, 21, '刪除', 'sys:bookList:delete', '', '', '', '2', '', '書本名單', 3, '2022-01-02 13:31:10', NULL);
INSERT INTO `sys_menu` VALUES (28, 0, '借閱管理', 'sys:borrow:index', 'borrow', '/borrow', '', '0', 'iconfont icon-r-refresh', '主選單', 5, '2022-01-02 13:32:02', '2022-02-11 14:23:29');
INSERT INTO `sys_menu` VALUES (29, 28, '借書管理', 'sys:bookBorrow:index', 'bookBorrow', '/bookBorrow', '/borrow/bookBorrow', '1', 'iconfont icon-r-left', '借閱管理', 1, '2022-01-02 13:33:07', '2022-02-11 14:23:13');
INSERT INTO `sys_menu` VALUES (30, 28, '還書管理', 'sys:bookReturn:index', 'bookReturn', '/bookReturn', '/borrow/bookReturn', '1', 'iconfont icon-r-right', '借閱管理', 2, '2022-01-02 13:33:58', '2022-02-11 14:23:43');
INSERT INTO `sys_menu` VALUES (31, 28, '借閱記錄', 'sys:borrowLook:index', 'borrowLook', '/borrowLook', '/borrow/borrowLook', '1', 'iconfont icon-r-find', '借閱管理', 3, '2022-01-02 13:34:48', NULL);
INSERT INTO `sys_menu` VALUES (32, 0, '公告管理', 'sys:notice:index', 'notice', '/notice', '', '0', 'iconfont icon-r-edit', '主選單', 6, '2022-01-02 13:35:27', '2022-02-11 14:12:36');
INSERT INTO `sys_menu` VALUES (33, 32, '公告', 'sys:noticeList:index', 'noticeList', '/noticeList', '/notice/noticeList', '1', 'iconfont icon-r-edit', '公告管理', 1, '2022-01-02 13:36:14', '2022-02-26 17:05:46');
INSERT INTO `sys_menu` VALUES (34, 29, '借書', 'sys:bookBorrow:borrow', '', '', '', '2', '', '借書管理', 1, '2022-01-02 13:37:03', '2022-01-08 18:15:23');
INSERT INTO `sys_menu` VALUES (37, 30, '新增', 'sys:bookReturn:add', '', '', '', '2', '', '還書管理', 1, '2022-01-02 13:38:01', NULL);
INSERT INTO `sys_menu` VALUES (38, 30, '編輯', 'sys:bookReturn:edit', '', '', '', '2', '', '還書管理', 2, '2022-01-02 13:38:17', NULL);
INSERT INTO `sys_menu` VALUES (39, 30, '刪除', 'sys:bookReturn:delete', '', '', '', '2', '', '還書管理', 3, '2022-01-02 13:38:31', NULL);
INSERT INTO `sys_menu` VALUES (40, 31, '新增', 'sys:borrowLook:add', '', '', '', '2', '', '借閱記錄', 1, '2022-01-02 13:38:58', NULL);
INSERT INTO `sys_menu` VALUES (41, 31, '編輯', 'sys:borrowLook:edit', '', '', '', '2', '', '借閱記錄', 2, '2022-01-02 13:39:27', NULL);
INSERT INTO `sys_menu` VALUES (42, 31, '刪除', 'sys:borrowLook:delete', '', '', '', '2', '', '借閱記錄', 3, '2022-01-02 13:39:41', NULL);
INSERT INTO `sys_menu` VALUES (43, 33, '新增', 'sys:noticeList:add', '', '', '', '2', '', '公告', 1, '2022-01-02 13:40:07', NULL);
INSERT INTO `sys_menu` VALUES (44, 33, '編輯', 'sys:noticeList:edit', '', '', '', '2', '', '公告', 2, '2022-01-02 13:40:19', NULL);
INSERT INTO `sys_menu` VALUES (45, 33, '刪除', 'sys:noticeList:delete', '', '', '', '2', '', '公告', 3, '2022-01-02 13:40:33', NULL);
INSERT INTO `sys_menu` VALUES (46, 33, '記錄', 'sys:notice:look', '', '', '', '2', '', '公告', 4, '2022-01-08 18:13:03', NULL);
INSERT INTO `sys_menu` VALUES (47, 31, '借閱管理--記錄', 'sys:borrowLook:look', '', '', '', '2', '', '借閱記錄', 4, '2022-01-08 18:14:15', NULL);
INSERT INTO `sys_menu` VALUES (48, 15, '會員名單---審核', 'sys:reader:apply', '', '', '', '2', '', '會員名單', 4, '2022-01-08 20:35:38', NULL);
INSERT INTO `sys_menu` VALUES (49, 4, '選單管理--編輯', 'sys:menu:edit', '', '', '', '2', '', '選單管理', 2, '2022-01-08 20:39:15', NULL);
INSERT INTO `sys_menu` VALUES (50, 4, '選單管理---刪除', 'sys:menu:delete', '', '', '', '2', '', '選單管理', 3, '2022-01-08 20:39:43', NULL);
INSERT INTO `sys_menu` VALUES (51, 31, '借閱記錄---審核', 'sys:borrowLook:apply', '', '', '', '2', '', '借閱記錄', 5, '2022-01-08 20:47:18', NULL);
INSERT INTO `sys_menu` VALUES (52, 31, '借閱記錄---續期', 'sys:borrowLook:addTime', '', '', '', '2', '', '借閱記錄', 5, '2022-01-09 12:40:12', NULL);
INSERT INTO `sys_menu` VALUES (53, 2, '帳戶管理----重置密碼', 'sys:user:resetpassword', '', '', '', '2', '', '帳戶管理', 6, '2022-01-11 17:43:28', NULL);
INSERT INTO `sys_menu` VALUES (54, 15, '會員名單----重置密碼功能', 'sys:reader:resetpassword', '', '', '', '2', '', '會員名單', 6, '2022-01-11 17:44:32', NULL);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '編號',
  `notice_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '標題',
  `notice_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '創建時間',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, 'HKPES網上書本借閱正式啟用', '歡迎大家註冊加入', '2026-07-20 15:38:12');

-- ----------------------------
-- Table structure for sys_reader
-- ----------------------------
DROP TABLE IF EXISTS `sys_reader`;
CREATE TABLE `sys_reader`  (
  `reader_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '會員編號',
  `username` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '姓名',
  `sex` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '電話',
  `email` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '電郵',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '密碼',
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '類別',
  `check_status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '審核狀態 0：未審核  1：已審核',
  `user_status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '會員狀態 0:停用  1：啟用',
  PRIMARY KEY (`reader_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_reader
-- ----------------------------
INSERT INTO `sys_reader` VALUES (1, '小美', '0', '66666666', 'happy@gmai.com', 'e10adc394', '1', '1', '1');
INSERT INTO `sys_reader` VALUES (2, '小可', '0', '55555555', 'sad@gmai.com', 'e10adc394', '1', '1', '1');
INSERT INTO `sys_reader` VALUES (3, '小愛', '0', '33333333', 'poor@gmai.com', 'e10adc394', '1', '1', '1');

ALTER TABLE `sys_reader` ADD UNIQUE INDEX `uk_phone` (`phone`);

-- ----------------------------
-- Table structure for sys_reader_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_reader_role`;
CREATE TABLE `sys_reader_role`  (
  `reader_role_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '編號',
  `reader_id` int(0) NULL DEFAULT NULL COMMENT '會員編號',
  `role_id` int(0) NOT NULL COMMENT '身份編號',
  PRIMARY KEY (`reader_role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_reader_role
-- ----------------------------
INSERT INTO `sys_reader_role` VALUES (8, 1, 5);
INSERT INTO `sys_reader_role` VALUES (10, 2, 5);
INSERT INTO `sys_reader_role` VALUES (27, 3, 5);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '身份編號',
  `role_name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '身份名稱',
  `role_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '身份類別 1：系統帳戶  2：會員',
  `remark` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '備註',
  `create_time` datetime NULL DEFAULT NULL COMMENT '創建時間',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新時間',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '系統總管', '1', '系統總管', '2021-12-06 13:50:28', NULL);
INSERT INTO `sys_role` VALUES (2, '管理員', '1', '管理員', '2022-02-15 15:40:19', NULL);
INSERT INTO `sys_role` VALUES (5, '會員', '2', '會員身份', '2022-02-15 15:40:06', NULL);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_menu_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '編號',
  `role_id` int(0) NULL DEFAULT NULL COMMENT '身份編號',
  `menu_id` int(0) NULL DEFAULT NULL COMMENT '選單編號',
  PRIMARY KEY (`role_menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 740 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (482, 5, 29);
INSERT INTO `sys_role_menu` VALUES (483, 5, 34);
INSERT INTO `sys_role_menu` VALUES (484, 5, 47);
INSERT INTO `sys_role_menu` VALUES (485, 5, 52);
INSERT INTO `sys_role_menu` VALUES (486, 5, 46);
INSERT INTO `sys_role_menu` VALUES (487, 5, 28);
INSERT INTO `sys_role_menu` VALUES (488, 5, 31);
INSERT INTO `sys_role_menu` VALUES (489, 5, 32);
INSERT INTO `sys_role_menu` VALUES (490, 5, 33);
INSERT INTO `sys_role_menu` VALUES (618, 1, 1);
INSERT INTO `sys_role_menu` VALUES (619, 1, 2);
INSERT INTO `sys_role_menu` VALUES (620, 1, 5);
INSERT INTO `sys_role_menu` VALUES (621, 1, 6);
INSERT INTO `sys_role_menu` VALUES (622, 1, 7);
INSERT INTO `sys_role_menu` VALUES (623, 1, 53);
INSERT INTO `sys_role_menu` VALUES (624, 1, 3);
INSERT INTO `sys_role_menu` VALUES (625, 1, 8);
INSERT INTO `sys_role_menu` VALUES (626, 1, 9);
INSERT INTO `sys_role_menu` VALUES (627, 1, 10);
INSERT INTO `sys_role_menu` VALUES (628, 1, 4);
INSERT INTO `sys_role_menu` VALUES (629, 1, 11);
INSERT INTO `sys_role_menu` VALUES (630, 1, 49);
INSERT INTO `sys_role_menu` VALUES (631, 1, 50);
INSERT INTO `sys_role_menu` VALUES (632, 1, 14);
INSERT INTO `sys_role_menu` VALUES (633, 1, 15);
INSERT INTO `sys_role_menu` VALUES (634, 1, 16);
INSERT INTO `sys_role_menu` VALUES (635, 1, 17);
INSERT INTO `sys_role_menu` VALUES (636, 1, 18);
INSERT INTO `sys_role_menu` VALUES (637, 1, 48);
INSERT INTO `sys_role_menu` VALUES (638, 1, 54);
INSERT INTO `sys_role_menu` VALUES (639, 1, 19);
INSERT INTO `sys_role_menu` VALUES (640, 1, 20);
INSERT INTO `sys_role_menu` VALUES (641, 1, 22);
INSERT INTO `sys_role_menu` VALUES (642, 1, 23);
INSERT INTO `sys_role_menu` VALUES (643, 1, 24);
INSERT INTO `sys_role_menu` VALUES (644, 1, 21);
INSERT INTO `sys_role_menu` VALUES (645, 1, 25);
INSERT INTO `sys_role_menu` VALUES (646, 1, 26);
INSERT INTO `sys_role_menu` VALUES (647, 1, 27);
INSERT INTO `sys_role_menu` VALUES (648, 1, 28);
INSERT INTO `sys_role_menu` VALUES (649, 1, 29);
INSERT INTO `sys_role_menu` VALUES (650, 1, 34);
INSERT INTO `sys_role_menu` VALUES (651, 1, 30);
INSERT INTO `sys_role_menu` VALUES (652, 1, 37);
INSERT INTO `sys_role_menu` VALUES (653, 1, 38);
INSERT INTO `sys_role_menu` VALUES (654, 1, 39);
INSERT INTO `sys_role_menu` VALUES (655, 1, 31);
INSERT INTO `sys_role_menu` VALUES (656, 1, 40);
INSERT INTO `sys_role_menu` VALUES (657, 1, 41);
INSERT INTO `sys_role_menu` VALUES (658, 1, 42);
INSERT INTO `sys_role_menu` VALUES (659, 1, 47);
INSERT INTO `sys_role_menu` VALUES (660, 1, 51);
INSERT INTO `sys_role_menu` VALUES (661, 1, 52);
INSERT INTO `sys_role_menu` VALUES (662, 1, 43);
INSERT INTO `sys_role_menu` VALUES (663, 1, 44);
INSERT INTO `sys_role_menu` VALUES (664, 1, 45);
INSERT INTO `sys_role_menu` VALUES (666, 1, 32);
INSERT INTO `sys_role_menu` VALUES (667, 1, 33);
INSERT INTO `sys_role_menu` VALUES (704, 2, 14);
INSERT INTO `sys_role_menu` VALUES (705, 2, 15);
INSERT INTO `sys_role_menu` VALUES (706, 2, 16);
INSERT INTO `sys_role_menu` VALUES (707, 2, 17);
INSERT INTO `sys_role_menu` VALUES (708, 2, 18);
INSERT INTO `sys_role_menu` VALUES (709, 2, 48);
INSERT INTO `sys_role_menu` VALUES (710, 2, 54);
INSERT INTO `sys_role_menu` VALUES (711, 2, 19);
INSERT INTO `sys_role_menu` VALUES (712, 2, 20);
INSERT INTO `sys_role_menu` VALUES (713, 2, 22);
INSERT INTO `sys_role_menu` VALUES (714, 2, 23);
INSERT INTO `sys_role_menu` VALUES (715, 2, 24);
INSERT INTO `sys_role_menu` VALUES (716, 2, 21);
INSERT INTO `sys_role_menu` VALUES (717, 2, 25);
INSERT INTO `sys_role_menu` VALUES (718, 2, 26);
INSERT INTO `sys_role_menu` VALUES (719, 2, 27);
INSERT INTO `sys_role_menu` VALUES (720, 2, 28);
INSERT INTO `sys_role_menu` VALUES (721, 2, 29);
INSERT INTO `sys_role_menu` VALUES (722, 2, 34);
INSERT INTO `sys_role_menu` VALUES (723, 2, 30);
INSERT INTO `sys_role_menu` VALUES (724, 2, 37);
INSERT INTO `sys_role_menu` VALUES (725, 2, 38);
INSERT INTO `sys_role_menu` VALUES (726, 2, 39);
INSERT INTO `sys_role_menu` VALUES (727, 2, 31);
INSERT INTO `sys_role_menu` VALUES (728, 2, 40);
INSERT INTO `sys_role_menu` VALUES (729, 2, 41);
INSERT INTO `sys_role_menu` VALUES (730, 2, 42);
INSERT INTO `sys_role_menu` VALUES (731, 2, 47);
INSERT INTO `sys_role_menu` VALUES (732, 2, 51);
INSERT INTO `sys_role_menu` VALUES (733, 2, 52);
INSERT INTO `sys_role_menu` VALUES (734, 2, 32);
INSERT INTO `sys_role_menu` VALUES (735, 2, 33);
INSERT INTO `sys_role_menu` VALUES (736, 2, 43);
INSERT INTO `sys_role_menu` VALUES (737, 2, 44);
INSERT INTO `sys_role_menu` VALUES (738, 2, 45);
INSERT INTO `sys_role_menu` VALUES (739, 2, 46);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '帳戶編號',
  `username` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '登入帳戶',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '登入密碼',
  `phone` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '帳戶電話',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '電郵',
  `sex` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '0:男 1：女',
  `is_admin` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否為系統總管 1：是 0：否',
  `is_account_non_expired` tinyint(0) NULL DEFAULT NULL COMMENT '帳戶是否過期(1 未過期，0已過期)',
  `is_account_non_locked` tinyint(0) NULL DEFAULT NULL COMMENT '帳戶是否被鎖定(1 未鎖定，0已鎖定)',
  `is_credentials_non_expired` tinyint(0) NULL DEFAULT NULL COMMENT '密碼是否過期(1 未過期，0已過期)',
  `is_enabled` tinyint(0) NULL DEFAULT NULL COMMENT '帳戶是否可用(1 可用，0 刪除賬戶)',
  `nick_name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '姓名',
  `create_time` datetime NULL DEFAULT NULL COMMENT '創建時間',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新時間',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (3, 'superadmin', 'e10adc3949ba59abbe56e057f20f883e', '13477777777', '11232324344@gmail.com', '0', '1', 1, 1, 1, 1, '系統總管Nancy', '2026-07-20 15:05:04', '2026-08-27 16:00:58');
INSERT INTO `sys_user` VALUES (9, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '19977777777', '19977777777@gmail.com', '1', '0', 1, 1, 1, 1, '管理員Paul', '2026-08-14 21:31:52', '2024-09-24 15:56:11');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_role_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '編號',
  `user_id` int(0) NULL DEFAULT NULL COMMENT '帳戶編號',
  `role_id` int(0) NULL DEFAULT NULL COMMENT '身份編號',
  PRIMARY KEY (`user_role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (38, 9, 2);
INSERT INTO `sys_user_role` VALUES (40, 3, 1);

SET FOREIGN_KEY_CHECKS = 1;
