public with sharing class CampingListController {

    @auraEnabled
    public static List<Camping_Item__c> getItems(){

        List<Camping_Item__c> itemList = [SELECT Id, Name, Price__c, Quantity__c, Packed__c FROM Camping_Item__c];
    	return itemList;    
        
    }
    
    @auraEnabled
    public static Camping_Item__c saveItem(Camping_Item__c item){
        
        upsert item;
        return item;
        
    }
    
}