package blog.entity;
import javax.sql.DataSource;
import java.sql.SQLException;
import java.sql.Connection;
import com.mchange.v2.c3p0.ComboPooledDataSource;
public class jdbcUtils {

    // ���c3p0���ӳض���
    private static ComboPooledDataSource ds = new ComboPooledDataSource();

    /**
     * ���c3p0���ӳض���
     * @return
     */
    public static DataSource getDataSource() {
        return ds;
    }
}