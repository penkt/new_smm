/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : news_ssm

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2018-05-02 13:51:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for group_info
-- ----------------------------
DROP TABLE IF EXISTS `group_info`;
CREATE TABLE `group_info` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_prentid` int(11) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `role_ids` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of group_info
-- ----------------------------
INSERT INTO `group_info` VALUES ('1', '1', '管理员', '17,18,19,20,21,22,23,27,28,29,30,31,33');
INSERT INTO `group_info` VALUES ('5', '2', '采编部', '22,30');
INSERT INTO `group_info` VALUES ('6', '2', '审核管理', '29');
INSERT INTO `group_info` VALUES ('7', '2', '发布用户', '22,31');
INSERT INTO `group_info` VALUES ('8', '2', '新闻管理', '22,23,29,30');
INSERT INTO `group_info` VALUES ('9', '3', '权限管理', '17,18,19');

-- ----------------------------
-- Table structure for news_info
-- ----------------------------
DROP TABLE IF EXISTS `news_info`;
CREATE TABLE `news_info` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `news_title` varchar(11) DEFAULT NULL,
  `news_name` varchar(255) DEFAULT NULL,
  `news_desc` varchar(255) DEFAULT NULL,
  `news_keywords` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `news_content` longtext,
  `is_flag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of news_info
