trigger AccountAddressTrigger on Account (before insert, before update) {
    for(Account acc : Trigger.new)
    {
        if(acc.Match_Billing_Address__c){
            if(acc.BillingPostalCode != ''){
                acc.ShippingPostalCode = acc.BillingPostalCode;
            }
        }
    }
    
}