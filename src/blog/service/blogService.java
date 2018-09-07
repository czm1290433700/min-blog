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
	 * ע��
	 * @throws SQLException 
	 */
	public int register(String name, String tel, String nickname, String pwd, String interest) throws SQLException {
		return blog.loginInsert(name, tel, nickname, pwd, interest);
	}
	/**
	 * ��ȡע����û�id��
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
	 * ��¼��֤
	 * @param id
	 * @param pwd
	 * @return
	 * @throws SQLException
	 */
	public login login(int id,String pwd) throws SQLException {
		return blog.loginSelect(id, pwd);
	}
	/**
	 * �鿴�ҵĲ���
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
	 * �鿴���յ�������
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
	 * �鿴���յ��Ĳ�������
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
	 * ��ȡ�ҵ��û���Ϣ
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
	 * �����û���Ϣ
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
	 *д����
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
	 * д����(��ָ����������)
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
	 * д����(�Բ��ͽ�������)
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
	 * д����
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
	 * ��ȡ��Ӧ�����µ���������
	 * @param tid
	 * @return
	 * @throws SQLException
	 */
	public page<blogs> blogGetByTid(int tid,int pageNum, int pageSize) throws SQLException {
		return blog.blogSelectByTid(tid, pageNum, pageSize);
	}
	/**
	 * �������ۻ�ȡ���Ӧ����
	 * @param a
	 * @return
	 * @throws SQLException 
	 */
	public blogs blogGetByCid(comment a) throws SQLException {
		int bid=a.getBid();
		return blog.blogSelectByBid(bid);
	}
	/**
	 * ����id��ȡ�û���Ϣ
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public login loginGetById(int id) throws SQLException {
		return blog.loginSelectById(id);
	}
	/**
	 * ��ȡ����topic
	 * @return
	 * @throws SQLException
	 */
	public List<topic> topicGet() throws SQLException{
		return blog.topicSelect();
	}
	/**
	 * ���û��ǳƻ�ȡ�û���Ϣ
	 * @param nickname
	 * @return
	 * @throws SQLException
	 */
	public login loginGetByNick(String nickname) throws SQLException {
		return blog.loginSelectByNick(nickname);
	}
	/**
	 * ͨ��bid��ȡ��Ӧ��������
	 * @param bid
	 * @return
	 * @throws SQLException
	 */
	public blogs blogGetByBid(int bid) throws SQLException {
		return blog.blogSelectByBid(bid);
	}
	/**
	 * �����û���Ϣ
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
	 * �������
	 * @param nickname
	 * @param pwd
	 * @return
	 * @throws SQLException
	 */
	public int pwdUpdate(String nickname,String pwd) throws SQLException {
		return blog.pwdUpdate(nickname, pwd);
	}
	/**
	 * д����
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
	 * ����id��ȡ��������
	 * @param tid
	 * @return
	 * @throws SQLException
	 */
	public topic topicSelectByTid(int tid) throws SQLException {
		return blog.topicSelectByTid(tid);
	}
	/**
	 * ����ͼƬ���²���
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
	 * ��ͼƬ���²���
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
	 * ����ɾ��
	 * @param bid
	 * @return
	 * @throws SQLException
	 */
	public int blogDelete(int bid) throws SQLException {
		return blog.blogDelete(bid);
	}
	/**
	 * ��ȡĳ�����µ������Ų���
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
	 * ��������1
	 * @param bid
	 * @return
	 * @throws SQLException
	 */
	public int blogVisitorAdd(int bid) throws SQLException {
		return blog.blogVisitorAdd(bid);
	}
	/**
	 * ��ȡ���жԲ��͵�����
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
	 * ��ȡ��Ӧ���۵Ļظ�
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
	 * ����ɾ��
	 * @param cid
	 * @return
	 * @throws SQLException
	 */
	public int commentDelete(int cid) throws SQLException {
		return blog.commentDelete(cid);
	}
	/**
	 * ע�����û���user����
	 * @param id
	 * @return
	 * @throws SQLException 
	 */
	public int userInsert2(int id) throws SQLException {
		return blog.userInto(id);
	}
	/**
	 * ��ȡ���²���
	 * @return
	 * @throws SQLException
	 */
	public List<blogs> blogSelectByTime() throws SQLException {
		return blog.blogSelectByTime();
	}
	/**
	 * ��������ɾ�����������ɾ��
	 * @param tocid
	 * @return
	 * @throws SQLException
	 */
	public int commentDelete2(int tocid) throws SQLException {
		return blog.commentDelete2(tocid);
	}
	/**
	 * д���ͺ�Ĳ�������һ
	 * @return
	 * @throws SQLException
	 */
	public int userBlogAdd() throws SQLException {
		return blog.userBlogAdd();
	}
	/**
	 * ɾ�����ͺ�Ĳ�������һ
	 * @return
	 * @throws SQLException
	 */
	public int userBlogMinus() throws SQLException {
		return blog.userBlogMinus();
	}
	/**
	 * ���ݲ�����������ȡ������Ϣ
	 * @return
	 * @throws SQLException
	 */
	public List<user> userSelectByblog() throws SQLException {
		return blog.userSelectByblog();
	}
	/**
	 * ����������
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
