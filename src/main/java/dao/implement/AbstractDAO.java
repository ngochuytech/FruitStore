package dao.implement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import dao.GenericDAO;
import mapper.RowMapper;

public class AbstractDAO<T> implements GenericDAO<T>{
	ResourceBundle bundle = ResourceBundle.getBundle("db");
	
	public Connection getConnection() {
		try {
			Class.forName(bundle.getString("driveName"));
			String url = bundle.getString("url");
			String userName = bundle.getString("user");
			String password = bundle.getString("password");
			return DriverManager.getConnection(url,userName,password);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	private void setParameters(PreparedStatement statement, Object... parameters) {
        try {
            for (int i = 0; i < parameters.length; ++i) {
                Object parameter = parameters[i];
                int index = i + 1;
                if (parameter instanceof Integer) {
                    statement.setInt(index, (Integer) parameter);
                } else if (parameter instanceof String) {
                    statement.setString(index, (String) parameter);
                } else if (parameter instanceof Boolean) {
                    statement.setBoolean(index, (Boolean) parameter);
                } else if (parameter instanceof Double) {
                    statement.setDouble(index, (Double) parameter);
                } else if (parameter instanceof Long) {
                    statement.setLong(index, (Long) parameter);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
	@Override
	public <T> List<T> query(String sql, RowMapper<T> rowMapper, Object... paramaters) {
		List<T> result = new ArrayList<T>();
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		try {
			connection = getConnection();
			statement = connection.prepareStatement(sql);
			// set parameter ()
			setParameters(statement, paramaters);
			rs = statement.executeQuery();
			while(rs.next())
			{
				result.add(rowMapper.mapRow(rs));
			}
			return result;
		} catch (SQLException e) {
			return null;
		}finally 
		{
			try 
			{
				if(connection!=null) connection.close();
				if(statement!=null) statement.close();
				if(rs != null) rs.close();
			} 
			catch (SQLException e2) {
				e2.printStackTrace();
				return null;
			}
		}
	}

	@Override
	public void update(String sql, Object... parameters) {
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			connection = getConnection();
			connection.setAutoCommit(false);
			statement = connection.prepareStatement(sql);
			setParameters(statement, parameters);
			statement.executeUpdate();
			connection.commit();
		} catch (SQLException e) {
			try {
				connection.rollback();
				e.printStackTrace();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}finally 
		{
			try 
			{
				if(connection!=null) connection.close();
				if(statement!=null) statement.close();
			} 
			catch (SQLException e2) {
				e2.printStackTrace();
				return;
			}
		}
	}

	@Override
	public int insert(String sql, Object... parameters) {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		int id = -1;
		try {
			connection = getConnection();
			connection.setAutoCommit(false);
			statement = connection.prepareStatement(sql, statement.RETURN_GENERATED_KEYS);
			setParameters(statement, parameters);
			statement.executeUpdate();
			rs = statement.getGeneratedKeys();
			if(rs.next())
				id = rs.getInt(1);
			connection.commit();
			return id;
		} catch (SQLException e) {
			try {
				connection.rollback();
				e.printStackTrace();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
			return id;
		}finally 
		{
			try 
			{
				if(connection!=null) connection.close();
				if(statement!=null) statement.close();
				if(rs != null) rs.close();
			} 
			catch (SQLException e2) {
				e2.printStackTrace();
				return id;
			}
		}
	}

	@Override
	public void delete(String sql, Object... parameters) {
		update(sql,parameters);
	}

    @Override
    public int count(String sql, Object... parameters) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            int count = 0;
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            //set parameters
            setParameters(statement, parameters);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                count = resultSet.getInt(1);
            }
            return count;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) connection.close();
                if (statement != null) statement.close();
                if (resultSet != null) resultSet.close();
            } catch (SQLException err) {
                err.printStackTrace();
            }
        }
        return 0;
    }
}
