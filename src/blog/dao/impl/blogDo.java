package blog.dao.impl;

import java.sql.SQLException;
import java.util.Calendar;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import blog.dao.blog;
import blog.entity.jdbcUtils;
import blog.entity.login;
import blog.entity.message;
import blog.entity.page;
import blog.entity.topic;
import blog.entity.user;
import blog.entity.blogs;
import blog.entity.comment;

public class blogDo implements blog {
	QueryRunner qr=new QueryRunner(jdbcUtils.getDataSource());

	@Override
	public int loginInsert(String name, String tel, String nickname, String pwd, String interest) throws SQLException {
		String sql="insert into login(name,tel,nickname,pwd,interest,blogbirth) values(?,?,?,?,?,?)";
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR); 
		int month = c.get(Calendar.MONTH)+1; 
		int date = c.get(Calendar.DATE); 
		int hour = c.get(Calendar.HOUR_OF_DAY); 
		int minute = c.get(Calendar.MINUTE); 
		int second = c.get(Calendar.SECOND); 
		String blogbirth=year + "-" + month + "-" + date + " " +hour + ":" +minute + ":" + second; 
		int a=qr.update(sql,name,tel,nickname,pwd,interest,blogbirth);
		return a;
	}

	@Override
	public login loginSelectID(String name, String tel, String nickname, String pwd, String interest) throws SQLException {
		String sql="select id from login where name=? and tel=? and nickname=? and pwd=? and interest=?";
		login a=qr.query(sql, new BeanHandler<login>(login.class),name,tel,nickname,pwd,interest);
		return a;
	}

	@Override
	public login loginSelect(int id, String pwd) throws SQLException {
		String sql="select *from login where id=? and pwd=?";
		login a=qr.query(sql, new BeanHandler<login>(login.class),id,pwd);
		return a;
	}

	@Override
	public login loginSelectByNick(String nickname) throws SQLException {
		String sql="select *from login where nickname=?";
		login a=qr.query(sql, new BeanHandler<login>(login.class),nickname);
		return a;
	}

	public int getBlogNum() throws NumberFormatException, SQLException {
		
		String sql="select count(1) from blog";
		int a=Integer.parseInt((qr.query(sql, new ScalarHandler())).toString());
		return a;
	}
	
	public int getMessageNum() throws NumberFormatException, SQLException {
		
		String sql="select count(1) from message";
		int a=Integer.parseInt((qr.query(sql, new ScalarHandler())).toString());
		return a;
	}
	
	public int getCommentNum() throws NumberFormatException, SQLException {
		
		String sql="select count(1) from comment";
		int a=Integer.parseInt((qr.query(sql, new ScalarHandler())).toString());
		return a;
	}
	
	public int getCommentNum1(int bid) throws NumberFormatException, SQLException {
		
		String sql="select count(1) from comment where bid=? and tocid=0";
		int a=Integer.parseInt((qr.query(sql, new ScalarHandler(),bid)).toString());
		return a;
	}
	
	public int getCommentNum2(int bid,int tocid) throws NumberFormatException, SQLException {
		
		String sql="select count(1) from comment where bid=? and tocid=?";
		int a=Integer.parseInt((qr.query(sql, new ScalarHandler(),bid,tocid)).toString());
		return a;
	}
	
	public int getCommentNum4(int inid) throws NumberFormatException, SQLException {
		
		String sql="select count(1) from comment where inid=?";
		int a=Integer.parseInt((qr.query(sql, new ScalarHandler(),inid)).toString());
		return a;
	}
	
	public int getBlogNumByTid(int tid) throws NumberFormatException, SQLException {
		String sql="select count(1) from blog where tid=?";
		int a=Integer.parseInt((qr.query(sql, new ScalarHandler(),tid)).toString());
		return a;
	}
	
	@Override
	public page<blogs> blogSelectByID(int id,int pageNum, int pageSize) throws SQLException {
		String sql="select *from blog where id=? LIMIT ?,?";
		page<blogs> a=new page<blogs>(pageNum,pageSize,this.getBlogNum());
		List<blogs> b=qr.query(sql, new BeanListHandler<blogs>(blogs.class),id,a.getStartIndex(),pageSize);
		a.setData(b);
		return a;
	}


	@Override
	public page<message> messageSelectByID(int inid,int pageNum, int pageSize) throws SQLException {
		String sql="select *from message where inid=? LIMIT ?,?";
		page<message> a=new page<message>(pageNum,pageSize,this.getMessageNum());
		List<message> b=qr.query(sql, new BeanListHandler<message>(message.class),inid,a.getStartIndex(),pageSize);
		a.setData(b);
		return a;
	}

	@Override
	public page<comment> commentSelectByBID(int bid,int pageNum, int pageSize) throws SQLException {
		String sql="select *from comment where bid=? and tocid =0 LIMIT ?,?";
		page<comment> a=new page<comment>(pageNum,pageSize,this.getCommentNum1(bid));
		List<comment> b=qr.query(sql, new BeanListHandler<comment>(comment.class),bid,a.getStartIndex(),pageSize);
		a.setData(b);
		return a;
	}

	@Override
	public user userSelectByID(int id) throws SQLException {
		String sql="select *from user where id=?";
		user a=qr.query(sql, new BeanHandler<user>(user.class),id);
		return a;
	}

	@Override
	public int userInsert(int id, String sex, String birth, String city, String job, String sign,String pic) throws SQLException {
		String sql="insert into user(id,sex,birth,city,job,sign,pic) values(?,?,?,?,?,?,?)";
		int a=qr.update(sql,id,sex,birth,city,job,sign,pic);
		return a;
	}

	@Override
	public int blogInsert(int id, String btitle, String bauthor, String bcontent, int tid) throws SQLException {
		String sql="insert into blog(id,btime,btitle,bauthor,bcontent,tid) values(?,?,?,?,?,?)";
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR); 
		int month = c.get(Calendar.MONTH)+1; 
		int date = c.get(Calendar.DATE); 
		int hour = c.get(Calendar.HOUR_OF_DAY); 
		int minute = c.get(Calendar.MINUTE); 
		int second = c.get(Calendar.SECOND); 
		String btime=year + "-" + month + "-" + date + " " +hour + ":" +minute + ":" + second; 
		int a=qr.update(sql,id,btime,btitle,bauthor,bcontent,tid);
		return a;
	}

	@Override
	public int commentInsert(String ccontent, int inid,int bid, int toid,int tocid) throws SQLException {
		String sql="insert into comment(ccontent,ctime,inid,bid,toid,tocid) values(?,?,?,?,?,?)";
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR); 
		int month = c.get(Calendar.MONTH)+1; 
		int date = c.get(Calendar.DATE); 
		int hour = c.get(Calendar.HOUR_OF_DAY); 
		int minute = c.get(Calendar.MINUTE); 
		int second = c.get(Calendar.SECOND); 
		String ctime=year + "-" + month + "-" + date + " " +hour + ":" +minute + ":" + second; 
		int a=qr.update(sql,ccontent,ctime,inid,bid,toid,tocid);
		return a;
	}

	@Override
	public int messageInsert(String mcontent, int inid, int toid) throws SQLException {
		String sql="insert into message(mcontent,mtime,inid,toid) values(?,?,?,?)";
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR); 
		int month = c.get(Calendar.MONTH)+1; 
		int date = c.get(Calendar.DATE); 
		int hour = c.get(Calendar.HOUR_OF_DAY); 
		int minute = c.get(Calendar.MINUTE); 
		int second = c.get(Calendar.SECOND); 
		String mtime=year + "-" + month + "-" + date + " " +hour + ":" +minute + ":" + second; 
		int a=qr.update(sql,mcontent,mtime,inid,toid);
		return a;
	}

	@Override
	public page<blogs> blogSelectByTid(int tid,int pageNum, int pageSize) throws SQLException {
		String sql="select *from blog where tid=? order by btime desc LIMIT ?,?";
		page<blogs> a=new page<blogs>(pageNum,pageSize,this.getBlogNumByTid(tid));
		List<blogs> b=qr.query(sql, new BeanListHandler<blogs>(blogs.class),tid,a.getStartIndex(),pageSize);
		a.setData(b);
		return a;
	}

	@Override
	public page<comment> commentSelectById(int inid,int pageNum, int pageSize) throws SQLException {
		String sql="select *from comment where inid=? LIMIT ?,? ";
		page<comment> a=new page<comment>(pageNum,pageSize,this.getCommentNum4(inid));
		List<comment> b=qr.query(sql, new BeanListHandler<comment>(comment.class),inid,a.getStartIndex(),pageSize);
		a.setData(b);
		return a;
	}

	@Override
	public blogs blogSelectByBid(int bid) throws SQLException {
		String sql="select *from blog where bid=?";
		blogs a=qr.query(sql, new BeanHandler<blogs>(blogs.class),bid);
		return a;
	}

	@Override
	public login loginSelectById(int id) throws SQLException {
		String sql="select *from login where id=?";
		login a=qr.query(sql, new BeanHandler<login>(login.class),id);
		return a;
	}

	@Override
	public List<topic> topicSelect() throws SQLException {
		String sql="select *from topic";
		List<topic> a=qr.query(sql, new BeanListHandler<topic>(topic.class));
		return a;
	}

	@Override
	public topic topicSelectByName(String tname) throws SQLException {
		String sql="select *from topic where tname=?";
		topic a=qr.query(sql, new BeanHandler<topic>(topic.class),tname);
		return a;
	}

	@Override
	public int userUpdate(int id, String sex, String birth, String city, String job, String sign,String pic) throws SQLException {
		String sql="update user set sex=?,birth=?,city=?,job=?,sign=?,pic=? where id=?";
		int a=qr.update(sql,sex,birth,city,job,sign,pic,id);
		return a;
	}

	@Override
	public int pwdUpdate(String nickname,String pwd) throws SQLException {
		String sql="update login set pwd=? where nickname=?";
		int a=qr.update(sql,pwd,nickname);
		return a;
	}

	@Override
	public int blogInsert2(int id,String btitle, String bauthor, String bcontent,String bpic,int tid) throws SQLException {
		String sql="insert into blog(id,btime,btitle,bauthor,bcontent,tid,bpic) values(?,?,?,?,?,?,?)";
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR); 
		int month = c.get(Calendar.MONTH)+1; 
		int date = c.get(Calendar.DATE); 
		int hour = c.get(Calendar.HOUR_OF_DAY); 
		int minute = c.get(Calendar.MINUTE); 
		int second = c.get(Calendar.SECOND); 
		String btime=year + "-" + month + "-" + date + " " +hour + ":" +minute + ":" + second; 
		int a=qr.update(sql,id,btime,btitle,bauthor,bcontent,tid,bpic);
		return a;
	}

	@Override
	public topic topicSelectByTid(int tid) throws SQLException {
		String sql="select *from topic where tid=?";
		topic a=qr.query(sql, new BeanHandler<topic>(topic.class),tid);
		return a;
	}

	@Override
	public int blogUpdate(int bid, String btitle, String bauthor, String bcontent, int tid) throws SQLException {
		String sql="update blog set btitle=?,bauthor=?,bcontent=?,tid=? where bid=?";
		int a=qr.update(sql,btitle,bauthor,bcontent,tid,bid);
		return a;
	}

	@Override
	public int blogUpdate2(int bid, String btitle, String bauthor, String bcontent, String bpic, int tid) throws SQLException {
		String sql="update blog set btitle=?,bauthor=?,bcontent=?,bpic=?,tid=? where bid=?";
		int a=qr.update(sql,btitle,bauthor,bcontent,bpic,tid,bid);
		return a;
	}

	@Override
	public int blogDelete(int bid) throws SQLException {
		String sql="delete from blog where bid=?";
		int a=qr.update(sql,bid);
		return a;
	}

	@Override
	public page<blogs> blogSelectByTid2(int tid, int pageNum, int pageSize) throws SQLException {
		String sql="select *from blog where tid=? order by visitor desc LIMIT ?,?";
		page<blogs> a=new page<blogs>(pageNum,pageSize,this.getBlogNumByTid(tid));
		List<blogs> b=qr.query(sql, new BeanListHandler<blogs>(blogs.class),tid,a.getStartIndex(),pageSize);
		a.setData(b);
		return a;
	}

	@Override
	public int blogVisitorAdd(int bid) throws SQLException {
		String sql="update blog set visitor=visitor+1 where bid=?";
		int a=qr.update(sql,bid);
		return a;
	}

	@Override
	public int commentInsert2(String ccontent, int bid, int toid) throws SQLException {
		String sql="insert into comment(ccontent,ctime,bid,toid) values(?,?,?,?)";
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR); 
		int month = c.get(Calendar.MONTH)+1; 
		int date = c.get(Calendar.DATE); 
		int hour = c.get(Calendar.HOUR_OF_DAY); 
		int minute = c.get(Calendar.MINUTE); 
		int second = c.get(Calendar.SECOND); 
		String ctime=year + "-" + month + "-" + date + " " +hour + ":" +minute + ":" + second; 
		int a=qr.update(sql,ccontent,ctime,bid,toid);
		return a;
	}

	@Override
	public page<comment> commentSelectByBID2(int bid,int tocid, int pageNum, int pageSize) throws SQLException {
		String sql="select *from comment where bid=? and tocid =? LIMIT ?,?";
		page<comment> a=new page<comment>(pageNum,pageSize,this.getCommentNum2(bid,tocid));
		List<comment> b=qr.query(sql, new BeanListHandler<comment>(comment.class),bid,tocid,a.getStartIndex(),pageSize);
		a.setData(b);
		return a;
	}

	@Override
	public int commentDelete(int cid) throws SQLException {
		String sql="delete from comment where cid=?";
		int a=qr.update(sql,cid);
		return a;
	}

	@Override
	public int userInto(int id) throws SQLException {
		String sex="δ֪";
		String birth="δ֪";
		String city="δ֪";
		String job="δ֪";
		String sign="δ֪";
		String sql="insert into user(id,sex,birth,city,job,sign) values(?,?,?,?,?,?)";
		int a=qr.update(sql,id,sex,birth,city,job,sign);
		return a;
	}

	@Override
	public List<blogs> blogSelectByTime() throws SQLException {
		String sql="select *from blog order by btime desc";
		List<blogs> blog=qr.query(sql, new BeanListHandler<blogs>(blogs.class));
		return blog;
	}

	@Override
	public int commentDelete2(int tocid) throws SQLException {
		String sql="delete from comment where tocid=?";
		int a=qr.update(sql,tocid);
		return a;
	}

	@Override
	public int userBlogAdd() throws SQLException {
		String sql="update user set blog=blog+1";
		int a=qr.update(sql);
		return a;
	}

	@Override
	public int userBlogMinus() throws SQLException {
		String sql="update user set blog=blog-1";
		int a=qr.update(sql);
		return a;
	}

	@Override
	public List<user> userSelectByblog() throws SQLException {
		String sql="select *from user order by blog desc";
		List<user> a=qr.query(sql, new BeanListHandler<user>(user.class));
		return a;
	}

}
