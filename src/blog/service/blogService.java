package blog.service;

import java.sql.SQLException;
import java.util.List;

import blog.dao.impl.blogDo;
import blog.entity.login;
import blog.entity.message;
import blog.entity.page;
import blog.entity.topic;
import blog.entity.user;
import blog.entity.blogs;
import blog.entity.comment;

public class blogService {
	private blogDo blog=new blogDo(); 
	/**
	 * 注册
	 * @throws SQLException 
	 */
	public int register(String name, String tel, String nickname, String pwd, String interest) throws SQLException {
		return blog.loginInsert(name, tel, nickname, pwd, interest);
	}
	/**
	 * 获取注册后用户id名
	 * @param name
	 * @param tel
	 * @param nickname
	 * @param pwd
	 * @param interest
	 * @return
	 * @throws SQLException
	 */
	public login loginId(String name, String tel, String nickname, String pwd, String interest) throws SQLException{
		return blog.loginSelectID(name, tel, nickname, pwd, interest);
	}
	/**
	 * 登录验证
	 * @param id
	 * @param pwd
	 * @return
	 * @throws SQLException
	 */
	public login login(int id,String pwd) throws SQLException {
		return blog.loginSelect(id, pwd);
	}
	/**
	 * 查看我的博客
	 * @param nickname
	 * @return
	 * @throws SQLException 
	 */
	public page<blogs> blogGet(String nickname,int pageNum, int pageSize) throws SQLException {
		login a=blog.loginSelectByNick(nickname);
		int id=a.getId();
		return blog.blogSelectByID(id, pageNum, pageSize);
	}
	/**
	 * 查看我收到的留言
	 * @param nickname
	 * @return
	 * @throws SQLException
	 */
	public page<message> messageGet(String nickname,int pageNum, int pageSize) throws SQLException {
		login a=blog.loginSelectByNick(nickname);
		int id=a.getId();
		return blog.messageSelectByID(id, pageNum, pageSize);
	}
	/**
	 * 查看我收到的博客评论
	 * @param nickname
	 * @return
	 * @throws SQLException
	 */
	public page<comment> commentGet(String nickname,int pageNum, int pageSize) throws SQLException {
		login a=blog.loginSelectByNick(nickname);
		int id=a.getId();
		return blog.commentSelectById(id, pageNum, pageSize);
	}
	/**
	 * 获取我的用户信息
	 * @param nickname
	 * @return
	 * @throws SQLException
	 */
	public user userGet(String nickname) throws SQLException {
		login a=blog.loginSelectByNick(nickname);
		int id=a.getId();
		return blog.userSelectByID(id);
	}
	/**
	 * 更新用户信息
	 * @param nickname
	 * @param sex
	 * @param birth
	 * @param city
	 * @param job
	 * @param sign
	 * @return
	 * @throws SQLException
	 */
	public int userUpdate(String nickname, String sex, String birth, String city, String job, String sign,String pic) throws SQLException {
		login a=blog.loginSelectByNick(nickname);
		int id=a.getId();
		return blog.userUpdate(id, sex, birth, city, job, sign, pic);
	}
	/**
	 *写博客
	 * @param nickname
	 * @param btitle
	 * @param bauthor
	 * @param bcomment
	 * @param tid
	 * @return
	 * @throws SQLException
	 */
	public int blogInto(String nickname, String btitle, String bcontent,String tname) throws SQLException {
		login a=blog.loginSelectByNick(nickname);
		int id=a.getId();
		topic b=blog.topicSelectByName(tname);
		int tid=b.getTid();
		return blog.blogInsert(id, btitle, nickname, bcontent, tid);
	}
	/**
	 * 写评论(对指定对象评论)
	 * @param nickname
	 * @param ccontent
	 * @param inid
	 * @param bid
	 * @return
	 * @throws SQLException
	 */
	public int commentInto(String nickname,String ccontent, int inid,int bid,int tocid) throws SQLException {
		login a=blog.loginSelectByNick(nickname);
		int toid=a.getId();
		return blog.commentInsert(ccontent, inid, bid, toid,tocid);
	}
	/**
	 * 写评论(对博客进行评论)
	 * @param nickname
	 * @param ccontent
	 * @param bid
	 * @return
	 * @throws SQLException
	 */
	public int commentInto2(String nickname,String ccontent,int bid) throws SQLException {
		login a=blog.loginSelectByNick(nickname);
		int toid=a.getId();
		return blog.commentInsert2(ccontent, bid, toid);
	}
	/**
	 * 写留言
	 * @param nickname
	 * @param mcontent
	 * @param inid
	 * @return
	 * @throws SQLException
	 */
	public int messageInto(String nickname,String mcontent, int inid) throws SQLException {
		login a=blog.loginSelectByNick(nickname);
		int toid=a.getId();
		return blog.messageInsert(mcontent, inid, toid);
	}
	/**
	 * 获取对应主题下的最新新闻
	 * @param tid
	 * @return
	 * @throws SQLException
	 */
	public page<blogs> blogGetByTid(int tid,int pageNum, int pageSize) throws SQLException {
		return blog.blogSelectByTid(tid, pageNum, pageSize);
	}
	/**
	 * 根据评论获取其对应新闻
	 * @param a
	 * @return
	 * @throws SQLException 
	 */
	public blogs blogGetByCid(comment a) throws SQLException {
		int bid=a.getBid();
		return blog.blogSelectByBid(bid);
	}
	/**
	 * 根据id获取用户信息
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public login loginGetById(int id) throws SQLException {
		return blog.loginSelectById(id);
	}
	/**
	 * 获取所有topic
	 * @return
	 * @throws SQLException
	 */
	public List<topic> topicGet() throws SQLException{
		return blog.topicSelect();
	}
	/**
	 * 用用户昵称获取用户信息
	 * @param nickname
	 * @return
	 * @throws SQLException
	 */
	public login loginGetByNick(String nickname) throws SQLException {
		return blog.loginSelectByNick(nickname);
	}
	/**
	 * 通过bid获取对应博客内容
	 * @param bid
	 * @return
	 * @throws SQLException
	 */
	public blogs blogGetByBid(int bid) throws SQLException {
		return blog.blogSelectByBid(bid);
	}
	/**
	 * 插入用户信息
	 * @param nickname
	 * @param sex
	 * @param birth
	 * @param city
	 * @param job
	 * @param sign
	 * @return
	 * @throws SQLException
	 */
	public int userInto(String nickname, String sex, String birth, String city, String job, String sign,String pic) throws SQLException {
		login a=blog.loginSelectByNick(nickname);
		int id=a.getId();
		return blog.userInsert(id, sex, birth, city, job, sign, pic);
	}
	/**
	 * 密码更改
	 * @param nickname
	 * @param pwd
	 * @return
	 * @throws SQLException
	 */
	public int pwdUpdate(String nickname,String pwd) throws SQLException {
		return blog.pwdUpdate(nickname, pwd);
	}
	/**
	 * 写博客
	 * @param nickname
	 * @param btitle
	 * @param bcontent
	 * @param tname
	 * @param bpic
	 * @return
	 * @throws SQLException
	 */
	public int blogInto2(String nickname, String btitle, String bcontent,String tname,String bpic) throws SQLException {
		login a=blog.loginSelectByNick(nickname);
		int id=a.getId();
		topic b=blog.topicSelectByName(tname);
		int tid=b.getTid();
		return blog.blogInsert2(id, btitle, nickname, bcontent, bpic, tid);
	}
	/**
	 * 根据id获取主题名称
	 * @param tid
	 * @return
	 * @throws SQLException
	 */
	public topic topicSelectByTid(int tid) throws SQLException {
		return blog.topicSelectByTid(tid);
	}
	/**
	 * 不带图片更新博客
	 * @param btitle
	 * @param tname
	 * @param bcontent
	 * @param nickname
	 * @param bid
	 * @return
	 * @throws SQLException
	 */
	public int blogUpdate(String btitle,String tname,String bcontent,String nickname,int bid) throws SQLException {
		topic t=blog.topicSelectByName(tname);
		int tid=t.getTid();
		int a=blog.blogUpdate(bid, btitle, nickname, bcontent, tid);
		return a;
	}
	/**
	 * 带图片更新博客
	 * @param btitle
	 * @param tname
	 * @param bcontent
	 * @param nickname
	 * @param bid
	 * @param bpic
	 * @return
	 * @throws SQLException
	 */
	public int blogUpdate2(String btitle,String tname,String bcontent,String nickname,int bid,String bpic) throws SQLException {
		topic t=blog.topicSelectByName(tname);
		int tid=t.getTid();
		int a=blog.blogUpdate2(bid, btitle, nickname, bcontent, bpic, tid);
		return a;
	}
	/**
	 * 博客删除
	 * @param bid
	 * @return
	 * @throws SQLException
	 */
	public int blogDelete(int bid) throws SQLException {
		return blog.blogDelete(bid);
	}
	/**
	 * 获取某主题下的最热门博客
	 * @param tid
	 * @param pageNum
	 * @param pageSize
	 * @return
	 * @throws SQLException
	 */
	public page<blogs> blogSelectByTid2(int tid,int pageNum, int pageSize) throws SQLException{
		return blog.blogSelectByTid2(tid, pageNum, pageSize);
	}
	/**
	 * 访问量加1
	 * @param bid
	 * @return
	 * @throws SQLException
	 */
	public int blogVisitorAdd(int bid) throws SQLException {
		return blog.blogVisitorAdd(bid);
	}
	/**
	 * 获取所有对博客的评论
	 * @param bid
	 * @param pageNum
	 * @param pageSize
	 * @return
	 * @throws SQLException
	 */
	public page<comment> commentSelectByBID(int bid,int pageNum, int pageSize) throws SQLException{
		return blog.commentSelectByBID(bid, pageNum, pageSize);
	}
	/**
	 * 获取对应评论的回复
	 * @param bid
	 * @param inid
	 * @param pageNum
	 * @param pageSize
	 * @return
	 * @throws SQLException
	 */
	public page<comment> commentSelectByBID2(int bid,int tocid,int pageNum, int pageSize) throws SQLException{
		return blog.commentSelectByBID2(bid, tocid, pageNum, pageSize);
	}
	/**
	 * 评论删除
	 * @param cid
	 * @return
	 * @throws SQLException
	 */
	public int commentDelete(int cid) throws SQLException {
		return blog.commentDelete(cid);
	}
	/**
	 * 注册新用户的user表创建
	 * @param id
	 * @return
	 * @throws SQLException 
	 */
	public int userInsert2(int id) throws SQLException {
		return blog.userInto(id);
	}
	/**
	 * 获取最新博客
	 * @return
	 * @throws SQLException
	 */
	public List<blogs> blogSelectByTime() throws SQLException {
		return blog.blogSelectByTime();
	}
	/**
	 * 博客评论删除后的子评论删除
	 * @param tocid
	 * @return
	 * @throws SQLException
	 */
	public int commentDelete2(int tocid) throws SQLException {
		return blog.commentDelete2(tocid);
	}
	/**
	 * 写博客后的博客数加一
	 * @return
	 * @throws SQLException
	 */
	public int userBlogAdd() throws SQLException {
		return blog.userBlogAdd();
	}
	/**
	 * 删除博客后的博客数减一
	 * @return
	 * @throws SQLException
	 */
	public int userBlogMinus() throws SQLException {
		return blog.userBlogMinus();
	}
	/**
	 * 根据博客文章数获取博主信息
	 * @return
	 * @throws SQLException
	 */
	public List<user> userSelectByblog() throws SQLException {
		return blog.userSelectByblog();
	}
	/**
	 * 给博主留言
	 * @param mcontent
	 * @param inid
	 * @param toid
	 * @return
	 * @throws SQLException
	 */
	public int messageInsert(String mcontent,int inid,int toid) throws SQLException {
		return blog.messageInsert(mcontent, inid, toid);
	}
}
