({
	packItem : function(component, event, helper) {
		var itemAttr = component.get("v.item");
        itemAttr.Packed__c = true;
		
        var btn = event.getSource();
        btn.set("v.disabled",true);
        
        component.set("v.item",itemAttr);
    }
})