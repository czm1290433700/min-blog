package blog.dao;

import java.sql.SQLException;
import java.util.List;

import blog.entity.blogs;
import blog.entity.comment;
import blog.entity.login;
import blog.entity.message;
import blog.entity.page;
import blog.entity.topic;
import blog.entity.user;

public interface blog {
	/**
	 * 向login表中插入数据
	 * @param name
	 * @param tel
	 * @param nickname
	 * @param pwd
	 * @param interest
	 * @return
	 * @throws SQLException 
	 */
	public int loginInsert(String name,String tel,String nickname,String pwd,String interest) throws SQLException;
	/**
	 * 向login表中查询唯一id
	 * @param name
	 * @param tel
	 * @param nickname
	 * @param pwd
	 * @param interest
	 * @return
	 * @throws SQLException 
	 */
	public login loginSelectID(String name,String tel,String nickname,String pwd,String interest) throws SQLException; 
	/**
	 * 向login表中查询是否有相应id和pwd
	 * @param id
	 * @param pwd
	 * @return
	 * @throws SQLException 
	 */
	public login loginSelect(int id,String pwd) throws SQLException;
	/**
	 * 根据昵称获取对应用户信息
	 * @param nickname
	 * @return
	 * @throws SQLException 
	 */
	public login loginSelectByNick(String nickname) throws SQLException;
	/**
	 * 根据id获取对应博客信息
	 * @param id
	 * @return
	 * @throws SQLException 
	 */
	public page<blogs> blogSelectByID(int id,int pageNum, int pageSize) throws SQLException;
	/**
	 * 根据id分页获取对应的收到的留言信息
	 * @param inid
	 * @return
	 * @throws SQLException 
	 */
	public page<message> messageSelectByID(int inid,int pageNum, int pageSize) throws SQLException;
	/**
	 * 根据bid获取对应博客下的对博客评论
	 * @param bid
	 * @return
	 * @throws SQLException
	 */
	public page<comment> commentSelectByBID(int bid,int pageNum, int pageSize) throws SQLException;
	/**
	 * 根据bid和tocid获取博客下的博客评论
	 * @param bid
	 * @param inid
	 * @param pageNum
	 * @param pageSize
	 * @return
	 * @throws SQLException
	 */
	public page<comment> commentSelectByBID2(int bid,int tocid,int pageNum, int pageSize) throws SQLException;
	/**
	 * 根据id获取用户信息
	 * @param id
	 * @return
	 * @throws SQLException 
	 */
	public user userSelectByID(int id) throws SQLException;
	/**
	 * 插入用户信息
	 * @param sex
	 * @param birth
	 * @param city
	 * @param job
	 * @param sign
	 * @return
	 * @throws SQLException 
	 */
	public int userInsert(int id,String sex,String birth,String city,String job,String sign,String pic) throws SQLException;
	/**
	 * 插入博客
	 * @param id
	 * @param btime
	 * @param btitle
	 * @param bauthor
	 * @param bcontent
	 * @param tid
	 * @return
	 * @throws SQLException 
	 */
	public int blogInsert(int id,String btitle,String bauthor,String bcontent,int tid) throws SQLException;
	/**
	 * 插入评论(对指定对象进行评论)
	 * @param ccontent
	 * @param inid
	 * @param toid
	 * @return
	 * @throws SQLException 
	 */
	public int commentInsert(String ccontent,int inid,int bid,int toid,int tocid) throws SQLException;
	/**
	 * 插入评论(对博客进行评论)
	 * @param ccontent
	 * @param bid
	 * @param toid
	 * @return
	 * @throws SQLException
	 */
	public int commentInsert2(String ccontent,int bid,int toid) throws SQLException;
	/**
	 * 插入留言
	 * @param mcontent
	 * @param inid
	 * @param toid
	 * @return
	 * @throws SQLException 
	 */
	public int messageInsert(String mcontent,int inid,int toid) throws SQLException;
	/**
	 * 获取相应主题下的最新博客
	 * @param tid
	 * @return
	 * @throws SQLException 
	 */
	public page<blogs> blogSelectByTid(int tid,int pageNum, int pageSize) throws SQLException;
	/**
	 * 获取相应主题下的最热门博客
	 * @param tid
	 * @param pageNum
	 * @param pageSize
	 * @return
	 * @throws SQLException
	 */
	public page<blogs> blogSelectByTid2(int tid,int pageNum, int pageSize) throws SQLException;
	/**
	 * 查询某一用户所获得的全部评论
	 * @throws SQLException 
	 */
	public page<comment> commentSelectById(int inid,int pageNum, int pageSize) throws SQLException;
	/**
	 * 通过新闻编号查询新闻
	 * @param bid
	 * @return
	 * @throws SQLException 
	 */
	public blogs blogSelectByBid(int bid) throws SQLException;
	/**
	 * 通过id获取用户信息
	 * @param id
	 * @return
	 * @throws SQLException 
	 */
	public login loginSelectById(int id) throws SQLException;
	/**
	 * 获取所有主题
	 * @return
	 * @throws SQLException 
	 */
	public List<topic> topicSelect() throws SQLException;
	/**
	 * 根据主题名获取主题id
	 * @param tname
	 * @return
	 * @throws SQLException 
	 */
	public topic topicSelectByName(String tname) throws SQLException;
	/**
	 * 更新user表内容
	 * @param id
	 * @param sex
	 * @param birth
	 * @param city
	 * @param job
	 * @param sign
	 * @return
	 * @throws SQLException 
	 */
	public int userUpdate(int id,String sex,String birth,String city,String job,String sign,String pic) throws SQLException;
	/**
	 * 修改密码
	 * @param nickname
	 * @return
	 * @throws SQLException 
	 */
	public int pwdUpdate(String nickname,String pwd) throws SQLException; 
	/**
	 * 写博客(带图片)
	 * @param a
	 * @return
	 * @throws SQLException 
	 */
	public int blogInsert2(int id,String btitle, String bauthor, String bcontent,String bpic,int tid) throws SQLException;
	/**
	 * 通过tid获取主题名称
	 * @param tid
	 * @return
	 * @throws SQLException 
	 */
	public topic topicSelectByTid(int tid) throws SQLException;
	/**
	 * 不插图片更新
	 * @param id
	 * @param btitle
	 * @param bauthor
	 * @param bcontent
	 * @param tid
	 * @return
	 * @throws SQLException 
	 */
	public int blogUpdate(int bid,String btitle,String bauthor,String bcontent,int tid) throws SQLException;
	/**
	 * 插图片更新
	 * @param id
	 * @param btitle
	 * @param bauthor
	 * @param bcontent
	 * @param bpic
	 * @param tid
	 * @return
	 * @throws SQLException 
	 */
	public int blogUpdate2(int bid,String btitle, String bauthor, String bcontent,String bpic,int tid) throws SQLException;
	/**
	 * 删除博客
	 * @param bid
	 * @return
	 * @throws SQLException 
	 */
	public int blogDelete(int bid) throws SQLException;
	/**
	 * 访问量加1
	 * @return
	 * @throws SQLException 
	 */
	public int blogVisitorAdd(int bid) throws SQLException;
	/**
	 * 评论删除
	 * @param cid
	 * @return
	 * @throws SQLException 
	 */
	public int commentDelete(int cid) throws SQLException;
	/**
	 * 注册用户后的user表新建
	 * @param id
	 * @return
	 * @throws SQLException 
	 */
	public int userInto(int id) throws SQLException;
	/**
	 * 获取最新博客
	 * @return
	 * @throws SQLException 
	 */
	public List<blogs> blogSelectByTime() throws SQLException;
	/**
	 * 博客评论删除时的自评论附带删除
	 * @param tocid
	 * @return
	 * @throws SQLException 
	 */
	public int commentDelete2(int tocid) throws SQLException;
	/**
	 * 写博客后博客数加一
	 * @return
	 * @throws SQLException 
	 */
	public int userBlogAdd() throws SQLException;
	/**
	 * 删除博客后的博客减一
	 * @return
	 * @throws SQLException 
	 */
	public int userBlogMinus() throws SQLException;
	/**
	 * 根据博客数来获取博主信息
	 * @return
	 * @throws SQLException 
	 */
	public List<user> userSelectByblog() throws SQLException;
}
