public with sharing class ContactController {
	
	@AuraEnabled
	public List<Contact> getContacts(){

		List<Contact> contacts = [SELECT Id, Name, MailingStreet, Phone, Email, LeadSource FROM Contact];

		// isAccessible() check;
		return contacts;

	}
}