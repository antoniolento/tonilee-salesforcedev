public class ContactSearch{

    public static List<Contact> searchForContacts(String lName, String mpc){
       List<Contact> contacts = [SELECT Id, Name FROM Contact WHERE lastName=:lName AND MailingPostalCode=:mpc];
        return contacts;
    }
    
}