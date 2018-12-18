package DAO;

import Model.Driver;
import Model.Visitor;
import org.junit.Before;
import org.junit.Test;

import java.sql.SQLException;

import static org.junit.Assert.*;

public class VisitorDAOTest {

    private VisitorDAO visitorDAO;

    @Before
    public void setUP(){
        visitorDAO = new VisitorDAO();
    }

    @Test
    public void addRecord() throws SQLException {
        Driver theDriver = Driver.newBuilder().setDriverID("HFJ3i6554").setDriverName("Stepan Ivanenko").build();
        Visitor theVisitor = Visitor.newBuilder().setVisitorID(5).setVisitorName("Stepan Ivanenko")
                .setVisitorLogin("bodia").setVisitorPassword("1234").setVisitorRole("Driver").setDriver(theDriver)
                .build();
        assertTrue(visitorDAO.addRecord(theVisitor));
    }

    @Test
    public void deleteRecord() {
    }

    @Test
    public void findAll() throws SQLException{
        assertNotNull(visitorDAO.findAll());
    }

    @Test
    public void findByID() throws SQLException{
        assertNotNull(visitorDAO.findByLogin("bodia"));
    }

    @Test
    public void findByName() {
    }
}