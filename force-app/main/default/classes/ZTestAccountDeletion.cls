@isTest
public class ZTestAccountDeletion {

    @isTest
    public static void testAccountDeletion_AccountWithOpps(){
        
        Account acc = new Account (Name = 'testAccount');
        insert acc;
        
        Opportunity opp = new Opportunity (Name='Test Opportunity',
                                       StageName='Prospecting',
                                       CloseDate=System.today().addMonths(1),
                                       AccountId=acc.Id);
        
        insert opp;
        
        Test.startTest();
        
        Database.DeleteResult result = Database.delete(acc, false);
        
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals(result.getErrors().get(0).message, 'Cannot delete account with related opportunities.');
        Test.stopTest();
        
    }
    
    @isTest 
    public static void testAccountDeletion_AccountNoOpps(){
       Account acc = new Account (Name = 'testAccount');
       insert acc; 
       
       Test.startTest();
        
       Database.DeleteResult result = Database.delete(acc, false);
        
       System.assert(result.isSuccess());
       System.assert(result.getErrors().size() == 0);
       Test.stopTest();
        
    }
    
}