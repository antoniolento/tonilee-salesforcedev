({
	createItem : function(component, newItem) {
		
		//create, then fire, an addItem event
        var event = component.getEvent("addItem");
        event.setParams({
        	"item": newItem
        });
        event.fire();

        //reset New Item attribute
        newItem = {"sobjectType": "Camping_Item__c", "Name": "", "Price__c": 0, "Quantity__c": 0, "Packed__c": false};
		component.set("v.newItem", newItem);       

	}
})