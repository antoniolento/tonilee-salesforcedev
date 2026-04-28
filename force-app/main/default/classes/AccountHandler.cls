public class AccountHandler{
    
    public static Account insertNewAccount(String n){
        Account acc = new Account();
        acc.Name = n;
        try{
            insert acc;
        }
        catch(DMLException e){
            return null;
        }
        return acc;
    }
}