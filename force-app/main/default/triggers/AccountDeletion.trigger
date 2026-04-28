trigger AccountDeletion on Account (before delete) {
	
    Map<Id, Account> map_accountWithOpps = new Map <Id, Account> ([SELECT Id,Name FROM Account WHERE Id IN (SELECT AccountId FROM Opportunity) AND Id IN: Trigger.Old]);
    
    for(Id accId: Trigger.oldMap.keySet()){
    	    
        if(map_accountWithOpps.keySet().contains(accId)){
            trigger.oldMap.get(accId).addError('Cannot delete account with related opportunities.');
        }
        
    }
    
}