-- ----------------------------
INSERT INTO `news_info` VALUES ('3', '8', null, 'news_id', 'fdsafa', 'safasf', '2018-04-07 11:26:34', null, '-1');
INSERT INTO `news_info` VALUES ('4', '8', null, 'news_id', 'news', 'news', '2018-04-07 11:26:37', '<p style=\"text-indent: 2em;\">在与同类组件的比较中，layer总是能轻易获胜。她尽可能地在以更少的代码展现更强健的功能，且格外注重性能的提升、易用和实用性，正因如此，越来越多的开发者将媚眼投上了layer（已被6212022人次关注）。</p><p style=\"text-indent: 2em;\">layer 甚至兼容了包括 IE6 在内的所有主流浏览器。</p><p>她数量可观的接口，使得您可以自定义太多您需要的风格，每一种弹层模式各具特色，广受欢迎</p><p>当然，这种“王婆卖瓜”的陈述听起来总是有点难受，</p><p>因此你需要进一步了解她是否真的如你所愿。</p>', '1');
INSERT INTO `news_info` VALUES ('8', '6', null, '注册拦截器的方法 ', null, '注册拦截器的方法 ', '2018-04-07 15:53:47', '<p><span style=\"color: rgb(170, 170, 170); font-family: georgia, Verdana, Helvetica, Arial; font-size: 13px;\"><img src=\"/news_ssm//ueditor/jsp/upload/image/20180408/1523146266374004950.png\" title=\"1523146266374004950.png\" alt=\"15.png\"/>注册拦截器的方法&nbsp;</span><span style=\"color: rgb(170, 170, 170); font-family: georgia, Verdana, Helvetica, Arial; font-size: 13px;\">注册拦截器的方法&nbsp;</span><span style=\"color: rgb(170, 170, 170); font-family: georgia, Verdana, Helvetica, Arial; font-size: 13px;\">注册拦截器的方法&nbsp;</span></p>', '0');
INSERT INTO `news_info` VALUES ('9', '11', null, '12312312', null, '12312312312', '2018-04-08 11:18:17', '<p><img alt=\"铲车潍坊柴油机490制造工厂\" src=\"/ueditor/jsp/upload/image/20180408/1523157465957093123.jpg\" width=\"350\" height=\"300\"/></p><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p><strong style=\"list-style: none; margin: 0px; padding: 0px; border: currentColor;\">产品品牌：</strong></p></li><li><p><span style=\"list-style: none; margin: 0px; padding: 0px; border: currentColor;\">潍坊华诚</span>&nbsp;</p></li><li><p><strong style=\"list-style: none; margin: 0px; padding: 0px; border: currentColor;\">产品单价：</strong></p></li><li><p><span style=\"list-style: none; margin: 0px; padding: 0px; border: currentColor;\">台</span>&nbsp;</p></li><li><p><strong style=\"list-style: none; margin: 0px; padding: 0px; border: currentColor;\">最小起订：</strong></p></li><li><p><span style=\"list-style: none; margin: 0px; padding: 0px; border: currentColor;\">1</span>&nbsp;</p></li><li><p><strong style=\"list-style: none; margin: 0px; padding: 0px; border: currentColor;\">供货总量：</strong></p></li><li><p><span style=\"list-style: none; margin: 0px; padding: 0px; border: currentColor;\">50000</span>&nbsp;</p></li><li><p><strong style=\"list-style: none; margin: 0px; padding: 0px; border: currentColor;\">发货期限：</strong></p></li><li><p><span style=\"list-style: none; margin: 0px; padding: 0px; border: currentColor;\">1-3天</span>&nbsp;</p></li><li><p><strong style=\"list-style: none; margin: 0px; padding: 0px; border: currentColor;\">发货城市：</strong></p></li><li><p><span style=\"list-style: none; margin: 0px; padding: 0px; border: currentColor;\">山东潍坊</span>&nbsp;</p></li></ul><p style=\"list-style: none; margin: 0px 0px 10px; padding: 0px; border: currentColor; text-align: justify; color: rgb(0, 0, 0); text-transform: none; line-height: 1.8; text-indent: 32px; letter-spacing: normal; font-family: &quot;microsoft yahei&quot;, 微软雅黑, STHeiti, &quot;wenquanyi micro hei&quot;, SimSun, sans-serif; font-size: medium; font-style: normal; font-weight: 400; word-spacing: 0px; white-space: normal; orphans: 2; widows: 2; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">铲车潍坊柴油机490制造工厂</p><p style=\"list-style: none; margin: 0px 0px 10px; padding: 0px; border: currentColor; text-align: justify; color: rgb(0, 0, 0); text-transform: none; line-height: 1.8; text-indent: 32px; letter-spacing: normal; font-family: &quot;microsoft yahei&quot;, 微软雅黑, STHeiti, &quot;wenquanyi micro hei&quot;, SimSun, sans-serif; font-size: medium; font-style: normal; font-weight: 400; word-spacing: 0px; white-space: normal; orphans: 2; widows: 2; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\"><img alt=\"铲车潍坊柴油机490制造工厂\" src=\"/ueditor/jsp/upload/image/20180408/1523157466175007107.jpg\"/><img alt=\"铲车潍坊柴油机490制造工厂\" src=\"/ueditor/jsp/upload/image/20180408/1523157466253038644.jpg\"/><img alt=\"铲车潍坊柴油机490制造工厂\" src=\"/ueditor/jsp/upload/image/20180408/1523157466305019846.jpg\"/><img alt=\"铲车潍坊柴油机490制造工厂\" src=\"/ueditor/jsp/upload/image/20180408/1523157466253038644.jpg\"/><img alt=\"铲车潍坊柴油机490制造工厂\" src=\"/ueditor/jsp/upload/image/20180408/1523157466574005801.jpg\"/></p><p style=\"list-style: none; margin: 0px 0px 10px; padding: 0px; border: currentColor; text-align: justify; color: rgb(0, 0, 0); text-transform: none; line-height: 1.8; text-indent: 32px; letter-spacing: normal; font-family: &quot;microsoft yahei&quot;, 微软雅黑, STHeiti, &quot;wenquanyi micro hei&quot;, SimSun, sans-serif; font-size: medium; font-style: normal; font-weight: 400; word-spacing: 0px; white-space: normal; orphans: 2; widows: 2; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">&nbsp;&nbsp;　　（7）将轮胎装到轮辋上，装上锁圈、挡圈；安装过程中要保护好气门嘴。&nbsp;&nbsp;　　2.原因排查装载机在比较恶劣的工地（比如岩石面）作业时经常发生爆胎。由于前轮承担负载、转向、驱动功能，且首先接触地面异物，因而更容易发生爆胎。装载机轮胎自重较大，加上受场地、工具限制，现场更换前轮胎费时费力。笔者所在单位拥有较多装载机，且经常在露天采场作业，爆胎时有发生，经过多年实践，摸索一条简易、快速更换装载机前轮胎的方法，具体如下：&nbsp;&nbsp;&nbsp;&nbsp;</p><p style=\"list-style: none; margin: 0px 0px 10px; padding: 0px; border: currentColor; text-align: justify; color: rgb(0, 0, 0); text-transform: none; line-height: 1.8; text-indent: 32px; letter-spacing: normal; font-family: &quot;microsoft yahei&quot;, 微软雅黑, STHeiti, &quot;wenquanyi micro hei&quot;, SimSun, sans-serif; font-size: medium; font-style: normal; font-weight: 400; word-spacing: 0px; white-space: normal; orphans: 2; widows: 2; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">　　（3）将内、外胎的相对位置作好标记，以便查找、异物和修补轮胎。&nbsp;&nbsp;　　由此看出，以上3种原因导致胶管扣压处容易发生渗油。&nbsp;&nbsp;　　进一步分析认为，胶管接头的扣压芯管与扣压外卡套的加工质量符合要求，是确保胶管不渗漏的关键。我们把质量较好、无渗漏的胶管接头与出现渗漏的胶管接头分别剖开进行对比，发现2种胶管接头芯管的加工质量确实有较大的差别。具体如下：&nbsp;&nbsp;</p><p style=\"list-style: none; margin: 0px 0px 10px; padding: 0px; border: currentColor; text-align: justify; color: rgb(0, 0, 0); text-transform: none; line-height: 1.8; text-indent: 32px; letter-spacing: normal; font-family: &quot;microsoft yahei&quot;, 微软雅黑, STHeiti, &quot;wenquanyi micro hei&quot;, SimSun, sans-serif; font-size: medium; font-style: normal; font-weight: 400; word-spacing: 0px; white-space: normal; orphans: 2; widows: 2; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">&nbsp;</p><p style=\"list-style: none; margin: 0px 0px 10px; padding: 0px; border: currentColor; text-align: justify; color: rgb(0, 0, 0); text-transform: none; line-height: 1.8; text-indent: 32px; letter-spacing: normal; font-family: &quot;microsoft yahei&quot;, 微软雅黑, STHeiti, &quot;wenquanyi micro hei&quot;, SimSun, sans-serif; font-size: medium; font-style: normal; font-weight: 400; word-spacing: 0px; white-space: normal; orphans: 2; widows: 2; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">卡特992D型装载机的铲斗定位机构是通过“霍尔效应”这一固态电路开关控制的，电路原理。“霍尔效应”开关在受到磁场作用后，即被触发启动，随着倾斜缸活塞杆伸缩的磁铁控制着铲斗定位机构开关的通断。</p><p style=\"list-style: none; margin: 0px 0px 10px; padding: 0px; border: currentColor; text-align: justify; color: rgb(0, 0, 0); text-transform: none; line-height: 1.8; text-indent: 32px; letter-spacing: normal; font-family: &quot;microsoft yahei&quot;, 微软雅黑, STHeiti, &quot;wenquanyi micro hei&quot;, SimSun, sans-serif; font-size: medium; font-style: normal; font-weight: 400; word-spacing: 0px; white-space: normal; orphans: 2; widows: 2; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">当铲斗定位机构被触发时，它是锁定的，这与提升机构不同，提升机构定位器开关在接通片刻后随即分断的，而铲斗定位开关导通后，一直要维持到铲斗倾斜时为止。铲斗倾斜时，铲斗推动磁铁返回，跨过接通位，磁铁失去作用，然后它继续移动跨过关断位，当磁铁接近关断位时，通过电子电路开关被分断，使电磁线圈中的电流被切断，制动棘爪为下一次动作做好准备。&nbsp;</p><p style=\"list-style: none; margin: 0px 0px 10px; padding: 0px; border: currentColor; text-align: justify; color: rgb(0, 0, 0); text-transform: none; line-height: 1.8; text-indent: 32px; letter-spacing: normal; font-family: &quot;microsoft yahei&quot;, 微软雅黑, STHeiti, &quot;wenquanyi micro hei&quot;, SimSun, sans-serif; font-size: medium; font-style: normal; font-weight: 400; word-spacing: 0px; white-space: normal; orphans: 2; widows: 2; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">当铲斗定位机构出现故障时，可通过以下步骤进行检测与修理。&nbsp;</p><p style=\"list-style: none; margin: 0px 0px 10px; padding: 0px; border: currentColor; text-align: justify; color: rgb(0, 0, 0); text-transform: none; line-height: 1.8; text-indent: 32px; letter-spacing: normal; font-family: &quot;microsoft yahei&quot;, 微软雅黑, STHeiti, &quot;wenquanyi micro hei&quot;, SimSun, sans-serif; font-size: medium; font-style: normal; font-weight: 400; word-spacing: 0px; white-space: normal; orphans: 2; widows: 2; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">⑴检查铲斗定位机构管式熔断器是否熔断或接触不良，如更换的保险管再次被熔断，则线路存在短路故障，可参照电路图对相关电路作检查处理。&nbsp;</p><p style=\"list-style: none; margin: 0px 0px 10px; padding: 0px; border: currentColor; text-align: justify; color: rgb(0, 0, 0); text-transform: none; line-height: 1.8; text-indent: 32px; letter-spacing: normal; font-family: &quot;microsoft yahei&quot;, 微软雅黑, STHeiti, &quot;wenquanyi micro hei&quot;, SimSun, sans-serif; font-size: medium; font-style: normal; font-weight: 400; word-spacing: 0px; white-space: normal; orphans: 2; widows: 2; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">⑵当操纵铲斗定位开关时，磁铁应移至定位开关的正上方处，磁铁与定位开关的距离应为4～6mm。如不符，应进行调整。&nbsp;</p><p style=\"list-style: none; margin: 0px 0px 10px; padding: 0px; border: currentColor; text-align: justify; color: rgb(0, 0, 0); text-transform: none; line-height: 1.8; text-indent: 32px; letter-spacing: normal; font-family: &quot;microsoft yahei&quot;, 微软雅黑, STHeiti, &quot;wenquanyi micro hei&quot;, SimSun, sans-serif; font-size: medium; font-style: normal; font-weight: 400; word-spacing: 0px; white-space: normal; orphans: 2; widows: 2; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">⑶检查磁铁是否完好。操纵铲斗定位手柄，使磁铁与定位开关远离，再将自备的磁铁移近定位开关，察看磁铁是不是将铲斗定位机构的电磁线圈激磁了，如果电磁线圈被激磁，则必须更换原磁铁。&nbsp;</p><p style=\"list-style: none; margin: 0px 0px 10px; padding: 0px; border: currentColor; text-align: justify; color: rgb(0, 0, 0); text-transform: none; line-height: 1.8; text-indent: 32px; letter-spacing: normal; font-family: &quot;microsoft yahei&quot;, 微软雅黑, STHeiti, &quot;wenquanyi micro hei&quot;, SimSun, sans-serif; font-size: medium; font-style: normal; font-weight: 400; word-spacing: 0px; white-space: normal; orphans: 2; widows: 2; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">⑷若磁铁未能使电磁线圈激磁，则应拔开定位开关与线束的连接器，检查其插座与插头之间的接触情况，并使其保持接触良好，然后将点火开关转至“ON”（接通）的位置，用万用表直流电压档做检测，插座A（128号粉红色线）和插座B（762号黄色线）与地（机体）之间都应该有一定的电压。必须提醒的是，检测插座B与地（机体）之间的电压时，应将定位开关的插头与线束的插座连接好，并用测试针（可用大头针代替）穿透762号黄色线的绝缘层。在关断点火开关后，插座C与地（机体）之间应该处于导通状态，如果对以上检测的结果出现异常，可参照电路图找出其故障原因，比如，当测得插座A与地（机体）之间的电压正常，而插座B（762号线）与地（机体）之间却无电压输出，则可判断故障出于铲斗定位开关。&nbsp;</p><p style=\"list-style: none; margin: 0px 0px 10px; padding: 0px; border: currentColor; text-align: justify; color: rgb(0, 0, 0); text-transform: none; line-height: 1.8; text-indent: 32px; letter-spacing: normal; font-family: &quot;microsoft yahei&quot;, 微软雅黑, STHeiti, &quot;wenquanyi micro hei&quot;, SimSun, sans-serif; font-size: medium; font-style: normal; font-weight: 400; word-spacing: 0px; white-space: normal; orphans: 2; widows: 2; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">⑸如果对铲斗定位机构的开关线路端检测的结果正常，而铲斗定位机构仍不工作，则可检测铲斗定位机构的电磁线圈。检测方法如下：拆卸铲斗定位电磁阀线路连接器，将点火开关转至“ON”位，测量插座1（200号黑色线）和插座2（762号黄色线）之间有无电压，若有电压，则电磁线圈或其插头的连线必须修理或更换；如果没有电压，则可根据电路图检测线路762号线、200号线是否存在开路，如线路正常，而铲斗定位开关连接器B端762号线无电压输出，则必须更换铲斗定位开关。</p><p style=\"list-style: none; margin: 0px 0px 10px; padding: 0px; border: currentColor; text-align: justify; color: rgb(0, 0, 0); text-transform: none; line-height: 1.8; text-indent: 32px; letter-spacing: normal; font-family: &quot;microsoft yahei&quot;, 微软雅黑, STHeiti, &quot;wenquanyi micro hei&quot;, SimSun, sans-serif; font-size: medium; font-style: normal; font-weight: 400; word-spacing: 0px; white-space: normal; orphans: 2; widows: 2; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">&nbsp;</p><p style=\"list-style: none; margin: 0px 0px 10px; padding: 0px; border: currentColor; text-align: justify; color: rgb(0, 0, 0); text-transform: none; line-height: 1.8; text-indent: 32px; letter-spacing: normal; font-family: &quot;microsoft yahei&quot;, 微软雅黑, STHeiti, &quot;wenquanyi micro hei&quot;, SimSun, sans-serif; font-size: medium; font-style: normal; font-weight: 400; word-spacing: 0px; white-space: normal; orphans: 2; widows: 2; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">铲车潍坊柴油机490制造工厂</p><p>&nbsp;</p>', '0');
INSERT INTO `news_info` VALUES ('10', '6', null, ' 初识Spring Boot框架', null, 'Spring  Spring boot', '2018-04-08 12:55:14', '<p><span style=\"color: rgb(79, 79, 79); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif, SimHei, SimSun; text-align: justify; background-color: rgb(255, 255, 255);\">前面的铺垫文章已经连着写了六篇了，主要是介绍了Spring和SpringMVC框架，小伙伴们在学习的过程中大概也发现了这两个框架需要我们手动配置的地方非常多，不过做JavaEE开发的小伙伴们肯定也听说过“约定大于配置”这样一句话，就是说系统，类库，框架应该假定合理的默认值，而非要求提供不必要的配置，可是使用Spring或者SpringMVC的话依然有许多这样的东西需要我们进行配置，这样不仅徒增工作量而且在跨平台部署时容易出问题。OK，由于这些已经存在的问题，Spring Boot应运而生，使用Spring Boot可以让我们快速创建一个基于Spring的项目，而让这个Spring项目跑起来我们只需要很少的配置就可以了。Spring Boot主要有如下核心功能：</span></p>', '1');
INSERT INTO `news_info` VALUES ('11', '6', null, 'SpringBootApplication注解', null, '', '2018-04-08 13:02:48', '<p><span class=\"hljs-annotation\" style=\"color: rgb(155, 133, 157); box-sizing: border-box; font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre;\">@Target</span><span style=\"font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre; background-color: rgb(246, 248, 250);\">({ElementType.TYPE})</span><span class=\"hljs-annotation\" style=\"color: rgb(155, 133, 157); box-sizing: border-box; font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre;\">@Retention</span><span style=\"font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre; background-color: rgb(246, 248, 250);\">(RetentionPolicy.RUNTIME)</span><span class=\"hljs-annotation\" style=\"color: rgb(155, 133, 157); box-sizing: border-box; font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre;\">@Documented</span><span style=\"font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre; background-color: rgb(246, 248, 250);\"></span><span class=\"hljs-annotation\" style=\"color: rgb(155, 133, 157); box-sizing: border-box; font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre;\">@Inherited</span><span style=\"font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre; background-color: rgb(246, 248, 250);\"></span><span class=\"hljs-annotation\" style=\"color: rgb(155, 133, 157); box-sizing: border-box; font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre;\">@SpringBootConfiguration</span><span style=\"font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre; background-color: rgb(246, 248, 250);\"></span><span class=\"hljs-annotation\" style=\"color: rgb(155, 133, 157); box-sizing: border-box; font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre;\">@EnableAutoConfiguration</span><span style=\"font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre; background-color: rgb(246, 248, 250);\"></span><span class=\"hljs-annotation\" style=\"color: rgb(155, 133, 157); box-sizing: border-box; font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre;\">@ComponentScan</span><span style=\"font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre; background-color: rgb(246, 248, 250);\">(\r\n &nbsp; &nbsp;excludeFilters = {</span><span class=\"hljs-annotation\" style=\"color: rgb(155, 133, 157); box-sizing: border-box; font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre;\">@Filter</span><span style=\"font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre; background-color: rgb(246, 248, 250);\">(\r\n &nbsp; &nbsp;type = FilterType.CUSTOM,\r\n &nbsp; &nbsp;classes = {TypeExcludeFilter.class}\r\n)}\r\n)</span><span class=\"hljs-keyword\" style=\"color: rgb(0, 0, 136); box-sizing: border-box; font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre;\">public</span><span style=\"font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre; background-color: rgb(246, 248, 250);\"> @</span><span class=\"hljs-class\" style=\"box-sizing: border-box; font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre;\"><span class=\"hljs-keyword\" style=\"color: rgb(0, 0, 136); box-sizing: border-box;\">interface</span> <span class=\"hljs-title\" style=\"box-sizing: border-box; color: rgb(79, 79, 79);\">SpringBootApplication</span> {</span><span style=\"font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre; background-color: rgb(246, 248, 250);\">}</span></p>', '1');
INSERT INTO `news_info` VALUES ('12', '11', null, '大爱临商感恩同行 临沂商会市区分会举行新春年会', null, '', '2018-04-08 14:43:57', '<p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">说起来，刘强东和湖南湘潭的缘分不止一点点，在今年的1月，刘强东发了寻祖公告，称自己的太爷爷是湖南湘潭人，而自己的家族是刘氏湘潭钟灵堂开始，当地的乡亲可以说是炸开了锅，纷纷建立了多个寻亲群，来帮助这位霸道总裁寻亲，甚至还有不少村民来认亲戚：“东哥，我是刘强西啊”，“一大批湘潭刘氏在去找你的路上”，“我是刘三姐”，当然这也只是开开玩笑。</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\"></span></p><p><img src=\"/news_ssm//ueditor/jsp/upload/image/20180408/1523170450492021474.png\" title=\"1523170450492021474.png\" alt=\"15.png\"/></p><p><br/></p>', '0');
INSERT INTO `news_info` VALUES ('13', '6', null, 'Configuration   ', null, '', '2018-04-08 15:06:39', '<p><span class=\"hljs-javadoc\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(136, 0, 0); font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre;\"><img src=\"/news_ssm//ueditor/jsp/upload/image/20180408/1523178932462060927.png\" title=\"1523178932462060927.png\" alt=\"bg.png\"/>\r\n *file: CustomWebMvcConfigurerAdapter.java\r\n * Created by jiaobuchong on 12/23/15.\r\n */</span><span style=\"font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre; background-color: rgb(246, 248, 250);\"></span><span class=\"hljs-annotation\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(155, 133, 157); font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre;\">@Configuration</span><span style=\"font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre; background-color: rgb(246, 248, 250);\"> &nbsp; </span><span class=\"hljs-comment\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(136, 0, 0); font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre;\">//标注此文件为一个配置项，spring boot才会扫描到该配置。该注解类似于之前使用xml进行配置</span><span style=\"font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre; background-color: rgb(246, 248, 250);\"></span><span class=\"hljs-keyword\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(0, 0, 136); font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre;\">public</span><span style=\"font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre; background-color: rgb(246, 248, 250);\"> </span><span class=\"hljs-class\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre;\"><span class=\"hljs-keyword\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(0, 0, 136);\">class</span> <span class=\"hljs-title\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(79, 79, 79);\">CustomWebMvcConfigurerAdapter</span> <span class=\"hljs-keyword\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(0, 0, 136);\">extends</span> <span class=\"hljs-title\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(79, 79, 79);\">WebMvcConfigurerAdapter</span> {</span><span style=\"font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre; background-color: rgb(246, 248, 250);\">\r\n &nbsp; &nbsp;</span><span class=\"hljs-annotation\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(155, 133, 157); font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre;\">@Override</span><span style=\"font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre; background-color: rgb(246, 248, 250);\">\r\n &nbsp; &nbsp;</span><span class=\"hljs-keyword\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(0, 0, 136); font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre;\">public</span><span style=\"font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre; background-color: rgb(246, 248, 250);\"> </span><span class=\"hljs-keyword\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(0, 0, 136); font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre;\">void</span><span style=\"font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre; background-color: rgb(246, 248, 250);\"> </span><span class=\"hljs-title\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(0, 153, 0); font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre;\">addInterceptors</span><span style=\"font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre; background-color: rgb(246, 248, 250);\">(InterceptorRegistry registry) {\r\n &nbsp; &nbsp; &nbsp; &nbsp;registry.addInterceptor(</span><span class=\"hljs-keyword\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(0, 0, 136); font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre;\">new</span><span style=\"font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre; background-color: rgb(246, 248, 250);\"> UserInterceptor()).addPathPatterns(</span><span class=\"hljs-string\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(0, 153, 0); font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre;\">&quot;/user/**&quot;</span><span style=\"font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre; background-color: rgb(246, 248, 250);\">); &nbsp;</span><span class=\"hljs-comment\" style=\"margin: 0px; padding: 0px; box-sizing: border-box; color: rgb(136, 0, 0); font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre;\">//对来自/user/** 这个链接来的请求进行拦截</span><span style=\"font-family: Consolas, Inconsolata, Courier, monospace; font-size: 14px; white-space: pre; background-color: rgb(246, 248, 250);\">\r\n &nbsp; &nbsp;}\r\n}</span></p>', '0');
INSERT INTO `news_info` VALUES ('23', '11', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for news_log
-- ----------------------------
DROP TABLE IF EXISTS `news_log`;
CREATE TABLE `news_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `doing` varchar(255) DEFAULT NULL,
  `log_name` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_flag` int(255) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of news_log
-- ----------------------------
INSERT INTO `news_log` VALUES ('13', '2018-04-08 13:54:24', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('15', '2018-04-08 13:54:34', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('17', '2018-04-08 13:55:10', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('18', '2018-04-08 13:57:24', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('19', '2018-04-08 14:00:24', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('20', '2018-04-08 14:05:02', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('21', '2018-04-08 14:07:28', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('22', '2018-04-08 14:14:09', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('23', '2018-04-08 14:14:20', null, '删除日志', '日志id:14', '6', '1');
INSERT INTO `news_log` VALUES ('24', '2018-04-08 14:14:24', null, '删除日志', '日志id:16', '6', '1');
INSERT INTO `news_log` VALUES ('25', '2018-04-08 14:15:29', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('26', '2018-04-08 14:15:38', null, '退出系统', '', '6', '1');
INSERT INTO `news_log` VALUES ('27', '2018-04-08 14:15:57', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('28', '2018-04-08 14:21:53', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('29', '2018-04-08 14:34:14', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('30', '2018-04-08 14:36:53', null, '登录系统', '成功登录', '11', '1');
INSERT INTO `news_log` VALUES ('31', '2018-04-08 14:38:06', null, '修改用户', '用户名为:admin', '11', '1');
INSERT INTO `news_log` VALUES ('32', '2018-04-08 14:40:03', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('33', '2018-04-08 14:40:36', null, '审核新闻', '新闻id:11,状态改为:1', '6', '1');
INSERT INTO `news_log` VALUES ('34', '2018-04-08 14:40:39', null, '审核新闻', '新闻id:11,状态改为:1', '6', '1');
INSERT INTO `news_log` VALUES ('35', '2018-04-08 14:40:41', null, '审核新闻', '新闻id:11,状态改为:1', '6', '1');
INSERT INTO `news_log` VALUES ('36', '2018-04-08 14:40:42', null, '审核新闻', '新闻id:11,状态改为:1', '6', '1');
INSERT INTO `news_log` VALUES ('37', '2018-04-08 14:40:48', null, '审核新闻', '新闻id:10,状态改为:1', '6', '1');
INSERT INTO `news_log` VALUES ('38', '2018-04-08 14:42:28', null, '登录系统', '成功登录', '11', '1');
INSERT INTO `news_log` VALUES ('39', '2018-04-08 14:43:57', null, '发布新闻', '大爱临商感恩同行 临沂商会市区分会举行新春年会', '11', '1');
INSERT INTO `news_log` VALUES ('40', '2018-04-08 14:44:44', null, '修改新闻', '新闻id:12新闻标题:大爱临商感恩同行 临沂商会市区分会举行新春年会', '11', '1');
INSERT INTO `news_log` VALUES ('41', '2018-04-08 14:46:36', null, '添加用户', '用户名:test', '11', '1');
INSERT INTO `news_log` VALUES ('42', '2018-04-08 14:46:40', null, '退出系统', '', '11', '1');
INSERT INTO `news_log` VALUES ('43', '2018-04-08 14:46:45', null, '登录系统', '成功登录', '12', '1');
INSERT INTO `news_log` VALUES ('44', '2018-04-08 14:47:06', null, '退出系统', '', '12', '1');
INSERT INTO `news_log` VALUES ('45', '2018-04-08 14:47:12', null, '登录系统', '成功登录', '11', '1');
INSERT INTO `news_log` VALUES ('46', '2018-04-08 14:49:56', null, '退出系统', '', '11', '1');
INSERT INTO `news_log` VALUES ('47', '2018-04-08 14:50:04', null, '登录系统', '成功登录', '12', '1');
INSERT INTO `news_log` VALUES ('48', '2018-04-08 14:54:12', null, '修改新闻', '新闻id:12新闻标题:大爱临商感恩同行 临沂商会市区分会举行新春年会', '6', '1');
INSERT INTO `news_log` VALUES ('49', '2018-04-08 14:56:25', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('50', '2018-04-08 15:01:14', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('51', '2018-04-08 15:04:01', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('52', '2018-04-08 15:05:32', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('53', '2018-04-08 15:06:39', null, '发布新闻', 'Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('54', '2018-04-08 15:12:54', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('55', '2018-04-08 15:18:38', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('56', '2018-04-08 15:20:01', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('57', '2018-04-08 15:21:01', null, '修改新闻', '新闻id:13新闻标题:Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('58', '2018-04-08 15:21:49', null, '修改新闻', '新闻id:13新闻标题:Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('59', '2018-04-08 15:23:08', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('60', '2018-04-08 15:23:30', null, '修改新闻', '新闻id:13新闻标题:Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('61', '2018-04-08 15:25:21', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('62', '2018-04-08 15:25:31', null, '修改新闻', '新闻id:13新闻标题:Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('63', '2018-04-08 15:26:57', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('64', '2018-04-08 15:27:16', null, '修改新闻', '新闻id:13新闻标题:Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('65', '2018-04-08 15:28:29', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('66', '2018-04-08 15:33:44', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('67', '2018-04-08 15:34:39', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('68', '2018-04-08 15:41:58', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('69', '2018-04-08 15:42:03', null, '修改新闻', '新闻id:13新闻标题:Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('70', '2018-04-08 15:43:50', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('71', '2018-04-08 15:43:54', null, '修改新闻', '新闻id:13新闻标题:Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('72', '2018-04-08 15:48:04', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('73', '2018-04-08 15:48:09', null, '修改新闻', '新闻id:13新闻标题:Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('74', '2018-04-08 15:48:42', null, '修改新闻', '新闻id:13新闻标题:Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('75', '2018-04-08 15:51:49', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('76', '2018-04-08 15:53:10', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('77', '2018-04-08 15:53:24', null, '修改新闻', '新闻id:13新闻标题:Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('78', '2018-04-08 15:56:38', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('79', '2018-04-08 15:56:38', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('80', '2018-04-08 15:56:38', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('81', '2018-04-08 15:58:14', null, '登录系统', '密码错误', '6', '0');
INSERT INTO `news_log` VALUES ('82', '2018-04-08 15:58:19', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('83', '2018-04-08 15:58:34', null, '修改新闻', '新闻id:13新闻标题:Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('84', '2018-04-08 16:04:27', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('85', '2018-04-08 16:04:32', null, '修改新闻', '新闻id:13新闻标题:Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('86', '2018-04-08 16:05:18', null, '修改新闻', '新闻id:13新闻标题:Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('87', '2018-04-08 16:06:56', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('88', '2018-04-08 16:06:56', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('89', '2018-04-08 16:11:29', null, '登录系统', '密码错误', '6', '0');
INSERT INTO `news_log` VALUES ('90', '2018-04-08 16:11:34', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('91', '2018-04-08 16:14:22', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('92', '2018-04-08 16:14:44', null, '修改新闻', '新闻id:13新闻标题:Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('93', '2018-04-08 16:15:59', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('94', '2018-04-08 16:16:09', null, '修改新闻', '新闻id:13新闻标题:Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('95', '2018-04-08 16:16:22', null, '修改新闻', '新闻id:12新闻标题:大爱临商感恩同行 临沂商会市区分会举行新春年会', '6', '1');
INSERT INTO `news_log` VALUES ('96', '2018-04-08 16:18:08', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('97', '2018-04-08 16:18:20', null, '修改新闻', '新闻id:13新闻标题:Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('98', '2018-04-08 16:19:21', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('99', '2018-04-08 16:19:42', null, '修改新闻', '新闻id:13新闻标题:Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('100', '2018-04-08 16:22:44', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('101', '2018-04-08 16:23:23', null, '修改新闻', '新闻id:13新闻标题:Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('102', '2018-04-08 16:27:40', null, '登录系统', '成功登录', '11', '1');
INSERT INTO `news_log` VALUES ('103', '2018-04-08 16:28:33', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('104', '2018-04-08 16:29:19', null, '登录系统', '成功登录', '11', '1');
INSERT INTO `news_log` VALUES ('105', '2018-04-08 16:38:31', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('106', '2018-04-08 16:43:28', null, '修改新闻', '新闻id:13新闻标题:Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('107', '2018-04-08 16:44:24', null, '修改新闻', '新闻id:13新闻标题:Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('108', '2018-04-08 16:45:14', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('109', '2018-04-08 16:45:21', null, '修改新闻', '新闻id:13新闻标题:Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('110', '2018-04-08 16:45:40', null, '修改新闻', '新闻id:13新闻标题:Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('111', '2018-04-08 16:56:54', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('112', '2018-04-08 17:15:19', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('113', '2018-04-08 17:15:35', null, '修改新闻', '新闻id:13新闻标题:Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('114', '2018-04-08 17:18:08', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('115', '2018-04-08 17:18:08', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('116', '2018-04-08 17:18:13', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('117', '2018-04-08 17:18:19', null, '修改新闻', '新闻id:13新闻标题:Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('118', '2018-04-08 17:22:50', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('119', '2018-04-08 17:24:45', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('120', '2018-04-08 17:24:49', null, '修改新闻', '新闻id:13新闻标题:Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('121', '2018-04-08 17:48:57', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('122', '2018-04-08 17:49:02', null, '修改新闻', '新闻id:13新闻标题:Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('123', '2018-04-08 17:50:48', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('124', '2018-04-08 17:50:52', null, '修改新闻', '新闻id:13新闻标题:Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('125', '2018-04-08 17:51:38', null, '登录系统', '成功登录', '6', '1');
INSERT INTO `news_log` VALUES ('126', '2018-04-08 17:51:42', null, '修改新闻', '新闻id:13新闻标题:Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('127', '2018-04-08 17:51:57', null, '修改新闻', '新闻id:13新闻标题:Configuration   ', '6', '1');
INSERT INTO `news_log` VALUES ('128', '2018-04-11 17:42:22', null, '登录系统', '成功登录', '11', '1');
INSERT INTO `news_log` VALUES ('129', '2018-04-16 12:40:37', null, '登录系统', '成功登录', '11', '1');
INSERT INTO `news_log` VALUES ('130', '2018-04-16 12:41:03', null, '登录系统', '成功登录', '11', '1');
INSERT INTO `news_log` VALUES ('131', '2018-04-16 12:51:22', null, '登录系统', '成功登录', '11', '1');
INSERT INTO `news_log` VALUES ('132', '2018-04-17 08:13:27', null, '登录系统', '成功登录', '11', '1');
INSERT INTO `news_log` VALUES ('133', '2018-04-17 08:13:53', null, '登录系统', '成功登录', '11', '1');
INSERT INTO `news_log` VALUES ('134', '2018-04-17 08:16:44', null, '登录系统', '成功登录', '11', '1');
INSERT INTO `news_log` VALUES ('135', '2018-04-17 08:18:46', null, '登录系统', '成功登录', '11', '1');
INSERT INTO `news_log` VALUES ('136', '2018-04-17 08:19:59', null, '删除新闻', '新闻id:24', '11', '1');
INSERT INTO `news_log` VALUES ('137', '2018-04-17 08:22:16', null, '登录系统', '成功登录', '11', '1');

-- ----------------------------
-- Table structure for role_info
-- ----------------------------
DROP TABLE IF EXISTS `role_info`;
CREATE TABLE `role_info` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_parent` int(10) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `role_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of role_info
-- ----------------------------
INSERT INTO `role_info` VALUES ('1', null, '管理员', null);
INSERT INTO `role_info` VALUES ('2', null, '新闻管理', null);
INSERT INTO `role_info` VALUES ('3', null, '权限管理', null);
INSERT INTO `role_info` VALUES ('4', null, '分组管理', null);
INSERT INTO `role_info` VALUES ('17', '3', '权限分组', 'login/prentrole.html');
INSERT INTO `role_info` VALUES ('18', '3', '权限列表', 'login/rolelist.html');
INSERT INTO `role_info` VALUES ('19', '3', '添加权限', 'login/addrole.html');
INSERT INTO `role_info` VALUES ('20', '4', '分组列表', 'login/grouplist.html');
INSERT INTO `role_info` VALUES ('21', '4', '添加分组', 'login/addgroup.html');
INSERT INTO `role_info` VALUES ('22', '2', '添加新闻', 'login/addnews.html');
INSERT INTO `role_info` VALUES ('23', '2', '新闻列表', 'login/newslist.html');
INSERT INTO `role_info` VALUES ('26', null, '用户管理', null);
INSERT INTO `role_info` VALUES ('27', '26', '添加用户', 'login/adduser.html');
INSERT INTO `role_info` VALUES ('28', '26', '用户列表', 'login/userlist.html');
INSERT INTO `role_info` VALUES ('29', '2', '审核新闻', 'login/shenhelist.html');
INSERT INTO `role_info` VALUES ('30', '2', '修改新闻', 'login/editlist.html');
INSERT INTO `role_info` VALUES ('31', '2', '我的新闻', 'login/mynewslist.html');
INSERT INTO `role_info` VALUES ('32', null, '日志管理', null);
INSERT INTO `role_info` VALUES ('33', '32', '操作日志', 'login/logslist.html');
INSERT INTO `role_info` VALUES ('34', null, '', null);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_img` varchar(255) DEFAULT NULL,
  `is_flag` int(255) DEFAULT NULL,
  `user_groupid` int(11) DEFAULT NULL,
  `user_roles` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', 'weizuqing', 'e9635578fe2d319e9accadded5888fb2', null, '1', '1', '');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_role_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_role
-- ----------------------------
