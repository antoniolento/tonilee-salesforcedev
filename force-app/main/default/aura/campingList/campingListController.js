({
    doInit : function(component, event, helper)
    {
        console.log("doInit start");
      	var action = component.get("c.getItems");
        action.setCallback(true, function(response){
           
            console.log("in callback");
            
            var state = response.getState();
            if(state === 'SUCCESS'){
				console.log("state is success");                
				component.set("v.items", response.getReturnValue());
                
            }
            
        });
        
        $A.enqueueAction(action);
        
        console.log("items: "+component.get("v.items").length);
		console.log("doInit end");
    },

    handleAddItem: function(component, event, helper){
        var newItem = event.getParam("item");

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


        //helper.createItem(component, newItem);
    }

})