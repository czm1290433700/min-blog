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
	 * ��login���в�������
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
	 * ��login���в�ѯΨһid
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
	 * ��login���в�ѯ�Ƿ�����Ӧid��pwd
	 * @param id
	 * @param pwd
	 * @return
	 * @throws SQLException 
	 */
	public login loginSelect(int id,String pwd) throws SQLException;
	/**
	 * �����ǳƻ�ȡ��Ӧ�û���Ϣ
	 * @param nickname
	 * @return
	 * @throws SQLException 
	 */
	public login loginSelectByNick(String nickname) throws SQLException;
	/**
	 * ����id��ȡ��Ӧ������Ϣ
	 * @param id
	 * @return
	 * @throws SQLException 
	 */
	public page<blogs> blogSelectByID(int id,int pageNum, int pageSize) throws SQLException;
	/**
	 * ����id��ҳ��ȡ��Ӧ���յ���������Ϣ
	 * @param inid
	 * @return
	 * @throws SQLException 
	 */
	public page<message> messageSelectByID(int inid,int pageNum, int pageSize) throws SQLException;
	/**
	 * ����bid��ȡ��Ӧ�����µĶԲ�������
	 * @param bid
	 * @return
	 * @throws SQLException
	 */
	public page<comment> commentSelectByBID(int bid,int pageNum, int pageSize) throws SQLException;
	/**
	 * ����bid��tocid��ȡ�����µĲ�������
	 * @param bid
	 * @param inid
	 * @param pageNum
	 * @param pageSize
	 * @return
	 * @throws SQLException
	 */
	public page<comment> commentSelectByBID2(int bid,int tocid,int pageNum, int pageSize) throws SQLException;
	/**
	 * ����id��ȡ�û���Ϣ
	 * @param id
	 * @return
	 * @throws SQLException 
	 */
	public user userSelectByID(int id) throws SQLException;
	/**
	 * �����û���Ϣ
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
	 * ���벩��
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
	 * ��������(��ָ�������������)
	 * @param ccontent
	 * @param inid
	 * @param toid
	 * @return
	 * @throws SQLException 
	 */
	public int commentInsert(String ccontent,int inid,int bid,int toid,int tocid) throws SQLException;
	/**
	 * ��������(�Բ��ͽ�������)
	 * @param ccontent
	 * @param bid
	 * @param toid
	 * @return
	 * @throws SQLException
	 */
	public int commentInsert2(String ccontent,int bid,int toid) throws SQLException;
	/**
	 * ��������
	 * @param mcontent
	 * @param inid
	 * @param toid
	 * @return
	 * @throws SQLException 
	 */
	public int messageInsert(String mcontent,int inid,int toid) throws SQLException;
	/**
	 * ��ȡ��Ӧ�����µ����²���
	 * @param tid
	 * @return
	 * @throws SQLException 
	 */
	public page<blogs> blogSelectByTid(int tid,int pageNum, int pageSize) throws SQLException;
	/**
	 * ��ȡ��Ӧ�����µ������Ų���
	 * @param tid
	 * @param pageNum
	 * @param pageSize
	 * @return
	 * @throws SQLException
	 */
	public page<blogs> blogSelectByTid2(int tid,int pageNum, int pageSize) throws SQLException;
	/**
	 * ��ѯĳһ�û�����õ�ȫ������
	 * @throws SQLException 
	 */
	public page<comment> commentSelectById(int inid,int pageNum, int pageSize) throws SQLException;
	/**
	 * ͨ�����ű�Ų�ѯ����
	 * @param bid
	 * @return
	 * @throws SQLException 
	 */
	public blogs blogSelectByBid(int bid) throws SQLException;
	/**
	 * ͨ��id��ȡ�û���Ϣ
	 * @param id
	 * @return
	 * @throws SQLException 
	 */
	public login loginSelectById(int id) throws SQLException;
	/**
	 * ��ȡ��������
	 * @return
	 * @throws SQLException 
	 */
	public List<topic> topicSelect() throws SQLException;
	/**
	 * ������������ȡ����id
	 * @param tname
	 * @return
	 * @throws SQLException 
	 */
	public topic topicSelectByName(String tname) throws SQLException;
	/**
	 * ����user������
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
	 * �޸�����
	 * @param nickname
	 * @return
	 * @throws SQLException 
	 */
	public int pwdUpdate(String nickname,String pwd) throws SQLException; 
	/**
	 * д����(��ͼƬ)
	 * @param a
	 * @return
	 * @throws SQLException 
	 */
	public int blogInsert2(int id,String btitle, String bauthor, String bcontent,String bpic,int tid) throws SQLException;
	/**
	 * ͨ��tid��ȡ��������
	 * @param tid
	 * @return
	 * @throws SQLException 
	 */
	public topic topicSelectByTid(int tid) throws SQLException;
	/**
	 * ����ͼƬ����
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
	 * ��ͼƬ����
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
	 * ɾ������
	 * @param bid
	 * @return
	 * @throws SQLException 
	 */
	public int blogDelete(int bid) throws SQLException;
	/**
	 * ��������1
	 * @return
	 * @throws SQLException 
	 */
	public int blogVisitorAdd(int bid) throws SQLException;
	/**
	 * ����ɾ��
	 * @param cid
	 * @return
	 * @throws SQLException 
	 */
	public int commentDelete(int cid) throws SQLException;
	/**
	 * ע���û����user���½�
	 * @param id
	 * @return
	 * @throws SQLException 
	 */
	public int userInto(int id) throws SQLException;
	/**
	 * ��ȡ���²���
	 * @return
	 * @throws SQLException 
	 */
	public List<blogs> blogSelectByTime() throws SQLException;
	/**
	 * ��������ɾ��ʱ�������۸���ɾ��
	 * @param tocid
	 * @return
	 * @throws SQLException 
	 */
	public int commentDelete2(int tocid) throws SQLException;
	/**
	 * д���ͺ󲩿�����һ
	 * @return
	 * @throws SQLException 
	 */
	public int userBlogAdd() throws SQLException;
	/**
	 * ɾ�����ͺ�Ĳ��ͼ�һ
	 * @return
	 * @throws SQLException 
	 */
	public int userBlogMinus() throws SQLException;
	/**
	 * ���ݲ���������ȡ������Ϣ
	 * @return
	 * @throws SQLException 
	 */
	public List<user> userSelectByblog() throws SQLException;
}
