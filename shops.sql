# MySQL-Front Dump 2.5
#
# Host: localhost   Database: shops
# --------------------------------------------------------
# Server version 5.0.41-community-nt-log


#
# Table structure for table 'activity'
#

CREATE TABLE IF NOT EXISTS activity (
  activityId int(12) NOT NULL auto_increment,
  activityName varchar(50) NOT NULL DEFAULT '' ,
  activityDes varchar(500) NOT NULL DEFAULT '' ,
  discount float DEFAULT '1' ,
  fullPrice int(12) ,
  reducePrice int(12) ,
  fullNum int(12) ,
  reduceNum int(12) ,
  PRIMARY KEY (activityId)
);



#
# Dumping data for table 'activity'
#



#
# Table structure for table 'address'
#

CREATE TABLE IF NOT EXISTS address (
  addressID int(12) NOT NULL auto_increment,
  userId int(12) NOT NULL DEFAULT '' ,
  province varchar(50) NOT NULL DEFAULT '' ,
  city varchar(50) NOT NULL DEFAULT '' ,
  county varchar(50) NOT NULL DEFAULT '' ,
  detailAddr varchar(50) NOT NULL DEFAULT '' ,
  conName varchar(50) NOT NULL DEFAULT '' ,
  conTel varchar(50) NOT NULL DEFAULT '' ,
  PRIMARY KEY (addressID),
   KEY addressID (addressID),
   KEY userId (userId)
);



#
# Dumping data for table 'address'
#



#
# Table structure for table 'admin'
#

CREATE TABLE IF NOT EXISTS admin (
  adminId int(12) NOT NULL auto_increment,
  adminName varchar(50) NOT NULL DEFAULT '' ,
  password varchar(50) NOT NULL DEFAULT '' ,
  PRIMARY KEY (adminId)
);



#
# Dumping data for table 'admin'
#



#
# Table structure for table 'category'
#

CREATE TABLE IF NOT EXISTS category (
  cateId int(12) NOT NULL auto_increment,
  cateName varchar(50) NOT NULL DEFAULT '' ,
  PRIMARY KEY (cateId)
);



#
# Dumping data for table 'category'
#

INSERT INTO category VALUES("1", "数码");
INSERT INTO category VALUES("2", "服饰");
INSERT INTO category VALUES("3", "家电");
INSERT INTO category VALUES("4", "书籍");


#
# Table structure for table 'chat'
#

CREATE TABLE IF NOT EXISTS chat (
  chatId int(20) NOT NULL auto_increment,
  sendUser int(12) NOT NULL DEFAULT '' ,
  receiveUser int(12) NOT NULL DEFAULT '' ,
  MsgContent varchar(255) NOT NULL DEFAULT '' ,
  MsgTime datetime NOT NULL DEFAULT '' ,
  PRIMARY KEY (chatId),
   KEY sendUser (sendUser),
   KEY receiveUser (receiveUser)
);



#
# Dumping data for table 'chat'
#



#
# Table structure for table 'collection'
#

CREATE TABLE IF NOT EXISTS collection (
  userId int(12) NOT NULL DEFAULT '' ,
  goodsId int(12) NOT NULL DEFAULT '' ,
  collectTime datetime NOT NULL DEFAULT '' ,
  PRIMARY KEY (userId,goodsId),
   KEY collection_ibfk_2 (goodsId)
);



#
# Dumping data for table 'collection'
#



#
# Table structure for table 'comment'
#

CREATE TABLE IF NOT EXISTS comment (
  commentId int(12) NOT NULL auto_increment,
  userId int(12) NOT NULL DEFAULT '' ,
  goodsId int(12) NOT NULL DEFAULT '' ,
  point int(8) NOT NULL DEFAULT '' ,
  content varchar(255) NOT NULL DEFAULT '' ,
  commentTime datetime NOT NULL DEFAULT '' ,
  PRIMARY KEY (commentId),
   KEY userId (userId),
   KEY goodsId (goodsId)
);



#
# Dumping data for table 'comment'
#



#
# Table structure for table 'deliver'
#

