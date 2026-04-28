({
	createItem : function(component, newItem) {
		
        var action = component.get("c.saveItem");
        action.setParams({
            
            "item": newItem
            
        });
        
        action.setCallback(true, function(response){
           
            var state = response.getState();
            if(state === "SUCCESS"){
                
                var itemList = component.get("v.items");
                itemList.push(response.getReturnValue());
                component.set("v.items", itemList);
            }
            
        });
        
        $A.enqueueAction(action);
        
	}
})