@isTest
public class UnitOfWorkTest {

    @isTest
    public static void challengeComplete(){
        Test.startTest();
        
        //create unit of work
        fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(
            new Schema.SObjectType[] {
                Account.SObjectType,
                Contact.SObjectType,
                Note.SObjectType
            }
        );
 
        //business logic execution
        for(Integer i = 0; i < 100; i++){
            Account a = new Account (Name = 'Acc'+i);
            uow.registerNew(a);
            for(Integer o = 0; o < 5; o++){
                Contact c = new Contact(LastName=a.Name+'_o'+o);
                Note n = new Note(Title=a.Name+'_n'+o);
                uow.registerNew(c);
                uow.registerNew(n);   
                uow.registerRelationship(c, Contact.AccountId, a);
                uow.registerRelationship(n, Note.ParentId, a);
            }
        }
        
        //commit work
        uow.commitWork();
        
        Test.stopTest();
        
        /*temp debug log
        for(Account a: [Select Id from Account LIMIT 10]){
            System.debug('Acc: '+a);
        }
        
        for(Contact c: [Select Id, AccountId from Contact LIMIT 10]){
            System.debug('Contact: '+c);
        }
        
        for(Note n: [Select Id, ParentId from Note LIMIT 10]){
            System.debug('Note: '+n);
        }
		*/
        
        System.assertEquals(100, [Select Id from Account].size());
		System.assertEquals(500, [Select Id from Contact].size());
		System.assertEquals(500, [Select Id from Note].size());
    }
}