CREATE TABLE IF NOT EXISTS deliver (
  deliverId int(12) NOT NULL auto_increment,
  orderId int(12) NOT NULL DEFAULT '' ,
  sendId int(12) NOT NULL DEFAULT '' ,
  PRIMARY KEY (deliverId),
   KEY orderId (orderId)
);



#
# Dumping data for table 'deliver'
#



#
# Table structure for table 'goods'
#

CREATE TABLE IF NOT EXISTS goods (
  goodsId int(12) NOT NULL auto_increment,
  goodsName varchar(50) NOT NULL DEFAULT '' ,
  price int(12) NOT NULL DEFAULT '' ,
  num int(12) NOT NULL DEFAULT '' ,
  upTime datetime NOT NULL DEFAULT '' ,
  category int(12) NOT NULL DEFAULT '' ,
  detailCate varchar(50) NOT NULL DEFAULT '' ,
  description text NOT NULL DEFAULT '' ,
  activityId int(12) NOT NULL DEFAULT '1' ,
  PRIMARY KEY (goodsId),
   KEY activityId (activityId),
   KEY category (category)
);



#
# Dumping data for table 'goods'
#



#
# Table structure for table 'imagepath'
#

CREATE TABLE IF NOT EXISTS imagepath (
  pathId int(12) NOT NULL auto_increment,
  goodId int(12) NOT NULL DEFAULT '' ,
  path varchar(255) NOT NULL DEFAULT '' ,
  PRIMARY KEY (pathId),
   KEY goodid (goodId)
);



#
# Dumping data for table 'imagepath'
#



#
# Table structure for table 'indent'
#

CREATE TABLE IF NOT EXISTS indent (
  orderId int(12) NOT NULL auto_increment,
  userId int(12) NOT NULL DEFAULT '' ,
  orderTime datetime NOT NULL DEFAULT '' ,
  oldPrice float NOT NULL DEFAULT '' ,
  newPrice float NOT NULL DEFAULT '' ,
  isPay tinyint(1) NOT NULL DEFAULT '' ,
  isSend tinyint(1) NOT NULL DEFAULT '' ,
  isReceive tinyint(1) NOT NULL DEFAULT '' ,
  isComplete tinyint(1) NOT NULL DEFAULT '' ,
  addressId int(12) NOT NULL DEFAULT '' ,
  PRIMARY KEY (orderId),
   KEY userId (userId),
   KEY orderGoods (orderTime),
   KEY addressId (addressId)
);



#
# Dumping data for table 'indent'
#



#
# Table structure for table 'orderitem'
#

CREATE TABLE IF NOT EXISTS orderitem (
  itemId int(12) NOT NULL auto_increment,
  orderId int(12) NOT NULL DEFAULT '' ,
  goodsId int(12) NOT NULL DEFAULT '' ,
  num int(12) NOT NULL DEFAULT '' ,
  PRIMARY KEY (itemId),
   KEY orderId (orderId),
   KEY goodsId (goodsId)
);



#
# Dumping data for table 'orderitem'
#



#
# Table structure for table 'shopcart'
#

CREATE TABLE IF NOT EXISTS shopcart (
  userId int(12) NOT NULL DEFAULT '' ,
  goodsid int(12) NOT NULL DEFAULT '' ,
  cateDate datetime NOT NULL DEFAULT '' ,
  goodsNum int(12) NOT NULL DEFAULT '' ,
  PRIMARY KEY (userId,goodsid),
   KEY userId (userId),
   KEY goodsid (goodsid)
);



#
# Dumping data for table 'shopcart'
#



#
# Table structure for table 'user'
#

CREATE TABLE IF NOT EXISTS user (
  userId int(12) NOT NULL auto_increment,
  username varchar(50) NOT NULL DEFAULT '' ,
  password varchar(50) NOT NULL DEFAULT '' ,
  regTime datetime NOT NULL DEFAULT '' ,
  email varchar(50) NOT NULL DEFAULT '' ,
  telephone varchar(50) NOT NULL DEFAULT '' ,
  PRIMARY KEY (userId),
   KEY userId (userId)
);



#
# Dumping data for table 'user'
#

INSERT INTO user VALUES("11", "哈哈男", "123456789", "2018-04-28 18:04:25", "15910299984@163.com", "15910299984");
