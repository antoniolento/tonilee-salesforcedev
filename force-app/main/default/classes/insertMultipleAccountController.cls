public with sharing class insertMultipleAccountController {

	Account account;
	Public list<Account> listAccount {get; set;}

	public insertMultipleAccountController() {
		account = new Account();
		listAccount.add(account);
	}

	public void addAccount(){
		Account acc = new Account();
		listAccount.add(acc);
	}

	public PageReference saveAccounts(){

		for(Integer i = 0; i < listAccount.size(); i++){
			
			
		}
		return null;
	}


}