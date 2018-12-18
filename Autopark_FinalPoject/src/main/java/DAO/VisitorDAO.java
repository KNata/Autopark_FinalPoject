package DAO;

import DBConnection.ConnectionPool;
import Model.Visitor;
import org.apache.log4j.Logger;

import java.sql.*;
import java.util.ArrayList;

public class VisitorDAO  {

    private static Logger theLogger;

    static {
        theLogger = Logger.getLogger(DriverDAO.class);
    }

    // to think why it fails
    public boolean addRecord(Visitor anEntity) throws SQLException {
        String insertSQL = "insert into `mydb`.`Visitor` values(?, ?, ?, ?, ?, ?)";
        boolean wasAdded = false;
        if (anEntity == null) {
            wasAdded = false;
        } else if (findByLogin(anEntity.getVisitorLogin()) != null) {
            System.out.println("findByLogin(anEntity.getVisitorLogin()) != null");
        } else {
            Connection conn = null;
            PreparedStatement preparedStatement = null;
            Savepoint savePoint = null;
            try {
                System.out.println("1");
                conn = ConnectionPool.getConnection();
                conn.setAutoCommit(false);
                System.out.println("2");
                preparedStatement = conn.prepareStatement(insertSQL);
                System.out.println("3");
                preparedStatement.setInt(1, anEntity.getVisitorID());
                System.out.println("4");
                preparedStatement.setString(2, anEntity.getVisitorLogin());
                System.out.println("5");
                preparedStatement.setString(3, anEntity.getVisitorPassword());
                System.out.println("6");
                preparedStatement.setString(4, anEntity.getVisitorRole());
                System.out.println("7");
                preparedStatement.setString(5, anEntity.getVisitorName());
                System.out.println("8");
                preparedStatement.setString(6, anEntity.getTheDriver().getDriverID());
                System.out.println("9");
                preparedStatement.executeUpdate();
                System.out.println("10");
                wasAdded = true;
                savePoint = conn.setSavepoint();
                conn.commit();
            } catch (SQLException e) {
                if (savePoint == null) {
                    conn.rollback();
                } else {
                    conn.rollback(savePoint);
                }
            } finally {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (conn != null) {
                    conn.commit();
                }
            }
        }
        return wasAdded;
    }

    public boolean deleteRecord(String anID) throws SQLException {
        int visitorID = Integer.valueOf(anID);
        boolean wasDeleted = false;
        String deleteSQL = "delete from `mydb`.`Visitor` where `visitorID` = ?";
        if (anID == null) {
            wasDeleted = false;
        } else {
            Connection conn = null;
            PreparedStatement preparedStatement = null;
            Savepoint savePoint = null;
            try {
                conn = ConnectionPool.getConnection();
                conn.setAutoCommit(false);
                preparedStatement = conn.prepareStatement(deleteSQL);
                preparedStatement.setString(1, anID);
                preparedStatement.executeUpdate();
                wasDeleted = true;
                savePoint = conn.setSavepoint();
                conn.commit();
            } catch (SQLException e) {
                if (savePoint == null) {
                    conn.rollback();
                } else {
                    conn.rollback(savePoint);
                }
                theLogger.error(e.getMessage());
            } finally {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (conn != null) {
                    conn.commit();
                }
            }
        }
        return wasDeleted;
    }

    public ArrayList<Visitor> findAll() throws SQLException {
        String selectAllSQL = "select * from `mydb`.`Visitor`";
        ArrayList<Visitor> visitorList = new ArrayList<Visitor>();
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        Savepoint savePoint = null;
        try {
            conn = ConnectionPool.getConnection();
            conn.setAutoCommit(false);
            preparedStatement = conn.prepareStatement(selectAllSQL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int visitorID = resultSet.getInt("visitorID");
                String visitorLogin = resultSet.getString("login");
                String visitorPassword = resultSet.getString("password");
                String visitorName = resultSet.getString("visitorName");
                String visitorRole = resultSet.getString("visitorRole");
                String driverID = resultSet.getString("Driver_driverID");
                DriverDAO driverDAO = new DriverDAO();
                Visitor theVisitor = Visitor.newBuilder().setVisitorID(visitorID).setVisitorName(visitorName)
                        .setVisitorLogin(visitorLogin).setVisitorPassword(visitorPassword).setVisitorRole(visitorRole)
                        .setDriver(driverDAO.findByID(driverID)).build();
                visitorList.add(theVisitor);
                savePoint = conn.setSavepoint();
            }
            conn.commit();
        } catch (SQLException e) {
            if (savePoint == null) {
                conn.rollback();
            } else {
                conn.rollback(savePoint);
            }
            theLogger.error(e.getMessage());
        } finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (conn != null) {
                conn.commit();
            }
        }
        return visitorList;
    }

    // actually find by login
    public Visitor findByLogin(String anID) throws SQLException {
        String selectAllSQL = "select * from `mydb`.`Visitor` where `login` = ?";
        Visitor theVisitor = null;
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        Savepoint savePoint = null;
        try {
            conn = ConnectionPool.getConnection();
            conn.setAutoCommit(false);
            preparedStatement = conn.prepareStatement(selectAllSQL);
            preparedStatement.setString(1, anID);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String visitorLogin = resultSet.getString("login");
                if (visitorLogin.equals(anID)) {
                    int vositorID = resultSet.getInt("visitorID");
                    String visitorPassword = resultSet.getString("password");
                    String visitorRole = resultSet.getString("visitorRole");
                    String visitorName = resultSet.getString("visitorName");
                    String driverID = resultSet.getString("Driver_driverID");
                    DriverDAO driverDAO = new DriverDAO();
                    theVisitor = Visitor.newBuilder().setVisitorID(vositorID).setVisitorLogin(visitorLogin)
                            .setVisitorPassword(visitorPassword).setVisitorRole(visitorRole).setDriver(driverDAO
                                    .findByID(driverID)).setVisitorName(visitorName).build();
                }
            }
            savePoint = conn.setSavepoint();
            conn.commit();
        } catch (SQLException e) {
            if (savePoint == null) {
                conn.rollback();
            } else {
                conn.rollback(savePoint);
            }
            theLogger.error(e.getMessage());
        } finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (conn != null) {
                conn.commit();
            }
        }
        return theVisitor;
    }


    public Visitor findByName(String aName) throws SQLException {
        throw new UnsupportedOperationException();
    }


    public boolean update() {
        return false;
    }
}
