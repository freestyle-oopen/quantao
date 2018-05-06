
CREATE TABLE IF NOT EXISTS classify (
  id int(5) unsigned NOT NULL DEFAULT '0' ,
  father_id int(5) unsigned NOT NULL DEFAULT '0' ,
  name varchar(20) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (id)
);

INSERT INTO classify VALUES("1000", "0", "手机/数码");
INSERT INTO classify VALUES("1001", "0", "电脑办公");
INSERT INTO classify VALUES("2000", "1000", "手机");
INSERT INTO classify VALUES("2001", "1000", "手机配件");
INSERT INTO classify VALUES("2002", "1000", "相机");
INSERT INTO classify VALUES("2003", "1000", "时尚影音");
INSERT INTO classify VALUES("2004", "1000", "数码产品");
INSERT INTO classify VALUES("2005", "1000", "其他");
INSERT INTO classify VALUES("2006", "1001", "笔记本");
INSERT INTO classify VALUES("2007", "1001", "台式电脑");
INSERT INTO classify VALUES("2008", "1001", "电脑主机");
INSERT INTO classify VALUES("2009", "1001", "一体机");
INSERT INTO classify VALUES("2010", "1001", "平板电脑");
INSERT INTO classify VALUES("2011", "1001", "超级本");
INSERT INTO classify VALUES("2012", "1001", "办公设备");
INSERT INTO classify VALUES("2013", "1001", "路由器");
INSERT INTO classify VALUES("2014", "1001", "其他");



CREATE TABLE IF NOT EXISTS goods (
  id int(10) unsigned NOT NULL auto_increment,
  title varchar(50) NOT NULL DEFAULT '0' ,
  price float NOT NULL DEFAULT '0' ,
  guide_url varchar(200) NOT NULL DEFAULT '0' ,
  url varchar(200) NOT NULL DEFAULT '0' ,
  icon varchar(100) NOT NULL DEFAULT '0' ,
  user_id int(5) unsigned DEFAULT '0' ,
  creat_time datetime ,
  rebate float NOT NULL DEFAULT '0' ,
  coupon int(5) unsigned NOT NULL DEFAULT '0' ,
  source int(3) unsigned NOT NULL DEFAULT '0' ,
  free_shipping int(3) unsigned NOT NULL DEFAULT '0' ,
  is_shelf int(3) unsigned NOT NULL DEFAULT '0' ,
  first_class int(5) unsigned NOT NULL DEFAULT '0' ,
  second_class int(5) unsigned NOT NULL DEFAULT '0' ,
  sale_num int(10) unsigned NOT NULL DEFAULT '0' ,
  PRIMARY KEY (id)
);



CREATE TABLE IF NOT EXISTS user (
  id int(5) NOT NULL auto_increment,
  name varchar(10) NOT NULL DEFAULT '0' ,
  phone varchar(15) NOT NULL DEFAULT '0' ,
  creat_time datetime NOT NULL DEFAULT '' ,
  invitation_code varchar(10) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (id)
);



INSERT INTO user VALUES("1", "任宇锴", "15910299984", "2018-05-03 00:00:00", "AABB");
