package blog.entity;
import javax.sql.DataSource;
import java.sql.SQLException;
import java.sql.Connection;
import com.mchange.v2.c3p0.ComboPooledDataSource;
public class jdbcUtils {

    // 获得c3p0连接池对象
    private static ComboPooledDataSource ds = new ComboPooledDataSource();

    /**
     * 获得c3p0连接池对象
     * @return
     */
    public static DataSource getDataSource() {
        return ds;
    }
}