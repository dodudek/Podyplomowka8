package jdbc;

import com.microsoft.sqlserver.jdbc.SQLServerDataSource;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectAdventureWorks {

    public static void main(String[] args) {
        SQLServerDataSource ds = new SQLServerDataSource();
        ds.setUser("dodudek");
        ds.setServerName("morfeusz.wszib.edu.pl");
        ds.setPortNumber(1433);
        ds.setDatabaseName("AdventureWorks");
        ds.setPassword("Safira100112");
        String sql = "SELECT top 10 * FROM Person.Contact where LastName = 'Anderson'";
        String sql2 = " SELECT distinct Title from HumanResources.Employee";
        String sql3 = " select CustomerID, count (*) as LiczbaZamowien from Sales.SalesOrderHeader\n" +
                "  group by CustomerID\n" +
                "  order by LiczbaZamowien desc";

        try (Connection con = ds.getConnection(); Statement stmt = con.createStatement()){

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()){
                System.out.println(rs.getString("FirstName") + " " + (rs.getString("LastName")));
            }

        }catch(SQLException e){
            System.out.println("Problemy z bazą danch: " + e.getMessage());

        }

        System.out.println("--------------------------------------------------------");

        try (Connection con = ds.getConnection(); Statement stmt = con.createStatement()){

            ResultSet rs2 = stmt.executeQuery(sql2);

            while (rs2.next()){
                System.out.println(rs2.getString("Title"));
            }

        }catch(SQLException e){
            System.out.println("Problemy z bazą danch: " + e.getMessage());

        }

        System.out.println("--------------------------------------------------------");

        try (Connection con = ds.getConnection(); Statement stmt = con.createStatement()){

            ResultSet rs3 = stmt.executeQuery(sql3);

            while (rs3.next()){
                System.out.println(rs3.getString("CustomerID") + " " + (rs3.getString("LiczbaZamowien")));
            }

        }catch(SQLException e){
            System.out.println("Problemy z bazą danch: " + e.getMessage());

        }

    }
}
