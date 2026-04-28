public with sharing class ContactAccountDetails {
	
	Public List<Contact> contactList {get; set;}
	Public Boolean showContacts {get; set;}

	Public Id accountId;

	public ContactAccountDetails(ApexPages.StandardController controller) {
		accountId = controller.getRecord().Id;
		showContacts = false;
		fetchContacts();
	}

	public void fetchContacts(){
			contactList = [SELECT Id, Name, Account.Name, MailingAddress FROM Contact WHERE AccountId = :accountId];
			if(contactList.size() > 0){
				showContacts = true;
			}
	}

	public PageReference hideTestBtn(){
		System.debug('ContactAccountDetails: hideTestBtn START');

		System.debug('ContactAccountDetails: hideTestBtn END');	
		return null;
	}
}