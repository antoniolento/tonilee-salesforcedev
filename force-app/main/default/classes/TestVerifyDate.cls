@isTest
public class TestVerifyDate {

    @isTest
    static void testCheckDatesTrue(){
        Date date1 = Date.newInstance(1992,9,25);
        Date date2 = Date.newInstance(1992,9,29);
        
        System.assertEquals(date2, VerifyDate.CheckDates(date1, date2));
    }
    
    @isTest
    static void testCheckDatesFalse(){
        Date date1 = Date.newInstance(1992, 9, 25);
        Date date2 = Date.newInstance(1992,11,29);
        
        System.assertEquals(Date.newInstance(1992,9,30), VerifyDate.CheckDates(date1, date2));
        
    }   
        
    @isTest
    static void testDateWithin30DaysWrong(){
		Date date1 = Date.newInstance(1992,9,30);
        Date date2 = Date.newInstance(1991,9,30);
        
        System.assertEquals(Date.newInstance(1992, 9, 30), VerifyDate.checkDates(date1, date2));
    }
        
}